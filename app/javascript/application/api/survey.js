import Vue from 'vue/dist/vue.esm'

export default {
  getSurveys (reject, callback) {
    let url = `/api/v1/surveys`

    Vue.http.get(url)
      .then((r) => callback(r.data.data), e => reject(e));
  },
  getSurvey(id, reject, callback) {
    let url = `/api/v1/surveys/${id}`

    Vue.http.get(url)
      .then((r) => callback(r.data), e => reject(e));
  }
}
