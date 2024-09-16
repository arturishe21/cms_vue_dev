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
                                 <input type="file" multiple @change="uploadFile" ref="file">
                                 Загрузить
                            </span>
                            <span class="button select_with_uploaded" @click="selectFromUploaded">
                                    Выбрать из загруженных
                            </span>
                            <input type="text"
                                   placeholder="Выберите файл для загрузки"
                                   readonly="readonly"
                            >
                        </div>
                        <div class="uploaded-files" v-if="listFiles.length">
                            <ul>
                                <li v-for="(file, index) in listFiles">
                                    {{basename(file)}} <a :href="file"  target="_blank">Скачать</a>
                                    <a class="delete" @click="removeFile(index)">Удалить</a>
                                </li>
                            </ul>
                        </div>

                    </div>

                </div>
            </div>
        </div>

        <storage-files v-if="isShowFileStorage"
                        :multiSelect="true"
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

        watch: {
            listFiles () {
                this.value = JSON.stringify(this.listFiles);
            },

            value () {
                this.fillListFiles();
            }
        },

        mounted() {
            this.fillListFiles();
        },

        methods: {

            fillListFiles () {
                this.listFiles = this.value ? JSON.parse(this.value) : [];
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
                        .post(`${this.urlAction}/file/upload`, data, config)

                        .then(response => {
                            this.listFiles.push(response.data.long_link);
                            this.progress = 0;
                        })
                        .catch(error => console.log(error))
                        .finally(() => this.loading = false)
                }

            },

            basename(path) {
                return path.split('/').reverse()[0];
            },

            removeFile(index) {
                this.listFiles.splice(index, 1);
            },

            selectFromUploaded() {
                this.isShowFileStorage = true;
            },

            closeFileStorage () {
                this.isShowFileStorage = false;
            },

            addToFiles(files) {
                let newFilesList = this.listFiles.concat(files);
                this.listFiles = newFilesList;
                this.closeFileStorage();
            }

        }
    }
</script>