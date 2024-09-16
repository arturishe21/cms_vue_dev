<template>
  <section>
      <select v-model="fastValue" @change="changeValue()" class="form-control input-small">
        <option :value="key" v-for="(val, key) in field.options">{{val}}</option>
      </select>
      <i></i>
  </section>
</template>

<script>
import FastEditBase from './FastEditBase';

export default {
  extends: FastEditBase,
}
</script>