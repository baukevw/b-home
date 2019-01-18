<template>
  <toggle-button :value="value" v-model="value" :sync="true" :color="{checked: '#1AB394', unchecked: '#c4c4c4'}" :labels="false" :width=35 @change="changeSwitchValue()" />
</template>

<script>
  import Axios from 'axios'

  export default {
    props: ['device'],
    data: function () {
      return {
        value: null
      }
    },
    watch: {
      device: function(val) {
        this.setSwitchValue(val.current_state);
      }
    },
    methods: {
      setSwitchValue: function(val) {
        this.value = this.convertOnOff(val)
      },
      changeSwitchValue: function() {
        var switchState = this.convertTrueFalse(this.value)

        Axios.request({
          method: 'POST',
          url: '/mqtt/publish',
          data: { 'device': { 'id': this.device.id, 'current_state': switchState } }
        })
      },
      convertOnOff: function(value) {
        return value == this.device.mqtt_on_message ? true : false
      },
      convertTrueFalse: function(value) {
        return value == true ? this.device.mqtt_on_message : this.device.mqtt_off_message
      }
    },
    mounted() {
      this.setSwitchValue(this.device.current_state);
    }
  }
</script>

<style scoped>
</style>
