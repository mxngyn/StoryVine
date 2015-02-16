$(document).ready(function() {
  checkSignUpValidations();

  DeleteSnippetWidget.autoDeleteIncompleteSnippet();
  SaveWidget.autoSaveContent();
  warnBeforePublish();

});


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
