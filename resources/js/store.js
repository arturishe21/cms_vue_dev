
export default {

    state: {
        data: {},
        isShowMessage : false,
        languages : {},
        menu : {},
        user : {}
    },

    getters: {
        getData: state => {
            return state.data
        },

        menu: state => state.menu,
        user: state => state.user,
        languages: state => state.languages,

        showMessage: state => {
            return state.isShowMessage
        },
    },

    mutations: {
        updateData (state, {key, value}) {
            state.data[key] = value;
        },

        setDefaultData(state) {
            state.data = {};
        },

        message (state, status) {
            state.isShowMessage = status;

            setTimeout(function () {
                state.isShowMessage = false;
            }, 2000);
        },

        setLanguage (state, languages) {
            state.languages = languages;
        },

        setMenu (state, menu) {
            state.menu = menu;
        },
    },

    actions: {
        init({commit}) {

            axios
                .get(`/cms/init`)
                .then(response => {
                    commit('setLanguage', response.data.languages);
                    commit('setMenu', response.data.menu)
                });

        }
    }
};
