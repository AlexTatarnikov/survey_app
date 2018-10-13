import Vue from 'vue/dist/vue.esm'

export default {
  postResponse (response, reject, callback) {
    let url = `/api/v1/users/surveys/${response.survey_id}/response`

    Vue.http.post(url, {response: response})
      .then((r) => callback(r.data.data), e => reject(e));
  },
  getResponse (survey_id, reject, callback) {
    let url = `/api/v1/users/surveys/${survey_id}/response`

    Vue.http.get(url)
      .then((r) => callback(r.data), e => reject(e));
  }
}
