<template>
  <div style="position: relative;">
    <div class="div_input">
      <div class="input_content">
        <multiselect
            v-model="filter[field.key]"
            id="ajax"
            label="name"
            track-by="id"
            placeholder="Поиск"
            open-direction="bottom"
            :options="results"
            :searchable="true"
            :loading="isLoading"
            :internal-search="true"
            :clear-on-select="true"
            :close-on-select="true"
            :options-limit="300"
            :limit="3"
            :max-height="600"
            :show-no-results="false"
            :hide-selected="true"
            @search-change="asyncFind"
            @input="changeFilter"
        >
          <template slot="tag" slot-scope="{ option, remove }">
                  <span class="custom__tag"><span>{{ option.name }}</span>
                  <span class="custom__remove" @click="remove(option)">❌</span></span>
          </template>
        </multiselect>
      </div>
    </div>
    <button v-if="filter[field.key]" @click="clearFilter(field.key)" class="close" style="position: absolute; top: 5px; right: 26px;">
      ×
    </button>
  </div>
</template>

<script>
  import FilterBase from './FilterBase';
  import Multiselect from "vue-multiselect";

  export default {
    components: { Multiselect },
    extends: FilterBase,
    name: 'FilterForeignAjax',
    data() {
      return {
        results : [],
        isLoading: false,
      }
    },
    methods: {

      asyncFind(query) {

        if (query) {
          this.isLoading = true;
          this.axios.post(`${this.$route.path}/search`,
              {
                'query' : query,
                'key' : this.field.key
              })
              .then(response => {
                this.isLoading = false;
                this.results = response.data;
              })
              .catch(err => console.log(err))
        }
      }
    }
  }
</script>