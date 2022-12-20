require('./bootstrap');
import Vue from 'vue/dist/vue.esm.js';
window.Vue = require('vue');
import Vuex from 'vuex'


import App from './components/App.vue';
import VueRouter from 'vue-router';
import VueAxios from 'vue-axios';
import axios from 'axios';
import {routes} from './routes';
import Pagination from 'vue2-laravel-pagination'
import Translit from './plugins/Translit'
import Notifications from 'vue-notification'

import Id from './components/fields/Id.vue'
import Virtual from './components/fields/Virtual.vue'
import Password from './components/fields/Password.vue'
import Checkbox from './components/fields/Checkbox.vue'
import Readonly from './components/fields/Readonly.vue'
import Manytomany from './components/fields/Manytomany.vue'
import Text from './components/fields/Text.vue'
import Froala from './components/fields/Froala.vue'
import File from './components/fields/File.vue'
import Datetime from './components/fields/Datetime.vue'
import Date from './components/fields/Date.vue'
import Textarea from './components/fields/Textarea.vue'
import Image from './components/fields/Image.vue'
import Select from './components/fields/Select.vue'
import Hidden from './components/fields/Hidden.vue'
import TextareaLanguage from './components/fields/TextareaLanguage.vue'
import TextLanguage from './components/fields/TextLanguage.vue'
import FroalaLanguage from './components/fields/FroalaLanguage.vue'
import Foreign from './components/fields/Foreign.vue'
import Number from './components/fields/Number.vue'
import ForeignAjax from './components/fields/ForeignAjax.vue'
import Definition from './components/fields/Definition.vue'
import MultiFile from './components/fields/MultiFile.vue'
import MultiImage from './components/fields/MultiImage.vue'

import FilterText from './components/filters/Text.vue'
import FilterForeignAjax from './components/filters/ForeignAjax.vue'
import FilterSelect from './components/filters/Select.vue'
import FilterDate from './components/filters/Date.vue'

import FormCenter from './components/FormCenter.vue'
import Paginate from './components/partials/Paginate.vue'

import store from "./store";

import { BDropdown } from 'bootstrap-vue'
Vue.component('b-dropdown', BDropdown);
Vue.component('pagination', Pagination);

Vue.component('idField', Id);
Vue.component('virtualField', Virtual);
Vue.component('passwordField', Password);
Vue.component('checkboxField', Checkbox);
Vue.component('readonlyField', Readonly);
Vue.component('manytomanyField', Manytomany);
Vue.component('textField', Text);
Vue.component('froalaField', Froala);
Vue.component('fileField', File);
Vue.component('datetimeField', Datetime);
Vue.component('dateField', Date);
Vue.component('textareaField', Textarea);
Vue.component('imageField', Image);
Vue.component('selectField', Select);
Vue.component('hiddenField', Hidden);
Vue.component('TextareaLanguageField', TextareaLanguage);
Vue.component('TextLanguageField', TextLanguage);
Vue.component('FroalaLanguageField', FroalaLanguage);
Vue.component('ForeignField', Foreign);
Vue.component('numberField', Number);
Vue.component('ForeignajaxField', ForeignAjax);
Vue.component('DefinitionField', Definition);
Vue.component('multifileField', MultiFile);
Vue.component('multiimageField', MultiImage);

Vue.component('FilterText', FilterText);
Vue.component('FilterForeignAjax', FilterForeignAjax);
Vue.component('FilterSelect', FilterSelect);
Vue.component('FilterDate', FilterDate);

Vue.component('paginate', Paginate);
Vue.component('formData', FormCenter);

require('froala-editor/js/froala_editor.pkgd.min.js')

// Require Froala Editor css files.
require('froala-editor/css/froala_editor.pkgd.min.css')
require('froala-editor/css/froala_style.min.css')


// Import and use Vue Froala lib.
import VueFroala from 'vue-froala-wysiwyg'
Vue.use(VueFroala)

Vue.use(VueRouter);
Vue.use(VueAxios, axios);
Vue.use(Vuex);
Vue.use(Translit, {});
Vue.use(Notifications);

const router = new VueRouter({
    mode: 'history',
    routes: routes
});

Vue.directive('click-outside',{
    bind: function (el, binding, vnode) {
        el.eventSetDrag = function () {
            el.setAttribute('data-dragging', 'yes');
        }
        el.eventClearDrag = function () {
            el.removeAttribute('data-dragging');
        }
        el.eventOnClick = function (event) {
            var dragging = el.getAttribute('data-dragging');
            // Check that the click was outside the el and its children, and wasn't a drag
            if (!(el == event.target || el.contains(event.target)) && !dragging) {
                // call method provided in attribute value
                vnode.context[binding.expression](event);
            }
        };
        document.addEventListener('touchstart', el.eventClearDrag);
        document.addEventListener('touchmove', el.eventSetDrag);
        document.addEventListener('click', el.eventOnClick);
        document.addEventListener('touchend', el.eventOnClick);
    }, unbind: function (el) {
        document.removeEventListener('touchstart', el.eventClearDrag);
        document.removeEventListener('touchmove', el.eventSetDrag);
        document.removeEventListener('click', el.eventOnClick);
        document.removeEventListener('touchend', el.eventOnClick);
        el.removeAttribute('data-dragging');
    },
});

const app = new Vue({
    el: '#app',
    store : new Vuex.Store(store),
    router,
    render: h => h(App),
});

