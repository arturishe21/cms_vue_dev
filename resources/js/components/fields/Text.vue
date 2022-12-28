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
      watch: {
        storeData(nn, tt) {
         /* var field = this.data.transliterationField;
          if (this.$store.getters.getData && field) {
            var valueTransliteration = this.$store.getters.getData(this.definition);
            this.value = this.$strSlug(valueTransliteration[field][this.language]);
          }*/

          return nn;
        }
      },
        computed : {
            storeData () {
              return this.$store.getters.getData(this.definition);
            },
        },

    }
</script>