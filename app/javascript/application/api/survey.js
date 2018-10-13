import Vue from 'vue/dist/vue.esm'

export default {
  getSurveys (callback) {
    let url = `/api/v1/surveys`

    Vue.http.get(url)
      .then((r) => callback(r.data.data), e => console.error(e));
  },
  getSurvey(id, callback) {
    let url = `/api/v1/surveys/${id}`

    Vue.http.get(url)
      .then((r) => callback(r.data), e => console.error(e));
  }
}
