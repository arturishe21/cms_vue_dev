<template>
    <section>
        <label class="label">{{data.title}}</label>
        <p>{{data.value}}</p>
    </section>
</template>

<script>
    export default {
        props : ['data'],
    }
</script>