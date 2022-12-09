<template>
    <section id="widget-grid" class="">
        <div class="row" style="padding-right: 13px; padding-left: 13px;">
            <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding-right: 0px; padding-left: 0px;">
                <div class="jarviswidget jarviswidget-color-blue" id="wid-id-1">
                    <header>
                        <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                        <h2>{{data.title}}</h2>
                    </header>
                    <div>
                        <div class="jarviswidget-editbox"></div>
                        <div class="widget-body no-padding">
                            <table id="datatable_fixed_column" class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th v-if="data.isSortable" style="width: 1%; padding: 0;">
                                        <i style="margin-left: -10px;" class="fa fa-reorder"></i>
                                    </th>

                                    <th v-for="field in data.fields" :key="field.key"
                                        style="position: relative"
                                        :style="{width: field.width ? field.width : 'auto'}"
                                        :class="classForTh(field)"
                                        @click="$emit('sort', field)"
                                    >
                                        <button type="button" @click="$emit('clearOrder')" v-if="data.order[field.key]" class="close" style="position: absolute; top: 12px; left: 13px;">×</button>
                                        {{field.title}}
                                    </th>

                                    <th class="e-insert_button-cell" style="min-width: 69px;">
                                        <button class="btn btn-sm btn-success" style="min-width: 70px;" type="button" @click="$emit('add')">
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
                                >
                                    <tr v-for="item in listItems.data" :key="item.id">
                                        <td v-if="data.isSortable" class="tb-sort" style="cursor:s-resize;">
                                            <i class="fa fa-sort"></i>
                                        </td>
                                        <td v-for="field in data.fields" :key="field.key">
                                            <span v-html="item[field.key]"></span>
                                        </td>
                                        <td style="width: 80px">

                                            <div class="btn-group pull-right" :class="{ open: checkOpenDropdown(item) }">
                                                <a class="btn dropdown-toggle btn-default"
                                                    data-toggle="dropdown"
                                                   @click="openDropdown(item)"
                                                >
                                                    <i class="fa fa-cog"></i> <i class="fa fa-caret-down"></i>
                                                </a>
                                                <ul class="dropdown-menu">
                                                    <li>
                                                        <a @click="$emit('edit', item.id)"><i class="fa fa-pencil"></i> Редактировать</a>
                                                    </li>
                                                    <li>
                                                        <a style="color: red" @click="$emit('deletePost', item.id)" ><i class="fa red fa-times"></i> Удалить</a>
                                                    </li>
                                                </ul>
                                            </div>

                                        </td>
                                    </tr>
                                </draggable>
                            </table>
                            <paginate :listItems = 'listItems' @updatelist="updatelist"></paginate>
                        </div>
                    </div>
                </div>
            </article>
        </div>
    </section>
</template>

<script>

    import draggable from 'vuedraggable'

    export default {
        name: 'list',
        props: ['info'],

        components: {
            draggable
        },

        data() {
            return {
                data: {},
                listItems: [],
                openItemDropdown: false
            }
        },

        mounted() {
            this.data = this.info;
            this.listItems = this.info.data;
        },

        watch: {
            info() {
                this.data = this.info;
                this.listItems = this.info.data;
            }
        },

        methods: {

            openDropdown(item)
            {
                this.openItemDropdown = this.openItemDropdown == item ? false : item;
            },

            checkOpenDropdown(item)
            {
                return this.openItemDropdown == item;
            },

            classForTh(field)
            {
                return {
                    'sorting' : field.isSortable,
                    'sorting_desc' : this.data.order[field.key] == 'desc',
                    'sorting_asc' : this.data.order[field.key] == 'asc',
                }
            },

            onDraggableUpdate() {
                let priorityIds = [];
                this.listItems.data.forEach(function (element) {
                    priorityIds.push(element.id);
                });

                this.axios
                    .post(`${this.$route.path}/change-position`, priorityIds)
                    .then(response => {});
            },

            updatelist(response) {
                this.listItems = response.data.data
            }
        },
    }

</script>