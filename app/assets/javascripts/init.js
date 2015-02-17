$(document).ready(function() {

  CheckLiveValidations.checkSignUpValidations();
  DeleteSnippetWidget.autoDeleteIncompleteSnippet();
  SaveWidget.autoSaveContent();
  warnBeforePublish();
  indexPage();
  voteUpdate();
  voteDown();
  accordionBar();
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
      anchors:['Main', 'Featured Story', 'Popular Stories', 'Popular Snippets', 'Meet the Team'],
      navigation: true,
      navigationPosition: 'right',
      navigationTooltips: ['Main', 'Featured Story', 'Popular Stories', 'Popular Snippets', 'Meet the Team'],
      slidesNavigation: true,
      slidesNavPosition: 'bottom',
    });
  }
}

var voteUpdate = function() {
  var voteFormExists = document.getElementsByClassName('vote_for_stories')[0];

  if (voteFormExists) {
    $('.vote_for_stories').on('submit', function(event) {
      event.preventDefault();
      var $target = $(event.target);
      $target.hide();
      var $url = $('.vote_for_stories')[0].action;
      $.ajax({
        type: "PATCH",
        url: $url,
        dataType: "text"
      }).done(function(response) {
        $('.vote-count').html(response);
      });
    });
  }
}

var voteDown = function() {
  var downVoteButton = document.getElementsByClassName('button_to')[0];
  if (downVoteButton) {
    console.log("hello");
    $('.button_to').on('submit', function(event) {
      event.preventDefault();
      var $target = $(event.target);
      $target.hide();
      var $url = $('.button_to')[0].action;
      $.ajax({
        type: "DELETE",
        url: $url,
        dataType: "text"
      }).done(function(response) {
        $('.vote-count').html(response);
      });
    });
  }
}

var accordionBar = function() {
  // var bar = document.getElementsByClassName('.accordion-navigation')[0];
  $('.accordion-navigation').on('click', function(event) {
    // event.preventDefault();
    $('#panel1a').slideToggle('slow');

  })
};

