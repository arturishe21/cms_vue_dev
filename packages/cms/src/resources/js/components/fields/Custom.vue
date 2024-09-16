<template>
  <section>
    <label class="label">{{data.title}}</label>
    <div style="position: relative;" v-html="data.html"></div>
  </section>
</template>

<script>
import FieldBase from './FieldBase';

export default {
  extends: FieldBase,
}
</script>