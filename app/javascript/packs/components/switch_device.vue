<template>
  <div class="col-lg-6 m-b-sm" style="height:25px;">
    <div class="pull-left">
      <i :class="'fas ' + device.icon" ></i> {{ device.name }}
    </div>
    <div class="pull-right">
      <span>{{ device.current_state }}</span>
      <switchBtn :device=device></switchBtn>
    </div>
    <div class="clearfix"></div>
  </div>
</template>

<script>
  import switchBtn from './switch_btn'

  export default {
    components: { switchBtn },
    props: ["device"]
  }
</script>
