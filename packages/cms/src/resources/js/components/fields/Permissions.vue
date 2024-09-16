<template>
  <section>
    <label class="label">{{data.title}}</label>
    <div style="position: relative;">
      <section style="border: 1px solid #ccc; padding: 10px" v-for="(permissions, key) in data.permissions">
        <p style="padding-bottom:10px">{{key}}</p>
        <section v-for="(permission, key) in permissions">

          <section v-if="typeof permission === 'object'" style="padding-left:10px">
            <p style="padding-bottom:10px">{{key}}</p>
            <section v-for="(permission2, key2) in permission">
              <label class="checkbox">
                <input type="checkbox" v-model="value[key2]" :name="data.key"><i></i> {{permission2}}
              </label>
            </section>
          </section>

          <section v-else>
            <label class="checkbox">
              <input type="checkbox" v-model="value[key]" :name="data.key"><i></i> {{permission}}
            </label>
          </section>
        </section>


      </section>
    </div>
  </section>
</template>

<script>
import FieldBase from './FieldBase';

export default {
  components: {},

  extends: FieldBase,
}
</script>