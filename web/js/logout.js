var logout = function(){
   var xhr = new XMLHttpRequest();

    xhr.open('GET', 'logout', true);
    
    console.log(this);
    xhr.send();

xhr.onreadystatechange = function() {
  if (this.readyState !== 4) return;


  if (this.status !== 200) {
    alert('Error while login out');
    return;
  } else{
    window.location.reload() 
  }

}

}

var logouts = document.getElementsByClassName("logout");
for(var i = 0; i < logouts.length; i++){
    logouts[i].onclick = logout;
}