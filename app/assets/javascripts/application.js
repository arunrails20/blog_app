// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
	$('.blog-approve').click(function() {
			if ($(this).is(':checked')) {
				ajaxUpateBlog(true, $(this).val());
			} else {
				ajaxUpateBlog(false, $(this).val());
			}
	});
	
	function ajaxUpateBlog(approve, blog_id) 
	{
		 $.ajax({url:"/blogs/blog_approve", type: "PUT", data: {id: blog_id, approve: approve}, dataType: "json",
			success:function(result){
				if (result.approve){
					alert("Approved Successfully");
				}
			else{ 
				alert("Unapproved Successfully");
			}
    }}); 
	}
});