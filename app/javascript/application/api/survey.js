import Vue from 'vue/dist/vue.esm'

export default {
  getSurveys (callback) {
    let url = `/api/v1/surveys`

    Vue.http.get(url)
      .then((r) => callback(r.data.data), e => console.error(e));
  }
}
