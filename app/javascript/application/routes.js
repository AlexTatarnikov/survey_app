import Home from './components/Home.vue'
import SignIn from './components/SignIn.vue'
import SignUp from './components/SignUp.vue'
import Survey from './components/Survey.vue'

const routes = [
  { path: '/', component: Home },
  { path: '/sign_in', component: SignIn },
  { path: '/sign_up', component: SignUp },
  { path: '/surveys/:id', component: Survey }
]

export default routes
