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
    }
  }
}

export default DeviceStore
