export default {
    props : ['field', 'filter'],
    methods: {
        clearFilter(key) {
            this.$emit('clearFilter', key)
        },
        changeFilter() {
            this.$emit('changeFilter')
        }
    }
}