<template>
    <section>
        <label class="label">{{data.title}}</label>
        <div style="position: relative;">
            <div class="div_input">
                <div class="input_content">
                    <label class="input">
                        <input type="number" :name="data.key" v-model="value">
                    </label>

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