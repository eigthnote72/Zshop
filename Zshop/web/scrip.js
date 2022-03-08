


function zoom(a) {
    var x = document.getElementById("sizelist").value;
    for (let i = 0; i < x; i++) {
        if (a === i) {
            document.getElementById('img' + i).width = 250;
            document.getElementById('img' + i).height = 250;
        }


    }



}
function back(a) {
    var x = document.getElementById("sizelist").value;
    for (let i = 0; i < x; i++) {
        if (a === i) {
            document.getElementById('img' + i).width = 200;
            document.getElementById('img' + i).height = 200;
        }
    }
}





