<template>
  <div class="dashboard-editor-container">

    <panel-group @handleSetLineChartData="handleSetLineChartData"/>


    <el-row style="background:#fff;padding:16px 16px 18px;margin-bottom:32px;" v-if="typeName == 'newVisitis'">
      <el-row :gutter="10" class="mb8">
        <el-col :span="1.5">
          <el-button
            type="text"
            icon="el-icon-download"
            @click="handleDelete()"
          >导出人员
          </el-button>
        </el-col>
      </el-row>
      <el-divider></el-divider>
      <el-table :data="userList" v-if="typeName == 'newVisitis'">
        <el-table-column label="用户工号" align="center" key="userId" prop="userId"/>
        <el-table-column label="用户名称" align="center" key="userName" prop="userName"
                         :show-overflow-tooltip="true"/>
        <el-table-column label="用户昵称" align="center" key="nickName" prop="nickName"
                         :show-overflow-tooltip="true"/>
        <el-table-column label="手机号码" align="center" key="phonenumber" prop="phonenumber"
                         width="120"/>
        <el-table-column label="创建时间" align="center" prop="createTime">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.createTime) }}</span>
          </template>
        </el-table-column>
      </el-table>
      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getUserList"
      />
    </el-row>
    <el-row style="background:#fff;padding:16px 16px 18px;margin-bottom:32px;" v-if="typeName == 'messages'">
      <el-row :gutter="10" class="mb8">
        <el-col :span="1.5">
          <el-button
            type="text"
            icon="el-icon-download"
            @click="handleDelete()"
          >导出教研项目
          </el-button>
        </el-col>
      </el-row>
      <el-divider></el-divider>
      <el-table :data="teachingList" v-if="typeName == 'messages'">
        <el-table-column type="selection" width="55" align="center"/>
        <el-table-column label="标题" align="center" prop="name"/>
        <el-table-column label="简介" align="center" prop="introduce" show-overflow-tooltip/>
        <el-table-column label="添加时间" align="center" prop="addTime" width="100">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.addTime, '{y}-{m}-{d}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="工号" align="center" prop="userId"/>
        <el-table-column label="姓名" align="center" prop="userName"/>
        <el-table-column label="状态" align="center" prop="status">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.proStatus" :value="scope.row.status"/>
          </template>
        </el-table-column>
        <el-table-column label="审核" align="center" prop="audit">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.auditStatus" :value="scope.row.audit"/>
          </template>
        </el-table-column>
        <el-table-column label="教研类型" align="center" prop="type">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.teacherType" :value="scope.row.type"/>
          </template>
        </el-table-column>
        <el-table-column label="结束时间" align="center" prop="endTime" width="100">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>
          </template>
        </el-table-column>
      </el-table>
      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParamsPro.pageNum"
        :limit.sync="queryParamsPro.pageSize"
        @pagination="getProList"
      />
    </el-row>

    <el-row style="background:#fff;padding:16px 16px 18px;margin-bottom:32px;" v-if="typeName == 'purchases'">
      <el-row :gutter="10" class="mb8">
        <el-col :span="1.5">
          <el-button
            type="text"
            icon="el-icon-download"
            @click="handleDelete()"
          >导出教材项目
          </el-button>
        </el-col>
      </el-row>
      <el-divider></el-divider>
      <el-table :data="teachingList" v-if="typeName == 'purchases'">
        <el-table-column type="selection" width="55" align="center"/>
        <el-table-column label="标题" align="center" prop="name"/>
        <el-table-column label="简介" align="center" prop="introduce" show-overflow-tooltip/>
        <el-table-column label="添加时间" align="center" prop="addTime" width="100">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.addTime, '{y}-{m}-{d}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="工号" align="center" prop="userId"/>
        <el-table-column label="姓名" align="center" prop="userName"/>
        <el-table-column label="状态" align="center" prop="status">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.proStatus" :value="scope.row.status"/>
          </template>
        </el-table-column>
        <el-table-column label="审核" align="center" prop="audit">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.auditStatus" :value="scope.row.audit"/>
          </template>
        </el-table-column>
        <el-table-column label="教研类型" align="center" prop="type">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.teacherType" :value="scope.row.type"/>
          </template>
        </el-table-column>
        <el-table-column label="结束时间" align="center" prop="endTime" width="100">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>
          </template>
        </el-table-column>
      </el-table>
      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParamsPro.pageNum"
        :limit.sync="queryParamsPro.pageSize"
        @pagination="getProList"
      />
    </el-row>

  </div>
</template>

<script>
import PanelGroup from './dashboard/PanelGroup'
import {listUser} from "@/api/system/user";
import {listTeaching} from "@/api/system/teaching";
import {listReward} from "@/api/system/reward";


export default {
  name: 'Index',
  dicts: ['proStatus', 'teacherType', 'auditStatus', 'sys_normal_disable', 'sys_user_sex', 'rewardType'],
  components: {
    PanelGroup
  },
  data() {
    return {
      loading: true,
      showSearch: false,
      // 总条数
      total: 0,
      // 用户表格数据
      userList: null,
      teachingList: null,
      rewardList: null,
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
      },
      queryParamsPro: {
        pageNum: 1,
        pageSize: 10,
        type: null,
      },
      typeName: 'newVisitis',
    }
  },
  created() {
    this.handleSetLineChartData('newVisitis');
  },
  methods: {
    handleSetLineChartData(type) {
      console.log(type)
      this.typeName = type
      switch (type) {
        case 'newVisitis':
          return this.getUserList();
        case 'messages':
          return this.getProList();
        case 'purchases':
          return this.getProList();
      }
    },
    getHjList() {
      listReward(this.queryParams).then(response => {
        this.rewardList = response.rows;
        this.total = response.total;
      });
    },
    getUserList() {
      listUser(this.queryParams).then(response => {
          this.userList = response.rows;
          this.total = response.total;
        }
      );
    },
    getProList() {
      if (this.typeName == 'purchases') {
        this.queryParamsPro.type = '01'
      } else {
        this.queryParamsPro.type = '00'
      }
      listTeaching(this.queryParamsPro).then(response => {
        this.teachingList = response.rows;
        this.total = response.total;
      });
    },
    // 多选框选中数据
    handleSelectionChange(selection) {

    },
    handleDelete() {
      switch (this.typeName) {
        case 'newVisitis':
          return this.handleUserExport();
        case 'messages':
          return this.handleTeachExport();
        case 'purchases':
          return this.handleTeachExport();
      }
    },
    /** 导出按钮操作 */
    handleUserExport() {
      this.download('system/user/export', {
        ...this.queryParams
      }, `用户_${new Date().getTime()}.xlsx`)
    },
    /** 导出按钮操作 */
    handleTeachExport() {
      let fileN = '';
      if (this.typeName == 'purchases') {
        this.queryParamsPro.type = '01'
        fileN = '教材'
      } else {
        this.queryParamsPro.type = '00'
        fileN = '教研'
      }
      this.download('system/teaching/export', {
        ...this.queryParamsPro
      }, fileN + `_${new Date().getTime()}.xlsx`)
    },
    /** 导出按钮操作 */
    handleRewardExport() {
      this.download('system/reward/export', {
        ...this.queryParams
      }, `reward_${new Date().getTime()}.xlsx`)
    },
  }
}
</script>

<style lang="scss" scoped>
.dashboard-editor-container {
  padding: 32px;
  background-color: rgb(240, 242, 245);
  position: relative;

  .chart-wrapper {
    background: #fff;
    padding: 16px 16px 0;
    margin-bottom: 32px;
  }
}

@media (max-width: 1024px) {
  .chart-wrapper {
    padding: 8px;
  }
}
</style>
