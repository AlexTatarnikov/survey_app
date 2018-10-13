import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import VuexPersist from 'vuex-persist'
import current_user from './modules/current_user'
import surveys from './modules/surveys'
import survey from './modules/survey'
import response from './modules/response'


Vue.use(Vuex)

const vuexPersist = new VuexPersist({
  key: 'survey_app',
  storage: localStorage
})

const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
  modules: {
    current_user,
    surveys,
    survey,
    response
  },
  strict: debug,
  plugins: [vuexPersist.plugin]
})
