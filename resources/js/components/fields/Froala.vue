<template>
    <section>
      <label class="label">{{data.title}}</label>
        <div style="position: relative;">
          <froala :tag="'textarea'" :name="data.key" :config="config" v-model="value"></froala>
        </div>
    </section>
</template>

<script>
  import 'froala-editor/js/plugins.pkgd.min.js'
  import 'froala-editor/css/froala_editor.pkgd.min.css';
  import FieldBase from './FieldBase';
  export default {
          extends: FieldBase,
          name: 'froalafield',

          data () {
            return {
              config: {
                immediateVueModelUpdate: true,
                toolbarButtonsMD: [],
                events: {
                  'initialized': function () {

                  }
                }
              },
            }
          },

      }
</script>