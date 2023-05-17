<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="标题" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入标题"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="添加时间" prop="addTime">
        <el-date-picker clearable size="small"
                        v-model="queryParams.addTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="选择添加时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="结束时间" prop="endTime">
        <el-date-picker clearable size="small"
                        v-model="queryParams.endTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="选择结束时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="工号" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入工号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="姓名" prop="userName">
        <el-input
          v-model="queryParams.userName"
          placeholder="请输入姓名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable size="small">
          <el-option
            v-for="dict in dict.type.proStatus"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="审核" prop="audit">
        <el-select v-model="queryParams.audit" placeholder="请选择审核" clearable size="small">
          <el-option
            v-for="dict in dict.type.auditStatus"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="教研类型" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择教研类型" clearable size="small">
          <el-option
            v-for="dict in dict.type.teacherType"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:teaching:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:teaching:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:teaching:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:teaching:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="teachingList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="主键" align="center" prop="id"/>
      <el-table-column label="标题" align="center" prop="name"/>
      <el-table-column label="简介" align="center" prop="introduce" show-overflow-tooltip/>
      <el-table-column label="内容" align="center" prop="content">
        <template slot-scope="scope">
          <el-tooltip class="item" effect="dark" content="点击查看" placement="top">
            <el-link type="primary" @click="handleLook(scope.row)">
              <div class="moreLine">
                点击查看详情
              </div>
            </el-link>
          </el-tooltip>
        </template>
      </el-table-column>
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
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="180">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:teaching:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:teaching:remove']"
          >删除
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-check"
            @click="handleImg(scope.row)"
            v-hasPermi="['system:teaching:edit']"
          >资料
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-circle-check"
            @click="handleAudit(scope.row)"
            v-hasPermi="['system:teaching:audit']"
          >审核
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-trophy"
            @click="handleReward(scope.row)"
          >获奖成果
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改教研科目对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1000px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="标题" prop="name">
          <el-input v-model="form.name" placeholder="请输入标题"/>
        </el-form-item>
        <el-row>
          <el-col :span="12">
            <el-form-item label="教研类型" prop="type">
              <el-select v-model="form.type" placeholder="请选择教研类型" style="width: 401px;">
                <el-option
                  v-for="dict in dict.type.teacherType"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="状态" prop="status">
              <el-select v-model="form.status" placeholder="请选择状态" style="width: 401px;">
                <el-option
                  v-for="dict in dict.type.proStatus"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="工号" prop="userId">
              <el-input v-model="form.userId" placeholder="请输入工号"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="姓名" prop="userName">
              <el-input v-model="form.userName" placeholder="请输入姓名"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="添加时间" prop="addTime">
              <el-date-picker clearable size="small" style="width: 401px;"
                              v-model="form.addTime"
                              type="date"
                              value-format="yyyy-MM-dd"
                              placeholder="选择添加时间">
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="结束时间" prop="endTime">
              <el-date-picker clearable size="small" style="width: 401px;"
                              v-model="form.endTime"
                              type="date"
                              value-format="yyyy-MM-dd"
                              placeholder="选择结束时间">
              </el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>

        <el-form-item label="简介" prop="introduce">
          <el-input v-model="form.introduce" placeholder="请输入简介"/>
        </el-form-item>
        <el-form-item label="内容">
          <editor v-model="form.content" :min-height="192"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <el-dialog title="查看内容" :visible.sync="openLook" width="900px" append-to-body>
      <div v-html="contentInfo" class="dialog-content"></div>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="openLook = false">确 定</el-button>
      </div>
    </el-dialog>

    <!--  获奖成果展示  -->
    <el-dialog title="获奖成果展示" :visible.sync="openReward" width="650px" append-to-body>
      <div v-if="rewardList == undefined ||rewardList == null || rewardList.length <= 0 ">
        <el-empty description="暂无数据"></el-empty>
      </div>
      <div class="list" v-else>
        <div class="item data-item" v-for="(item, index) in rewardList" :key="item.id">
          <div class="item-top">
            <img :src="baseUrl + item.img" class="image">
          </div>
          <div class="item-bottom">
            <div class="moreLine">{{ item.name }}</div>
            <div class="flex align-center mgt-15">
              <div>{{ item.addTime }}</div>
            </div>
          </div>
        </div>
      </div>
      <div slot="footer" class="dialog-footer">
        <el-button @click="openReward = false">关闭</el-button>
      </div>
    </el-dialog>

    <!--  审核  -->
    <el-dialog title="审核" :visible.sync="auditOpen" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="审核" prop="audit">
          <el-select v-model="form.audit" placeholder="请选择审核">
            <el-option
              v-for="dict in dict.type.auditStatus"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {listTeaching, getTeaching, delTeaching, addTeaching, updateTeaching} from "@/api/system/teaching";
import {listReward} from "@/api/system/reward";

export default {
  name: "Teaching",
  dicts: ['proStatus', 'teacherType', 'auditStatus'],
  data() {
    return {
      // 遮罩层
      loading: true,
      openReward: false,
      rewardList: [],
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 教研科目表格数据
      teachingList: [],
      baseUrl: process.env.VUE_APP_BASE_API,
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      auditOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        introduce: null,
        content: null,
        addTime: null,
        userId: null,
        userName: null,
        status: null,
        audit: null,
        type: null,
        endTime: null
      },
      // 表单参数
      form: {},
      isAdd: true,
      // 表单校验
      rules: {
        name: [
          {required: true, message: "标题不能为空", trigger: "blur"}
        ],
        introduce: [
          {required: true, message: "简介不能为空", trigger: "blur"}
        ],
        content: [
          {required: true, message: "内容不能为空", trigger: "blur"}
        ],
      },
      contentInfo: null,
      openLook: false,
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询教研科目列表 */
    getList() {
      this.loading = true;
      listTeaching(this.queryParams).then(response => {
        this.teachingList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.auditOpen = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        introduce: null,
        content: null,
        addTime: null,
        userId: null,
        userName: null,
        status: null,
        audit: null,
        type: null,
        endTime: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.form.audit = '00';
      this.open = true;
      this.isAdd = true;
      this.title = "添加教研科目";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getTeaching(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.isAdd = false;
        this.title = "修改教研科目";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateTeaching(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.auditOpen = false;
              this.getList();
            });
          } else {
            addTeaching(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.auditOpen = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除教研科目编号为"' + ids + '"的数据项？').then(function () {
        return delTeaching(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/teaching/export', {
        ...this.queryParams
      }, `teaching_${new Date().getTime()}.xlsx`)
    },
    handleLook(row) {
      this.openLook = true;
      this.contentInfo = row.content
    },
    /** 附件资料 */
    handleImg(row) {
      this.$router.push({path: "/proMan/fileInfo", query: {id: row.id, name: row.name}});
    },

    /** 审核按钮操作 */
    handleAudit(row) {
      this.reset();
      const id = row.id || this.ids
      getTeaching(id).then(response => {
        this.form = response.data;
        this.auditOpen = true;
      });
    },
    handleReward(row) {
      listReward({fileId: row.id}).then(response => {
        this.rewardList = response.rows;
        this.openReward = true
      });

    },

  }
};
</script>
<style scoped>
/* 超出文本显示省略号 */
.moreLine {
  width: auto;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
}

.dialog-content >>> img, p, span {
  width: 100%;
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
  width: 139px;
  display: block;
  height: 136px;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both
}

.list {
  display: grid;
  grid-gap: 15px;
  grid-template-columns: repeat(4, 1fr);

  .item {
    overflow: hidden;
    min-height: 166px;
    background-color: white;
    border: 1px solid #E2E6EA;
  }

  .add-item {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    cursor: pointer;


    i {
      font-size: 38px;
      color: #4469F7;
    }

    span {
      color: #686C7A;
      margin-top: 10px;
      font-size: 14px;
    }
  }

  .data-item {
    .item-top {
      display: flex;
      align-items: center;
      height: 124px;

      .item-title {
        width: calc(100% - 110px);
        margin-right: 10px;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;

      }
    }

    .item-bottom {
      min-height: calc(100% - 62px);
      padding-top: 20px;
      padding-left: 5px;
      padding-bottom: 15px;
      font-size: 14px;
    }
  }
}


</style>
