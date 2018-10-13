<template>
  <header>
    <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
      <a class="navbar-brand" href="#">
        <i class="far fa-gem"></i>
        Survey App
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <router-link tag="li" to="/" class="nav-item" exact-active-class="active">
            <a class="nav-link">Surveys</a>
          </router-link>
          <li class="nav-item">
            <a class="nav-link" href="#">Responses</a>
          </li>
        </ul>
        <ul class="navbar-nav">
          <li class="nav-item">
            <a @click="logOut" class="nav-link" href="#" v-if="$store.state.current_user.token">Log out</a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
</template>

<script>
  export default {
    methods: {
      logOut() {
        this.$store.dispatch('current_user/logOut')
        this.$router.push('/sign_in')
      }
    }
  }
</script>
