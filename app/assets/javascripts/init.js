$(document).ready(function() {
  checkSignUpValidations();

  autoDeleteIncompleteSnippet();
  SaveWidget.autoSaveContent();
  warnBeforePublish();

});

var autoDeleteIncompleteSnippet = function() {
  var submitNewContentExists = document.getElementById("submit_new_content")
  if(submitNewContentExists) {
    LeavePage();
  }
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
