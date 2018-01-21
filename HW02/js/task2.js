(function(){
    "use strict";
    function alertFn(){
        var x = document.getElementById('h1').innerHTML;
        alert(x);
        //document.write(x.innerHTML);
    }
    function incFn(){
        var x = document.getElementById('h1').innerHTML;
        document.getElementById('h1').innerHTML = Number(x) + 1;
    }
    function displayFn(){
     
        var x = document.getElementById('h1').innerHTML;
        var p = document.createElement("p");
        //p.style.position = "absolute";
        //p.style.bottom = "0";
        p.innerHTML = x;
        document.body.appendChild(p);
       
    }

    function init(){
        var btn1 = document.getElementById("btn1");
        btn1.addEventListener("click",alertFn);

        var btn2 = document.getElementById("btn2");
        btn2.addEventListener("click",incFn);

        var btn3 = document.getElementById("btn3");
        btn3.addEventListener("click",displayFn);
    }
    window.addEventListener("load",init,false);
    
})();