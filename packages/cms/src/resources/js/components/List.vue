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
                                      <th v-if="data.is_sortable" style="width: 1%; padding: 0;">
                                          <i style="margin-left: -10px;" class="fa fa-reorder"></i>
                                      </th>
                                      <th v-for="field in data.fields" :key="field.key"
                                          style="position: relative"
                                          :style="{width: field.width ? field.width : 'auto'}"
                                          :class="classForThOrder(field)"
                                          @click="$emit('sort', field)"
                                      >
                                          <button type="button" @click="$emit('clearOrder')" v-if="data.order[field.key]" class="close" style="position: absolute; top: 12px; left: 13px;">×</button>
                                          {{field.title}}
                                      </th>
                                      <th class="e-insert_button-cell" style="min-width: 69px;">
                                          <button v-if="checkActionAccess('insert')"
                                              class="btn btn-sm btn-success" style="min-width: 70px;" type="button" @click="$emit('add');">
                                              Добавить
                                          </button>
                                      </th>
                                  </tr>
                                  <tr class="filters-row">
                                    <td v-if="data.is_sortable"></td>
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
                                >
                                    <tr v-for="item in listItems.data" :key="item.id">
                                        <td v-if="data.is_sortable" class="tb-sort" style="cursor:s-resize;">
                                            <i class="fa fa-sort"></i>
                                        </td>
                                        <td v-for="field in data.fields" :key="field.key">
                                            <component
                                                v-if="field.is_fast_edit && field.fast_edit_component"
                                                :is="field.fast_edit_component"
                                                :field="field"
                                                :itemId="item.id"
                                                :value="item[field.key]"
                                            ></component>
                                            <span v-else v-html="item[field.key]"></span>
                                        </td>
                                        <td style="width: 80px">
                                          <div class="btn-group pull-right">
                                            <b-dropdown right no-caret>
                                              <template #button-content>
                                                <i class="fa fa-cog"></i> <i class="fa fa-caret-down"></i>
                                              </template>
                                              <li v-if="checkActionAccess('update')">
                                                <a @click="$emit('edit', item.id)"><i class="fa fa-pencil"></i> Редактироварь</a>
                                              </li>
                                              <li v-if="checkActionAccess('preview')">
                                                <a :href="item.url_preview" target="_blank"><i class="fa fa-eye"></i> Предпросмотр</a>
                                              </li>
                                              <li v-if="checkActionAccess('clone')">
                                                <a @click="$emit('clone', item.id)"><i class="fa fa-copy"></i> Клонировать</a>
                                              </li>
                                              <li v-if="checkActionAccess('delete')">
                                                <a style="color: red" @click="$emit('deletePost', item.id)"><i class="fa red fa-times"></i> Удалить</a>
                                              </li>
                                            </b-dropdown>
                                          </div>
                                        </td>
                                    </tr>
                                </draggable>
                            </table>
                            <paginate :listItems = 'listItems' :per_page_list="info.per_page_list" @updatelist="updatelist"></paginate>
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
                filter: {},
                page: 1
            }
        },

        computed: {
            urlAction()
            {
              return this.$urlCms + this.$route.path;
            }
        },

        mounted() {
            this.data = this.info;
            this.listItems = this.info.data;

            if (typeof this.data.filter === 'object' && this.data.filter != '') {
              this.filter = this.data.filter;
            }
        },

        watch: {
            info() {
                this.data = this.info;
                this.listItems = this.info.data;
            }
        },

        methods: {

            checkActionAccess(name) {
                return this.info.actions[name] !== undefined;
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

            classForThOrder(field)
            {
                return {
                    'sorting' : field.is_sortable,
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
                    .post(`${this.urlAction}/change-position`, {
                      'ids' : priorityIds,
                      'number_page' : this.page,
                      'per_page' : this.listItems.per_page
                    })
                    .then(response => (this.$notify({text: response.data.message, type: response.data.status})))
                    .catch(error => {
                      this.$emit('showError', error);
                    });
            },

            updatelist(response) {
                this.listItems = response.list.data.data;
                this.page = response.page;
                this.listItems.per_page = response.per_page;

                this.$emit('setPage', this.page)
            }
        },
    }

</script>