import Vue from "vue"
import Vuex from "vuex"

Vue.use(Vuex)

const state = {
  language: {
    id: "ja",
    name: "Japanese"
  },
  source: undefined,
  translated: undefined,
  in_progress: false,
  clean: true
}

const mutations = {
  CHANGE_LANGUAGE (state, language) {
    state.language = language;
  },
  TRANSLATION_IN_PROGRESS (state, source) {
    state.clean = false
    state.in_progress = true
    state.source = source
  },
  TRANSLATION_SUCCESS (state, data) {
    state.in_progress = false
    state.translated = data.translated
  },
  TRANSLATION_FAILURE (state, error) {
    state.in_progress = false
    console.warn(error);
  }
}

const actions = {
  TRANSLATE ({ commit, state }, source) {
    commit("TRANSLATION_IN_PROGRESS", source);

    fetch("/translations", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        translation: {
          to: state.language.id,
          source: state.source
        }
      })
    }).then((resp) => {
      if(resp.status >= 200 && resp.status < 300) {
        return resp.json()
      } else {
        let error = new Error(resp.statusText);
        error.response = resp
        throw error
      }
    }).then((data) => commit("TRANSLATION_SUCCESS", data))
      .catch((error) => commit("TRANSLATION_FAILURE", error))
  }
}

const store = new Vuex.Store({
  state,
  mutations,
  actions
})

export default store
