export default {
    props : ['data'],

    data () {
        return {
            value: this.data.value
        }
    },

    watch: {
        value(newValue) {
            this.updateData(this.data.key, newValue);
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
        }
    }
}