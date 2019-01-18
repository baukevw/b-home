import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
Vue.use(Vuex)

import RoomStore from './stores/room_store'
import DeviceStore from './stores/device_store'

window.store = new Vuex.Store({
  modules: {
    RoomStore,
    DeviceStore
  }
});

export default window.store
