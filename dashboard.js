if(sessionStorage.getItem("loggedIn")!== "true"){window.location.href="Login.html";}

const monthlyLimit ={
    "Airtel Money": 350000,
    "MTN Money": 160000,
    "Zamtel Money": 70000,
    "Zanaco": 80000,
    "FNB": 80000,
};

window.onload = function(){
    fetch("https://wina-bwangu-wd53.onrender.com/get-transactions")
    .then(function(response) {return response.json();})
    .then(function(transactions){

        const totals = {
            "Airtel Money": 0,
            "MTN Money": 0,
            "Zamtel Money": 0,
            "Zanaco": 0,
            "FNB": 0,

        };

        transactions.forEach(function(t){
            if (totals[t.service] !== undefined){
                totals[t.service] += parseFloat(t.amount);
            }
        });

        const tbody = document.getElementById("summary-body");
        tbody.innerHTML ="";

        Object.keys(monthlyLimit).forEach(function(service){
            const cumulative = totals[service];
            const remaining = monthlyLimit[service] - cumulative;

            const row = document.createElement("tr");
            row.innerHTML = `
            <td>${service}</td>
            <td>${monthlyLimit[service].toLocaleString()}</td>
            <td>${cumulative.toLocaleString(undefined, {minimumFractionDigits:2, maximumFractionDigits:2})}</td>
            <td>${remaining.toLocaleString(undefined, {minimumFractionDigits:2, maximumFractionDigits:2})}</td>
            `;
            tbody.appendChild(row);
        });

        const boothLocations = {
            Wina1: "Lusaka CPD",
            Wina2: "Libala",
            Wina3: "Kabwata",
            Wina4: "Mandevu",
            Wina5: "Woodlands",
            Wina6: "Matero East",
        };

        // variables that hold cumulative totals and frequently used services
        const boothTotals ={};
        const boothServiceCount = {};

        transactions.forEach(function(t){
            const booth = t.booth;
            const service = t.service;
            const amount = parseFloat(t.amount);


            // calculates the total at the booth
            if(!boothTotals[booth]) boothTotals[booth] = 0;
            boothTotals[booth] += amount;

            // finds service frequency
            if(!boothServiceCount[booth]) boothServiceCount[booth] = {};
            if(!boothServiceCount[booth][service]) boothServiceCount[booth][service]= 0;
            boothServiceCount[booth][service]++;

            // find most frequented service per booth
            const boothBody = document.getElementById("booth-body");
            boothBody.innerHTML = "";

            Object.keys(boothLocations).forEach(function(booth){
                const total = boothTotals[booth] || 0;

                let frequentlyUsed = "N/A";
                if(boothServiceCount[booth]){
                    frequentlyUsed = Object.keys(boothServiceCount[booth]).reduce(function(a,b){
                       return boothServiceCount[booth][a] > boothServiceCount[booth][b] ? a : b;
                    });

                }

                const row = document.createElement("tr");
                row.innerHTML =`
                <td>${booth}</td>
                <td>${boothLocations[booth]}</td>
                <td>${total.toLocaleString(undefined, {minimumFractionDigits:2, maximumFractionDigits:2})}</td>
                <td>${frequentlyUsed}</td>
                `;
                boothBody.appendChild(row);

            });

        });

        // calculating total revenue and capital 
        let totalRevenue = 0;
        let totalCapital = 0;

        transactions.forEach(function(t){
            totalRevenue += parseFloat(t.amount) * parseFloat(t.revenue_per_kwacha);
            totalCapital += parseFloat(t.amount);

        });

        document.getElementById("total-revenue").textContent = totalRevenue.toLocaleString(undefined, {minimumFractionDigits:2, maximumFractionDigits:2});
        document.getElementById("total-capital").textContent= totalCapital.toLocaleString(undefined, {minimumFractionDigits:2, maximumFractionDigits:2});

        // Pie chart

        const canvas = document.getElementById("pieChart");
        const ctx = canvas.getContext("2d");
        const total = totalRevenue + totalCapital;
        const cx = canvas.width / 2;
        const cy = canvas.height / 2;
        const radius = 120;

        const slices = [
            {value: totalRevenue, color:"rgb(52,118,216)",label:"Revenue"},
            {value: totalCapital, color:"green", label:"Capital"}
        ];


        let startAngle = -Math.PI /2;

        slices.forEach(function(slice){

            const sliceAngle = (slice.value / total) * 2 * Math.PI;

            ctx.beginPath();
            ctx.moveTo(cx,cy);
            ctx.arc(cx, cy, radius, startAngle, startAngle + sliceAngle);
            ctx.closePath();
            ctx.fillStyle = slice.color;
            ctx.fill();
            ctx.strokeStyle = "White";
            ctx.lineWidth = 2;
            ctx.stroke();

            // Percentage label inside slice

            const midAngle = startAngle + sliceAngle / 2
            const lx = cx + (radius * 0.65) * Math.cos(midAngle);
            const ly = cy + (radius * 0.65) * Math.sin(midAngle);
            ctx.fillStyle = "White";
            ctx.font = "bold 13px Times New Roman";
            ctx.textAlign = "center";
            ctx.textBaseline = "middle";
            ctx.fillText((slice.value / total * 100).toFixed(1) + "%", lx, ly);

            startAngle += sliceAngle;


        });

        // Legend 
        const legend = document.getElementById("pie-chart");
        slices.forEach(function(slice){
            const item = document.createElement("div");
            item.style.display = "flex";
            item.style.alignItems = "center";
            item.style.gap = "8px";
            item.style.marginTop = "8px";
            item.innerHTML = `<span style="width:16px; height:16px: background:${slice.color}; display:inline-block; border-radius:50%"></span>
            <span>${slice.label}: ZMW ${slice.value.toLocaleString(undefined, {minimumFractionDigits:2, maximumFractionDigits:2})}</span>
            `;
            legend.appendChild(item);
        });



    })
    .catch(function(err){
        console.log("Error: "+err.message);
    });
};