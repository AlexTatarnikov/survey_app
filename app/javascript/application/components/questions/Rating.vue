<template>
  <star-rating v-model="response.answers[question.id]" :star-size="40" :show-rating="false"></star-rating>
</template>

<script>
  export default {
    props: ['response', 'question']
  }
</script>
