<template>
    <div class="dt-toolbar-footer">
        <div class="col-sm-6 col-xs-12 hidden-xs">
            <div id="dt_basic_info" class="dataTables_info" role="status" aria-live="polite" style="margin-top:5px">
                Показывать по
                <select style="margin-right: 30px" v-model="listItems.per_page" @change="changePerPage()">
                  <option :value="val" v-for="(val) in per_page_list">{{val}}</option>
                </select>

                Показано
                <span class="txt-color-darken listing_from">{{listItems.from}}</span>
                -
                <span class="txt-color-darken listing_to">{{listItems.to}} </span>
                из
                <span class="text-primary listing_total">{{listItems.total}}</span>
                записей
            </div>
        </div>
        <div class="col-xs-12 col-sm-6">
            <div id="dt_basic_paginate" class="dataTables_paginate paging_simple_numbers">
                <pagination
                      :current="listItems.current_page"
                      :total="listItems.total"
                      :per-page="listItems.per_page"
                      @page-changed="fetchData"
                      v-show="listItems.last_page > 1"
                >
                </pagination>
            </div>
        </div>
    </div>
</template>

<script>
    import Select from "../fields/Select";
    export default {
         name: 'paginate',
         components: {Select},
         props : ['listItems', 'per_page_list'],

         methods: {
            changePerPage()
            {
               this.axios.post(`${this.$route.path}/set-per-page`, {
                 'per_page' : this.listItems.per_page
               }).then(response => {
                  this.fetchData(1);
               }).catch(error => {
                  this.$emit('showError', error);
               });
            },

            fetchData(page) {
                page = page || 1;
                var urlPath = window.location.href.split('?')[0];
                var url = (page == 1) ? urlPath : urlPath + '?page=' + page;

                window.history.pushState(url, '', url);

                this.axios.get(`${this.$route.path}/list?page=` + page)
                    .then(response => {
                        this.$emit("updatelist", {
                          'list': response,
                          'page': page,
                          'per_page': this.listItems.per_page
                        });
                    })
                    .catch(error => {
                      this.$emit('showError', error);
                    });
            },
        }
    }
</script>