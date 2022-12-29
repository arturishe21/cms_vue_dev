import RoutePages from './components/RoutePages.vue';
import Translations from './components/Translations.vue';

export const routes = [
    {
        name: 'translations',
        path: '/cms/translations',
        component: Translations
    },
    {
        name: 'translations-cms',
        path: '/cms/translations-cms',
        component: Translations
    },
    {
        name: 'list',
        path: '/cms/*',
        component: RoutePages
    },
];