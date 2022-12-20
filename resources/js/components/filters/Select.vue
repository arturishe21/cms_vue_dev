<template>
  <div style="position: relative;">
      <select v-model="filter[field.key]" :name="'filter['+ field.key +']'" @change="changeFilter" class="form-control input-small">
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
}
</script>