<template>
    <section>
        <label class="label">{{data.title}}</label>
        <div style="position: relative;">
            <div class="div_input">
                <div class="input_content">

                    <div class="files_type_fields">
                        <div class="progress progress-micro" style="margin-bottom: 0;">
                            <div class="img-progress progress-bar progress-bar-primary bg-color-redLight"
                                 :style="{ width: progress + '%' }" role="progressbar"></div>
                        </div>
                        <div class="input input-file">
                            <span class="button">
                                 <input type="file" @change="uploadFile" ref="file">
                                 Загрузить
                            </span>
                            <span class="button select_with_uploaded" @click="selectFromUploaded">
                                    Выбрать из загруженных
                            </span>
                            <input type="text"
                                   v-model="value"
                                   placeholder="Выберите файл для загрузки"
                                   readonly="readonly"
                            >
                        </div>
                        <div class="tb-uploaded-file-container-ss tb-uploaded-file-container">
                            <template v-if="value">
                                <a :href="value" target="_blank">Скачать</a> |
                                <a class="delete" style="color:red;" @click="removeFile">Удалить</a>
                            </template>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <storage-files v-if="isShowFileStorage"
                       :multiSelect="false"
                       @close="closeFileStorage"
                       @addToFiles="addToFiles"
        ></storage-files>

    </section>
</template>

<script>

    import FieldBase from './FieldBase';
    import StorageFiles from '../partials/StorageFiles';

    export default {
        extends: FieldBase,

        components: {
            StorageFiles,
        },

        data() {
            return {
                progress: 0,
                listFiles: [],
                isShowFileStorage: false
            }
        },

        methods: {

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
                    .post(`${this.$route.path}/file/upload`, data, config)

                    .then(response => {
                        this.value = response.data.long_link;
                        this.progress = 0;
                    })
                    .catch(error => console.log(error))
                    .finally(() => this.loading = false)

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

            addToFiles(files) {

                if (files.length) {
                    this.value = files[0];
                }

                this.closeFileStorage();
            }
        }
    }
</script>