function validation(event) {
    event.preventDefault();

    var email = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    if (email === "admin@gmail.com" && password === "6360") {
        window.location.replace("app/home/home.html");
    } else if (email != "admin@gmail.com") {
        alert("Incorrect email. Try again");
        return;
    } else if (password != "6360") {
        alert("Incorrect password. Try again");
        return;
    } else {
        alert("The email and password entered are both incorrect. Try again");
        return;
    }
}