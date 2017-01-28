
window.onload = function (e) {
    var c = document.getElementById('type_select');
    c.onchange = function () {
        var value = this.value;
        var url = window.location.href;
        url = url.substring(0, url.indexOf('?')) + "?type="+value;     
        window.location.href = url;
    }
}

