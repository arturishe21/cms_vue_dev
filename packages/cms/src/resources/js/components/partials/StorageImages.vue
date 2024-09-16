<template>
    <div class="modal files_uploaded_table" style="display:block; " role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog">
            <div class="form-preloader smoke_lol"><i class="fa fa-gear fa-4x fa-spin"></i></div>
            <div class="modal-content">
                <div class="modal-header">
                    <span class="close_window" @click="close"> &times; </span>
                    <h4 class="modal-title" id="modal_form_label">Выберите изображения</h4>
                </div>
                <div class="modal-body" style="padding: 0 30px">
                    <div class="smart-form">
                        <div class="row filter_gallary_images" style="padding-top: 10px">
                            <section  class="col col-4">
                                <label class="input">
                                    <input type="text" value="" name="q" placeholder="Искать..">
                                </label>
                            </section>
                            <section class="col col-4">
                                <label class="select">
                                    <select name="id_gallery">
                                        <option value="">Выбрать галерею</option>
                                    </select>
                                    <i></i>
                                </label>
                            </section>

                            <section class="col col-4">
                                <label class="select">
                                    <select name="id_tag">
                                        <option value="">Выбрать тег</option>
                                    </select>
                                    <i></i>
                                </label>
                            </section>
                        </div>

                        <div class="one_img_uploaded is_wrapper"
                             :class="{ selected: isSelected(image) }"
                             v-for="image in images.data" @click="select(image)">
                            <div class="one_img_uploaded_content">
                                <img :src="image.preview">
                            </div>
                            <div class="one_img_uploaded_label">
                                {{image.size}}
                            </div>
                        </div>
                        <div style="clear:both"></div>
                        <div class="paginator_pictures" style="text-align: center">
                            <pagination
                                    :current="images.current_page"
                                    :total="images.total"
                                    :per-page="images.per_page"
                                    @page-changed="loadStorage"
                                    v-show="images.last_page > 1"
                            >
                            </pagination>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" style="padding-top: 5px">
                    <span class="btn btn-success btn-sm" @click="addToImages">Выбрать</span>
                    <span class="btn btn-default" @click="close"> Отмена</span>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'storage-images',

        props : ['multiSelect'],

        data () {
            return {
                images: [],
                selectedImages : []
            }
        },

        mounted() {
            this.loadStorage();
        },

        methods: {

            close() {
                this.$emit('close')
            },

            loadStorage(page) {

                page = page || 1;

                this.axios
                    .post(`${this.$urlCms}/load-storage-images?page=`  + page)
                    .then(response => {
                        this.images = response.data.images
                    })
                    .catch(error => console.log(error))
                    .finally(() => this.loading = false)
            },

            select(image){

                if (this.multiSelect == false) {
                    this.selectedImages = [];
                }

                let elementPosition = this.selectedImages.indexOf(image);
                (elementPosition == -1) ? this.selectedImages.push(image) : this.selectedImages.splice(elementPosition, 1);
            },

            isSelected(image) {

                let result = this.selectedImages.find(function(item) {
                    return item.id === image.id
                });

                return result != undefined;
            },

            addToImages()
            {
                this.$emit('addToImages', this.selectedImages);
            }
        }
    }
</script>

<style scoped>

    .one_img_uploaded img {
        width: auto;
        height: auto;
    }
    .one_img_uploaded.is_wrapper {
        width: 110px;
        height: 125px;
        flex-flow: column;
        align-items: center;
        justify-content: center;
    }
    .one_img_uploaded_content {
        width: 110px;
        height: 100px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .one_img_uploaded_label {
        padding: 5px 0px;
        font-size: 14px;
        line-height: 1;
    }
</style>