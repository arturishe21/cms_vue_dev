<template>
    <div class="dt-toolbar-footer">
        <div class="col-sm-6 col-xs-12 hidden-xs">
            <div id="dt_basic_info" class="dataTables_info" role="status" aria-live="polite">
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
    export default {
         name: 'paginate',
         props : ['listItems'],

        methods: {
            fetchData(page) {
                page = page || 1;

                this.axios.get(`${this.$route.path}/list?page=`  + page)
                    .then(response => {
                        this.$emit("updatelist", response);
                    })
                    .catch(err => consolel.log(err))
            },
        }
    }
</script>