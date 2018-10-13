<template>
  <div class="answer">
    <p>{{ answer.title }}</p>
    <p class="quote">{{ answer.value }}</p>
  </div>
</template>

<script>
  export default {
    props: ['answer'],
  }
</script>
