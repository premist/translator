<template>
  <div v-if="clean" id="translated-panel">
    <p class="clean">Translated text will appear here.</p>
  </div>

  <div v-else id="translated-panel">
    <p>{{ translated }}</p>
  </div>
</template>

<script>
export default {
  name: "TranslatedPanel",
  computed: {
    translated () {
      return this.$store.state.translated
    },
    clean() {
      return this.$store.state.clean
    }
  }
}
</script>

<style scoped>
div {
  grid-area: translated;
}

p.clean {
  color: #aaa;
}
</style>
