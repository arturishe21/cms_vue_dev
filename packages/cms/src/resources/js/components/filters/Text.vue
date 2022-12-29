<template>
  <div style="position: relative;">
    <input
        v-if="field.is_filterable"
        type="text"
        :name="'filter['+ field.key +']'"
        v-model="filter[field.key]"
        class="form-control input-small">

    <button v-if="filter[field.key]" @click="clearFilter(field.key)" class="close" style="position: absolute; top: 6px; right: 6px;">
      ×
    </button>
  </div>
</template>

<script>
import FilterBase from './FilterBase';

export default {
  extends: FilterBase,
  name: 'FilterText',
}
</script>