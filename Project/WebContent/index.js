/**
 * 
 */

function validate() {
    var uname = document.getElementById('username').value;

    var pwd = document.getElementById('password').value;

    if (uname.length >= 6) {
        alert("UserName is:" + uname);
    }
    else {
        alert("Username must be 6 character length");
        document.getElementById('username').focus();
        return false;
    }
    if (pwd.length >= 8) {
        alert("Password is:"+ pwd);
    } else {
        alert("password must be 8 character length");
        document.getElementById("password").focus();
        return false;
    }
    return true;
}

function registerValidate(){
    var email= document.getElementById('email').value;

    var mailformat = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    var uname = document.getElementById('username').value;


    var pw = document.getElementById('password').value;
   
    var cpw = document.getElementById('cpassword').value;

    if(uname.length >= 6){
        alert("username is:"+uname);
    }else{
        alert("Username must be 6 characters");
        document.getElementById('username').focus();
        return false;
    }
    if(pw.length >= 8){
        alert("Password is:"+pw);
    }else{
        alert("Password must be of 8");
        document.getElementById('password').focus();
        return false;
    }
    if(cpw != pw){
        alert("Confirm passward and password must be same.");
        document.getElementById('cpassword').focus();
        return false;
    }
    if(email.match(mailformat)){
        alert("email is:"+email);
    }else{
        alert("Please enter a valid email");
        document.getElementById('email');
        return false;
    }
     return true;
}


function adminValidate(){
    var uname = document.getElementById('username').value;

    var pwd = document.getElementById('password').value;

    if (uname == 'admin' && pwd == 'admin') {
        alert('Admin login success');
    }
    else {
        alert("Please enter valid username and password");
        return false;
    }
    return true;
}

function canValidate(){
    var cn = document.getElementById('cname').value;
    var pn = document.getElementById('pname').value;
    if (cn.length >= 4) {
        alert("Candidate Name is:" + cn);
    }
    else {
        alert("Enter a valid candidate name");
        document.getElementById('cname').focus();
        return false;
    }
    if (pn.length >= 4) {
        alert("Party name is:"+ pn);
    } else {
        alert("Enter a valid Party name");
        document.getElementById("pname").focus();
        return false;
    }
    return true;

}