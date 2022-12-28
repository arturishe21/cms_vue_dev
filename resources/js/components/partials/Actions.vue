<template>
  <div class="btn-group pull-right">
    <b-dropdown right no-caret>
      <template #button-content>
        <i class="fa fa-cog"></i> <i class="fa fa-caret-down"></i>
      </template>
      <li><a @click="$emit('edit', item.id)"><i class="fa fa-pencil"></i> Редактироварь</a></li>
      <li><a style="color: red" @click="$emit('deletePost', item.id)"><i class="fa red fa-times"></i> Удалить</a></li>
    </b-dropdown>
  </div>
</template>

<script>
export default {
  name: "Actions",
  props : ['item'],

}
</script>