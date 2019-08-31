<template>
  <div class='item'>
    <div class='middle aligned content'>
      <div class='ui checkbox'>
        <input type='checkbox'>
        <label></label>
      </div>
      {{task.text}}
      <div class='right floated content'>
        <i class='ui right sort icon icon-type2' />
        <i class='ui right pencil icon icon-type2' />
        <i class='ui right trash icon icon-type2' @click="handleDestroyTask(task.id)" />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['task', 'handleDestroyTask'],
}
</script>

<style>
.ui.right.trash.icon.icon-type2 {
  padding-right: 30px;
}
</style>
