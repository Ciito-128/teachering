<template>
  <div class="carousel_div">
    <el-carousel indicator-position="outside" height="450px" :autoplay="true">
      <el-carousel-item v-for="item in carouselData" :key="item.url">
        <img :src="item.url">
      </el-carousel-item>
    </el-carousel>
  </div>
</template>

<script>
export default {
  name: 'PcCarousel',
  data() {
    return {
      carouselData: [
        { url: 'http://www.java1234.vip/carouselImages/20200710112256.png' },
        { url: 'http://www.java1234.vip/carouselImages/20200710120817.jpg' },
        { url: 'http://www.java1234.vip/carouselImages/20200713125857.jpg' },
        { url: 'http://www.java1234.vip/carouselImages/20200710085038.png' }
      ]
    }
  }
}
</script>

<style scoped>
.carousel_div {
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  margin: 20px 355px;
  width: 1210px;
}
</style>
