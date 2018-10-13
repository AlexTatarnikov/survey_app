import Home from './components/Home.vue'
import SignIn from './components/SignIn.vue'
import SignUp from './components/SignUp.vue'

const routes = [
  { path: '/', component: Home },
  { path: '/sign_in', component: SignIn },
  { path: '/sign_up', component: SignUp }
]

export default routes
