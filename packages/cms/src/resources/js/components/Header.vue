<template>
    <div>
        <!-- HEADER -->
        <header id="header">
            <div id="logo-group">
                <span id="logo" style="margin-top: 10px;">
                   <img :src="settings.logo" height="30px">
                </span>
            </div>
            <!-- pulled right: nav area -->
            <div class="pull-right">
                <div id="hide-menu" class="btn-header pull-right">
                    <span> <a href="javascript:void(0);" data-action="toggleMenu" title="Collapse Menu"><i class="fal fa-bars"></i></a> </span>
                </div>
                <div id="logout" class="btn-header transparent pull-right">
                    <span> <a href="/cms/logout" data-action="userLogout" ><i class="fal fa-sign-out"></i></a> </span>
                </div>
<!--                <div class="header-dropdown-list hidden-xs" style="margin-top:10px">
                      <b-dropdown right no-caret>
                        <template #button-content>
                          <span> Русский </span>
                          <i class="fa fa-angle-down"></i>
                        </template>
                        <li v-if="settings.languages['cms'] != undefined" v-for="(languageTitle, key) in settings.languages['cms'].all">
                          <a :href="key" v-text="languageTitle"></a>
                        </li>
                      </b-dropdown>
                </div>-->
            </div>
        </header>
    </div>
</template>
<script>
    import Vuex from "vuex";
    import draggable from 'vuedraggable'

    export default {

      computed: Vuex.mapGetters(['settings']),

      components: {
        draggable
      },
    }
</script>