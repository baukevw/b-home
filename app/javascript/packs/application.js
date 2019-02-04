/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import Vue from 'vue/dist/vue.esm'
import ToggleButton from 'vue-js-toggle-button'
import Axios from 'axios'
import VueAxios from 'vue-axios'

import store from './vuex'

import Devices from './containers/devices'
import DeviceForm from './containers/device-form'
import Rooms from './containers/rooms'

Vue.use(ToggleButton)
Vue.use(VueAxios, Axios)

Vue.component('devices', Devices)
Vue.component('device-form', DeviceForm)
Vue.component('rooms', Rooms)


document.addEventListener("DOMContentLoaded", function () {

  Axios.defaults.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  const app = new Vue({
    el: '[data-behaviour="vue"]',
    store: store
  })
});
