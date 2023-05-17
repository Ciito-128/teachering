<template>
  <div class="header">
    <el-row type="flex" justify="center">
      <el-col :span="6">
        <a :href="url" class="logo">GeLi酒店</a>
      </el-col>
      <el-col :span="18" :offset="1">
        <el-menu router
                 :default-active="this.$route.path"
                 class="el-menu-demo"
                 mode="horizontal"
        >
          <template v-for="item in menuData">
            <el-menu-item v-if="!item.children" :index="item.path">{{ item.nameZh }}</el-menu-item>
            <el-submenu v-if="item.children" :index="item.id.toString()">
              <template slot="title">{{ item.nameZh }}</template>
              <template v-for="child in item.children">
                <el-menu-item :index="child.path">{{ child.nameZh }}</el-menu-item>
              </template>
            </el-submenu>
          </template>
        </el-menu>
      </el-col>
      <el-col :span="6" style="padding: 12px;">
        <el-tag v-if="this.$store.state.user.name" @click.native="goUserInfo()" style="cursor: pointer;">个人中心</el-tag>
        <el-tag v-if="this.$store.state.user.name" style="cursor: pointer;margin-left: 20px" @click.native="logout">退出</el-tag>
        <el-tag v-else style="cursor: pointer;"><a href="/login">登录</a></el-tag>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {

  name: 'PcHeader',
  created() {
    console.log(this.$store.state.settings.activeIndexPc)
    this.activeIndex = this.$store.state.settings.activeIndexPc
  },
  data() {
    return {
      url: '/pc',
      activeIndex: '1',
      searchKey: null,
      menuData: [
        {
          id: 1,
          path: '/pc',
          name: 'AdminIndex',
          nameZh: '首页',
          iconCls: 'el-icon-s-home',
          component: 'AdminIndex',
          parentId: 0,
          children: null
        },
        {
          id: 3,
          path: '/pc/dataList',
          name: 'AdminIndex',
          nameZh: '客房',
          iconCls: 'el-icon-s-home',
          component: 'AdminIndex',
          parentId: 0,
          children: null
        },
        {
          id: 5,
          path: '/pc/dataList2',
          name: 'AdminIndex',
          nameZh: '公告',
          iconCls: 'el-icon-s-home',
          component: 'AdminIndex',
          parentId: 0,
          children: null
        },
        {
          id: 6,
          path: '/pc/dataList1',
          name: 'AdminIndex',
          nameZh: '本地疫情',
          iconCls: 'el-icon-s-home',
          component: 'AdminIndex',
          parentId: 0,
          children: null
        },
        {
          id: 7,
          path: '/pc/roomType',
          name: 'AdminIndex',
          nameZh: '房型介绍',
          iconCls: 'el-icon-s-home',
          component: 'AdminIndex',
          parentId: 0,
          children: null
        },
      ]
    }
  },
  methods: {
    search() {
      this.$router.push({path: '/pc/dataList', query: {searchKey: this.searchKey}})
    },
    goUserInfo() {
      this.$router.push({ path: "/pc/user/profile" });
    },
    async logout() {
      this.$confirm('确定注销并退出系统吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$store.dispatch('LogOut').then(() => {
          location.href = '/pc';
        })
      }).catch(() => {});
    }
  }
}
</script>

<style lang="scss" scoped>
@import "./header.css";
</style>

