import Vue from 'vue/dist/vue.esm'

export default {
  postResponse (response, callback) {
    let url = `/api/v1/users/surveys/${response.survey_id}/response`

    Vue.http.post(url, {response: response})
      .then((r) => callback(r.data.data), e => console.error(e));
  }
}
