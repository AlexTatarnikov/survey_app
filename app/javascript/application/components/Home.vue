<template>
  <a @click="logOut" href="#" v-if="$store.state.current_user.token">Log out</a>
  <sign-in v-else></sign-in>
</template>

<script>
  import SignIn from './SignIn.vue'

  export default {
    components: { SignIn },
    methods: {
      logOut() {
        this.$store.dispatch('current_user/logOut')
      }
    }
  }
</script>
