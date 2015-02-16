$(document).ready(function() {
  checkSignUpValidations();

  autoDeleteIncompleteSnippet();
  autoSaveContent();
  warnBeforePublish();

});

var autoDeleteIncompleteSnippet = function() {
  var submitNewContentExists = document.getElementById("submit_new_content")
  if(submitNewContentExists) {
    LeavePage();
  }
}

var autoSaveContent = function() {
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
}

var checkSignUpValidations = function() {
  var userNameFieldExists = document.querySelector('#user_username');

  if (userNameFieldExists) {
    liveValidationFunction();
  }
}

var warnBeforePublish = function() {
  $('#story_published_true').on("click", function(){
    $('#publish-warning').show();
  })

}
