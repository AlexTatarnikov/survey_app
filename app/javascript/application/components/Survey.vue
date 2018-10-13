<template>
  <div class="survey">
    <h1>
      {{ survey.title }}
    </h1>
    <h6>
      {{ survey.subtitle }}
    </h6>

    <form class="questions" v-on:submit.prevent="submit">
      <span class="text-muted">Please fill out the form below</span>
      <div class="form-group required" v-for="question in survey.questions">
        <label :for="question.id">{{ question.attributes.title }}</label>
        <component v-bind:is="question.attributes.kind+'Input'" :question="question" :response="response"></component>
      </div>

      <input value="Submit" type="submit" class="btn btn-primary btn-lg btn-block">
    </form>
  </div>
</template>

<script>
  import CheckboxInput from './questions/Checkbox'
  import NumberInput from './questions/Number'
  import RadioInput from './questions/Radio'
  import RatingInput from './questions/Rating'
  import TextInput from './questions/Text'

  export default {
    components: {CheckboxInput, NumberInput, RadioInput, RatingInput, TextInput},
    data () {
      return {
        response: {
          answers: {}
        }
      }
    },

    created(){
      this.loadData()
    },
    computed: {
      survey() {
        return this.$store.state.survey
      }
    },
    methods: {
      loadData() {
        this.$store.dispatch('survey/getSurvey', this.$route.params.id)
      },
      submit() {
        let newResponse = {
          survey_id: this.survey.id,
          answers: {}
        }

        for (let question of this.survey.questions) {
          newResponse.answers[question.id] = {}
          newResponse.answers[question.id].title = question.attributes.title
          newResponse.answers[question.id].placeholder = question.attributes.placeholder
          newResponse.answers[question.id].kind = question.attributes.kind
          newResponse.answers[question.id].choices = question.attributes.choices
          newResponse.answers[question.id].value = this.response.answers[question.id]
        }
        this.$store.dispatch('response/submitResponse', newResponse).then(() => {
          this.$router.push(`/users/surveys/${this.survey.id}/response`)
        })
      }
    }
  }
</script>
