import ResponseApi from '../../api/response'
import SurveyApi from "../../api/survey";

function initialState() {
  return {
    id: null,
    survey_id: null,
    survey: {},
    answers: {}
  };
}
const state = initialState()

const mutations = {
  setResponse (state, response) {
    state.id = response.data.id
    state.survey_id = response.data.attributes.survey_id
    state.answers = response.data.attributes.answers
    state.survey = response.included[0].attributes
  }
}

const actions = {
  submitResponse ({ commit, state }, response) {
    return new Promise((resolve, reject) => {
      ResponseApi.postResponse(response, reject, (response) => {
        commit('setResponse', response);
        resolve()
      })
    })
  },
  getResponse ({ commit, state }, survey_id) {
    return new Promise((resolve, reject) => {
      ResponseApi.getResponse(survey_id, reject, (response) => {
        commit('setResponse', response);
        resolve()
      })
    })
  }
}

export default {
  namespaced: true,
  state,
  actions,
  mutations
}
