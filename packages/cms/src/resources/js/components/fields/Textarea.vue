<template>
    <section>
        <label class="label">{{data.title}}</label>
        <div style="position: relative;">
            <div class="div_input">
                <div class="input_content">
                    <label class="textarea">
                         <textarea rows="3" class="custom-scroll" :name="data.key" v-model="value"></textarea>
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