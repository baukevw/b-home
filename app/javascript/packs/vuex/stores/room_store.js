const RoomsStore = {
  namespaced: true,
  state: {
    rooms: []
  },
  mutations: {
    addRooms(state, data) {
      state.rooms.push(data)
    }
  },
  getters: {
    rooms: state => {
      return state.rooms
    }
  }

}

export default RoomsStore
