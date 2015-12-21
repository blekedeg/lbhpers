/*
 * main.js
 * AJI Indonesia.or.id
 * Author: Iyan Kushardiansah <iyank4@gmail.com>
 */

jQuery.easing.def = "easeOutBack";
var tmpZoomWrap = "";
var tmpZoom = "";
var qsRandomTimer;

function shuffleArray(array) {
  var currentIndex = array.length
    , temporaryValue
    , randomIndex;

  // While there remain elements to shuffle...
  while (0 !== currentIndex) {

    // Pick a remaining element...
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex -= 1;

    // And swap it with the current element.
    temporaryValue = array[currentIndex];
    array[currentIndex] = array[randomIndex];
    array[randomIndex] = temporaryValue;
  }

  return array;
}

function randomQs(className) {
  var source = $("." + className + " li");
  var destin = shuffleArray(source);
  $("." + className).quicksand(destin, {'easing' : 'easeInOutQuad'});
}

function getTweetsCallback(content) {
  //alert('dipanggil');
  var html_content = "<ul>";
  for (var i=0; i<content.length; i++) {
    html_content += "<li>" + content[i] + "</li>";
  }
  html_content += "</ul>";
  $("#tweetdiv").html(html_content);

  // bind click event
  $("#tweetdiv .interact a").click(function (e) {
    e.preventDefault();
    window.open($(this).attr("href"),"","width=420,height=350");
  });
  $("#tweetdiv .user a,#tweetdiv .user a").each(function () {
    $(this).attr("target", "_blank");
  });
}

function getTweets() {
  // domId ngga ngaruh disini, soalnya pake custom callback
  // id domId maxTweets enableLinks showUser showTime dateFunction showRt customCallback showInteraction
  twitterFetcher.fetch('414516836852436992', 'tweetdiv', 2, true, true, true, '', true, function (cc) {getTweetsCallback(cc)});

  //setTimeout(function() {getTweets()}, 3000);
}

function setCookie(key, value) {
  var expires = new Date();
  expires.setTime(expires.getTime() + (1 * 24 * 60 * 60 * 1000));
  document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
}

function getCookie(key) {
  var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
  return keyValue ? keyValue[2] : null;
}

$(document).ready(function () {
  // open corrensponding #id if specified on the URI
  var urisp =document.URL.split("#");
  if (typeof (urisp[1]) != "undefined") {
    $("#"+urisp[1]).show();
  }

  // main nav hover
  /*$(".navbar-aji .dropdown").hover(function () {
	$(this).find(".dropdown-toggle").trigger("click")
  },
  function () { $(this).find(".dropdown-toggle").trigger("click") }
  );*/
  //$(".dropdown-menu").mouseleave(function () { $(".dropdown").removeClass("open") });
  
  // added by ttg
  $('.dropdown').mouseover(function(){$(this).addClass("open").trigger("click")});
  $('.dropdown').mouseleave(function() {$(this).removeClass("open").trigger("click")});

  qsRandomTimer = setInterval(function(){ randomQs("qs-random") }, 1888);
  $(".qs-random li").hover(function () {
    clearInterval (qsRandomTimer);
    $(this).siblings().css('opacity', '0.4');
  }, function () {
    $(this).siblings().css('opacity', '1');
    qsRandomTimer = setInterval(function(){ randomQs("qs-random") }, 1888);
  });

  if ($.fn.cslider) {
    //$('#da-slider').css({"background-image":"../img/aji-bg.jpg"}).cslider({
		$('#da-slider').cslider({
        autoplay  : true,
        bgincrement : 15,
        interval:8000
      });
  }

  $(".media .thumbnail").click(function (e) {
    e.preventDefault();

    var html_title = $(this).closest('.media').find('h4').html();
    var foto  = $(this).attr('data-foto');
    var desc  = $(this).attr('alt');
    var link = $(html_title).attr('href');

    var html_content = '<div style="text-align:center"><img style="max-width:100%" alt="" src="'+foto+'" /></div>';
    if (desc != "") {
      html_content = html_content + "<br><h4>"+desc+"</h4>";
    }
    if (link != "") {
      html_content = html_content + '<hr><p style="text-align:center"><a href="'+link+'">Lanjut ke artikel &raquo;</a></p>';
    }
    $('#media-preview').find('.modal-title').html(html_title);
    $('#media-preview').find('.modal-body').html(html_content);

    $('#media-preview').modal('show');
  });

  $(".content-foto").click(function (e) {
    e.preventDefault();

    var html_title = $(this).closest('.content').find('.page-header').text();
    var foto  = $(this).find("img").attr('src');
    var desc  = $(this).find(".content-foto-desc").text();

    var html_content = '<div style="text-align:center"><img style="max-width:100%" alt="" src="'+foto+'" /></div>';
    if (desc != "") {
      html_content = html_content + '<br><p style="text-align:center;font-weight:bold">'+desc+'</p>';
    }
    $('#media-preview').find('.modal-title').css("text-align","center").html(html_title);
    $('#media-preview').find('.modal-body').html(html_content);

    var w_height = $(window).height() - 100;
    var w_width = $(window).width() - 100;
    var c_css = {"width":"auto", "max-height": w_height+"px", 'max-width': w_width+"px"};
    $('#media-preview').find(".modal-dialog").css(c_css);


    $('#media-preview').modal('show');
  });

  $(".thumbnail").hover(function() {
    $(this).addClass("thumbnail-zoomed");
  }, function() {
    $(this).removeClass("thumbnail-zoomed");
  }).parent().css("overflow", "hidden");

  $('#scroll-to-top').hide();
  $("#scroll-to-top span").click(function () {
    $("html, body").animate({ scrollTop: 0 }, {duration:800, easing: "easeOutExpo", complete: function() {$("#scroll-to-top").fadeOut();}});
  });

  if ($.fn.flexslider) {
    $('.flexslider').flexslider({
      animation: "slide",
      animationLoop: true,
      controlNav: false
    });
  }

  $(".tips").each(function () {
    var placem = 'bottom';
    if (typeof ($(this).attr("data-placement")) != "undefined") {
      placem = $(this).attr("data-placement");
    }
    $(this).tooltip({placement:placem});
  });

  //getTweets();

  $(".ezoom").elevateZoom({zoomWindowWidth:350,zoomWindowHeight:260,tint:true, tintColour:'#F90', tintOpacity:0.5,easing : false,scrollZoom : true});

  $(".blink").each(function() {
    var elem = $(this);
    setInterval(function() {
      if (elem.css('visibility') == 'hidden') {
        elem.css('visibility', 'visible');
      } else {
        elem.css('visibility', 'hidden');
      }
    }, 500);
  });
});


$(window).scroll(function(event) {
  if ($(window).scrollTop() > 170) {
    $('#scroll-to-top').stop(true,true).show();
  } else {
    $('#scroll-to-top').stop(true,true).hide();
  }
});
