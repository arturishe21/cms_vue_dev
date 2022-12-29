<template>
  <div style="position: relative;">
      <select v-model="selected" :name="'filter['+ field.key +']'" @change="changeFilter" class="form-control input-small">
        <option value="">Все</option>
        <option :value="key" v-for="(val, key) in field.options">{{val}}</option>
      </select>

      <button v-if="filter[field.key]" @click="clearFilter(field.key)" class="close" style="position: absolute; top: 6px; right: 16px;">
        ×
      </button>
  </div>
</template>

<script>
import FilterBase from './FilterBase';

export default {
  extends: FilterBase,
  name: 'FilterSelect',
  data() {
    return {
      selected: this.filter[this.field.key] != undefined ? this.filter[this.field.key] : '',
    }
  },

  methods: {
    clearFilter(key) {
      this.selected = '';
      this.$emit('clearFilter', key)
    },
    changeFilter() {
      this.filter[this.field.key] = this.selected;
      this.$emit('changeFilter');
    }
  },

}
</script>