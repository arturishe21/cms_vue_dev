import RoutePages from './components/RoutePages.vue';
import Translations from './components/Translations.vue';
import Login from './components/Login.vue';

export const routes = [
    {
        name: 'translations',
        path: '/translations',
        component: Translations
    },
    {
        name: 'translations-cms',
        path: '/translations-cms',
        component: Translations
    },
    {
        name: 'login',
        path: '/login',
        component: Login
    },
    {
        name: 'list',
        path: '/*',
        component: RoutePages
    },
];