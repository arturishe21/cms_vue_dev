<template>
  <section>
    <div class="input_content">
      <multiselect
          v-model="fastValue"
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
          @input="changeValue"
      >
        <template slot="tag" slot-scope="{ option, remove }">
                  <span class="custom__tag"><span>{{ option.name }}</span>
                  <span class="custom__remove" @click="remove(option)">❌</span></span>
        </template>
      </multiselect>
    </div>
  </section>
</template>

<script>
import FastEditBase from './FastEditBase';
import Multiselect from "vue-multiselect";

export default {
  extends: FastEditBase,
  components: { Multiselect },

  data() {
    return {
      results : [],
      isLoading: false,
      fastValue: this.value,
    }
  },

  methods: {

    changeValue() {
      this.axios
          .post(`${this.urlAction}/fast-edit/${this.itemId}`, {
            'key': this.field.key,
            'value': this.fastValue.id
          })
          .then(response => (this.$notify({text: response.data.message, type: response.data.status})))
          .catch(error => {
            this.$notify({text: error.response.data.message, type: 'error'});
          });
    },

    asyncFind(query) {

      if (query) {
        this.isLoading = true;
        this.axios.post(`${this.$urlCms + this.$route.path}/search`,
            {
              'query' : query,
              'key' : this.field.key
            })
            .then(response => {
              this.isLoading = false;
              this.results = response.data;
            })
            .catch(error => {
              this.$notify({text: error.response.data.message, type: 'error'});
            });
      }
    }
  }
}
</script>