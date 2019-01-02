<template>
  <toggle-button :value="value" v-model="value" :sync="true" :color="{checked: '#1AB394', unchecked: '#c4c4c4'}" :labels="false" :width=35 @change="changeSwitchValue()" />
</template>

<script>
  import axios from 'axios'

  export default {
    props: ['device'],
    data: function () {
      return {
        value: null,
        interval: null,
      }
    },
    methods: {
      getSwitchStatus: function() {
        var request_url = this.device.api_get_url
        var request_headers =  JSON.parse(this.device.api_get_request_headers)
        var request_body = JSON.parse(this.device.api_get_request_body)
        var request_type = this.device.api_get_request_type

        axios.request({
          method: request_type,
          url: request_url,
          headers: request_headers,
          params: request_body
        })
        .then((response) => { this.setValue(response) })
      },
      setValue: function(response) {
        var data = Object.values(response.data)[0]
        this.value = this.convertOnOff(data)
      },
      changeSwitchValue: function() {
        var request_url = this.device.api_set_url
        var request_headers =  JSON.parse(this.device.api_set_request_headers)
        var request_body = JSON.stringify(this.device.api_set_request_body)
        var request_type = this.device.api_set_request_type
        var request_action = this.convertTrueFalse(this.value)
        request_body = JSON.parse(request_body.replace('[API_REQUEST_ACTION]', request_action))

        axios.request({
          method: request_type,
          url: request_url,
          headers: request_headers,
          data: request_body
        })
      },
      convertOnOff: function(value) {
        return value == 'on' ? true : false
      },
      convertTrueFalse: function(value) {
        return value == true ? 'on' : 'off'
      }
    },
    // mounted() {
    //   this.getSwitchStatus();
    // },
    mounted() {
      this.getSwitchStatus();

      this.interval = setInterval(function () {
        this.getSwitchStatus();
      }.bind(this), 2000);
    },
    beforeDestroy: function(){
      clearInterval(this.interval);
    }
  }
</script>

<style scoped>
</style>
