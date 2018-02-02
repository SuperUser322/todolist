<template>
  <div class='ui centered two column grid'>
    <div class='column'>
      <div class='ui fluid card'>
        <div class='ui segment'>
          <i class='ui big calendar icon' />
          <span class='project-header'>Complete the test task for Ruby Garage</span>
          <span class='right floated'>
            <i class='ui pencil right icon' />
            <i class='ui trash right icon' />
          </span>
        </div>
        <div class='ui action input'>
          <i class='ui big plus icon teal' />
          <input type='text' placeholder='Start typing here to create a task...'>
          <button class='ui teal button'>Add Task</button>
        </div>
        <div class='ui divided items'>
          <task />
          <task />
          <task />
        </div>
      </div>
      <button class='ui button b1'>
        <i class='ui plus icon i1' />
        Add TODO List
      </button>
    </div>
  </div>
</template>

<script>
import task from 'components/Task'
export default {
  components : {
    task
  }
}
</script>

<style>
.project-header {
  font-size: 18px;
}
.ui.button.b1 {

  margin-left: 40%;
}
.ui.plus.icon.i1 {
  padding-right: 3px;
}
.ui.centered.two.column.grid {
  padding-top: 20px;
}
.ui.action.input {
  padding-right: 10px;
  padding-left: 10px;
}
.ui.big.plus.icon.teal {
  padding-right: 5px;
  padding-top: 5px;
}
.ui.divided.items {
  padding-bottom: 15px;
}
.ui.checkbox {
  padding-left: 10px;
  padding-top: 2px;
}
</style>
