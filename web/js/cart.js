var amountButtonFunc = function(){
   var xhr = new XMLHttpRequest();

    xhr.open('GET', 'addItem?'+this.getAttribute('action')
            +'='+this.getAttribute('product_id'), true);
    
    console.log(this);
    xhr.send();

xhr.onreadystatechange = function() {
  if (this.readyState !== 4) return;


  if (this.status !== 200) {
    alert('Error while adding item to order');
    return;
  } else{
    window.location = "cart"  
  }

  // получить результат из this.responseText или this.responseXML
}

}

var amountButtons = document.getElementsByClassName("amount_button");
for(var i = 0; i < amountButtons.length; i++){
    amountButtons[i].onclick = amountButtonFunc;
}