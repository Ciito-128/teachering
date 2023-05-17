<template>
  <div class="cardList">
    <h3 class="course_title">
      <img class="course_title_img" v-if="imgUrl" :src="imgUrl">{{ title }}
    </h3>
    <el-row :gutter="12">
      <el-col :span="6" v-for="item in shopData" :key="item.id">
        <el-card shadow="hover" style="margin-bottom: 20px;height: 312px;cursor: pointer;"@click.native="goDetails(item.id)">
          <img class="image" :src="'/dev-api'+item.cover">
          <div style="padding: 14px;">
            <span v-if="item.typeId == 1"><el-link type="primary">大房({{ item.name }})</el-link></span>
            <span v-if="item.typeId == 2"><el-link type="success">小房({{ item.name }})</el-link></span>
            <el-divider content-position="left"><el-link type="danger">特价:￥{{ item.price }}</el-link></el-divider>
            <div class="bottom clearfix">
              <el-button type="text" class="button" @click.stop="goDetails(item.id)">预定</el-button>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'PcCard',
  props: {
    logoUrl: {
      type: String,
      default: null
    },
    logoTitle: {
      type: String,
      default: null
    },
    cardData: {
      type: Array,
      default: []
    },
  },
  data() {
    return {
      shopData: this.cardData,
      imgUrl: this.logoUrl,
      title: this.logoTitle,
    }
  },
  methods: {
    goDetails(id) {
      this.$router.push({ path: '/pc/details', query: { id: id } })
    },
  }
}
</script>

<style scoped>
.cardList {
  margin: 20px 355px;
  width: 1210px;
}

.time {
  font-size: 13px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
}

.button {
  padding: 0;
  float: right;
}

.image {
  height: 173px;
  width: 100%;
  display: block;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both
}

.course_title {
  letter-spacing: 6px;
  line-height: 36px;
  text-align: center;
  font-size: 16px;
  font-weight: 600;
  color: #4D555D;
}

.course_title_img {
  position: relative;
  top: 10px;
  right: 10px;
}
</style>
