
export default {

    state: {
        data: {},
        languages : {},
        menu : {},
        user : {},
    },

    getters: {
        getData: (state) => (definition) => {
            return state.data[definition];
        },
        menu: state => state.menu,
        user: state => state.user,
        languages: state => state.languages,
    },

    mutations: {
        updateData (state, {definition, key, value}) {

           if (state.data[definition] == undefined) {
               state.data[definition] = {};
           }

           state.data[definition][key] = value;
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
