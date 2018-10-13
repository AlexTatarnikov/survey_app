<template>
  <div class="response">
    <h1>
      {{ response.survey.title }}
    </h1>
    <h6>
      {{ response.survey.subtitle }}
    </h6>

    <div class="answers">
      <span class="text-muted">Your answers</span>
      <div class="form-group required" v-for="answer in response.answers">
        <component v-bind:is="answer.kind+'Answer'" :answer="answer"></component>
      </div>
    </div>
  </div>
</template>

<script>
  import CheckboxAnswer from './answers/Checkbox'
  import NumberAnswer from './answers/Number'
  import RadioAnswer from './answers/Radio'
  import RatingAnswer from './answers/Rating'
  import TextAnswer from './answers/Text'

  export default {
    components: {CheckboxAnswer, NumberAnswer, RadioAnswer, RatingAnswer, TextAnswer},
    created(){
      this.loadData()
    },
    computed: {
      response() {
        return this.$store.state.response
      }
    },
    methods: {
      loadData() {
        this.$store.dispatch('response/getResponse', this.$route.params.survey_id)
      }
    }
  }
</script>
