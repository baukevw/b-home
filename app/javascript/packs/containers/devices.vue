<template>
  <div class="ibox-content">
    <div class="row" v-if="switch_devices.length > 0">
      <switchDevice v-for="device in switch_devices" :device="device" :key="device.id"></switchDevice>
    </div>
    <div class="row" v-if="temperature_reading_devices.length > 0">
      <temperatureReadingDevice v-for="device in temperature_reading_devices" :device="device" :key="device.id"></temperatureReadingDevice>
    </div>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex'
  import switchDevice from '../components/switch_device'
  import temperatureReadingDevice from '../components/temperature_reading_device'

  export default {
    components: { switchDevice, temperatureReadingDevice },
    props: ['initial_devices', 'room_id'],
    data: function () {
      return {
      }
    },
    mounted() {
      this.initial_devices.map(function(value, key) {
        this.$store.state.DeviceStore.devices.push(value)
      }, this)
    },
    computed: {
      switch_devices() {
        return this.$store.getters['DeviceStore/switch_devices'](this.room_id)
      },
      temperature_reading_devices() {
        return this.$store.getters['DeviceStore/temperature_reading_devices'](this.room_id)
      }
    },
  }
</script>
