<template>
  <div id="language-chooser-panel">
    <ul>
      <button v-on:click="choose" data-lang-id="ko" data-lang-name="Korean">🇰🇷</button>
      <button v-on:click="choose" data-lang-id="ja" data-lang-name="Japanese">🇯🇵</button>
      <button v-on:click="choose" data-lang-id="en" data-lang-name="English">🇬🇧</button>
    </ul>
  </div>
</template>

<script>
export default {
  name: "LanguageChooserPanel",
  methods: {
    choose: function(e) {
      let data = e.target.dataset
      this.$store.commit("CHANGE_LANGUAGE", {
        id: data.langId,
        name: data.langName
      })
    }
  }
}
</script>

<style scoped>
div {
  position: fixed;
  height: 30px;
  right: 10px;
  bottom: 10px;
}

ul {
  margin: 0;
  padding: 0;
}

button {
  width: 30px;
  height: 30px;
  padding: 11px 0;

  border: 0;
  outline: 0;
  border-radius: 15px;

  background-color: #693AFF;

  font-size: 18px;
  line-height: 12px;
}
</style>
