<template>
    <section>
        <label class="label">{{data.title}}</label>
        <div style="position: relative;">
            <div class="div_input">
                <div class="input_content">
                    <label class="input">
                        <input type="text" :name="data.key" v-model="value">
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

        computed : {
            transliteration () {
                if (this.$store.getters.getData && this.data.transliteration) {
                    this.value = this.$strSlug(this.$store.getters.getData[this.data.transliteration].ru);
                }
            }
        },
    }
</script>