$(document).ready(function() {

  CheckLiveValidations.checkSignUpValidations();
  DeleteSnippetWidget.autoDeleteIncompleteSnippet();
  SaveWidget.autoSaveContent();
  warnBeforePublish();
  indexPage();

});


var warnBeforePublish = function() {
  $('#story_published_true').on("click", function(){
    $('#publish-warning').show();
  })
}


var indexPage = function() {
  var fullPage = document.getElementById('fullpage');
  if(fullPage) {
    $('#fullpage').fullpage({
      menu: true,
      anchors:['firstSlide', 'secondSlide'],
      navigation: true,
      navigationPosition: 'right',
      navigationTooltips: ['firstSlide', 'secondSlide'],
      slidesNavigation: true,
      slidesNavPosition: 'bottom',
    });
  }
}
