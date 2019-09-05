<template>
  <div class='ui centered two column grid'>
    <div class='column'>
      <div class='ui fluid card'>
        <div class='ui segment'>
          <i class='ui big calendar icon'/>
          <template v-if="editMode">
            <div class='ui mini input'>
              <input v-model="newProjectTitle" :key="project.id">
            </div>
            <span class='right floated'>
              <i
                class='ui link teal check right icon'
                @click="handleUpdateProject(); toggleEditMode()"
              />
              <i class='ui link red plus right icon' @click="toggleEditMode" />
            </span>
          </template>
          <template v-else>
            <span class='project-header'>{{project.title}}</span>
            <span class='right floated'>
              <i class='ui link pencil right icon' @click="toggleEditMode" />
              <i class='ui link trash right icon' @click="handleDestroyProject(project.id)" />
            </span>
          </template>
        </div>
        <div class='ui action input'>
          <i class='ui big plus icon teal' />
          <input
            v-model="newTaskText"
            :key="project.id"
            type='text'
            placeholder='Start typing here to create a task...'
          />
          <button class='ui teal button' @click="handleCreateNewTask(project.id)">
            Add Task
          </button>
        </div>
        <div class='ui divided items'>
          <task
            v-for="task in project.tasks"
            :key="task.id"
            :task="task"
            :handleDestroyTask="handleDestroyTask"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import task from 'components/Task'
import { updateProject, createNewTask, destroyTask } from 'api'
import normalize from 'json-api-normalize'

export default {
  created() {
    this.newProjectTitle = this.project.title
  },
  components: {
    task
  },
  data() {
    return {
      editMode: false,
      newProjectTitle:'',
      newTaskText:'',
      tasks: []
    }
  },
  methods: {
    toggleEditMode() {
      this.editMode = !this.editMode
    },
    handleUpdateProject() {
      updateProject(this.project.id, this.newProjectTitle);
      this.project.title = this.newProjectTitle
    },
    handleCreateNewTask() {
      createNewTask(this.project.id, this.newTaskText).then((response) => {
        const task = normalize(response.data).get(['id', 'text', 'done', 'deadline']);
        this.project.tasks.push(task);
      })
    },
    handleDestroyTask(taskId) {
      destroyTask(taskId).then((response) => {
        this.project.tasks = this.project.tasks.filter((task) => task.id !== taskId)
      })
    }
  },
  props: ['project', 'handleDestroyProject'],
}
</script>

<style>
p {
  padding-left: 40px;
}
.project-header {
  font-size: 18px;
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
.ui.link.red.plus.right.icon {
  -webkit-transform:rotate(45deg);
}
</style>
