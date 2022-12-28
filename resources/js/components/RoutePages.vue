<template>
    <div>
        <div class="load_page" v-if="isLoad" style="position: fixed; display: block; opacity: 0.7; z-index: 1111111; height: 50px; top: 10px; right: 30px"><i class="fa fa-spinner fa-spin" style="font-size: 40px"></i></div>

        <notifications/>

        <edit v-if="isShow"
              :id="editId"
              :urlLoadData="urlLoadData"
              :urlSave = "urlForUpdate"
              @showError = 'showError'
              @closeWindow="closeWindow"
              @loadData="loadData"
        ></edit>

        <create v-if="isShowCreateWindow"
              @closeWindow="isShowCreateWindow = false"
              @loadData="loadData"
              @showError = 'showError'
              :url = $route.path
              :urlCreate = "urlForCreate"
        ></create>

        <component :is="component"
               :info="data"
               @edit="edit"
               @add="add"
               @deletePost="deletePost"
               @sort="sort"
               @clearOrder="clearOrder"
               @loader="loader"
               @search="search"
               @showError = 'showError'
               @setPage = 'setPage'
        ></component>
    </div>
</template>

<script>

    import list from './List';
    import list_tree from './ListTree';
    import edit from './Edit';
    import create from './Create';

    export default {
        components: {
            list,
            edit,
            create,
            list_tree
        },

        data() {
            return {
                data: {},
                listItems: [],
                fields: [],
                title: '',
                editId: null,
                isShow: false,
                isShowCreateWindow: false,
                isLoad: false,
                isSortable: false,
                order: [],
                page: 1
            }
        },

        mounted() {
            this.loadData();

            if (this.$route.query.id != undefined) {
                this.edit(parseInt(this.$route.query.id));
            }
        },

        watch: {
            '$route'(to, from) {
                this.setPage(1);
                this.loadData();
            }
        },

        computed: {
            isShowMessage() {
                return this.$store.getters.showMessage;
            },

            urlLoadData() {
                return `${this.$route.path}/edit/` + this.editId
            },

            urlForUpdate() {
                return `${this.$route.path}/save/` + this.editId
            },

            urlForCreate() {
                return `${this.$route.path}/save`
            },

            component()
            {
                return this.data.component;
            }
        },

        methods: {

            sort (field) {

                if (!field.is_sortable || this.isLoad) {
                    return;
                }

                this.loader(true);
                let direction = this.order[field.key] == 'asc' ? 'desc' : 'asc';

                this.axios
                    .post(`${this.$route.path}/set-order`,
                        {
                            'field' : field.key,
                            'direction' : direction
                    }).then(response => {
                        this.loadData()
                    }).catch(error => {
                        this.showError(error);
                    });
            },

            search(filter) {
                this.loader(true);

                this.axios
                    .post(`${this.$route.path}/filter`, filter)
                    .then(response => {
                        this.loadData()
                    }).catch(error => {
                        this.showError(error);
                    });
            },

            clearOrder () {
                this.loader(true);

                this.axios
                    .post(`${this.$route.path}/clear-order`)
                    .then(response => {
                        this.loadData()
                    }).catch(error => {
                        this.showError(error);
                    });
            },

            closeWindow() {
                this.isShow = false;
                this.loader(false);
                var url = window.location.href.split('?')[0];

                let getParams = this.getParamFromUrl('node') != null ? '?node=' + this.getParamFromUrl('node') : '';

                url += getParams;

                window.history.pushState(url, '', url);
            },

            setPage(page) {
              this.page = page;
            },

            loadData() {
                this.loader(true);
                this.editId = null;

                let getParams = this.getParamFromUrl('node') != null ? '?node=' + this.getParamFromUrl('node') : '';

                if (this.getParamFromUrl('page') != null) {
                  getParams = '?page=' + this.getParamFromUrl('page');
                }
                if (this.page != 1) {
                  getParams = '?page=' + this.page;
                }

                this.axios
                    .get(`${this.$route.path}/list${getParams}` )
                    .then(response => {

                        this.data = response.data;

                        this.listItems = response.data.data;
                        this.title = response.data.title;
                        this.fields = response.data.fields;
                        this.isSortable = response.data.is_sortable;
                        this.order = response.data.order;
                        document.title = this.title;

                        this.loader(false);
                    }).catch(error => {
                        this.showError(error);
                    });
            },

            getParamFromUrl(param)
            {
                let urlParams = new URLSearchParams(window.location.search);

                return urlParams.get(param);
            },

            add() {
                this.isShowCreateWindow = true;
            },

            edit(id) {
                this.editId = id;
                this.isShow = true;

                this.createUrl(id);
            },

            createUrl(id) {
                let url = window.location.href.split('?')[0];

                url += '?id=' + id;

                if (this.getParamFromUrl('node') != null) {
                    url += '&node=' + this.getParamFromUrl('node');
                }

                window.history.pushState(url, '', url);
            },

            deletePost(id) {
                this.axios
                    .delete(`${this.$route.path}/delete/${id}`)
                    .then(response => {
                        this.loadData();
                        this.$notify({text: response.data.message, type: response.data.status});
                    }).catch(error => {
                        this.showError(error);
                   });
            },

            loader(status) {
                this.isLoad = status;
            },

            showError(error) {
              this.$notify({text: error.response.data.message, type: 'error'});
            }
        }
    }
</script>