<template>
  <div>
    <div class="el-backtop" style="right: 40px; top: 40px;">
      <el-button type="success" icon="el-icon-search" circle @click="searchClick"></el-button>
      <el-dialog title="搜索" :visible.sync="open" width="800px" append-to-body>
        <el-row>
          <el-col :span="24">
            <el-input placeholder="请输入内容" v-model="input3" class="input-with-select">
              <el-button slot="append" icon="el-icon-search" @click="goIndex"></el-button>
            </el-input>
          </el-col>
        </el-row>
        <div style="height: 40px"></div>
      </el-dialog>
    </div>
<!--    <div class="el-backtop" style="right: 40px; bottom: 250px;">
      <el-button type="primary" icon="el-icon-phone-outline" circle @click="searchClick"></el-button>
    </div>
    <div class="el-backtop" style="right: 40px; bottom: 207px;">
      <el-button type="primary" icon="el-icon-user" circle @click="searchClick"></el-button>
    </div>-->
  </div>
</template>
<script>

export default {
  name: 'searchClick',
  data() {
    return {
      msg: 'vue模板页',
      open: false,
      input3: null
    }
  },
  methods: {
    searchClick() {
      this.open = true
    },
    goIndex() {
      this.$router.push({ path: '/pc' })
    }
  }
}
</script>
