<template>
  <div class="ibox-content">
    <div class="panel panel-room float-e-margins"  v-if="temperature_reading_devices.length > 0 || humidity_reading_devices.length > 0">
      <div class="panel-body">
        <div class="row">
          <div class="col-sm-12">
            <div class="row text-center weather m-b-lg">
              <div class="col-xs-6">
                <span class="weather-title">
                  <temperatureReadingDevice :device="temperature_reading_devices[0]"></temperatureReadingDevice>
                  <small>Temperature</small>
                </span>
              </div>
              <div class="col-xs-6">
                <span class="weather-title">
                  <humidityReadingDevice :device="humidity_reading_devices[0]"></humidityReadingDevice>
                  <small>Humidity</small>
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="panel panel-room float-e-margins"  v-if="switch_devices.length > 0">
      <div class="panel-body">
        <div class="row">
          <div class="col-sm-6">
            <dl class="dl-horizontal">
              <dt>Active devices:</dt><dd><label class="label label-plain" :class="{'label-primary': active_devices > 0}"> {{ active_devices }} </label></dd>
              <dt>Inactive devices:</dt><dd><label class="label label-plain" :class="{'label-primary': inactive_devices > 0}"> {{ inactive_devices }} </label></dd>
            </dl>
          </div>
          <div class="col-sm-6 text-center">
            <a href="#" class="btn btn-danger" style="margin-top:6px;">Turn off all devices</a>
          </div>
        </div>
      </div>
    </div>
    <div class="row" v-if="switch_devices.length > 0">
      <switchDevice v-for="device in switch_devices" :device="device" :key="device.id"></switchDevice>
    </div>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex'
  import switchDevice from '../components/switch_device'
  import temperatureReadingDevice from '../components/temperature_reading_device'
  import humidityReadingDevice from '../components/humidity_reading_device'

  export default {
    components: { switchDevice, temperatureReadingDevice, humidityReadingDevice },
    props: ['initial_devices', 'room'],
    mounted() {
      this.initial_devices.map(function(value, key) {
        this.$store.state.DeviceStore.devices.push(value)
      }, this)
    },
    computed: {
      switch_devices() {
        return this.$store.getters['DeviceStore/switch_devices'](this.room.id)
      },
      temperature_reading_devices() {
        return this.$store.getters['DeviceStore/temperature_reading_devices'](this.room.id)
      },
      humidity_reading_devices() {
        return this.$store.getters['DeviceStore/humidity_reading_devices'](this.room.id)
      },
      active_devices() {
        return this.$store.getters['DeviceStore/active_devices'](this.room.id).length
      },
      inactive_devices() {
        return this.$store.getters['DeviceStore/inactive_devices'](this.room.id).length
      }
    },
  }
</script>
