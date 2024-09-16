<template>
    <div>
        <headerPage v-if="currentRouteName != 'login'"></headerPage>
        <navigation v-if="currentRouteName != 'login'"></navigation>

         <router-view></router-view>
    </div>
</template>

<script>
    import headerPage from './Header';
    import navigation from './Navigation'

    export default {
        components: {
            headerPage,
            navigation
        },

      computed: {
        currentRouteName() {
          return this.$route.name;
        }
      },
      mounted() {
        this.$store.dispatch('init');
      },
    }
</script>