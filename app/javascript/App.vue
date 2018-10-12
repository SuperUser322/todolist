<template>
  <div>
    <project v-for = "project in projects" />
  </div>
</template>

<script>
import project from 'components/Project'
import {getProjectsList} from 'api.js'
import normalize from 'json-api-normalize'
export default {
  components: {
    project
  },
  data: function() {
      return {projects: []
      }
  },
  created: function() {
    getProjectsList()
    .then(function (response) {
      this.projects = normalize(response).get([ 'id', 'title']);
    })
  }
}
</script>
