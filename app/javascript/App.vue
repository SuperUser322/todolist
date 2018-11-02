<template>
  <div>
    <project v-for = "project in projects" :key="project.id" :title = "project" />
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
      this.projects = normalize(response.data).get('title');
    })
  }
}
</script>
