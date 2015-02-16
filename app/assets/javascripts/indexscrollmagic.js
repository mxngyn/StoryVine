$(document).ready(function() {

  var $index = $('#index')
  if ($index){

  // init ScrollMagic Controller
  var controller = new ScrollMagic();

  // Scene Handler
  var scene = new ScrollScene({
      triggerElement: "#pinned-trigger1", // point of execution
      duration: 60 // pin the element for a total of 400px
    }).setPin("#pinned-element1"); // the element we want to pin
  // Scene2 Handler
  var scene2 = new ScrollScene({
    triggerElement: "#pinned-trigger2", // point of execution
    duration: 60 // pin the element for a total of 400px
  }).setPin("#pinned-element2"); // the element we want to pin

  // Add Scenes to ScrollMagic Controller
  controller.addScene([
    scene,
    scene2
  ]);

}

});
