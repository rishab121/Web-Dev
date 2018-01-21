(function(){
    "use strict";
    function loremFn(){
        document.getElementById("para1").innerHTML = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac tristique orci, id mattis ante. Fusce sed faucibus est. Phasellus ultrices egestas sagittis. Maecenas tempor dignissim neque in laoreet. Morbi felis mi, dapibus a venenatis ac, finibus porta ipsum. Nulla facilisi. Etiam non commodo magna.";
        document.getElementById("para2").innerHTML = "Aliquam nunc nulla, porttitor id elit sed, porttitor fermentum lacus. Aliquam sed iaculis massa. Aenean id eros erat. Aliquam dignissim dapibus nulla a imperdiet. Sed sed lorem vestibulum, vulputate orci eget, gravida elit. Nam eget erat tortor. Aliquam sollicitudin, elit non sollicitudin imperdiet, lectus arcu sagittis nunc, bibendum posuere massa ipsum eget quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.";
        document.getElementById("para3").innerHTML = "Maecenas ultricies egestas cursus. Vivamus laoreet nisi odio, posuere pulvinar magna eleifend ultricies. Vestibulum nec quam aliquet, egestas nisl eu, sollicitudin libero. Ut consequat consectetur sollicitudin. In luctus, lectus sagittis euismod porttitor, metus ipsum posuere leo, et ullamcorper justo nibh sed urna. In scelerisque porttitor leo, in accumsan eros molestie eu. Sed sed faucibus mauris. Maecenas dignissim a justo vitae molestie.";
        document.getElementById("para4").innerHTML = "Aliquam erat volutpat. Nulla suscipit nisl at magna feugiat, id varius urna commodo. Donec tempus eget diam vel convallis. Etiam nisi lacus, semper a fringilla et, rhoncus non nisi. Etiam tempus mollis rutrum. Praesent scelerisque, leo a pellentesque porta, nibh felis pharetra mi, ut lacinia turpis risus at nisi.";
    }
    function bottleFn(){
        document.getElementById("para1").innerHTML = "99 bottles of beer on the wall, 99 bottles of beer. Take one down and pass it around, 98 bottles of beer on the wall.";
        document.getElementById("para2").innerHTML = "98 bottles of beer on the wall, 98 bottles of beer.Take one down and pass it around, 97 bottles of beer on the wall.";
        document.getElementById("para3").innerHTML = "97 bottles of beer on the wall, 97 bottles of beer.Take one down and pass it around, 96 bottles of beer on the wall.";
        document.getElementById("para4").innerHTML = "96 bottles of beer on the wall, 96 bottles of beer. Take one down and pass it around, 95 bottles of beer on the wall.";
    }

    function lastFn(){
        document.getElementById("para1").innerHTML = "This is the third thing.";
        document.getElementById("para2").innerHTML = "";
        document.getElementById("para3").innerHTML = "";
        document.getElementById("para4").innerHTML = "";

    }

    function init(){
        var a = document.getElementById("anchor1");
        a.addEventListener("click",loremFn);

        var a2 = document.getElementById("anchor2");
        a2.addEventListener("click",bottleFn);

        var a3 = document.getElementById("anchor3");
        a3.addEventListener("click",lastFn);
    }
    window.addEventListener("load",init);
    
})();