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
                                    <input type="file" accept="image/*" ref="file" @change="uploadFile">
                                    Загрузить
                                </span>
                                <input type="text" placeholder="Выберите изображение для загрузки" readonly="readonly">
                            </div>
                            <div class="tb-uploaded-image-container ">
                                <div style="position: relative; display: inline-block;" v-if="preview">
                                    <img class="image-attr-editable" width="200" style="max-width: 200px" :src="preview" />
                                    <div class="tb-btn-delete-wrap">
                                        <button class="btn btn-default btn-sm tb-btn-image-delete"
                                                type="button"
                                                @click="removeFile"
                                        >
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <p style="padding: 20px 0 10px 0" v-else>Нет изображения</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <storage-images v-if="isShowFileStorage"
                        :multiSelect="false"
                        @close="closeFileStorage"
                        @addToImages="addToImage"
        ></storage-images>

    </section>
</template>

<script>

    import StorageImages from '../partials/StorageImages';
    import FieldBase from './FieldBase';

    export default {
        extends: FieldBase,

        components: {
            StorageImages,
        },

        data() {
            return {
                progress: 0,
                isShowFileStorage: false,
                preview : '',
            }
        },

        watch: {
            value () {
                this.setImageValue();
            }
        },

        mounted() {
            this.setImageValue();
        },

        methods: {

            setImageValue () {

                if (this.value) {
                    this.preview = this.value.preview;
                    this.updateData(this.data.key, this.value.path);
                } else {
                    this.preview = '';
                    this.updateData(this.data.key, '');
                }
            },

            uploadFile() {

                var data = new FormData();
                data.append("file", this.$refs.file.files[0]);
                data.append("key", this.data.key);

                const config = {
                    onUploadProgress: progressEvent => {
                        this.progress = (progressEvent.loaded / progressEvent.total) * 100;
                    }
                }

                this.axios
                    .post(`${this.urlAction}/file/upload`, data, config)
                    .then(response => {
                        this.value = response.data.image;
                        this.progress = 0;
                    })
                    .catch(error => console.log(error))

            },

            removeFile() {
                this.value = '';
            },

            selectFromUploaded() {
                this.isShowFileStorage = true;
            },

            closeFileStorage () {
                this.isShowFileStorage = false;
            },

            addToImage (image) {
                this.value = image[0];
                this.closeFileStorage();
            }
        }
    }
</script>