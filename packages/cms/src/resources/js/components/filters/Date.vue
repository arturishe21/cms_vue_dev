<template>
  <div style="position: relative; text-align: center">
    <label class="input" style="width: 210px">
      <date-picker
          v-model="filter[field.key]"
          value-type="format"
          default-value="value"
          @clear = 'clearFilter(field.key)'
          @change = 'changeFilter'
          :range=true
          style="width:100%"
          type="date"
      ></date-picker>
    </label>
  </div>
</template>

<script>
  import FilterBase from './FilterBase';
  import DatePicker from 'vue2-datepicker';
  import 'vue2-datepicker/index.css';

  export default {
    extends: FilterBase,
    name: 'FilterDate',
    components: { DatePicker},
  }
</script>