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
    thermostat_devices: state => room_id => {
      return state.devices
        .filter(device => device.room_id == room_id)
        .filter(device => device.device_type == 'thermostat')
    },
    active_devices: state => room_id => {
      var on_messages = []
      Object.keys(state.devices).forEach(function (key) {
        on_messages.push(state.devices[key].data['mqtt_on_message'])
      });
      return state.devices
        .filter(device => device.room_id == room_id)
        .filter(device => on_messages.filter(m => m !== "").includes(device.current_state))
    },
    inactive_devices: state => room_id => {
      var off_messages = []
      Object.keys(state.devices).forEach(function (key) {
        off_messages.push(state.devices[key].data['mqtt_off_message'])
      });
      return state.devices
        .filter(device => device.room_id == room_id)
        .filter(device => off_messages.filter(m => m !== "").includes(device.current_state))
    }
  }
}

export default DeviceStore
