export const alert = {

    namespaced: true,
    state: {
        type: null,
        message: null,
        booking: false
    },
    actions:
    {
        success({ commit }, message)
        {
            commit('success', message);
        },
        error({ commit }, message)
        {
            commit('error', message);
        },
        clear({ commit }, message)
        {
            commit('success', message);
        },
        showBooking({ commit })
        {
            commit('trueBooking');
        },
        hideBooking({ commit })
        {
            commit('falseBooking');
        }
    },
    mutations: {
        success(state, message)
        {
            state.type = 'alert-success';
            state.message = message;
        },
        error(state, message)
        {
            state.type = 'alert-danger';
            state.message = message;
        },
        clear(state) {
            state.type = null;
            state.message = null;
        },
        trueBooking(state)
        {
            state.booking = true
        },
        falseBooking(state)
        {
            state.booking = false
        }
    }
}
