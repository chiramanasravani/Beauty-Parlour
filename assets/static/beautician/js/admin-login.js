function loginvalidation(){
    var Email = document.getElementById('email');
    // var mailformat = /^\w+([\.-]?\w+)@\w+([\.-]?\w+)(\.\w{2,3})+$/;
    // var password = document.myform.password
    
    if (Email.value.length <= 0 ){
        alert("invalid email");
        Email.focus();
        return false;
    } 
   
    if (password.value.length <= 0){
        alert("password should not be emty")
        password.focus();
        return false;
       }
    return true;   
}