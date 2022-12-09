<template>
    <section>
        <label class="label"></label>

        <div style="position: relative;">
            <div class="div_input">
                <div class="input_content">
                    <div class="no_active_froala">
                        <textarea></textarea>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
    export default {
        name: 'froala',
        props : ['data'],
    }
</script>