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
