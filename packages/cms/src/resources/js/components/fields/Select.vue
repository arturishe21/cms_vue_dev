<template>
    <section>
        <label class="label">{{data.title}}</label>
        <div style="position: relative;">
            <div class="div_input">
                <div class="input_content">
                    <label class="select">
                        <select v-model="value">
                            <option :value="key" v-for="(val, key) in data.options">{{val}}</option>
                        </select>
                        <i></i>
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