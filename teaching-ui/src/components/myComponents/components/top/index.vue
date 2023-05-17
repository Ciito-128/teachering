<template>
  <div class="head_top">
    <div class="tl">
      <a>{{ msg }}</a>
    </div>
    <span class="tr">
     <a>
      <img src="@/assets/images/weixinlogin.png"/>
     </a>
    </span>
  </div>
</template>

<script>
export default {
  name: 'HeaderTop',
  data() {
    return {
      msg: 'itSession - 专业的网站设计',
      url: '/pc'
    }
  }
}
</script>

<style lang="scss" scoped>
@import "./head_top.css";
</style>

