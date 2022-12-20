<template>
    <div id="content">
        <div class="row" id="content_admin">
            <div id="table-preloader" class="smoke_lol"><i class="fa fa-gear fa-4x fa-spin"></i></div>
            <p><a class="show_hide_tree">Показать дерево</a></p>
            <div id="tree_top">
                <div class="tree_top_content"></div>
            </div>
            <section id="widget-grid" class="">

                <div class="row" style="padding-right: 13px; padding-left: 13px;">
                    <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding-right: 0px; padding-left: 0px;">
                        <div class="jarviswidget jarviswidget-color-blue">
                            <table id="tb-tree-table" class="table table-bordered">
                                <thead>
                                <tr>
                                    <th class="text-left">
                                        <template v-if="list.node">

                                            <span v-for="link in list.node.ancestors">
                                                 <a @click="getNodeContent(link.id)" style="color: #fff" class="node_link" >{{jsonConvert(link.title)}}</a> /
                                            </span>

                                            <span>
                                                {{jsonConvert(list.node.page.title)}}
                                            </span>

                                        </template>
                                        <template v-if="list.node">
                                            <a style="min-width: 70px; float: right;" @click="edit(list.node.page)">Редактировать</a>
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

                                                        <th v-for="field in list.fields" :key="field.key"
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
                                                    <template v-if="list.node">
                                                        <tr v-if="list.node.page.parent_id">
                                                            <td colspan="6" style="text-align: left">
                                                                <a @click="getNodeContent(list.node.page.parent_id)" class="node_link">&larr; Назад</a>
                                                            </td>
                                                        </tr>
                                                    </template>
                                                </thead>

                                                    <draggable
                                                            :list="list.data.data"
                                                            :element="'tbody'"
                                                            handle=".tb-sort"
                                                            ref="draggable"
                                                            @update="onDraggableUpdate"
                                                            :move="checkMove"
                                                    >
                                                        <tr v-for="item in list.data.data" :key="item.id">
                                                            <td class="tb-sort" style="cursor:s-resize;">
                                                                <i class="fa fa-sort"></i>
                                                            </td>
                                                            <td v-for="field in list.fields" :key="field.key" style="text-align:left">

                                                                <template v-if="field.key == 'title'">
                                                                    <i :class="[item[field.key].folder ? 'fa fa-folder' : 'fal fa-file']"></i>&nbsp;
                                                                    <a @click="getNodeContent(item.id)" class="node_link">{{ item[field.key].title }}</a>
                                                                </template>
                                                                <template v-else>
                                                                    <span v-html="item[field.key].title"></span>
                                                                </template>

                                                            </td>
                                                            <td style="width: 80px">
                                                                <div class="btn-group pull-right">
                                                                    <b-dropdown right no-caret>
                                                                        <template #button-content>
                                                                            <i class="fa fa-cog"></i> <i class="fa fa-caret-down"></i>
                                                                        </template>
                                                                        <li><a @click="edit(item)"><i class="fa fa-pencil"></i> Редактироварь</a></li>
                                                                        <li><a style="color: red" @click="remove(item)"><i class="fa red fa-times"></i> Удалить</a></li>
                                                                    </b-dropdown>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </draggable>

                                            </table>
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

    export default {
        name: 'list_tree',
        props: ['info'],

        components: {
            draggable
        },

        data() {
            return {
                list: this.info,
                elementDraggable : {}
            }
        },

        watch: {
            info: function(newVal, oldVal) {
                this.list = newVal
            }
        },

        methods: {

            checkMove: function(evt){
                this.elementDraggable = evt.draggedContext.element.id;
            },

            add() {

                this.$store.commit('updateData', {
                    'key': '__node',
                    'value': this.list.node.page.id
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
                this.list.data.data.forEach(function (element) {
                    priorityIds.push(element.id);
                });

                this.axios
                    .post(`${this.$route.path}/change-position`, {
                        'ids' : priorityIds,
                        'element' : this.elementDraggable
                    })
                    .then(response => {});
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
                    .get(`${this.$route.path}/list?node=` +id )
                    .then(response => {
                        this.list = response.data;
                        this.$emit('loader', false);
                    });
            },
        },
    }
</script>