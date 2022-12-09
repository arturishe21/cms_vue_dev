<script>
    $(".breadcrumb").html("<li><a href='/admin'>{{__cms('Главная')}}</a></li> <li>{{__cms($title)}}</li>");
    $("title").text("{{__cms($title)}} - {{ __cms(config('builder.admin.caption')) }}");
</script>

<!-- MAIN CONTENT -->
<div id="content_email">
    <div class="row" style="margin-left: 0; margin-right: 0">
        <div id="table-preloader" class="smoke_lol"><i class="fa fa-gear fa-4x fa-spin"></i></div>
        <div class="jarviswidget jarviswidget-color-blue " id="wid-id-4" data-widget-editbutton="false" data-widget-colorbutton="false">
            <header>
                <span class="widget-icon"> <i class="fa  fa-file-text"></i> </span>
                <h2> {{__cms($title)}} </h2>
            </header>

            <div class="table_center no-padding">
                @include('image-storage::gallery.partials.content_table')
                @include('image-storage::partials.pagination')
            </div>
        </div>
    </div>
</div>
<!-- END MAIN CONTENT -->

@include('image-storage::partials.modal_wrapper', ["width" => "100%"])

<link rel="stylesheet" href="{{asset('packages/vis/image-storage/css/image_storage.css')}}">
<script src="{{asset('packages/vis/image-storage/js/image_storage.js')}}"></script>

<script>
    $(document).ready(function(){
        ImageStorage.entity = 'galleries';
    });
</script>
