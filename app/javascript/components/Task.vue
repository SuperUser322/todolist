<template>
  <div class='item'>
    <div class='middle aligned content'>
      <div class='ui checkbox'>
        <input type='checkbox'>
        <label></label>
      </div>
      {{task}}
      <div class='right floated content'>
        <i class='ui right sort icon iconType2' />
        <i class='ui right pencil icon iconType2' />
        <i class='ui right trash icon iconType2' />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['task'],
}
</script>

<style>
.ui.right.trash.icon.iconType2 {
  padding-right: 30px;
}
</style>
