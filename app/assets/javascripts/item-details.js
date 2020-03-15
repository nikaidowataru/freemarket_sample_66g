$(document).on('turbolinks:load', function() {

  $(function(){
    $('.item__detailpage__box__main__image__bottom__column li').hover(function(){
        //オーバーしたliのインデックスを取得
        debugger
        var index = $('.item__detailpage__box__main__image__bottom__column li').index(this);
        //オーバーした画像URLを取得
        var imageurl = $('.item__detailpage__box__main__image__bottom__column li').eq(index).find('img').attr('src');
        //ulのクラス名を取得（空白で分割）
        className = $(this).parent().attr('class').split(" ");
        //元のメイン画像を保存しておく
        defaultImage = $('img.mainimage.'+className[1]).attr('src');
        $('img.mainimage.'+className[1]).attr('src',imageurl);
    },function(){
        $('img.mainimage.'+className[1]).attr('src',defaultImage);
    });
});
});