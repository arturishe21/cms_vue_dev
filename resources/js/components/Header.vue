<template>
    <div>
        <!-- HEADER -->
        <header id="header">
            <div id="logo-group">
            <span id="logo" style="margin-top: 10px;">
               <img src="/packages/vis/builder/img/logo-w.png">
            </span>
            </div>
            <!-- pulled right: nav area -->
            <div class="pull-right">
                <div id="hide-menu" class="btn-header pull-right">
                    <span> <a href="javascript:void(0);" data-action="toggleMenu" title="Collapse Menu"><i class="fal fa-bars"></i></a> </span>
                </div>
                <div id="logout" class="btn-header transparent pull-right">
                    <span> <a href="/admin/logout" data-action="userLogout" ><i class="fal fa-sign-out"></i></a> </span>
                </div>
                <ul class="header-dropdown-list hidden-xs">
                    <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span> Русский </span> <i class="fa fa-angle-down"></i> </a>
                        <ul class="dropdown-menu pull-right">

                        </ul>
                    </li>
                </ul>
            </div>
        </header>
    </div>
</template>
<script>
    export default {
    }
</script>