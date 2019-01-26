const DeviceStore = {
  namespaced: true,
  state: {
    devices: []
  },
  mutations: {
    addDevices(state, data) {
      state.devices.push(data)
    },
    changedDevice(state, data) {
      const deviceIndex = state.devices.findIndex(device => device.id == data.id)
      state.devices.splice(deviceIndex, 1, data)
    }
  },
  getters: {
    switch_devices: state => room_id => {
      return state.devices
        .filter(device => device.room_id == room_id)
        .filter(device => device.device_type == 'switch')
    },
    temperature_reading_devices: state => room_id => {
      return state.devices
        .filter(device => device.room_id == room_id)
        .filter(device => device.device_type == 'temperature_reading')
    },
    humidity_reading_devices: state => room_id => {
      return state.devices
        .filter(device => device.room_id == room_id)
        .filter(device => device.device_type == 'humidity_reading')
    },
    active_devices: state => room_id => {
      var on_messages = []
      Object.keys(state.devices).forEach(function (key) {
        on_messages.push(state.devices[key]['mqtt_on_message'])
      });
      return state.devices
        .filter(device => device.room_id == room_id)
        .filter(device => on_messages.filter(m => m !== "").includes(device.current_state))
    },
    inactive_devices: state => room_id => {
      var off_messages = []
      Object.keys(state.devices).forEach(function (key) {
        off_messages.push(state.devices[key]['mqtt_off_message'])
      });
      return state.devices
        .filter(device => device.room_id == room_id)
        .filter(device => off_messages.filter(m => m !== "").includes(device.current_state))
    }
  }
}

export default DeviceStore
