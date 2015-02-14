$(document).ready(function() {

var password = new LiveValidation('user_password');
password.add( Validate.Length, { minimum: 4 } );
password.validMessage = "Thanks, that works";
console.log(password);

var email = new LiveValidation('user_email');
email.add( Validate.Email );


var confirmation = new LiveValidation('user_password_confirmation');
confirmation.add( Validate.Confirmation, { match: 'user_password' } );

});
