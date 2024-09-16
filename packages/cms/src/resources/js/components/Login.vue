<template>
  <div id="main" role="main" style="background-image: url(/packages/vis/builder/img/vis-admin-lock.jpg);">
    <div id="content" class="container">
      <div class="b-login col-xs-12 col-sm-12 col-md-5 col-lg-4 " style="float: right;">
        <div class="well no-padding">


          <div class="alert alert-danger fade in" v-html="error_message" v-if="error_message"></div>

          <form method="post" name="repawning" class="smart-form client-form" @submit="login">
            <header>
              Войти
            </header>
            <fieldset>
              <section>
                <label class="label">Эл.почта</label>
                <label class="input"> <i class="icon-append fa fa-user"></i>
                  <input type="email" name="email" v-model="form.email" required>
                </label>
              </section>

              <section>
                <label class="label">Пароль</label>
                <label class="input"> <i class="icon-append fa fa-lock"></i>
                  <input type="password" name="password" v-model="form.password" required  autocomplete="off">
                </label>
              </section>

            </fieldset>
            <footer>
              <button class="btn btn-primary submit_button">
                Войти
              </button>
            </footer>
          </form>

        </div>

      </div>

    </div>
  </div>

</template>

<script>
  export default {
    name : 'login',
    data() {
      return {
        form: {
          'email': '',
          'password': ''
        },
        error_message: ''
      }
    },
    methods: {
      login: function(event) {
        event.preventDefault();
        this.axios
            .post('login', this.form).
                then(response => {

                  if (response.data.status == 'error') {
                    this.error_message = response.data.message;
                    this.form = {};

                    return;
                  }

                  location.href = '/cms/tree';

                }).catch(error => {
                  this.error_message = error.response.data.message;
           });
      }
    }
  }
</script>

<style scoped>
  html {
    margin: 0;
    overflow-x: hidden !important;
    padding: 0;
    position: relative;
    min-height: 100%;
    height: 100%;
    background: none;
  }
  #main {
    background: #667;
    margin: 0;
    height: 100vh;
    display: block;
    min-height: 100%;
    position: relative;
    background-size: cover !important;

  }
  body{
    padding: 0 !important;
  }
  div#content {
    margin-right: 0;
    padding: 0;
    position: relative;
  }
  .container:after {
    clear:both;
  }
  div.b-login {
    background: #fff;
    opacity: 0.9;
    position: fixed;
    height: 100%;
    right: 0;
    top: 0;
    min-height: 480px;
    width: 29%;
  }
  .well {
    margin-top: 130px;
    border: none;
    box-shadow: none;
    background-color: #fbfbfb;
    position: relative;
    margin-bottom: 20px;
  }
  .client-form header {
    border-bottom-style: solid;
    background: #fff;
  }
  .smart-form footer {
    background: #fff;
    display: block;
    padding: 7px 14px 15px;
    border-top: 1px solid rgba(0,0,0,.1);
  }
  .smart-form .btn.submit_button {
    float: left;
    margin-left: 0;
    height: 31px;
    margin: 10px 0 0 5px;
    padding: 0 22px;
    cursor: pointer;
  }
  form.smart-form {
    padding: 0 15px;
  }
</style>