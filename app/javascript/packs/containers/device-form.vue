<template>
  <form class="form-horizontal" v-on:submit.prevent="saveDevice">
    <div class="form-group">
      <label class="col-sm-2 control-label">Device Name:</label>
      <div class="col-sm-10">
        <input type="text" v-model="device.name" name="device[name]" class="form-control" />
      </div>
    </div>
    <div class="hr-line-dashed"></div>
    <div class="form-group">
      <label class="col-sm-2 control-label">Device Type:</label>
      <div class="col-sm-10 select">
        <select v-model="deviceType" name="device[device_type]" class="form-control" @change="changeDeviceType">
          <option :value="null">Select device type...</option>
          <option v-for="device_type in parsedDeviceTypesList" v-bind:value="device_type.value" v-bind:key="device_type.key">
            {{ device_type.key }}
          </option>
        </select>
      </div>
    </div>
    <div class="hr-line-dashed"></div>
    <div class="form-group">
      <label class="col-sm-2 control-label">Room:</label>
      <div class="col-sm-10 select">
        <select v-model="device.room_id" name="device[room_id]" class="form-control">
          <option :value="null">Select room...</option>
          <option v-for="room in rooms" v-bind:value="room.id" v-bind:key="room.id">
            {{ room.name_with_area }}
          </option>
        </select>
      </div>
    </div>
    <div class="hr-line-dashed"></div>
    <div class="form-group">
      <label class="col-sm-2 control-label">Icon:</label>
      <div class="col-sm-10">
        <input type="text" v-model="device.icon" name="device[icon]" class="form-control" />
        <span class="help-block m-b-none">Choose a Font Awesome icon class.</span>
      </div>
    </div>
    <div class="hr-line-dashed"></div>
    <div class="form-group">
      <label class="col-sm-2 control-label">MQTT Topic:</label>
      <div class="col-sm-10">
        <input type="text" v-model="device.mqtt_topic" name="device[mqtt_topic]" class="form-control" />
      </div>
    </div>
    <div class="hr-line-dashed"></div>
    <div v-if="deviceType === 'switch'">
      <div class="form-group">
        <label class="col-sm-2 control-label">MQTT On Message:</label>
        <div class="col-sm-10">
          <input type="text" v-model="device.data.mqtt_on_message" name="device[data][mqtt_on_message]" class="form-control data" />
        </div>
      </div>
      <div class="hr-line-dashed"></div>
      <div class="form-group">
        <label class="col-sm-2 control-label">MQTT Off Message:</label>
        <div class="col-sm-10">
          <input type="text" v-model="device.data.mqtt_off_message" name="device[data][mqtt_off_message]" class="form-control data" />
        </div>
      </div>
      <div class="hr-line-dashed"></div>
    </div>
    <div v-if="deviceType === 'thermostat'">
      <div class="form-group">
        <label class="col-sm-2 control-label">Delta Above Temperature:</label>
        <div class="col-sm-10">
          <input type="text" v-model="device.data.delta_above_state" name="device[data][delta_above_state]" class="form-control data" />
        </div>
      </div>
      <div class="hr-line-dashed"></div>
      <div class="form-group">
        <label class="col-sm-2 control-label">Delta Below Temperature:</label>
        <div class="col-sm-10">
          <input type="text" v-model="device.data.delta_below_state" name="device[data][delta_below_state]" class="form-control data" />
        </div>
      </div>
      <div class="hr-line-dashed"></div>
      <div class="form-group">
        <label class="col-sm-2 control-label">Average Reading Number:</label>
        <div class="col-sm-10">
          <input type="text" v-model="device.data.average_reading_number" name="device[data][average_reading_number]" class="form-control data" />
        </div>
      </div>
      <div class="hr-line-dashed"></div>
    </div>

    <div class="form-group">
      <label class="col-sm-2 control-label">MQTT State Topic:</label>
      <div class="col-sm-10">
        <input type="text" v-model="device.mqtt_state_topic" name="device[mqtt_state_topic]" class="form-control" />
      </div>
    </div>
    <div class="hr-line-dashed"></div>
    <div class="form-group">
      <div class="col-sm-10 col-sm-offset-2">
          <div class="pull-right" v-if="this.id != null">
            <a data-confirm="Are you sure?" rel="nofollow" data-method="delete" :href="`/admin/devices/${this.id}`" class="btn btn-danger">Destroy</a>
          </div>
        <div class="pull-left">
          <a href="/admin/devices" class="btn btn-white">Cancel</a>
          <input type="submit" value="Save Device" class="btn btn-primary">
        </div>
      </div>
    </div>
  </form>
</template>

<script>
import humanizeString from 'humanize-string'
import Axios from 'axios'

  export default {
    props: ['id', 'device', 'deviceTypes', 'rooms'],
    data: function () {
      return {
        deviceType: this.device.device_type,
        parsedDeviceTypesList: []
      }
    },
    mounted() {
      this.parsedDeviceTypes()
      this.addDataAttributes()
    },
    methods: {
      parsedDeviceTypes: function() {
        for(var deviceType in this.deviceTypes){
          this.parsedDeviceTypesList.push({key: humanizeString(deviceType), value: deviceType })
        }
      },
      addDataAttributes: function() {
        this.device.data = { ...this.device.data }
      },
      saveDevice: function() {
        this.device.device_type = this.deviceType
        console.log(this.device);
        var url = this.id == null ? '/admin/devices.json' : `/admin/devices/${this.id}.json`
        var method = this.id == null ? 'POST' : 'PUT'

        Axios.request({
          method: method,
          url: url,
          data: this.device
        }).then((response) => {
          window.location.href = response.data.url
        })
        .catch(error => {
          console.log(error);
        })
      },
      changeDeviceType: function() {
        this.device.data = { }
      }
    }
  }
</script>
