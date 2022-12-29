<template>
    <div class="modal files_uploaded_table" role="dialog" style="display: block" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog">
            <div class="form-preloader smoke_lol"><i class="fa fa-gear fa-4x fa-spin"></i></div>
            <div class="modal-content">
                <div class="modal-header">
                    <span class="close_window" @click="close"> &times; </span>
                    <h4 class="modal-title" id="modal_form_label">Выберите файлы</h4>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered table-striped table-condensed table-hover smart-form has-tickbox">
                        <thead>
                        <tr>
                            <th>&nbsp;</th>
                            <th class="name">Имя</th>
                            <th class="size">Размер</th>
                            <th class="date">Дата</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr v-for="file in files.data">
                                <td>
                                    <label class="checkbox">
                                        <input v-model="selectedfiles" type="checkbox" :value="file.path" @change="uniqueCheck">
                                        <i></i>
                                    </label>
                                </td>
                                <td style="text-align: left" class="name"><a href="" target="_blank">{{file.name}}</a></td>
                                <td class="size">{{file.size}}</td>
                                <td class="date">{{file.date}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="paginator_pictures" style="text-align: center; padding-top: 10px">
                    <pagination
                            :current="files.current_page"
                            :total="files.total"
                            :per-page="files.per_page"
                            @page-changed="loadStorage"
                            v-show="files.last_page > 1"
                    >
                    </pagination>
                </div>
                <div class="modal-footer" style="background: #fff">
                    <span class="btn btn-success btn-sm" @click="chooseFiles">Выбрать</span>
                    <span class="btn btn-default" @click="close"> Отмена </span>
                </div>
            </div>
        </div>
    </div>

</template>

<script>
    export default {
        name: 'storage-files',
        props: ['multiSelect'],

        data () {
            return {
                files: [],
                selectedfiles : []
            }
        },

        mounted() {
            this.loadStorage();
        },

        methods: {

            uniqueCheck(e) {

                if (this.multiSelect == false) {
                    this.selectedfiles = [];
                    if (e.target.checked) {
                        this.selectedfiles.push(e.target.value);
                    }
                }
            },

            close() {
                this.$emit('close')
            },

            loadStorage(page) {

                page = page || 1;

                this.axios
                    .post(`/cms/load-storage-files?page=`  + page)
                    .then(response => {
                        this.files = response.data.files
                    })
                    .catch(error => console.log(error))
                    .finally(() => this.loading = false)
            },

            chooseFiles()
            {
                this.$emit('addToFiles', this.selectedfiles);
            }
        }

    }
</script>