<template>
    <section>
        <label class="label">{{data.title}}</label>
        <div style="position: relative;">
            <div class="div_input">
                <div class="input_content">
                    <div class="pictures_input_field">
                        <div class="picture_block">
                            <div class="progress progress-micro" style="margin-bottom: 0;">
                                <div class="img-progress progress-bar progress-bar-primary bg-color-redLight"
                                     role="progressbar" :style="{ width: progress + '%' }"></div>
                            </div>
                            <div class="input input-file">
                                <span class="button select_with_uploaded" @click="selectFromUploaded">Выбрать из загруженных</span>
                                <span class="button">
                                    <input type="file" multiple accept="image/*" ref="file" @change="uploadFile">
                                    Загрузить
                                </span>
                                <input type="text" placeholder="Выберите изображение для загрузки" readonly="readonly">
                            </div>

                            <div class="tb-uploaded-image-container">
                                <ul class="dop_foto" v-if="listFiles.length">
                                    <li v-for="(file, index) in listFiles">
                                        <img class="image-attr-editable" style="max-width: 120px" :src="file.preview" />

                                        <div class="tb-btn-delete-wrap">
                                            <button class="btn2 btn-default btn-sm tb-btn-image-delete"
                                                    type="button"
                                                    @click="removeFile(index)"
                                                    >
                                                <i class="fa fa-times"></i>
                                            </button>
                                        </div>
                                    </li>
                                </ul>
                                <div class="no_photo" style="text-align: center; " v-else>
                                    Нет изображений
                                </div>
                                <div style="clear: both"></div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <storage-images v-if="isShowFileStorage"
                        :multiSelect="true"
                        @close="closeFileStorage"
                        @addToImages="addToImages"
        ></storage-images>
    </section>
</template>

<script>

    import FieldBase from './FieldBase';
    import StorageImages from '../partials/StorageImages';

    export default {
        extends: FieldBase,

        components: {
            StorageImages,
        },

        data() {
            return {
                progress: 0,
                listFiles: [],
                isShowFileStorage: false
            }
        },

        watch: {
           value () {
               this.fillListFiles();
           }
        },

        mounted() {
            this.fillListFiles();
        },

        methods: {

            fillListFiles () {
                 this.listFiles = this.value ? this.value : [];

                let arrayPicturesForValue = this.value.map(function (el) {
                    return el.path;
                });

                this.updateData(this.data.key, JSON.stringify(arrayPicturesForValue));
            },

            uploadFile() {

                for (var index = 0; index < this.$refs.file.files.length; ++index) {

                    var data = new FormData();
                    data.append("file", this.$refs.file.files[index]);
                    data.append("key", this.data.key);

                    const config = {
                        onUploadProgress: progressEvent => {
                            this.progress = (progressEvent.loaded / progressEvent.total) * 100;
                        }
                    }

                    this.axios
                        .post(`${this.$route.path}/file/upload`, data, config)
                        .then(response => {
                            this.value.push(response.data.image);
                            this.progress = 0;
                        })
                        .catch(error => console.log(error))
                        .finally(() => this.loading = false)
                }

            },

            removeFile(index) {
                this.value.splice(index, 1);
            },

            selectFromUploaded() {
                this.isShowFileStorage = true;
            },

            closeFileStorage () {
                this.isShowFileStorage = false;
            },

            addToImages (images) {

                let newImagesList = this.value.concat(images);
                this.value = newImagesList;
                this.closeFileStorage();
            }
        }
    }
</script>