$(document).ready(function() {

  CheckLiveValidations.checkSignUpValidations();
  DeleteSnippetWidget.autoDeleteIncompleteSnippet();
  SaveWidget.autoSaveContent();
  warnBeforePublish();

});


var warnBeforePublish = function() {
  $('#story_published_true').on("click", function(){
    $('#publish-warning').show();
  })
}
