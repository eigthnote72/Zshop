
function zoom(a) {    // zoom item in home.jsp
    var x = document.getElementById("sizelist").value;
    for (let i = 0; i < x; i++) {
        if (a === i) {
            document.getElementById('img' + i).width = 230;
            document.getElementById('img' + i).height = 230;
        }


    }

}
function backZoom(a) {    //backzoomitem in home.jsp
    var x = document.getElementById("sizelist").value;
    for (let i = 0; i < x; i++) {
        if (a === i) {
            document.getElementById('img' + i).width = 200;
            document.getElementById('img' + i).height = 200;
        }
    }
}


//function onpenAccount(){
//    alert("ablc");
//    document.getElementById("loginBar").style.display = "block";
//    
//    
//    
//}




