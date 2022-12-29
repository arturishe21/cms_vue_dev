<template>
   <div>
       <div class="load_page" v-if="isLoad" style="position: fixed; display: block; opacity: 0.7; z-index: 1111111; height: 50px; top: 10px; right: 30px"><i class="fa fa-spinner fa-spin" style="font-size: 40px"></i></div>

       <div class="jarviswidget jarviswidget-color-blue " id="wid-id-4">
           <header>
               <span class="widget-icon"> <i class="fa  fa-file-text"></i> </span>
               <h2>Переводы</h2>
           </header>
           <div class="table_center no-padding">

               <div class="dt-toolbar">
                   <div class="col-xs-12 col-sm-6">
                       <div id="dt_basic_filter" class="dataTables_filter">
                           <form v-on:submit.prevent>
                               <label>
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                                   <input class="form-control" v-model="query" @keyup.enter.prevent="search" type="search" value="" aria-controls="dt_basic">
                               </label>
                           </form>
                       </div>
                   </div>
               </div>

               <div class="result_table">

                   <table class="table  table-hover table-bordered " id="sort_t">
                       <thead>
                       <tr>
                           <th style="width: 25%">Фраза</th>
                           <th>Код</th>
                           <th>Переводы</th>
                           <th style="width: 50px">
                               <a class="btn btn-sm btn-success" categor="0">
                                   <i class="fa fa-plus"></i> Создать
                               </a>
                           </th>
                       </tr>
                       </thead>
                       <tbody>
                           <template v-if="listItems.total">
                               <tr v-for="item in listItems.data"  :key="item.id">
                                   <td style="text-align: left;">
                                       {{item.phrase}}
                                   </td>
                                   <td>__t('{{item.phrase}}')</td>

                                   <td style="text-align: left">
                                       <p v-for="translate in item.translations">
                                           <img :class="'flag flag-' + translate.lang" style="margin-right: 5px">
                                           <a contenteditable="true"
                                              @blur="event => editText(event, translate.id)"
                                              >
                                               {{translate.translate}}
                                           </a>
                                       </p>
                                   </td>
                                   <td>
                                       <div class="btn-group pull-right">
                                           <b-dropdown right no-caret>
                                               <template #button-content>
                                                   <i class="fa fa-cog"></i> <i class="fa fa-caret-down"></i>
                                               </template>
                                               <li><a style="color: red" @click="deleteItem(item.id)" ><i class="fa red fa-times"></i> Удалить</a></li>
                                           </b-dropdown>
                                       </div>
                                   </td>

                               </tr>
                           </template>
                           <template v-else>
                               <tr>
                                   <td colspan="5"  class="text-align-center">
                                       Пусто
                                   </td>
                               </tr>
                           </template>
                       </tbody>
                   </table>
                   <paginate :listItems = 'listItems' @updatelist="updatelist"></paginate>
               </div>

           </div>
       </div>
   </div>
</template>

<script>

    import draggable from 'vuedraggable'

    export default {

        components: {
            draggable
        },

        data() {
            return {
                listItems : [],
                showDropdownItem : 0,
                query : '',
                isLoad: false,
            }
        },

        watch: {
            '$route' (to, from) {
                this.loadData();
            }
        },

        mounted() {
           this.loadData();
        },

        methods: {

            search() {

                this.isLoad = true;

                this.axios
                    .get(`${this.$route.path}/search?query=${this.query}`)
                    .then(response => {
                        this.listItems = response.data.data;
                        this.isLoad = false;
                    });
            },

            showDropdown(id) {
                this.showDropdownItem = id
            },

            loadData() {

                this.isLoad = true;

                this.axios
                    .get(`${this.$route.path}/list`)
                    .then(response => {
                        this.listItems = response.data.data;
                        this.isLoad = false;
                    });
            },

            deleteItem(id) {
                this.axios
                    .delete(`${this.$route.path}/delete/${id}`)
                    .then(response => {
                        this.loadData();
                    });
            },

            updatelist(response)
            {
                this.listItems = response.data.data
            },

            editText(event, id) {

                this.axios
                    .post(`${this.$route.path}/update/${id}`, {
                        'translate' : event.target.innerText
                    })
                    .then(response => {
                        this.listItems = response.data.data;
                    });
            }
        }
    }
</script>