export const link = {

    namespaced: true,
    state: {
        url: null,
    },
    actions:
    {
        saveUrl({ commit }, url)
        {
            localStorage.setItem('url',url.slice(21))
            commit('save', url);
        },
        removeUrl({ commit }, url)
        {
            commit('remove', url);
        }
    },
    mutations: {
        save(state, url)
        {
            state.url = url;
        },
        remove(state)
        {
            state.url = null;
        }
    }
}
