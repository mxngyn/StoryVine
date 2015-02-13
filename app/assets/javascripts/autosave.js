$(document).ready(function (){
  $(".edit_snippet").on("keyup", function(event){
    var $target = $(event.target);
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

  });
});
