import Vue from 'vue/dist/vue.esm'

export default {
  postSignIn (email, password, reject, callback) {
    let url = `/api/v1/users/tokens`

    Vue.http.post(url, { sign_in: { email, password } })
      .then((r) => callback(r.data.jwt), e => reject(e));
  },
  postSignUp (email, password, first_name, last_name, reject, callback) {
    let url = `/api/v1/users/registrations`

    Vue.http.post(url, { sign_up: { email, password, first_name, last_name } })
      .then((r) => callback(r.data.jwt), e => reject(e));
  }
}
