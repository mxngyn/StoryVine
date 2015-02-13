$(document).ready(function(){
  var csrf_token = $('meta[name=csrf-token]').attr('content');
  var csrf_param = $('meta[name=csrf-param]').attr('content');
  var params;
  if (csrf_param !== undefined && csrf_token !== undefined) {
    params = csrf_param + "=" + encodeURIComponent(csrf_token);
  }
  $('.redactor').redactor(
    { "imageUpload":"/redactor_rails/pictures?" + params,
      "imageGetJson":"/redactor_rails/pictures",
      "fileUpload":"/redactor_rails/documents?" + params,
      "fileGetJson":"/redactor_rails/documents",
      "path":"/assets/redactor-rails",
      "css":"style.css"}
  );
  // $('.new_snippet').redactor({
  // autosave: '/snippets',
  // autosaveInterval: 5,
  // autosaveCallback: function(name, json)
  //     {
  //         console.log("Hello");
  //         console.log(name);
  //         console.log(json.content);
  //         alert("SUCCESS");
  //     },
  // autosaveErrorCallback: function(name, json)
  // {
  //     console.log("Goodbye");
  //     console.log(name);
  //     alert("FAILED");
  // }
  // });


});

