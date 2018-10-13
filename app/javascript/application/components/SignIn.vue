<template>
  <div class="form-signin">
    <h1 class="h3 mb-3 font-weight-normal">Sign in</h1>
    <label for="email" class="sr-only">Email address</label>
    <input type="email" id="email" v-model="email" class="form-control" placeholder="Email address" required="" autofocus="">
    <label for="password" class="sr-only">Password</label>
    <input type="password" id="password" v-model="password" class="form-control" placeholder="Password" required="">
    <router-link to="/sign_up" class="sign-up">Sign up</router-link>
    <button @click="signIn" class="btn btn-lg btn-primary btn-block">Sign in</button>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        email: null,
        password: null
      }
    },
    methods: {
      signIn () {
        this.$store.dispatch('current_user/signIn', { email: this.email, password: this.password })
      }
    }
  }
</script>
