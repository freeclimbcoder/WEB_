var buyButtonFunc = function(){
   var xhr = new XMLHttpRequest();

    xhr.open('GET', 'addItem?add='+this.getAttribute('product_id'), true);
    
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

var buyButtons = document.getElementsByClassName("buy_button");
for(var i = 0; i < buyButtons.length; i++){
    buyButtons[i].onclick = buyButtonFunc;
}