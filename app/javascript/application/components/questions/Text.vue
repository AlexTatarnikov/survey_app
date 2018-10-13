<template>
  <textarea class="form-control" v-model="response.answers[question.id]" :id="question.id" :placeholder="question.attributes.placeholder" v-bind:required="{ required: question.attributes.required }"></textarea>
</template>

<script>
  export default {
    props: ['response', 'question']
  }
</script>
