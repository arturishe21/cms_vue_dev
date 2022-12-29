<template>
    <form class="smart-form" method="post" novalidate="novalidate">
        <div v-if="fieldsGroup[0]">
            <div class="table-responsive">
                <fieldset style="padding:0">
                    <div v-for="field in fieldsGroup">
                        <component :is="nameComponent(field.component)" :data="field" :id="id" :definition="definition"></component>
                    </div>
                </fieldset>
            </div>
        </div>
        <div v-else>
            <ul class="nav nav-tabs bordered">
                <li v-for="(fields, name, index) in fieldsGroup"
                    :class="{ active: index == tabActive}"
                    @click="changeTab(index)"
                >
                    <a >{{ name }}</a>
                </li>
            </ul>
            <div class="tab-content padding-10">
                <div class="tab-pane"
                     :class="{ active: index == tabActive}"
                     v-for="(fields, name, index) in fieldsGroup" >
                    <div class="table-responsive">
                        <fieldset style="padding:0">
                            <div v-for="field in fields">
                                <component
                                    :is="nameComponent(field.component)"
                                    @updateTemplate
                                    :data="field"
                                    :id="id"
                                    :definition="definition"
                                ></component>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </form>
</template>

<script>
    export default {
        name : 'formData',
        props : ['fieldsGroup', 'id', 'definition'],

        data() {
            return {
                tabActive : 0
            }
        },

        methods: {

            nameComponent(component) {
                return component + 'Field';
            },

            changeTab(index) {
                this.tabActive = index;
            },
        }
    }
</script>