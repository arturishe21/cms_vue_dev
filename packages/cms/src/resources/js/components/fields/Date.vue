<template>
    <section>
        <label class="label">{{data.title}}</label>
        <div style="position: relative;">
            <div class="div_input">
                <div class="input_content">
                    <label class="input">
                        <date-picker
                            v-model="value"
                            value-type="format"
                            default-value="value"
                            style="width:100%"
                            type="date"
                        ></date-picker>
                    </label>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
    import FieldBase from './FieldBase';
    import DatePicker from 'vue2-datepicker';
    import 'vue2-datepicker/index.css';

    export default {
        extends: FieldBase,
        name: 'datetimefield',
        components: { DatePicker},
    }
</script>