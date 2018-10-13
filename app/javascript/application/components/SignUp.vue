<template>
  <div class="form-signin">
    <h1 class="h3 mb-3 font-weight-normal">Sign up</h1>
    <label for="email" class="sr-only">Email address</label>
    <input type="email" id="email" v-model="email" class="form-control" placeholder="Email address" required="" autofocus="">
    <label for="first_name" class="sr-only">First Name</label>
    <input type="text" id="first_name" v-model="first_name" class="form-control" placeholder="First Name" required="">
    <label for="last_name" class="sr-only">Last Name</label>
    <input type="text" id="last_name" v-model="last_name" class="form-control" placeholder="Last Name" required="">
    <label for="password" class="sr-only">Password</label>
    <input type="password" id="password" v-model="password" class="form-control" placeholder="Password" required="">
    <router-link to="/sign_in" class="sign-up">Sign in</router-link>
    <button @click="signUp" class="btn btn-lg btn-primary btn-block" type="submit">Sign up</button>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        email: null,
        password: null,
        first_name: null,
        last_name: null
      }
    },
    methods: {
      signUp () {
        this.$store.dispatch('current_user/signUp',
          { email: this.email, password: this.password, first_name: this.first_name, last_name: this.last_name }).then(() => {
            this.$router.push('/')
        })
      }
    }
  }
</script>
