function changeColor(){
    Array.from(document.querySelectorAll('button')).map(function(button) {
        button.style.borderColor="green";
    })
}