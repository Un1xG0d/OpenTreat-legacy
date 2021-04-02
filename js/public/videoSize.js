'use strict';

$(function() {
  var app = (function() {
    var $videoContainer = $('.video-container');
    var $video = $('.video');
    var ratioWidth = 4;
    var ratioHeight = 3;
    
    var ratioCheck = function() {
      var ratio = $(window).height() / $(window).width();
      
      if (ratio > 0.562) {
        handleHeightCentricDisplay();
      } else if (ratio < 0.562) {
        handleWidthCentricDisplay(); 
      }
    };

    var handleHeightCentricDisplay = function() {
      var windowHeight = $(window).height();
      var newVideoWidth = ratioWidth * windowHeight / ratioHeight;

      $video.css({
        height: windowHeight,
        width: newVideoWidth,
        left: (newVideoWidth - $(window).width()) / 2 * -1
      });

      $videoContainer.css('height', windowHeight);
    };
    
    var handleWidthCentricDisplay = function() {
      var windowWidth = $(window).width();
      var windowHeight = $(window).height();
      var newVideoHeight = ratioHeight * windowWidth / ratioWidth;

      $video.css({
        height: newVideoHeight,
        width: windowWidth,
        left: 0,
        top: (newVideoHeight - windowHeight) / 2 * -1
      });

      $videoContainer.css('height', windowHeight);
    };

    var listenForVideoResize = function() {
      $(window).on('resize', function() {
        ratioCheck();
      });
    };

    var init = function() {
      ratioCheck();
      listenForVideoResize();
    };

    return {
      init: init
    };
  })();

  app.init();
});