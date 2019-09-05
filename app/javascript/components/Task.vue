<template>
  <div class='item'>
    <div class='middle aligned content'>
      <div class='ui checkbox'>
        <input type='checkbox' :checked='task.done'>
        <label @click="handleMarkAsDone"></label>
      </div>
      <template v-if="editMode">
        <div class='ui mini input'>
          <input v-model="newTaskText" :key="task.id">
        </div>
        <span class='right floated content'>
          <date-picker
            v-model="newDeadline"
            lang='en'
            type='datetime'
            format='YYYY/MM/DD hh:mm'
            :minute-step='1'
          />
          <i class='ui link teal check right icon' @click="handleUpdateTask(); toggleEditMode()" />
          <i class='ui link red plus right icon' @click="toggleEditMode" />
        </span>
      </template>
      <template v-else>
        <span>{{task.text}}</span>
        <span class='right floated content'>
          {{task.deadline}}
          <i class='ui right sort icon icon-type2'/>
          <i class='ui link right pencil icon icon-type2' @click="toggleEditMode" />
          <i class='ui link right trash icon icon-type2' @click="handleDestroyTask(task.id)" />
        </span>
      </template>
    </div>
  </div>
</template>

<script>
import project from 'components/Project'
import { updateTask } from 'api'
import datePicker from 'vue2-datepicker'

export default {
  created() {
    this.newTaskText = this.task.text
  },
  components: {
    datePicker
  },
  data() {
    return {
      editMode: false,
      newTaskText:'',
      newDeadline:''
    }
  },
  methods: {
    toggleEditMode() {
      this.editMode = !this.editMode
    },
    handleUpdateTask() {
      updateTask(this.task.id, { text: this.newTaskText, done: false, deadline: this.newDeadline });
      this.task.text = this.newTaskText;
      this.task.deadline = this.newDeadline
    },
    handleMarkAsDone() {
      updateTask(this.task.id, { done: !this.task.done });
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
