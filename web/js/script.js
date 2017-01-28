

var description;
var propertys;
var reviews;
window.onload = function(e){
	var c = document.getElementsByTagName("service_inf")[0].getAttribute("value");
	console.log(c);
	
	propertys = document.getElementsByClassName("prop")[0];
	reviews = document.getElementsByClassName("reviews")[0];
	description = document.getElementsByClassName("descr")[0];

	document.getElementById("description_tab").onclick = showDescription;
	document.getElementById("propertys_tab").onclick = showPropertys;
	document.getElementById("reviews_tab").onclick = showReviews;

	if(c == 1){
		showDescription();
		document.getElementById("description_tab").className = "checked";
	}

	if(c == 2){
		showPropertys();
		document.getElementById("propertys_tab").className = "checked";
	}

	if(c == 3){
		showReviews();
		document.getElementById("reviews_tab").className = "checked";
	}

}

function hide( element){
	element.style.display = 'none';
}

function show( element){
	element.style.display = 'block';
}

function removeCheckedClass(){

	var element = document.getElementsByClassName("checked")[0];
	if(element)
		element.className = "";
}

function showDescription(){
	show(description);
	hide(propertys);
	hide(reviews);
	removeCheckedClass();
	this.className = "checked";
	return false;
}
function showPropertys(){
	hide(description);
	show(propertys);
	hide(reviews);
	removeCheckedClass();
	this.className = "checked";
	return false;
}
function showReviews(){
	hide(description);
	hide(propertys);
	show(reviews);
	removeCheckedClass();
	this.className = "checked";
	return false;
}
