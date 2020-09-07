import vue from 'vue';
import vuex from 'vuex';
import { alert } from './alert'
import { link } from './url'
vue.use(vuex)

export const store = new vuex.Store({
	modules: {
		alert,
		link
	},
})
