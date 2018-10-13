import ResponseApi from '../../api/response'

function initialState() {
  return {
    id: null,
    survey_id: null,
    answers: {}
  };
}
const state = initialState()

const mutations = {
  setResponse (state, response) {
    state.id = response.data.id
    state.survey_id = response.data.attributes.survey_id
    state.answers = response.data.attributes.answers
  }
}

const actions = {
  submitResponse ({ commit, state }, response) {
    return new Promise((resolve, reject) => {
      ResponseApi.postResponse(response, (response) => {
        commit('setResponse', response);
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
