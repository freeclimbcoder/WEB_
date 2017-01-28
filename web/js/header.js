
var redirect = function ()
{
    key = encodeURI('lang'); value = encodeURI(this.id);
    console.log(this);

    var kvp = document.location.search.substr(1).split('&');
    console.log(kvp.length);
    var i=kvp.length; var x; while(i--) 
    {
        x = kvp[i].split('=');

        if (x[0]===key)
        {
            x[1] = value;
            kvp[i] = x.join('=');
            break;
        }
    }

    if(i<0) {kvp[kvp.length] = [key,value].join('=');}

    document.location.search=kvp.join('&');
}


var c = document.getElementsByClassName("lang_link");
for(i = 0; i < c.length; i++){
    c[i].onclick = redirect;
    
}



