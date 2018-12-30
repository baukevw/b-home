import Vue from 'vue/dist/vue.esm'
import App from '../components/app.vue'


document.addEventListener('DOMContentLoaded', () => {
  var element = document.querySelector("#app")
  if (element != undefined) {
    const app = new Vue({
      el: element,
      components: { App }
    })
  };
})
