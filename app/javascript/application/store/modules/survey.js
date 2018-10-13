import SurveyApi from '../../api/survey'

function initialState() {
  return {
    id: null,
    title: null,
    subtitle: null,
    questions: []
  };
}
const state = initialState()

const mutations = {
  setSurvey (state, survey) {
    state.id = survey.data.id
    state.title = survey.data.attributes.title
    state.subtitle = survey.data.attributes.subtitle
    state.questions = survey.included
  }
}

const actions = {
  getSurvey ({ commit, state }, id) {
    return new Promise((resolve, reject) => {
      SurveyApi.getSurvey(id, reject, (survey) => {
        commit('setSurvey', survey);
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
