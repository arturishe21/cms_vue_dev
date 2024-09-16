
<section>
    <div class="container">
        <div class="row">
            <div class="col text-center">
                @if(!$receipt)
                    <button id="send-to-checkbox" type="button" value="{{$id}}" class="btn btn-success">{{ __t('Фискализация чека') }}</button><br />
                @else
                    <a class="btn btn-sm btn-warning" href="{{$receipt->formPrintPath() .'/html'}}" role="button" target="_blank">
                        <i class="glyphicon glyphicon-print"></i> {{ __t('HTML чек') }}
                    </a>
                    <a class="btn btn-sm btn-info" href="{{$receipt->formPrintPath() .'/pdf'}}" role="button" target="_blank">
                        <i class="glyphicon glyphicon-print"></i> {{ __t('PDF чек') }}
                    </a>
                    <a class="btn btn-sm btn-primary" href="{{$receipt->formPrintPath() .'/text'}}" role="button" target="_blank">
                        <i class="glyphicon glyphicon-print"></i> {{ __t('TXT чек') }}
                    </a>
                    <a class="btn btn-sm btn-success" href="{{$receipt->formPrintPath() .'/qrcode'}}" role="button" >
                        <i class="glyphicon glyphicon-qrcode"></i> {{ __t('QR код чека') }}
                    </a>
                @endif
            </div>
        </div>
    </div>
</section>
<script>
    $('#send-to-checkbox').click(function () {
        $.get( '/admin/send/order/' + $(this).val() , function( data ) {
            if (data){
                let btnSend = document.getElementById('send-to-checkbox');
                btnSend.setAttribute('disabled', true);
            }
        });
    })
</script>
