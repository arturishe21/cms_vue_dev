<template>
    <div>
        <headerPage></headerPage>
        <navigation></navigation>
        <div id="main" role="main">
            <div id="main-content">
                <div id="ribbon">
                    ribbon
                </div>
                    <div id="content">
                        <router-view></router-view>
                    </div>

            </div>
        </div>

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
    }
</script>