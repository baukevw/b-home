<template>
  <div class="rooms">
    <div v-for="room in rooms" :key="room.id">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5><i :class="'fas '+ room.icon"></i> {{ room.name }}</h5>
          <div class="ibox-tools">
            <a class="collapse-link">
                <i class="fa fa-chevron-up"></i>
            </a>
          </div>
        </div>
        <devices :initial_devices="room.devices" :room_id="room.id"></devices>
      </div>
    </div>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex'

  export default {
    props: ['initial_rooms'],
    data: function () {
      return {
      }
    },
    mounted() {
      this.initial_rooms.map(function(value, key) {
        this.$store.state.RoomStore.rooms.push(value)
      }, this)
    },
    computed: {
      ...mapGetters({
        rooms: 'RoomStore/rooms'
      })
    },
  }
</script>
