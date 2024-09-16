export default {
    props: ['field', 'itemId', 'value'],

    data() {
        return {
            fastValue: this.value,
        }
    },

    computed: {
        keyFastEditField() {
            return this.field.key + this.itemId;
        },
        urlAction() {
            return this.$urlCms + this.$route.path;
        }
    },
    methods: {
        changeValue() {
            this.axios
                .post(`${this.urlAction}/fast-edit/${this.itemId}`, {
                    'key': this.field.key,
                    'value': this.fastValue
                })
                .then(response => (this.$notify({text: response.data.message, type: response.data.status})))
                .catch(error => {
                    this.$notify({text: error.response.data.message, type: 'error'});
                });
        },
    },
}