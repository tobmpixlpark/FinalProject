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
    background-color: #FFFFCC;
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
</style>
<body>
<h1>Please sign up!</h1>
 
<h2>Message : ${message}</h2>
<h2>Counter : ${counter}</h2>	


<form action="/CounterWebApp/Formular" method="POST">
    <label for="vname">
        Vorname<input type="text" class="form" id="vname" name="vname"> 
    </label>
    <label for="zname">
        Nachname: *<input id="zname" name="zname" required class="form">
    </label>
    <label>enter your phonenumber: 
        <input type="tel" name="mobilNummer" placeholder="0221-" class="form">
    </label>
    <label for="passwd">Passwort *</label>  
    <input type="password" id="passwd" size="30" maxlength="40" required class="form" onchange='check_pass()'><br> </br>
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
        document.getElementById("submit").style.background='#4CAF50';
    } else {
        document.getElementById('submit').disabled = true;
        document.getElementById("submit").style.background='red';
    }
}

</script>
</body>
</html>