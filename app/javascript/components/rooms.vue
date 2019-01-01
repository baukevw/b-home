<template>
  <div id="rooms">
    <div v-for="room in rooms" :key="room.id" class="col-lg-6">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>{{ room.name }}</h5>
          <div class="ibox-tools">
            <a class="collapse-link">
                <i class="fa fa-chevron-up"></i>
            </a>
          </div>
        </div>
        <div class="ibox-content">
          <div class="row">
            <Device v-for="device in room.devices" :key="device.id" :device="device"></Device>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'
  import Device from 'components/device.vue'

  export default {
    props: ['area_id'],
    components: { Device },
    data: function () {
      return {
        rooms: null
      }
    },
    mounted() {
      this.getAreaData();
    },
    methods: {
      getAreaData: function() {
        axios
          .get(`/api/v1/areas/${this.area_id}/rooms-devices`)
          .then(response => (this.rooms = response.data))
      }
    }
  }
</script>

<style scoped>
</style>
