
document.getElementById('comment_button').onclick = function () {
    var comment = document.getElementById('comment_text').value;

    if (comment === ''){
        alert('empty comment');
        return;
    }
    var xhr = new XMLHttpRequest();

    xhr.open('POST', 'CommentServlet', true);
    
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
    var body = 'comment=' + encodeURIComponent(comment);
    console.log(body);

    xhr.send(body);
    
    var comment = document.getElementById('comment_text').value = '';
    
    xhr.onreadystatechange = function () {
        if (this.readyState !== 4)
            return;

            
        if (this.status !== 200) {
            alert('Error while sensing order');
            return;
        } else {
            var t = this.responseText;
            console.log(t);
            var c = JSON.parse(t);
            console.log(c);
            
            
           var commentDiv = '<div class="comment">';
           var authorDiv  = '<div class="comment_author">';
           var dateDiv = '<div class="comment_date">';
           var messageDiv = '<div class="comment_text">';
           var closeDiv = '</div>';
           var insertText = commentDiv + authorDiv + c.name + closeDiv + dateDiv + c.date + closeDiv + messageDiv + c.comment + closeDiv +closeDiv;
           
            document.getElementById('comments').innerHTML += insertText;
            
                  
        }

    }

}






