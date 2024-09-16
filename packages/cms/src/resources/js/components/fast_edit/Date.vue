<template>
  <section>
    <label class="input">
      <date-picker
          v-model="fastValue"
          value-type="format"
          default-value="value"
          style="width:100%"
          @change = 'changeValue'
          type="date"
      ></date-picker>
    </label>
  </section>
</template>

<script>
import FastEditBase from './FastEditBase';
import DatePicker from 'vue2-datepicker';
import 'vue2-datepicker/index.css';

export default {
  extends: FastEditBase,
  components: { DatePicker},
}
</script>