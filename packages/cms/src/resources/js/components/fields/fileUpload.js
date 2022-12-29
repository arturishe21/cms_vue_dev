export default {

    data() {
        return {
            progress: 0,
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

        }
    }
}