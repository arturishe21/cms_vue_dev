<template>
  <section id="widget-grid" v-html="info.html"></section>
</template>
<script>
  export default {
    name: 'resource_custom',
    props: ['info'],
  }
</script>