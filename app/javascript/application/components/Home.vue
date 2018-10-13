<template>
  <div class="survey">
    <div class="list-group text-center">
      <a href="#" class="list-group-item list-group-item-action" v-for="survey in $store.state.surveys.all">
        {{ survey.attributes.title }}
      </a>
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
      }
    }
  }
</script>
