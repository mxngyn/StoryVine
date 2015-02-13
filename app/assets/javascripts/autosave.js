function autosave () {
  var $url = $('.edit_snippet')[0].action;
  var $data = $('.edit_snippet').serialize();
  $.ajax({
    type: "PATCH",
    url: $url,
    data: $data,
    dataType: "text"
  }).done(function(response){
    console.log(response);
    $(".autosave").html(response);
  });
}


$(document).ready(function (){
  var autosaveOnFocus;
  $('.redactor_editor').focus(function() {
    autosaveOnFocus = setTimeout(autosave, 5000);
  });

  $('.redactor_editor').blur(function() {
    clearTimeout(autosaveOnFocus);
  })
});
