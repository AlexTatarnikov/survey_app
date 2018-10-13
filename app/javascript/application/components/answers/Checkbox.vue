<template>
  <div class="answer">
    <span>{{ answer.title }}: </span>
    <strong class="quote">{{ answer.value.join(', ') }}</strong>
  </div>
</template>

<script>
  export default {
    props: ['answer'],
  }
</script>
