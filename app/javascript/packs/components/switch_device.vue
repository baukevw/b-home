<template>
  <div class="col-sm-6 m-b-sm">
    <div class="panel panel-default float-e-margins">
      <div class="panel-heading">
        <div class="pull-right">
          <switchBtn :device=device></switchBtn>
        </div>
        <i :class="'icon fas ' + device.icon" ></i>
        <h5>{{ device.name }}</h5>
      </div>
      <div class="panel-body lighter-text">
        <span class="pull-right"><i class="fas fa-arrow-right"></i></span>
        <i class="fas fa-clock"></i> Schedule
      </div>
    </div>
  </div>
</template>

<script>
  import switchBtn from './switch_btn'

  export default {
    components: { switchBtn },
    props: ["device"]
  }
</script>
