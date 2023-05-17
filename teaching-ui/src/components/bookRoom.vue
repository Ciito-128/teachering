<template>
  <div>
    <el-dialog title="预定房间" :visible.sync="open" width="600px"
               :close-on-click-modal="false"
               :close-on-press-escape="false"
               append-to-body>
      <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="姓名" prop="userName">
          {{ form.userName }}
        </el-form-item>
        <el-form-item label="房间号" prop="roomName">
          {{ form.roomName }}
        </el-form-item>
        <el-form-item label="价格" prop="roomPrice">
          {{ form.roomPrice }}
        </el-form-item>
        <el-form-item label="楼层" prop="floor">
          <el-select v-model="form.floor" placeholder="请选择楼层" disabled>
            <el-option
              v-for="dict in dict.type.room_floor"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="类型" prop="typeId">
          <el-select v-model="form.typeId" placeholder="请选择房型" clearable size="small" disabled>
            <el-option
              key="1"
              label="大房"
              :value="1*1"
            />
            <el-option
              key="2"
              label="小房"
              :value="2*1"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="入住时间" prop="startTime">
          <el-date-picker
            v-model="value1"
            type="daterange"
            :editable="false"
            value-format="yyyy-MM-dd"
            range-separator="至"
            start-placeholder="开始日期"
            :picker-options="pickerOptions"
            end-placeholder="结束日期" @change="getCountNight">
          </el-date-picker>

        </el-form-item>
        <el-form-item label="天数" prop="countNight">
          <el-input v-model="form.countNight" readonly/>
        </el-form-item>
        <el-form-item label="总价" prop="status">
          <el-input v-model="form.status" readonly/>
        </el-form-item>
        <el-form-item label="付款码" prop="status">
          <el-image
            style="width: 180px; height: 180px"
            :src="avatar"
            fit="cover"></el-image>
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

export default {
  name: "BookRoom",
  dicts: ['room_floor'],
  props: {
    roomId: {
      type: String,
      default: null,
    },
    orderShow: {
      type: Boolean,
      default: false,
    },
  },
  computed: {
    open: {
      get() {
        return this.orderShow;
      },
      set(val) {
        this.$emit('update:orderShow', val);
      }
    }
  },
  data() {
    return {
      form: {},
      roomInfo: {},
      value1: '',
      pickerOptions: {
        disabledDate(v) {
          // 1、日期禁止选择今天以前的日期
          return v.getTime() < new Date().getTime() - 86400000;
        }
      },
      avatar: require("@/assets/images/fkm.png"),
    }
  },
  methods: {
    /** 提交按钮 */
    submitForm() {
      this.form.startTime = this.value1[0]
      this.form.endTime = this.value1[1]
      this.$refs["form"].validate(valid => {
        if (this.form.status) {
          /*addRoomOrder(this.form).then(response => {
            this.$modal.msgSuccess("预定成功");
            this.open = false;
            this.getList();
          });*/
        }else {
          this.$modal.msgError("入住时间")
        }
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
    },
    getRoomInfo() {
      /*getRoom(this.roomId).then(response => {
        this.roomInfo = response.data;
        this.form = {
          id: null,
          userId: this.$store.state.user.id,
          userName: this.$store.state.user.nickName,
          roomId: this.roomId,
          roomName: this.roomInfo.name,
          roomPrice: this.roomInfo.price,
          floor: this.roomInfo.floor,
          typeId: this.roomInfo.typeId,
          countNight: null,
          startTime: null,
          endTime: null,
          addTime: null,
        };
      });*/
    },
    getCountNight() {
      if (this.value1) {
        var ksrq = this.value1[0] + " 00:00:00";
        var jsrq = this.value1[1] + " 00:00:00";
        let ts = this.getDateDiff(ksrq, jsrq, "day");
        this.form.countNight = ts + " 晚";
        if (ts) {
          this.form.status = parseInt(ts) * parseInt(this.form.roomPrice);
        } else {
          this.form.status = null;
        }
      } else {
        this.form.countNight = null
        this.form.status = null;
      }

    },
    getDateDiff(startTime, endTime, diffType) {
      //将xxxx-xx-xx的时间格式，转换为 xxxx/xx/xx的格式
      startTime = startTime.replace(/\-/g, "/");
      endTime = endTime.replace(/\-/g, "/");
      //将计算间隔类性字符转换为小写
      diffType = diffType.toLowerCase();
      var sTime = new Date(startTime); //开始时间
      var eTime = new Date(endTime); //结束时间

      if (sTime > eTime) {
        alert("开始时间不能大于结束时间!!!");
        return false;
      }
      //作为除数的数字
      var divNum = 1;
      switch (diffType) {
        case "second":
          divNum = 1000;
          break;
        case "minute":
          divNum = 1000 * 60;
          break;
        case "hour":
          divNum = 1000 * 3600;
          break;
        case "day":
          divNum = 1000 * 3600 * 24;
          break;
        default:
          break;
      }
      var ts = parseInt((eTime.getTime() - sTime.getTime()) / parseInt(divNum));
      return ts;
    }
  },
  mounted() {
    this.getRoomInfo();
  }
  ,
}
</script>

<style scoped>

</style>
