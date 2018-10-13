<template>
  <div class="answer">
    <p>{{ answer.title }}</p>
    <star-rating :star-size="40" :show-rating="false" :rating="answer.value" :read-only="true"></star-rating>
  </div>
</template>

<script>
  export default {
    props: ['answer'],
  }
</script>
