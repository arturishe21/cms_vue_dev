<template>
    <div id="content">
        <div class="row" id="content_admin">
            <div id="table-preloader" class="smoke_lol"><i class="fa fa-gear fa-4x fa-spin"></i></div>

            <section id="widget-grid" class="">

                <div class="row" style="padding-right: 13px; padding-left: 13px;">
                    <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding-right: 0px; padding-left: 0px;">
                        <div class="jarviswidget jarviswidget-color-blue">
                            <table id="tb-tree-table" class="table table-bordered">
                                <thead>
                                <tr>
                                    <th class="text-left">
                                        <template v-if="data.node">

                                            <span v-for="link in data.node.ancestors">
                                                 <a @click="getNodeContent(link.id)" style="color: #fff" class="node_link" >{{jsonConvert(link.title)}}</a> /
                                            </span>

                                            <span>
                                                {{jsonConvert(data.node.page.title)}}
                                            </span>

                                        </template>
                                        <template v-if="data.node">
                                            <a style="min-width: 70px; float: right;" @click="edit(data.node.page)">Редактировать</a>
                                        </template>
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="tree-td tree-dark" style="padding: 0px; vertical-align: top;text-align: left;">
                                            <table  class="table table-hover table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 1%; padding: 0;">
                                                            <i style="margin-left: -10px;" class="fa fa-reorder"></i>
                                                        </th>

                                                        <th v-for="field in data.fields" :key="field.key"
                                                            style="position: relative"
                                                        >
                                                            {{field.title}}
                                                        </th>

                                                        <th class="e-insert_button-cell" style="min-width: 69px;">
                                                            <button class="btn btn-sm btn-success" style="min-width: 70px;" type="button" @click="add()" >
                                                                Добавить
                                                            </button>
                                                        </th>
                                                    </tr>
                                                    <template v-if="data.node">
                                                        <tr v-if="data.node.page.parent_id">
                                                            <td colspan="6" style="text-align: left">
                                                                <a @click="getNodeContent(data.node.page.parent_id)" class="node_link">&larr; Назад</a>
                                                            </td>
                                                        </tr>
                                                    </template>
                                                    <tr class="filters-row" v-if="isShowFilter">
                                                      <td></td>
                                                      <td v-for="field in data.fields" :key="field.key">
                                                        <component
                                                            :is="field.filterType"
                                                            :field="field"
                                                            :filter="filter"
                                                            @clearFilter="clearFilter"
                                                            @changeFilter="changeFilter"
                                                        ></component>
                                                      </td>
                                                      <td class="e-insert_button-cell" style="min-width: 69px;">
                                                        <button class="btn btn-default btn-sm tb-search-btn" style="min-width: 70px;" type="button"  @click="$emit('search', filter)">
                                                          Поиск
                                                        </button>
                                                      </td>
                                                    </tr>
                                                </thead>

                                                    <draggable
                                                            :list="listItems.data"
                                                            :element="'tbody'"
                                                            handle=".tb-sort"
                                                            ref="draggable"
                                                            @update="onDraggableUpdate"
                                                            :move="checkMove"
                                                    >
                                                        <tr v-for="item in listItems.data" :key="item.id">
                                                            <td class="tb-sort" style="cursor:s-resize;">
                                                                <i class="fa fa-sort"></i>
                                                            </td>
                                                            <td v-for="field in data.fields" :key="field.key">
                                                                <template v-if="field.key == 'title'">
                                                                  <p style="text-align: left">
                                                                    <i :class="[item[field.key].folder ? 'fa fa-folder' : 'fal fa-file']"></i>&nbsp;
                                                                    <a @click="getNodeContent(item.id)" class="node_link">
                                                                      {{ item[field.key].title }}
                                                                    </a>
                                                                  </p>
                                                                </template>
                                                                <template v-else>
                                                                  <component
                                                                      v-if="field.is_fast_edit && field.fast_edit_component"
                                                                      :is="field.fast_edit_component"
                                                                      :field="field"
                                                                      :itemId="item.id"
                                                                      :value="item[field.key].title"
                                                                  ></component>
                                                                  <span v-else v-html="item[field.key].title"></span>

                                                                </template>
                                                            </td>
                                                            <td style="width: 80px">

                                                                <div class="btn-group pull-right">
                                                                    <b-dropdown right no-caret>
                                                                        <template #button-content>
                                                                            <i class="fa fa-cog"></i> <i class="fa fa-caret-down"></i>
                                                                        </template>
                                                                        <li  v-if="checkActionAccess('update')">
                                                                          <a @click="edit(item)"><i class="fa fa-pencil"></i> Редактироварь</a>
                                                                        </li>
                                                                        <li v-if="checkActionAccess('preview')">
                                                                          <a :href="item.url_preview" target="_blank"><i class="fa fa-eye"></i> Предпросмотр</a>
                                                                        </li>
                                                                        <li v-if="checkActionAccess('clone')">
                                                                          <a @click="$emit('clone', item.id)"><i class="fa fa-copy"></i> Клонировать</a>
                                                                        </li>
                                                                        <li  v-if="checkActionAccess('delete')">
                                                                          <a style="color: red" @click="remove(item)"><i class="fa red fa-times"></i> Удалить</a>
                                                                        </li>
                                                                    </b-dropdown>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </draggable>
                                            </table>
                                            <paginate :listItems = 'listItems' :per_page_list="info.per_page_list" @updatelist="updatelist"></paginate>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </article>
                </div>
            </section>
        </div>
    </div>
</template>

<script>

    import draggable from 'vuedraggable'
    import parseJson from "parse-json";

    export default {
        name: 'list_tree',
        props: ['info'],

        components: {
            draggable
        },

        data() {
            return {
                data: {},
                listItems: [],
                filter: {},
                page: 1,
                isShowFilter: false,
                elementDraggable : {},
            }
        },

        computed: {
          urlAction() {
            return this.$urlCms + this.$route.path;
          }
        },

        mounted() {

          this.data = this.info;
          this.listItems = this.info.data;

          if (typeof this.data.filter === 'object' && this.data.filter != '') {
            this.filter = this.data.filter;
          }

          this.checkIsFilterableResource();
        },

        watch: {
          info() {
            this.data = this.info;
            this.listItems = this.info.data;
            this.checkIsFilterableResource();
          }
        },

        methods: {
          parseJson,

          checkActionAccess(name) {
            return this.info.actions[name] !== undefined;
          },

          checkIsFilterableResource()
            {
              for (var prop in this.data.fields) {
                if (this.data.fields[prop].is_filterable) {
                  this.isShowFilter = true;
                  return;
                }
              }

              this.isShowFilter = false;
            },

            updatelist(response) {
              this.listItems = response.list.data.data;
              this.page = response.page;
              this.listItems.per_page = response.per_page;

              this.$emit('setPage', this.page)
            },

            clearFilter(key)
            {
              this.filter[key] = '';
              this.$emit('search', this.filter)
            },

            changeFilter()
            {
              this.$emit('search', this.filter)
            },

            checkMove: function(evt){
                this.elementDraggable = evt.draggedContext.element.id;
            },

            add() {

                var definition = this.$route.params.pathMatch;

                this.$store.commit('updateData', {
                    'definition': definition,
                    'key': '__node',
                    'value': this.data.node.page.id
                });

                this.$emit('add');
            },

            edit(item) {
                this.$emit('edit', item.id);
            },

            remove(item) {
                this.$emit('deletePost', item.id);
            },

            onDraggableUpdate() {
                let priorityIds = [];
                this.data.data.data.forEach(function (element) {
                    priorityIds.push(element.id);
                });

                this.axios
                    .post(`${this.urlAction}/change-position`, {
                        'ids' : priorityIds,
                        'element' : this.elementDraggable
                    })
                    .then(response => (this.$notify({text: response.data.message, type: response.data.status})))
                    .catch(error => {
                      this.$emit('showError', error);
                    });
            },

            jsonConvert(field) {
                try {
                    let jsonField = JSON.parse(field);

                    return jsonField.ru;

                } catch (e) {
                    return field;
                }
            },

            getNodeContent(id) {

                var url = window.location.href.split('?')[0] + '?node=' + id;
                window.history.pushState(url, '', url);

                this.$emit('loader', true);

                this.axios
                    .get(`${this.urlAction}/list?node=` +id )
                    .then(response => {
                        this.data = response.data;
                        this.listItems = this.data.data;
                        this.$emit('loader', false);
                    }).catch(error => {
                        this.$emit('showError', error);
                    });
            },
        },
    }
</script>