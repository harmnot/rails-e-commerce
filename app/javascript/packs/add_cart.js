$(function() {

   $(".btn_add_cart").click(function(e) {
       var data = $(this).attr('data-product');
       var getCookies;
         getCookies = getCookie("_cart");
       if (!getCookies) {
           var obj = [JSON.parse(data)];
           setCookie("_cart", JSON.stringify(obj), 3600);
       } else {
           var objTemp = JSON.parse(getCookies);
           var newData = JSON.parse(data);
           var count= 0;
           for(var i = 0; i < objTemp.length; i++) {
               if(newData["id"] === objTemp[i]["id"]) {
                   objTemp[i]["quantity"]++;
               } else {
                   count++
               }
           }
           if(count === objTemp.length) {
               objTemp.push(newData)
           }
           setCookie("_cart", JSON.stringify(objTemp), 3600);
       }
   });
});


function setCookie(variable, value, expires_seconds) {
    var d = new Date();
    d = new Date(d.getTime() + 1000 * expires_seconds);
    document.cookie = variable + '=' + value + '; expires=' + d.toGMTString() + ';';
}

function getCookie(cname) {
    var name = cname + "=",
        ca = document.cookie.split(';'),
        i,
        c,
        ca_length = ca.length;
    for (i = 0; i < ca_length; i += 1) {
        c = ca[i];
        while (c.charAt(0) === ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) !== -1) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}



function eraseCookie(name) {
    document.cookie = name+'=; Max-Age=-99999999;';
}
