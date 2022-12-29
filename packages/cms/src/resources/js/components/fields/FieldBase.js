export default {
    props : ['data', 'id', 'definition'],

    data () {
        return {
            value: this.data.value,
            language: 'ua'
        }
    },

    mounted() {
        this.updateData(this.data.key, this.data.value);
        this.language = this.$store.getters.languages.site.default;
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
                'definition' : this.definition,
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