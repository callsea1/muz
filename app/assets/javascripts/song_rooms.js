# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/



$(document).ready(function(){
  
    <% @song_room_song_versions.each do |song| %>
    	$("#jquery_jplayer_<%= song.id%>").jPlayer({
    		ready: function () {
    			$(this).jPlayer("setMedia", {
    				mp3: "<%= song.song_version_upload.url %>"
    			});
    		},
    		play: function() { // To avoid both jPlayers playing together.
    			$(this).jPlayer("pauseOthers");
    		},
    		swfPath: "js",
    		supplied: "mp3",
    		cssSelectorAncestor: "#jp_container_<%= song.id%>"
    	});
    <% end %>
    
    $('ul.tabs li').first().addClass('active');
    /*
$('li .a .jp-audio:hover').mouseover(function() {
      $(this).first('jp-download').css('opacity' , 1);
    }
*/
    	
  	// TEXTAREA FOCUS //
  	$('textarea').focus(function() {
    	$(this).animate({ height:60 });
    });
    $('textarea').focusout(function() {
    	$(this).animate({ height:25 });
    });
    
    // MENU RIGHT //
    function div_toggle(){
      $('.main').toggleClass('main_open', 500);
      $('.info').toggleClass('info_open', 500);
    }
    $('.icon-pq-settings').click(function() {
      div_toggle();
      event.preventDefault();
    });
    $('.icon-pq-people').click(function() {
      div_toggle();
      event.preventDefault();
    });
    
    
    // ACCORDION //
    // Store variables
    var accordion_head = $('.accordion > li > a'),
        accordion_body = $('.accordion li > .sub-menu');

    // Open the first tab on load
    accordion_head.last().addClass('active').next().slideDown('normal');

    // Click function
    accordion_head.on('click', function(event) {
        // Disable header links 
        event.preventDefault();

        // Show and hide the tabs on click
        if ($(this).attr('class') != 'active'){
            accordion_body.slideUp('normal');
            $(this).next().stop(true,true).slideToggle('normal');
            accordion_head.removeClass('active');
            $(this).addClass('active');
        }
    });

  });