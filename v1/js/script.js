// JavaScript Document


$(document).ready (function() {
	$('#save-btn').on('click', function(e) {
		console.log('test');
		var $btn = $(this);
		var user_id = $btn.data('user');
		var obj_id = $btn.data('num');
		var obj_type = $btn.data('type');
		
		$.ajax({
			url: '../save-btn.php',/* PHP file which does the save function */
			type: "POST",
			data: {'user':user_id,'oid':obj_id,'type':obj_type},
			success:function(data){
				$('.save-btn').removeClass("default").addClass("inactive");
				console.log(data);
			}
		});
		//console.log($btn.data('num')); error handler if we want
	})
})