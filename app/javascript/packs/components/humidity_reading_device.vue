<template>
  <span>
    <vue-c3 :handler="handler"></vue-c3>
  </span>
</template>

<script>
  import Vue from 'vue/dist/vue.esm'
  import VueC3 from 'vue-c3'

  export default {
    components: { VueC3 },
    props: ["device"],
    data: function () {
      return {
        handler: new Vue()
      }
    },
    watch: {
      device: function(val) {
        this.c3Data(val.data.humidity)
      }
    },
    methods: {
      c3Data: function(current_state) {
        const options = {
          data: {
            columns: [
              ['Humidity', current_state]
            ],
            type: 'gauge'
          },
          gauge: {
            label: {
              format: function(value, ratio) {
                  return value+ ' %';
              },
              show: true // to turn off the min/max labels.
            },
            min: 0, // 0 is default, //can handle negative min e.g. vacuum / voltage / current flow / rate of change
            max: 100, // 100 is default
            units: '',
            width: 30, // for adjusting arc thickness
            expand: true
          },
          tooltip: {
            show: false
          },
          legend: {
            show: false
          },
          color:{
            pattern: ['#ED5565', '#f8ac59', '#1ab394', '#ED5565'],
            threshold: {
              values: [25, 40, 60]
            }
          },
          size: {
            height: 120
          }
        }
        this.handler.$emit('init', options)
      }
    },
    mounted() {
      this.c3Data(this.device.data.humidity)
    }
  }
</script>
