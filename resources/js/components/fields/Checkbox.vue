<template>
    <section>
        <div style="position: relative;">
            <div class="div_input">
                <div class="input_content">
                    <label class="checkbox">
                        <input type="checkbox"
                               v-model="value"
                        >
                        <i></i>{{data.title}}</label>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
    import FieldBase from './FieldBase';

    export default {
        extends: FieldBase,
    }
</script>