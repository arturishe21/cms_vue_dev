
export default {

    state: {
        data: {},
        user : {},
        settings: {},
        path: document.querySelector('meta[name="path"]').content,
    },

    getters: {
        getData: (state) => (definition) => {
            return state.data[definition];
        },
        user: state => state.user,
        path: state => state.path,
        settings: state => state.settings
    },

    mutations: {
        updateData (state, {definition, key, value}) {

           if (state.data[definition] == undefined) {
               state.data[definition] = {};
           }

           state.data[definition][key] = value;
        },

        setSettings (state, settings) {
            state.settings = settings;
        },
    },

    actions: {
        init({commit}) {
            axios
                .get('/' + this.state.path + '/init')
                .then(response => {
                    commit('setSettings', response.data)
                });
        }
    }
};
