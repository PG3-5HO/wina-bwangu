if(sessionStorage.getItem("loggedIn")!== "true"){
    window.location.href="Login.html";}

// variable declaration
const TAX_RATE = 0.16;
let idCount = 0;
let boothData = {};
let serviceRevenue = {};
let monthlyLimit = {};

// generating ID
function generateID(){
    idCount++;
    return "WB"+ String(idCount).padStart(7,"0");
}

// load data

window.onload =function(){
    Promise.all([
        fetch("http://localhost:3000/get-booths").then(r => r.json()),
        fetch("http://localhost:3000/get-services").then(r => r.json()),
        fetch("http://localhost:3000/get-last-id").then(r => r.json())
    ])
    .then(function(results){
        const booths = results[0];
        const services = results[1];
        const lastId = results[2].lastId;
        console.log("results[2]:", results[2].lastId);
        console.log("lastId",lastId);

       // generating boothData, serviceRevenue and montlyLimit from database

        booths.forEach(function(b){
            boothData[b.booth_name] = {
                location: b.location,
                services: []
            };
        });

        services.forEach(function(s){
            serviceRevenue[s.service_name] = parseFloat(s.revenue_per_kwacha);
            monthlyLimit[s.service_name] = parseFloat(s.monthly_limit);
        });

        // booth services assignment 
        boothData["Wina1"].services = ["Airtel Money","MTN Money","Zamtel Money","Zanaco","FNB"];
        boothData["Wina2"].services = ["Airtel Money","MTN Money","Zamtel Money","FNB"];
        boothData["Wina3"].services = ["Airtel Money","MTN Money","Zamtel Money","Zanaco","FNB"];
        boothData["Wina4"].services = ["Airtel Money","MTN Money","Zamtel Money"];
        boothData["Wina5"].services = ["Airtel Money","MTN Money","Zanaco","FNB"];
        boothData["Wina6"].services = ["Airtel Money","MTN Money","Zamtel Money"];

        // get last transaction id 
        idCount = lastId;
        document.getElementById("transaction-id").value = "WB" + String(idCount + 1).padStart(7,"0");
        
    })
    .catch(function(err){
        console.log("Error loading data: "+ err.message);
    });
};

function onBoothChange(){
    // variables
    const booth = document.getElementById("booth-select").value;
    const location_input = document.getElementById("show-location");
    const service_select = document.getElementById("select-service");
    const revenue_input = document.getElementById("show-revenue");

    revenue_input.value = "";
    document.getElementById("vat-value").value= "";
    document.getElementById("after-tax").value= "";
    document.getElementById("amount").value= "";

    // if booth is not selected , display default values

    if(!booth){
        location_input.value = "";
        service_select.innerHTML = "<option value=''>-- Select Booth First --</option>";
        service_select.disabled = true;
        return;
    }

    // else make changes

    location_input.value = boothData[booth].location;
    service_select.disabled =false;
    service_select.innerHTML = "<option value=''>-- Select Booth First --</option>";
    
    boothData[booth].services.forEach(function(service){
        const option = document.createElement("option");
        option.value = service;
        option.textContent = service;
        service_select.appendChild(option);
    });

}

function calculateTax(){

    // variable declaration
    const amount = parseFloat(document.getElementById("amount").value);
    const taxableAmounnt = document.getElementById("vat-value");
    const amountAfterTax = document.getElementById("after-tax");


    // if amount is left blank or is less than zero then no calculations are done
    if(isNaN(amount) || amount <= 0){
        taxableAmounnt.value = "";
        amountAfterTax.value = "";
        return;
    }

    const taxes = amount * TAX_RATE;
    const plusTax = amount + taxes;

    taxableAmounnt.value = taxes.toFixed(2);
    amountAfterTax.value = plusTax.toFixed(2);

}

function onServiceChange(){

    const service = document.getElementById("select-service").value;
    const revenueInput = document.getElementById("show-revenue");


    // when service is not selected nothing happens
    if(!service){
        revenueInput.value = "";
        return;
    }

    // else calculate tax 

    revenueInput.value = serviceRevenue[service];
    calculateTax();

}

function submitTransaction(){

    // variables
    const booth = document.getElementById("booth-select").value;
    const service = document.getElementById("select-service").value;
    const amount = parseFloat(document.getElementById("amount").value);

    // valiation to make sure transaction form is properly filled
    if(!booth)   {alert("Please select a Booth"); return;}
    if(!service) {alert("Please select a Service"); return;}
    if(isNaN(amount) || amount <= 0){alert("Please select a valid Amount"); return;}

    // variables to store information from Transaction Form
    const transaction_id = generateID();
    const location = boothData[booth].location;
    const revenue_per_kwacha = serviceRevenue[service];
    const vat = parseFloat((amount * TAX_RATE).toFixed(2));
    const amount_after_tax = parseFloat((amount + vat).toFixed(2));

    // submitting the content 

    fetch("http://localhost:3000/add-transaction",{
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({
            transaction_id, booth, location, service, revenue_per_kwacha,
            amount, vat, amount_after_tax
        })
    })
    .then(function(response){return response.json();})
    .then(function(data){
        alert("Transaction recorded successfully!");
        clearForm();
    })
    .catch(function(err){
        alert("Error saving transaction: "+ err.message);
    });

}

function clearForm(){

    // clearing the form 

    document.getElementById("booth-select").value = "";
    document.getElementById("show-location").value = "";
    document.getElementById("select-service").innerHTML = "<option value=''>-- Select Booth First --</option>";
    document.getElementById("select-service").disabled = true;
    document.getElementById("show-revenue").value = "";
    document.getElementById("amount").value = "";
    document.getElementById("vat-value").value = "";
    document.getElementById("after-tax").value = "";

    document.getElementById("transaction-id").value = "WB" + String(idCount + 1).padStart(7,"0");
}

function logout(){
    sessionStorage.removeItem("loggedIn")
    window.location.href="Login.html";
}




