<template>
  <div class="survey">
    <div class="list-group text-center">
      <router-link :to="surveyUrl(survey)" class="list-group-item list-group-item-action" v-for="survey in $store.state.surveys.all" :key="survey.id">
        {{ survey.attributes.title }}
      </router-link>
    </div>
  </div>
</template>

<script>
  export default {
    created(){
      this.loadData()
    },
    methods: {
      loadData() {
        this.$store.dispatch('surveys/getSurveys')
      },
      surveyUrl(survey) {
        if(survey.relationships.response.data) {
          return `users/surveys/${survey.relationships.response.data.id}/response`
        }
        else {
          return `surveys/${survey.id}`
        }
      }
    }
  }
</script>
