<template>
  <section>
    <span class="onoffswitch">
        <input @change="changeValue()"
               type="checkbox"
               name="onoffswitch"
               class="onoffswitch-checkbox"
               v-model="fastValue"
               :id="keyFastEditField">
        <label class="onoffswitch-label" :for="keyFastEditField">
          <span class="onoffswitch-inner" data-swchon-text="ДА" data-swchoff-text="НЕТ"></span>
          <span class="onoffswitch-switch"></span>
        </label>
    </span>
  </section>
</template>

<script>
import FastEditBase from './FastEditBase';

export default {
  extends: FastEditBase,
}
</script>