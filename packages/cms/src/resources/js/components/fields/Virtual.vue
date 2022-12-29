<template>
    <section>
        <label class="label">{{data.title}}</label>
        <div style="position: relative;">
            <div class="div_input">
                <div class="input_content">
                   {{data.value}}
                </div>
            </div>
        </div>
    </section>

</template>

<script>
    export default {
        props : ['data'],
    }
</script>