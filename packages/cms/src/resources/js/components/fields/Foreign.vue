<template>
    <section>
        <label class="label">{{data.title}}</label>
        <div style="position: relative;">
            <div class="div_input">
                <div class="input_content">
                    <label class="select">
                        <select class="dblclick-edit-input form-control input-small unselectable"
                                v-model="value"
                            >
                            <option :value="item.id" v-for="item in data.options">{{item.name}}</option>
                        </select>
                        <i></i>
                    </label>
                </div>
            </div>
        </div>
    </section>
</template>

<script>

    import FieldBase from './FieldBase';

    export default {
        extends: FieldBase,
    }
</script>