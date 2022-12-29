<template>
    <section>
        <label class="label">{{data.title}}</label>
        <div style="position: relative;">
            <div class="div_input">
                <div class="input_content">
                    <multiselect
                            v-model="value"
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
                    >
                        <template slot="tag" slot-scope="{ option, remove }">
                                <span class="custom__tag"><span>{{ option.name }}</span>
                                <span class="custom__remove" @click="remove(option)">❌</span></span>
                        </template>
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

        data() {
            return {
                results : [],
                isLoading: false,
            }
        },

        methods: {

            updateData (key, value) {

                this.$store.commit('updateData', {
                    'definition' : this.definition,
                    'key': key,
                    'value': value ? value.id : null
                });
            },

            asyncFind(query) {

                if (query) {
                    this.isLoading = true;
                    this.axios.post(`${this.$route.path}/search`,
                        {
                            'query' : query,
                            'key' : this.data.key
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
