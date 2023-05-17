<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App',
  created() {
    // 设置主题
    this.$store.dispatch('settings/changeSetting', {
      key: 'topNav',
      value: true
    })
    this.$store.dispatch('settings/changeSetting', {
      key: 'sideTheme',
      value: 'theme-light'
    })
    this.$store.dispatch('settings/changeSetting', {
      key: 'theme',
      value: '#0A74E3'
    })
  },
  metaInfo() {
    return {
      title: this.$store.state.settings.dynamicTitle && this.$store.state.settings.title,
      titleTemplate: title => {
        return title ? `${title} - ${process.env.VUE_APP_TITLE}` : process.env.VUE_APP_TITLE
      }
    }
  }
}
</script>
