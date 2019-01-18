<template>
  <div class="col-lg-6 m-b-sm" style="height:25px;">
    <div class="pull-left">
      <i :class="'fas ' + device.icon" ></i> {{ device.name }}
    </div>
    <div class="pull-right">
      {{ device.current_state }} &deg;C
    </div>
    <div class="clearfix"></div>
  </div>
</template>

<script>
  export default {
    props: ["device"]
  }
</script>
