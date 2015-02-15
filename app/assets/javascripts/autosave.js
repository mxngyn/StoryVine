function autosaveSnippet () {
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

function autosaveStory () {
  var $url = $('.edit_story')[0].action;
  var $data = $('.edit_story').serialize();
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
    if ($('.edit_snippet').length !== 0) {
      autosaveOnFocus = setInterval(autosaveSnippet, 5000);
    }
    else {
      autosaveOnFocus = setInterval(autosaveStory, 5000);
    }
  });

  $('.redactor_editor').blur(function() {
    console.log(autosaveOnFocus);
    clearInterval(autosaveOnFocus);
    console.log(autosaveOnFocus);
  })

});
