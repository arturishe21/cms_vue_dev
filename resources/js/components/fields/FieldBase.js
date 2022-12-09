export default {
    props : ['data', 'id'],

    data () {
        return {
            value: this.data.value
        }
    },

    mounted() {
        this.updateData(this.data.key, this.data.value);
    },

    watch: {
        value: {
            handler(newValue){
                this.updateData(this.data.key, newValue);
            },
            deep: true
        },

        data(newValue) {
            this.value = newValue.value;
            this.updateData(this.data.key, newValue.value);
        }
    },

    methods: {

        updateData (key, value) {
            this.$store.commit('updateData', {
                'key': key,
                'value': value
            });
        },

        createEmptyValue() {

            if (!this.value) {
                var emptyObjectLanguage = {};

                for (var item in this.data.languages) {
                    var language = this.data.languages[item].language;
                    emptyObjectLanguage[language] = '';
                }

                this.value = emptyObjectLanguage;
            }
        }
    }
}