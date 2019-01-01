<template>
  <div class="col-lg-6 m-b-sm" style="height:25px;">
    <div class="pull-left">
      <i class="fas "></i> {{ device.name }}
    </div>
    <div class="pull-right">
      <toggle-button :value="false" color="#1AB394" :labels="false" :width=35 />
    </div>
    <div class="clearfix"></div>
  </div>
</template>

<script>

  export default {
    props: ['device'],
    data: function () {
      return {
      }
    }
  }
</script>

<style scoped>
</style>
