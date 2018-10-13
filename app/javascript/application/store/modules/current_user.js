import AuthenticationApi from '../../api/authentication'

function initialState() {
  return {
    first_name: null,
    last_name: null,
    email: null,
    token: null
  };
}
const state = initialState()

const mutations = {
  setToken (state, token) {
    state.token = token
  },
  setInfo (state, { email, first_name, last_name }) {
    state.email = email
    state.first_name = first_name
    state.last_name = last_name
  },
  resetInfo (state) {
    Object.assign(state, initialState())
  }
}

const actions = {
  signIn ({ commit, state }, { email, password }) {
    return new Promise((resolve, reject) => {
      AuthenticationApi.postSignIn(email, password, reject, token => {
        commit('setToken', token);
        commit('setInfo', { email });
        resolve()
      })
    })
  },
  signUp ({ commit, state }, { email, password, first_name, last_name }) {
    return new Promise((resolve, reject) => {
      AuthenticationApi.postSignUp(email, password, first_name, last_name, reject, token => {
        commit('setToken', token);
        commit('setInfo', { email, first_name, last_name });
        resolve()
      })
    })
  },
  logOut ({ commit, state }) {
    commit('resetInfo');
  }
}

export default {
  namespaced: true,
  state,
  actions,
  mutations
}
