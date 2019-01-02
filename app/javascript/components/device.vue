<template>
  <div class="col-lg-6 m-b-sm" style="height:25px;">
    <div class="pull-left">
      <i :class="'fas ' + device.icon" ></i> {{ device.name }}
    </div>
    <div class="pull-right">
      <switchBtn v-if="device.device_type === 'switch'" :device=device></switchBtn>
    </div>
    <div class="clearfix"></div>
  </div>
</template>

<script>
  import switchBtn from 'components/switch.vue'

  export default {
    props: ['device'],
    components: {switchBtn},
    data: function () {
      return {
      }
    }
  }
</script>

<style scoped>
</style>
