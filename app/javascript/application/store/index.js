import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import VuexPersist from 'vuex-persist'
import current_user from './modules/current_user'

Vue.use(Vuex)

const vuexPersist = new VuexPersist({
  key: 'survey_app',
  storage: localStorage
})

const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
  modules: {
    current_user
  },
  strict: debug,
  plugins: [vuexPersist.plugin]
})
