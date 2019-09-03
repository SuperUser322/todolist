<template>
  <div class='item'>
    <div class='middle aligned content'>
      <div class='ui checkbox'>
        <input type='checkbox' checked='this.task.done' @click="handleMarkAsDone">
        <label></label>
      </div>
      <template v-if="editMode">
        <input v-model="newTaskText" :key="task.id">
        <span class='right floated content'>
          <i class='ui link teal check right icon' @click="handleUpdateTask(); toggleEditMode()"/>
          <i class='ui link red plus right icon' @click="toggleEditMode"/>
        </span>
      </template>
      <template v-else>
        <span>{{task.text}}</span>
        <span class='right floated content'>
          <i class='ui right sort icon icon-type2'/>
          <i class='ui link right pencil icon icon-type2' @click="toggleEditMode"/>
          <i class='ui link right trash icon icon-type2' @click="handleDestroyTask(task.id)"/>
        </span>
      </template>
    </div>
  </div>
</template>

<script>
import project from 'components/Project'
import {updateTask} from 'api.js'
export default {
  data () {
    return {
      editMode: false,
      newTaskText:''
    }
  },
  methods: {
    toggleEditMode () {
      this.editMode = !this.editMode
    },
    handleUpdateTask () {
      updateTask(this.task.id, {text: this.newTaskText});
      this.task.text = this.newTaskText
    },
    handleMarkAsDone () {
      updateTask(this.task.id, {done: !this.task.done})
      this.task.done = !this.task.done
    }
  },
  props: ['task', 'handleDestroyTask'],
}
</script>

<style>
.ui.right.trash.icon.icon-type2 {
  padding-right: 30px;
}
</style>
