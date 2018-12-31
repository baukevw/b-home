import Vue from 'vue/dist/vue.esm'
import Rooms from '../components/rooms.vue'


document.addEventListener('DOMContentLoaded', () => {
  var rooms_element = document.querySelector(".rooms")
  if (rooms_element != undefined) {
    const rooms = new Vue({
      el: rooms_element,
      components: { Rooms }
    })
  };
})
