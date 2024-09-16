<template>
  <div class="btn-group pull-right">
    <b-dropdown right no-caret>
      <template #button-content>
        <i class="fa fa-cog"></i> <i class="fa fa-caret-down"></i>
      </template>
      <li><a @click="edit()"><i class="fa fa-pencil"></i> Редактироварь</a></li>
      <li><a style="color: red" @click="$emit('deletePost', item.id)"><i class="fa red fa-times"></i> Удалить</a></li>
    </b-dropdown>
  </div>
</template>

<script>
import RoutePages from '../../components/RoutePages.vue';
export default {
  name: "Actions",
  props : ['item'],
  components: {
    RoutePages
  },
  methods: {
    edit: function() {

   /*  this.$root.$on('RoutePages', () => {
        // your code goes here
        this.edit(1)
      });
*/
     // component('RoutePages').edit()
      this.$root.RoutePages.edit( this.item.id );
    }
  }

}
</script>