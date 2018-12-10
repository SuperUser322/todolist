<template>
  <div>
    <project v-for="project in projects" :key="project.id" :project="project" />
    <button class='ui button buttonType1'>
      <i class='ui plus icon iconType1' />
      Add TODO List
    </button>
  </div>
</template>

<script>
import project from 'components/Project'
import {getProjectsList} from 'api.js'
import normalize from 'json-api-normalize'
export default {
  components: {
    project,
  },
  data () {
      return {projects: []}
  },
  created () {
    getProjectsList()
    .then((response) => {
      console.log(response);
      this.projects = normalize(response.data).get('title', 'tasks.text');
    })
  }
}
</script>

<style>
.ui.button.buttonType1 {
  margin-left: 44%;
  margin-top: 2%;
}
.ui.plus.icon.iconType1 {
  padding-right: 3px;
}
</style>
