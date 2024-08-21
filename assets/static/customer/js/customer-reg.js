function validation(){
    var name = document.myform.name
    var email = document.myform.email
    var mailformat = /^\w+([\.-]?\w+)@\w+([\.-]?\w+)(\.\w{2,3})+$/;
    var mobile_number = document.myform.mobile_number
   
    var password = document.myform.password


    if (name.value=='' || name.value.length <4){
        alert(" Parlour name should be more than 4 alphabets" )
        return false;
    }
    if (!email.value.match(mailformat)){
        alert("invalid email")
        email.focus();
        return false;
       } 
    if (mobile_number.value=='' || mobile_number.value.length !=10 ){
        alert("Mobile number should be 10 digits")
        mobile_number.focus();
        return false;
    }
   
    if (password.value==''){
        alert("password should not be emty")
        password.focus();
        return false;
       }
    
    else{
       return true;
    }
}