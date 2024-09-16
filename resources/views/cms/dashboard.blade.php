<div class="row">
	<article class="col-sm-12 col-md-12 col-lg-6">
		<div id="wid-id-2" class="jarviswidget  jarviswidget-color-blueDark jarviswidget-sortable" data-widget-fullscreenbutton="false" data-widget-editbutton="false" style="" role="widget">
			<header>
				<h2>{{__cms('Новые пользователи')}}</h2>
			</header>
			<div role="content">
				<div class="widget-body no-padding">
					<table id="datatable_fixed_column" class="table table-hover table-bordered">
						<thead>
						<tr>
							<th>#</th>
							<th>{{__cms('ФИО')}}</th>
							<th>Email</th>
							<th>{{__cms('Дата регистрации')}}</th>
						</tr>
						</thead>
						<tbody>
						@forelse($lastUsers as $user)
							<tr>
								<td>{{$user->id}}</td>
								<td>
									<a href="/cms/users?id={{$user->id}}" target="_blank">{{$user->getFullName()}}</a>
								</td>
								<td>{{$user->email}}</td>
								<td>{{$user->created_at}}</td>
							</tr>
						@empty
							<tr>
								<td colspan="4">{{__cms('Пока нет пользователей')}}</td>
							</tr>
						@endforelse
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</article>
</div>
<script>
    $("title").text("{{__cms('Рабочий стол')}}");

    $( ".datepicker" ).datepicker({
        dateFormat: 'yy-mm-dd',
        nextText: ">",
        prevText: "<"
    });

    $('.datepicker_sum').on('change', function () {
        getCountValue(
            $('#datepicker_sum_from').val(),
            $('#datepicker_sum_to').val(),
            $('#new_datepicker_sum'),
            'sum'
        );
    });

    $('.datepicker_avg').on('change', function () {
        getCountValue(
            $('#datepicker_avg_from').val(),
            $('#datepicker_avg_to').val(),
            $('#new_datepicker_avg'),
            'avg'
        );
    });

    function getCountValue(start, end, price, method) {
        $.ajax({
            method: "POST",
            url:  '/admin/get-order/price-by-date',
            data: { from: start, to: end, method: method},
            success: function(result){
                price.html(result);
            }
        })
    }
</script>

