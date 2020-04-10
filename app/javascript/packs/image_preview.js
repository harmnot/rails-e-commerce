console.log("hello");

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            console.log(e.target.result)
            // $("#image_here").attr('src', e.target.result).css("width: 100%; max-width: 40px; height: auto")
            var img = `<div class="col-xs-3 col-sm-1">
                          <img src=${e.target.result}
                               alt="Profile Picture" class="img-responsive img-rounded"
                               style="max-height: 50px; max-width: 50px;">
                        </div>`;
            $("#image_here").html(img)
        };
        console.log(reader.readAsDataURL(input.files[0]))
        reader.readAsDataURL(input.files[0]);
    }
}


$(".photo_upload").change(function(){
    console.log("workkkkkk")
    readURL(this);
});

