<template>
    <div>
        <div class="modal-backdrop fade in"></div>

        <div class="modal-open">
            <div class="modal fade in"
                 id="modal_form_edit"
                 :style="styleWindow"
            >
                <div class="modal-dialog" style="width: 920px" data-width="920px">
                    <div class="form-preloader smoke_lol"><i class="fa fa-gear fa-4x fa-spin"></i></div>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button class="btn btn-default close_button" style="float: right; margin: 0 5px"  type="button" @click="close()"
                            > Отмена</button>

                            <button class="btn btn-success btn-sm" style="float: right"
                                    type="button" @click="saveData()">
                                <span class="glyphicon glyphicon-floppy-disk"></span>
                                Сохранить
                            </button>

                            <h4 class="modal-title" id="modal_form_label">Редактирование</h4>
                        </div>

                        <div class="modal-body">
                            <formData :fieldsGroup="fieldsGroup" :id="id"></formData>
                        </div>
                        <div class="modal-footer" style="padding-top:0">

                            <button type="button" class="btn btn-success btn-sm" @click="saveData()">
                                <span class="glyphicon glyphicon-floppy-disk"></span> Сохранить
                            </button>

                            <button type="button" class="btn btn-default close_button" @click="close()">
                                Отмена
                            </button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

    export default {
        name : 'edit',
        props : ['id', 'urlLoadData', 'urlSave'],

        data() {
            return {
                fieldsGroup: [],
                styleWindow: {
                    display: 'block',
                    top: '0px'
                }
            }
        },

        mounted() {
          this.loadData(this.urlLoadData);
        },

        computed: {
            data () {
                return this.$store.getters.getData;
            },
        },

        methods: {

            close() {
                this.$emit("closeWindow");
            },

            saveData() {

                this.$store.commit('message', true);

                this.axios.post(this.urlSave, this.data)
                    .then(response => {
                       this.$emit("loadData");
                       this.close();
                       this.$notify({text: response.data.message, type: response.data.status});
                    })
                    .catch(err => consolel.log(err))
            },

            loadData(url) {

                this.$store.commit('setDefaultData');
                this.styleWindow.top = window.scrollY + 'px';

                this.axios.get(url)
                    .then(response => {
                        this.fieldsGroup = response.data;
                        this.tabActive = 0;

                    })
                    .catch(err => consolel.log(err))
            }
        }
    }
</script>