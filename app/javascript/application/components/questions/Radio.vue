<template>
  <div class="checkbox-group">
    <div class="form-check" v-for="choice in question.attributes.choices">
      <input type="radio" :name="question.id" :value="choice" v-model="response.answers[question.id]" class="form-check-input" v-bind:required="{ required: question.attributes.required }" >
      <label class="form-check-label" :for="choice">{{ choice }}</label>
    </div>
  </div>
</template>

<script>
  export default {
    props: ['response', 'question'],
    created() {
      this.response.answers[this.question.id] = []
    }
  }
</script>
