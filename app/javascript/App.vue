<template>
  <div>
    <project v-for="project in projects" :key="project.id" :project="project" :handleDestroyProject="handleDestroyProject"/>
    <button class='ui button button-type1' @click="handleCreateNewProject">
      <i class='ui plus icon icon-type1'/>
      Add TODO List
    </button>
  </div>
</template>

<script>
import project from 'components/Project'
import {getProjectsList, createNewProject, destroyProject} from 'api.js'
import normalize from 'json-api-normalize'

export default {
  components: {
    project
  },
  data () {
      return {projects:[]}
  },
  methods: {
    handleCreateNewProject () {
      createNewProject()
      .then((response) => {
        const project = normalize(response.data).get(['title', 'id']);
        this.projects.push(project);
      })
    },
    handleDestroyProject (projectId) {
      destroyProject(projectId)
      .then(() => {
        this.projects = this.projects.filter((project) => project.id !== projectId)
      })
    }
  },
  created () {
    getProjectsList()
    .then((response) => {
      this.projects = normalize(response.data).get(['title', 'tasks.text', 'id', 'tasks.id', 'task.done']);
    })
  },
}
</script>

<style>
.ui.button.button-type1 {
  margin-left: 44%;
  margin-top: 2%;
}
.ui.plus.icon.icon-type1 {
  padding-right: 3px;
}
</style>
