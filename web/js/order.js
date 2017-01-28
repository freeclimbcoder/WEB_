
document.getElementById('order_button').onclick = function () {
    var delivery = false;
    var address = '';
    if (document.getElementById('delivery').checked)
        delivery = true;
    if (delivery) {
        address = document.getElementById('address').value
    } else {
        var addr1 = document.getElementById('addr_1');
        var addr2 = document.getElementById('addr_2');
        var addr3 = document.getElementById('addr_3');
        if (addr1.checked)
            address = addr1.value;
        if (addr2.checked)
            address = addr2.value;
        if (addr3.checked)
            address = addr3.value;
    }

    if (address === '') {
        alert("empty address!");
        return;
    }

    var xhr = new XMLHttpRequest();

    xhr.open('POST', 'make_order', true);
    
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
    var body = 'delivery=' + encodeURIComponent(delivery) +
            '&address=' + encodeURIComponent(address);
    console.log(body);

    xhr.send(body);
    
    this.disabled = true;
    this.style.cursor = 'wait'
    
    xhr.onreadystatechange = function () {
        if (this.readyState !== 4)
            return;

            
        if (this.status !== 200) {
            alert('Error while sensing order');
            return;
        } else {
            alert('готово!');
            window.location = 'profile'
        }

    }

}





