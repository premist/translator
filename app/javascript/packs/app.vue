<template>
  <div id="app" v-bind:class="language.id">
    <source-panel></source-panel>
    <translated-panel></translated-panel>
    <language-chooser-panel></language-chooser-panel>
  </div>
</template>

<script>
import SourcePanel from "./source-panel.vue"
import TranslatedPanel from "./translated-panel.vue"
import LanguageChooserPanel from "./language-chooser-panel.vue"

export default {
  computed: {
    language () {
      return this.$store.state.language
    }
  },
  components: {
    SourcePanel,
    TranslatedPanel,
    LanguageChooserPanel
  }
}
</script>

<style>
#app {
  display: grid;
  padding: 30vh 4vw;
  grid-gap: 0 2vw;
  grid-template-columns: 46vw 46vw;
  grid-template-areas:
    "source translated";
}

@media (max-width: 800px) {
  #app {
    display: grid;
    padding: 30px 4vw;
    grid-gap: 30px;
    grid-template-columns: 96vw;
    grid-template-areas:
      "source"
      "translated";
  }
}

* {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
}

p {
  font-size: 50px;
  margin: 0 0 20px 0;
}

button {
  border: 0;
  outline: 0;
  background-color: #693AFF;
  color: #FFF;
}

button:focus { box-shadow: 0 0 6px #9575CD; }
button:active { background-color: #512DA8; }
button:disabled { background-color: #B39DDB; }
</style>
