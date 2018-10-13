<template>
  <div class="checkbox-group required">
    <div class="form-check" v-for="choice in question.attributes.choices">
      <input type="checkbox" :name="choice" :value="choice" v-model="response.answers[question.id]" class="form-check-input" >
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
