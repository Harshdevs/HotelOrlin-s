function showalert(){
    alert("Successfully Registered !! Lets Login");
};

function passalert(){
    alert("You will rececive a password reset link to the given mail id. Please check your inbox");
};

function close_window(){
    close();
}

function validation() {

    var user = document.getElementById('user').value;
    var pass = document.getElementById('pass').value;
    var confirmpass = document.getElementById('conpass').value;
    var mobileNumber = document.getElementById('mobileNumber').value;
    var emails = document.getElementById('emails').value;
    var gend = document.getElementById('gender').value;


    if (user == "") {
        document.getElementById('username').innerHTML = " *Please fill the username field! *";
        return false;
    }
    if ((user.length <= 2) || (user.length > 20)) {
        document.getElementById('username').innerHTML = " * Username length must be between 2 and 20! *";
        return false;
    }
    if (!isNaN(user)) {
        document.getElementById('username').innerHTML = " * only characters are allowed! *";
        return false;
    }


    if (emails == "") {
        document.getElementById('emailids').innerHTML = " * Please fill the email field! *";
        return false;
    }
    if (emails.indexOf('@') <= 0) {
        document.getElementById('emailids').innerHTML = " * Invalid mail ID! *";
        return false;
    }

    if ((emails.charAt(emails.length - 4) != '.') && (emails.charAt(emails.length - 3) != '.')) {
        document.getElementById('emailids').innerHTML = " * Invalid mail ID! *";
        return false;
    }


    if (mobileNumber == "") {
        document.getElementById('mobileno').innerHTML = " * Please fill the contact number field! *";
        return false;
    }
    if (isNaN(mobileNumber)) {
        document.getElementById('mobileno').innerHTML = " * Enter only digits!*";
        return false;
    }
    if (mobileNumber.length != 10) {
        document.getElementById('mobileno').innerHTML = " * Contact Number must be 10 digits only!*";
        return false;
    }


    if (gend.value == 0) {
        document.getElementById('genders').innerHTML = " *Please fill this field! *";
        return false;
    }


    if (pass == "") {
        document.getElementById('passwords').innerHTML = " * Please fill the password field! *";
        return false;
    }
    if ((pass.length < 6) || (pass.length > 20)) {
        document.getElementById('passwords').innerHTML = " * Passwords length must be between  6 and 20! *";
        return false;
    }
    if (pass.search(/[0-9]/) == -1) {
        document.getElementById('passwords').innerHTML = " * Must contain atleast one number! *";
        return false;
    }

    if (pass.search(/[a-z]/) == -1) {
        document.getElementById('passwords').innerHTML = " * Must contain atleast one lowercase letter! *";
        return false;
    }

    if (pass.search(/[A-Z]/) == -1) {
        document.getElementById('passwords').innerHTML = " * Must contain atleast one uppercase letter! *";
        return false;
    }
    if (pass.search(/[!\@\#\$\%\^\&\(\)\_\+\.\,\;\:]/) == -1) {
        document.getElementById('passwords').innerHTML = " * Must contain atleast one special character! *";
        return false;
    }

    if (pass != confirmpass) {
        document.getElementById('confrmpass').innerHTML = " * Password does not match the confirm password! *";
        return false;
    }



    if (confirmpass == "") {
        document.getElementById('confrmpass').innerHTML = " * Please fill the confirmpassword field! *";
        return false;
    }



}