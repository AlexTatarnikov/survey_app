import Vue from 'vue/dist/vue.esm'
import VueRouter from 'vue-router'
import App from './components/App.vue'
import routes from './routes'
import store from './store'
import VueResource from 'vue-resource'
import StarRating from 'vue-star-rating'

// Assets
import '../src/applications.scss'

Vue.use(VueRouter);
Vue.use(VueResource);

Vue.component('star-rating', StarRating);

const router = new VueRouter({
  mode: 'history',
  routes
})

Vue.http.interceptors.push(function(request, next) {
  Vue.http.headers.common['Content-Type'] = 'application/json';
  Vue.http.headers.common['Accept'] = 'application/json';
  Vue.http.headers.common['Authorization'] = store.state.current_user.token

  next(function (response) {
    if(response.status == 401) {
      router.push('/sign_in')
    }
    else {
      return response
    }
  })
});

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    store,
    router,
    el: '#app',
    render: h => h(App)
  })
})
