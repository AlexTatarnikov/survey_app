<template>
  <div class="container">
    <navbar v-if="$store.state.current_user.token"></navbar>
    <router-view></router-view>
  </div>
</template>
<script>
  import Navbar from './Navbar.vue'

  export default {
    components: { Navbar }
  }
</script>

<style>
  html,
  body {
    height: 100%;
  }
</style>
