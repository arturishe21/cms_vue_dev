<template>
    <section>
      <div class="tab-pane active">
        <ul class="nav nav-tabs tabs-pull-right">
          <label class="label pull-left" style="line-height: 32px;">{{data.title}}</label>
          <li v-for='(tab, index) in data.languages' :class="{ active: index == tabActive }" @click="changeTab(index)">
            <a>{{tab.language}}</a>
          </li>
        </ul>

        <div class="tab-content padding-5">
          <div class="tab-pane" :class="{ active: index == tabActive }" v-for='(tab, index) in data.languages'>
            <div style="position: relative;">
              <froala :tag="'textarea'" :name="data.key" :config="config" v-model="value[tab.language]"></froala>
            </div>
          </div>
        </div>
      </div>
    </section>
</template>

<script>
  import 'froala-editor/js/plugins.pkgd.min.js'
  import 'froala-editor/css/froala_editor.pkgd.min.css';
  import FieldBase from './FieldBase';
  export default {
    extends: FieldBase,

    data () {
      return {
        tabActive: 0,
        config: {
          toolbarButtonsMD: [],
        },
      }
    },

    methods: {
      changeTab(index) {
        this.tabActive = index;
      },
    }
  }
</script>