var SaveWidget = {}

SaveWidget.autoSaveContent = function() {
  var autosaveOnFocus;
  var editSnippetExists = document.getElementsByClassName('edit_snippet')[0];
  var editStoryExists = document.getElementsByClassName('edit_snippet')[0];

  $('.redactor_editor').focus(function() {
    if (editSnippetExists) {
      autosaveOnFocus = setInterval(this.autosaveSnippet, 2000);
    }
    else if (editStoryExists) {
      autosaveOnFocus = setInterval(this.autosaveStory, 5000);
    }
  }.bind(this));

  $('.redactor_editor').blur(function() {
    console.log(autosaveOnFocus);
    clearInterval(autosaveOnFocus);
    console.log(autosaveOnFocus);
  })
}

SaveWidget.autosaveSnippet = function() {
  var $url = $('.edit_snippet')[0].action;
  var $data = $('.edit_snippet').serialize();
  var $textbox = $('.redactor_editor');
  if($textbox.html().length > 8) {
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
}

SaveWidget.autosaveStory = function() {
  var $url = $('.edit_story')[0].action;
  var $data = $('.edit_story').serialize();
  var $textbox = $('.redactor_editor');
  if($textbox.html().length > 8) {
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
}
