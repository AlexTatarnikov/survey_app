<template>
  <div class="answer">
    <span>{{ answer.title }}: </span>
    <strong>{{ answer.value }}</strong>
  </div>
</template>

<script>
  export default {
    props: ['answer'],
  }
</script>
