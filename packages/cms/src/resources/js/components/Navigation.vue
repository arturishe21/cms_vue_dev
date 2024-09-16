<template>
    <div>
        <aside id="left-panel">
            <div class="login-info">
                <span>
                    <a>
                        <span>

                        </span>
                    </a>
                </span>
            </div>
                    <!-- end user info -->
            <nav>
                <ul style="display: block;">

                    <li class="level1" v-for="(menuItem, key) in settings.menu" :key="key" :class="{'active': subIsActive(menuItem.link)}">
                        <template v-if="menuItem.submenu">

                                <a @click="$event.target.parentElement.classList.toggle('active')">
                                    <i :class="['fal fa-lg fa-fw fa-' + menuItem.icon]"></i>
                                    {{menuItem.title}}
                                    <b class="collapse-sign"><em class="fal fa-plus"></em></b>
                                </a>
                                <ul>
                                    <li v-for="(menuItem2, key2) in menuItem.submenu" :key="key2"
                                        :class="{'active': subIsActive(menuItem2.link)}"
                                    >
                                        <router-link :to="url(menuItem2.link)">
                                            {{menuItem2.title}}
                                        </router-link>
                                    </li>
                                </ul>
                        </template>
                        <router-link :to="url(menuItem.link)" v-else>
                            <i :class="['fal fa-lg fa-fw fa-' + menuItem.icon]"></i>{{menuItem.title}}
                        </router-link>
                    </li>
                </ul>
            </nav>
            <span class="minifyme" data-action="minifyMenu">
                <i class="fa fa-arrow-circle-left hit"></i>
            </span>
        </aside>
    </div>
</template>

<script>

    import Vuex from 'vuex'

    export default {

        computed: Vuex.mapGetters(['settings']),
/*

        mounted() {
            this.$store.dispatch('init');
        },
*/

        methods: {
            subIsActive(input) {
                return this.$route.path.indexOf(input) != -1;
            },

            url (urlPath) {
                return urlPath;
            }
        }
    }
</script>

<style>
    .level1.active ul {
        display: block;
    }
</style>