<html>
<head>
    
</head>
<style>
.form {
    height: 20px;
    padding-top: 5px;
    padding-left: 10px;
    font-family: "Courier New", Courier, monospace;
    font-size: 13px;
    border: 1px solid #000;
    background-color: #ffffff;
}

.buttons {
    background-color: white; 
    border: 1px solid #4CAF50;
    color: black;
    padding: 10px 22px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 2px 1px;
    transition-duration: 0.4s;
    cursor: pointer;
}

.buttons:hover {
    background-color: #4CAF50; /* Green */
    color: white;
}

h1 {
    color: red;
}

input:invalid {
    background-color: #ff8989;
}

input:valid {
    background-color: #ddffdd;
}

input:-webkit-autofill,
input:-webkit-autofill:hover,
input:-webkit-autofill:focus,
input:-webkit-autofill:active {
   -webkit-transition-delay: 9999s;
   transition-delay: 9999s;
}
</style>
<body>
<h1>Please sign up!</h1>
 
<h2>Message : ${message}</h2>
<h2>Counter : ${counter}</h2>	


<form action="/CounterWebApp/Formular" method="POST">
    <label for="vname">
        Vorname <input type="text" class="form" id="vname" name="vname"> 
    </label>
    <label for="zname">
        Nachname: <input id="zname" name="zname" class="form">
    </label>
    <label for="mail">
        enter your E-Mail adress: *<input type="email" pattern="[^ @]*@[^ @]*" placeholder="Enter your email" required class="form">
    </label>
    <label>enter your phonenumber: 
        <input type="tel" name="mobilNummer" placeholder="0221-" class="form"><br> </br>
    </label>
    <label for="passwd">Passwort *</label>  
    <input type="password" id="passwd" size="30" maxlength="40" required class="form" onchange='check_pass()'>
    <label for="passwd">Confirm password *</label>  
    <input type="password" id="confirm_password" size="30" maxlength="40" required class="form" onchange='check_pass()'><br> </br>
    <button type="submit" id='submit' class="buttons">SEND</button>
</form>
<p>
    Fields with * are required!
</p>

<script>

function check_pass() {
    if (document.getElementById('passwd').value ==
        document.getElementById('confirm_password').value) {
        document.getElementById('submit').disabled = false;
        document.getElementById("confirm_password").style.removeProperty("background-color");
    } else {
        document.getElementById('submit').disabled = true;
        document.getElementById("confirm_password").style.background='red';
    }
}
</script>
</body>
</html>