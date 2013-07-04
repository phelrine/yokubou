var text_set = {}
var text_list = []
var count = 0;
var display_limit = 10;

function fetch() {
    $.get('/yokubou', function(data){
        $.each(data, function(i, s){
            var text = s.text;
            console.log(s);
            if (text in text_set) {
                return true;
            }
            text_set[text] = 1;
            var node =$('<li>').append('"' + text + '"').hide();
            text_list.push(node);
        });
    });
}

function appendText() {
    if (count < text_list.length) {
        text_list[count++].prependTo('#main-list').slideDown();
    } else {
        count = 0;
        appendText();
    }
}

function rotate() {
    var $last = $('#main-list li:last-child');
    if ($('#main-list li').length < display_limit && count < text_list.length) {
        appendText();
    } else if(text_list.length < display_limit) {
        $last.slideUp(function(){
            $(this).prependTo(this.parentNode).slideDown();
        });
    } else {
        $last.slideUp(function(){
            $(this).remove();
            appendText();
        });
    }
}

$(function(){
    fetch();
    setInterval(fetch, 10000);
    setInterval(rotate, 3000);
});
