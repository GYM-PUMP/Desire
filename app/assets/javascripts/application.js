// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require bootstrap-sprockets
// require_tree .
//= require moment
//= require fullcalendar

//= require underscore
//= require gmaps/google




//TOPへ戻るボタン--------------------

$(function(){
  var pagetop = $('#page_back');
  // ボタン非表示
  pagetop.hide();
  // 100px スクロールしたらボタン表示
  $(window).scroll(function () {
     if ($(this).scrollTop() > 100) {
          pagetop.fadeIn();
     } else {
          pagetop.fadeOut();
     }
  });
  pagetop.click(function () {
     $('body, html').animate({ scrollTop: 0 }, 500);
     return false;
  });
});

//----------------------------------------------
//ローディング画面をフェードインさせてページ遷移-------
$(function(){
    // リンクをクリックしたときの処理。外部リンクやページ内移動のスクロールリンクなどではフェードアウトさせたくないので少し条件を加えてる。
    $('a[href ^= "https://newstella.co.jp"]' + 'a[target != "_blank"]').click(function(){
        var url = $(this).attr('href'); // クリックされたリンクのURLを取得
        $('#js-loader').fadeIn(600);    // ローディング画面をフェードイン
        setTimeout(function(){ location.href = url; }, 800); // URLにリンクする
        return false;
    });
});

// ページのロードが終わった後の処理
$(window).load(function(){
  $('#js-loader').delay(300).fadeOut(400); //ローディング画面をフェードアウトさせることでメインコンテンツを表示
});

// ページのロードが終わらなくても10秒後に強制的に処理を実行
$(function(){ setTimeout('stopload()', 10000); });
function stopload(){
  $('#js-loader').delay(300).fadeOut(400); //ローディング画面をフェードアウトさせることでメインコンテンツを表示
}


//閲覧数カウント--------------------------------------
$(function(){
  $('.article').click(function() {
    var $button = $(this)
    var id = $button.data('id');
    $.ajax({
      url: '/users/articles/' + id,
      type: 'GET',
    }).done(function(response){
      $("#sampleModal-" + id).find('.impression_count').text(response.impression_count)
      //モーダルの中の.impression_countをjsonでとったresponse.impression_countに書き換える
      $button.find('.impression_count').text(response.impression_count)
    });
  });
});






