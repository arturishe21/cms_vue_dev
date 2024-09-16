<template>
    <section>
        <label class="label">{{data.title}}</label>
        <div style="position: relative;">
            <div class="div_input">
                <div class="input_content _select">
                    <multiselect
                            v-model="value"
                            :options="data.options"
                            :multiple="true"
                            placeholder="Выбрать из списка"
                            track-by="id"
                            label="name"
                    >
                    </multiselect>
                </div>
            </div>
        </div>

    </section>
</template>

<script>
    import Multiselect from 'vue-multiselect'
    import FieldBase from './FieldBase';

    export default {
        components: { Multiselect },
        extends: FieldBase,
    }
</script>

<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>