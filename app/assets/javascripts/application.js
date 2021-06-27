// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require social-share-button
//= require owl.carousel


$(function(){
  $("#hoge").t()
});
// タイピングjs

$(function () {
  $("textarea").keyup(function(){
    var counter = $(this).val().length;
    $("#countUp").text(counter);
    if(counter == 0){
      $("#countUp").text("0");
    }
    if(counter >= 100){
      $("#countUp").css("color","red");
    } else {
      $("#countUp").css("color","white");
    }
  });
});
// 文字数カウントjs

$(function() {
    var password  = '#js-password';
    var passcheck = '#js-passcheck';

    changeInputtype(password, passcheck);
});


function changeInputtype(password, passcheck) {
    $(passcheck).change(function() {
        if ($(this).prop('checked')) {
            $(password).attr('type','text');
        } else {
            $(password).attr('type','password');
        }
    });
}
// パスワードjs