<template>
    <section style="position: static">
        <label class="label">{{data.title}}</label>
        <div >
            <table id="datatable_fixed_column" class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th v-if="list.isSortable" style="width: 1%; padding: 0;">
                        <i style="margin-left: -10px;" class="fa fa-reorder"></i>
                    </th>

                    <th v-for="field in list.fields" :key="field.key"
                        style="position: relative"
                        :style="{width: field.width ? field.width : 'auto'}"
                        :class="classForTh(field)"
                    >
                        <button type="button" v-if="list.order[field.key]" class="close" style="position: absolute; top: 12px; left: 13px;">×</button>
                        {{field.title}}
                    </th>

                    <th class="e-insert_button-cell" style="min-width: 69px;">
                        <button class="btn btn-sm btn-success" style="min-width: 70px;" type="button" @click="add">
                            Добавить
                        </button>
                    </th>
                </tr>
                </thead>
                <draggable
                        :list="listItems.data"
                        :element="'tbody'"
                        handle=".tb-sort"
                        ref="draggable"
                        @update="onDraggableUpdate"
                        v-if="list.data"
                >
                        <tr v-for="item in listItems.data">
                            <td v-if="list.isSortable" class="tb-sort" style="cursor:s-resize;">
                                <i class="fa fa-sort"></i>
                            </td>
                            <td v-for="field in list.fields" :key="field.key">
                                <span >{{item[field.key]}}</span>
                            </td>
                            <td style="width: 80px">
                                <div class="btn-group  pull-right" :class="{ open: checkOpenDropdown(item) }">
                                    <a class="btn dropdown-toggle btn-default"
                                       data-toggle="dropdown"
                                       @click="openDropdown(item)"
                                    >
                                        <i class="fa fa-cog"></i> <i class="fa fa-caret-down"></i>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a @click="edit(item)"><i class="fa fa-pencil"></i> Редактировать</a>
                                        </li>
                                        <li>
                                            <a @click="remote(item)"><i class="fa red fa-times"></i> Удалить</a>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                </draggable>
            </table>
            <div class="dt-toolbar-footer" style="padding: 10px 0" v-if="listItems">
                <div class="col-xs-12 col-sm-6">
                    <div id="dt_basic_paginate" class="dataTables_paginate paging_simple_numbers">
                        <pagination
                                :current="listItems.current_page"
                                :total="listItems.total"
                                :per-page="listItems.per_page"
                                @page-changed="loadDefinitionData"
                                v-show="listItems.last_page > 1"
                        >
                        </pagination>
                    </div>
                </div>
            </div>
        </div>

        <create v-if="isShowCreateWindow"
                @closeWindow="isShowCreateWindow = false"
                @loadData="loadDefinitionData"
                :urlCreate=urlSaveCreate
                :url=data.urlLoadDefinition
        ></create>

        <edit v-if="editId"
              :id="editId"
              :urlLoadData="urlLoadData"
              :urlSave = "urlSave"
              @closeWindow="closeWindow"
              @loadData="loadDefinitionData"></edit>

    </section>
</template>

<script>

    import FieldBase from './FieldBase';
    import draggable from 'vuedraggable';
    import create from '../Create';
    import edit from '../Edit';

    export default {
        extends: FieldBase,

        data() {
            return {
                list: {},
                isShowCreateWindow : false,
                openItemDropdown : false,
                editId : false,
                page: 1
            }
        },

        components: {
            draggable,
            create,
            edit
        },

        mounted() {
            this.loadDefinitionData();
        },

        computed : {
            listItems () {
                return this.list.data;
            },

            urlSaveCreate () {
                return `${this.$route.path}/${this.id}/${this.data.key}/save`;
            },

            urlLoadData() {
                return `${this.data.urlLoadDefinition}/edit/` + this.editId
            },

            urlSave() {
                return `${this.data.urlLoadDefinition}/save/` + this.editId;
            },

            urlAction() {
              return this.$urlCms + this.$route.path;
            }
        },

        watch: {
            data (url) {
                this.loadDefinitionData();
            }
        },

        methods: {

            openDropdown(item) {
                this.openItemDropdown = this.openItemDropdown == item ? false : item;
            },

            closeWindow() {
                this.editId = false;
            },

            checkOpenDropdown(item) {
                return this.openItemDropdown == item;
            },

            add() {
                this.isShowCreateWindow = true;
                this.openItemDropdown = false;
            },

            loadDefinitionData (page) {

                page = page || 1;

                this.axios
                    .get(`${this.urlAction}/list/${this.id}/${this.data.key}?page=` + page)
                    .then(response => {
                        this.list = response.data;
                    })
                    .catch(error => {
                      this.$emit('showError', error);
                    });
            },

            onDraggableUpdate() {
                let priorityIds = [];
                this.list.data.data.forEach(function (element) {
                    priorityIds.push(element.id);
                });

                this.axios
                    .post(`${this.data.urlLoadDefinition}/change-position`, {
                      'ids' : priorityIds,
                      'number_page' : this.page,
                      'per_page' : this.list.per_page
                    })
                    .then(response => (this.$notify({text: response.data.message, type: response.data.status})))
                    .catch(error => {
                      this.$emit('showError', error);
                    });
            },

            updatelist(response) {
                this.listItems = response.data.data
            },

            classForTh(field) {
                return {
                    'sorting' : field.isSortable,
                    'sorting_desc' : this.list.order[field.key] == 'desc',
                    'sorting_asc' : this.list.order[field.key] == 'asc',
                }
            },

            getParamFromUrl(param) {
                let urlParams = new URLSearchParams(window.location.search);

                return urlParams.get(param);
            },

            remote(item) {
                this.openItemDropdown = false;
                this.axios
                    .delete(`${this.data.urlLoadDefinition}/delete/${item.id}`)
                    .then(response => {this.loadDefinitionData()})
                    .catch(error => {this.$emit('showError', error);});
            },

            edit(item) {
                this.editId = item.id;
                this.openItemDropdown = false;
            }
        }
    }
</script>