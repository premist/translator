<template>
  <div id="source-panel">
    <p>Translate</p>
    <input type="text" v-model="message" />
    <p>to {{ language.name }}.</p>
    <button v-on:click="translate" v-bind:disabled="inProgress">GO</button>
  </div>
</template>

<script>
export default {
  name: "SourcePanel",
  methods: {
    translate: function(_e) {
      this.$store.dispatch("TRANSLATE", this.message);
    }
  },
  data: function () {
    return {
      message: "Hello World!"
    }
  },
  computed: {
    language () {
      return this.$store.state.language
    },
    inProgress() {
      return this.$store.state.in_progress
    }
  }
}
</script>

<style scoped>
div {
  grid-area: source;
}

input {
  width: 80%;
  margin: 0 0 15px 0;
  padding: 0;

  border-top: 0;
  border-left: 0;
  border-right: 0;
  border-bottom: 4px solid #693AFF;
  outline: none;

  font-size: 50px;
  font-weight: bold;
  color: #693AFF;
}

button {
  width: 150px;
  height: 70px;
  margin: 20px 0;

  border-radius: 35px;

  font-size: 30px;
  font-weight: bold;
}
</style>
