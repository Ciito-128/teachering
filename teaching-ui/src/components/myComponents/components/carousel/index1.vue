<template>
  <div class="top_div">
    <div style="height: 440px;width:200px;margin-bottom:10px;background-color: #97a8be;display: inline-block;">
    </div>
    <div class="carousel_div">
      <el-carousel height="450px" :autoplay="true">
        <el-carousel-item v-for="item in carouselData" :key="item.url">
          <img :src="item.url">
        </el-carousel-item>
      </el-carousel>
    </div>
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
      ],
    }
  }
}
</script>

<style scoped>
.top_div {
  margin: 20px 255px;
  width: 1410px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.carousel_div {
  width: 1210px;
  display: inline-block;
}
</style>
