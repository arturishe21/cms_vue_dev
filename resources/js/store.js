
export default {

    state: {
        data: {},
        languages : {},
        menu : {},
        user : {}
    },

    getters: {
        getData: state => state.data,
        menu: state => state.menu,
        user: state => state.user,
        languages: state => state.languages,
    },

    mutations: {
        updateData (state, {key, value}) {
            state.data[key] = value;
        },

        setDefaultData(state) {
            state.data = {};
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
