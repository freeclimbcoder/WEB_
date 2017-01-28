
var locale = "ru-RU";
var h1 = document.getElementsByTagName("h1")[0];
console.log(h1.innerText);

if(h1.innerText.indexOf("S") !== -1){
    locale = "en-US";
}
var options = {
    year: "numeric", 
    month: "numeric",
    day: "numeric",
    hour: "2-digit", 
    minute: "2-digit",
    second:"2-digit"
};

setInterval( function() { 

var d = new Date();
document.getElementById('time').innerHTML = d.toLocaleDateString(locale, options);

}, 1000);



