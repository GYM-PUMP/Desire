$(function(){
  // $( document ).on('turbolinks:load', function() {　← turbolinksの影響で反映されないので削除
    function readURL(input) {
      // console.log(input);コンソールで動作確認
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#item_image').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      }
    }
    $("#post_img").change(function(){
      // $('#item_image').removeClass('hidden');
      // $('.item_prev').remove();
      // console.log('post_img-change')コンソールで動作確認
      readURL(this);
    });
  })