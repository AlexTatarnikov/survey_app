import SurveyApi from '../../api/survey'

function initialState() {
  return {
    all: []
  };
}
const state = initialState()

const mutations = {
  setSurveys (state, surveys) {
    state.all = surveys
  }
}

const actions = {
  getSurveys ({ commit, state }) {
    return new Promise((resolve, reject) => {
      SurveyApi.getSurveys((surveys) => {
        commit('setSurveys', surveys);
      })

      resolve()
    })
  }
}

export default {
  namespaced: true,
  state,
  actions,
  mutations
}
