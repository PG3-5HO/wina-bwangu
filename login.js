
function login(){
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;

    if(!username){ alert("Please enter a username"); return; }
    if(!password){ alert ("Please enter a password"); return; }

    fetch("http://localhost:3000/login", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({username,password})
    })
    .then(function(response){return response.json();})
    .then(function(data) {
        if (data.message === "Login successful"){
            sessionStorage.setItem("loggedIn", "true");
            window.location.href = "Wina_App.html";
        } else {
            document.getElementById("error-message").textContent = "Invalid username or password";
        }
    })
    .catch(function(err) {
        console.log("Error: "+err.message)
    });
}



