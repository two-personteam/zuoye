<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="cc" uri="/jeelite-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图标</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<cc:base type="font-awesome,jquery,bootstrap"></cc:base>
<style type="text/css">
.fontawesome-icon-list > li{
	width:32px;
	text-overflow:ellipsis; 
	white-space: nowrap;
	overflow:hidden;
	float:left;
	list-style-type: none;
	height: 32px;
	line-height:16px;
	**font-size: 16px;
	padding:8px;
	border: 1px solid #ccc;
	cursor: pointer;
}

.fontawesome-icon-list li:hover {
	background-color: #1d9d74;
	color: #fff;
	text-decoration: none
}

.fontawesome-icon-list li:hover .fa {
	font-size:22px;margin-top:-4px;margin-left:-4px;

}
.fontawesome-icon-list li:hover span {
	margin-top:-14px;
}

</style>
  </head>
  
  <body>
    
<script type="text/javascript">
$(function(){

	var data = [{"name":"网页","icons":["fa-address-book","fa-address-book-o","fa-address-card","fa-address-card-o","fa-adjust","fa-american-sign-language-interpreting","fa-anchor","fa-archive","fa-area-chart","fa-arrows","fa-arrows-h","fa-arrows-v","fa-asl-interpreting","fa-assistive-listening-systems","fa-asterisk","fa-at","fa-audio-description","fa-automobile","fa-balance-scale","fa-ban","fa-bank","fa-bar-chart","fa-bar-chart-o","fa-barcode","fa-bars","fa-bath","fa-bathtub","fa-battery","fa-battery-0","fa-battery-1","fa-battery-2","fa-battery-3","fa-battery-4","fa-battery-empty","fa-battery-full","fa-battery-half","fa-battery-quarter","fa-battery-three-quarters","fa-bed","fa-beer","fa-bell","fa-bell-o","fa-bell-slash","fa-bell-slash-o","fa-bicycle","fa-binoculars","fa-birthday-cake","fa-blind","fa-bluetooth","fa-bluetooth-b","fa-bolt","fa-bomb","fa-book","fa-bookmark","fa-bookmark-o","fa-braille","fa-briefcase","fa-bug","fa-building","fa-building-o","fa-bullhorn","fa-bullseye","fa-bus","fa-cab","fa-calculator","fa-calendar","fa-calendar-check-o","fa-calendar-minus-o","fa-calendar-o","fa-calendar-plus-o","fa-calendar-times-o","fa-camera","fa-camera-retro","fa-car","fa-caret-square-o-down","fa-caret-square-o-left","fa-caret-square-o-right","fa-caret-square-o-up","fa-cart-arrow-down","fa-cart-plus","fa-cc","fa-certificate","fa-check","fa-check-circle","fa-check-circle-o","fa-check-square","fa-check-square-o","fa-child","fa-circle","fa-circle-o","fa-circle-o-notch","fa-circle-thin","fa-clock-o","fa-clone","fa-close","fa-cloud","fa-cloud-download","fa-cloud-upload","fa-code","fa-code-fork","fa-coffee","fa-cog","fa-cogs","fa-comment","fa-comment-o","fa-commenting","fa-commenting-o","fa-comments","fa-comments-o","fa-compass","fa-copyright","fa-creative-commons","fa-credit-card","fa-credit-card-alt","fa-crop","fa-crosshairs","fa-cube","fa-cubes","fa-cutlery","fa-dashboard","fa-database","fa-deaf","fa-deafness","fa-desktop","fa-diamond","fa-dot-circle-o","fa-download","fa-drivers-license","fa-drivers-license-o","fa-edit","fa-ellipsis-h","fa-ellipsis-v","fa-envelope","fa-envelope-o","fa-envelope-open","fa-envelope-open-o","fa-envelope-square","fa-eraser","fa-exchange","fa-exclamation","fa-exclamation-circle","fa-exclamation-triangle","fa-external-link","fa-external-link-square","fa-eye","fa-eye-slash","fa-eyedropper","fa-fax","fa-feed","fa-female","fa-fighter-jet","fa-file-archive-o","fa-file-audio-o","fa-file-code-o","fa-file-excel-o","fa-file-image-o","fa-file-movie-o","fa-file-pdf-o","fa-file-photo-o","fa-file-picture-o","fa-file-powerpoint-o","fa-file-sound-o","fa-file-video-o","fa-file-word-o","fa-file-zip-o","fa-film","fa-filter","fa-fire","fa-fire-extinguisher","fa-flag","fa-flag-checkered","fa-flag-o","fa-flash","fa-flask","fa-folder","fa-folder-o","fa-folder-open","fa-folder-open-o","fa-frown-o","fa-futbol-o","fa-gamepad","fa-gavel","fa-gear","fa-gears","fa-gift","fa-glass","fa-globe","fa-graduation-cap","fa-group","fa-hand-grab-o","fa-hand-lizard-o","fa-hand-paper-o","fa-hand-peace-o","fa-hand-pointer-o","fa-hand-rock-o","fa-hand-scissors-o","fa-hand-spock-o","fa-hand-stop-o","fa-handshake-o","fa-hard-of-hearing","fa-hashtag","fa-hdd-o","fa-headphones","fa-heart","fa-heart-o","fa-heartbeat","fa-history","fa-home","fa-hotel","fa-hourglass","fa-hourglass-1","fa-hourglass-2","fa-hourglass-3","fa-hourglass-end","fa-hourglass-half","fa-hourglass-o","fa-hourglass-start","fa-i-cursor","fa-id-badge","fa-id-card","fa-id-card-o","fa-image","fa-inbox","fa-industry","fa-info","fa-info-circle","fa-institution","fa-key","fa-keyboard-o","fa-language","fa-laptop","fa-leaf","fa-legal","fa-lemon-o","fa-level-down","fa-level-up","fa-life-bouy","fa-life-buoy","fa-life-ring","fa-life-saver","fa-lightbulb-o","fa-line-chart","fa-location-arrow","fa-lock","fa-low-vision","fa-magic","fa-magnet","fa-mail-forward","fa-mail-reply","fa-mail-reply-all","fa-male","fa-map","fa-map-marker","fa-map-o","fa-map-pin","fa-map-signs","fa-meh-o","fa-microchip","fa-microphone","fa-microphone-slash","fa-minus","fa-minus-circle","fa-minus-square","fa-minus-square-o","fa-mobile","fa-mobile-phone","fa-money","fa-moon-o","fa-mortar-board","fa-motorcycle","fa-mouse-pointer","fa-music","fa-navicon","fa-newspaper-o","fa-object-group","fa-object-ungroup","fa-paint-brush","fa-paper-plane","fa-paper-plane-o","fa-paw","fa-pencil","fa-pencil-square","fa-pencil-square-o","fa-percent","fa-phone","fa-phone-square","fa-photo","fa-picture-o","fa-pie-chart","fa-plane","fa-plug","fa-plus","fa-plus-circle","fa-plus-square","fa-plus-square-o","fa-podcast","fa-power-off","fa-print","fa-puzzle-piece","fa-qrcode","fa-question","fa-question-circle","fa-question-circle-o","fa-quote-left","fa-quote-right","fa-random","fa-recycle","fa-refresh","fa-registered","fa-remove","fa-reorder","fa-reply","fa-reply-all","fa-retweet","fa-road","fa-rocket","fa-rss","fa-rss-square","fa-s15","fa-search","fa-search-minus","fa-search-plus","fa-send","fa-send-o","fa-server","fa-share","fa-share-alt","fa-share-alt-square","fa-share-square","fa-share-square-o","fa-shield","fa-ship","fa-shopping-bag","fa-shopping-basket","fa-shopping-cart","fa-shower","fa-sign-in","fa-sign-language","fa-sign-out","fa-signal","fa-signing","fa-sitemap","fa-sliders","fa-smile-o","fa-snowflake-o","fa-soccer-ball-o","fa-sort","fa-sort-alpha-asc","fa-sort-alpha-desc","fa-sort-amount-asc","fa-sort-amount-desc","fa-sort-asc","fa-sort-desc","fa-sort-down","fa-sort-numeric-asc","fa-sort-numeric-desc","fa-sort-up","fa-space-shuttle","fa-spinner","fa-spoon","fa-square","fa-square-o","fa-star","fa-star-half","fa-star-half-empty","fa-star-half-full","fa-star-half-o","fa-star-o","fa-sticky-note","fa-sticky-note-o","fa-street-view","fa-suitcase","fa-sun-o","fa-support","fa-tablet","fa-tachometer","fa-tag","fa-tags","fa-tasks","fa-taxi","fa-television","fa-terminal","fa-thermometer","fa-thermometer-0","fa-thermometer-1","fa-thermometer-2","fa-thermometer-3","fa-thermometer-4","fa-thermometer-empty","fa-thermometer-full","fa-thermometer-half","fa-thermometer-quarter","fa-thermometer-three-quarters","fa-thumb-tack","fa-thumbs-down","fa-thumbs-o-down","fa-thumbs-o-up","fa-thumbs-up","fa-ticket","fa-times","fa-times-circle","fa-times-circle-o","fa-times-rectangle","fa-times-rectangle-o","fa-tint","fa-toggle-down","fa-toggle-left","fa-toggle-off","fa-toggle-on","fa-toggle-right","fa-toggle-up","fa-trademark","fa-trash","fa-trash-o","fa-tree","fa-trophy","fa-truck","fa-tty","fa-tv","fa-umbrella","fa-universal-access","fa-university","fa-unlock","fa-unlock-alt","fa-unsorted","fa-upload","fa-user","fa-user-circle","fa-user-circle-o","fa-user-o","fa-user-plus","fa-user-secret","fa-user-times","fa-users","fa-vcard","fa-vcard-o","fa-video-camera","fa-volume-control-phone","fa-volume-down","fa-volume-off","fa-volume-up","fa-warning","fa-wheelchair","fa-wheelchair-alt","fa-wifi","fa-window-close","fa-window-close-o","fa-window-maximize","fa-window-minimize","fa-window-restore","fa-wrench","fa-clipboard"]},{"name":"辅助功能","icons":["fa-american-sign-language-interpreting","fa-asl-interpreting","fa-assistive-listening-systems","fa-audio-description","fa-blind","fa-braille","fa-cc","fa-deaf","fa-deafness","fa-hard-of-hearing","fa-low-vision","fa-question-circle-o","fa-sign-language","fa-signing","fa-tty","fa-universal-access","fa-volume-control-phone","fa-wheelchair","fa-wheelchair-alt","fa-clipboard"]},{"name":"手势","icons":["fa-hand-grab-o","fa-hand-lizard-o","fa-hand-o-down","fa-hand-o-left","fa-hand-o-right","fa-hand-o-up","fa-hand-paper-o","fa-hand-peace-o","fa-hand-pointer-o","fa-hand-rock-o","fa-hand-scissors-o","fa-hand-spock-o","fa-hand-stop-o","fa-thumbs-down","fa-thumbs-o-down","fa-thumbs-o-up","fa-thumbs-up","fa-clipboard"]},{"name":"运输","icons":["fa-ambulance","fa-automobile","fa-bicycle","fa-bus","fa-cab","fa-car","fa-fighter-jet","fa-motorcycle","fa-plane","fa-rocket","fa-ship","fa-space-shuttle","fa-subway","fa-taxi","fa-train","fa-truck","fa-wheelchair","fa-wheelchair-alt","fa-clipboard"]},{"name":"性别","icons":["fa-genderless","fa-intersex","fa-mars","fa-mars-double","fa-mars-stroke","fa-mars-stroke-h","fa-mars-stroke-v","fa-mercury","fa-neuter","fa-transgender","fa-transgender-alt","fa-venus","fa-venus-double","fa-venus-mars","fa-clipboard"]},{"name":"文件类型","icons":["fa-file","fa-file-archive-o","fa-file-audio-o","fa-file-code-o","fa-file-excel-o","fa-file-image-o","fa-file-movie-o","fa-file-o","fa-file-pdf-o","fa-file-photo-o","fa-file-picture-o","fa-file-powerpoint-o","fa-file-sound-o","fa-file-text","fa-file-text-o","fa-file-video-o","fa-file-word-o","fa-file-zip-o","fa-clipboard"]},{"name":"可旋转","icons":["fa-info-circle fa-lg fa-li","fa-circle-o-notch","fa-cog","fa-gear","fa-refresh","fa-spinner","fa-clipboard"]},{"name":"表单","icons":["fa-check-square","fa-check-square-o","fa-circle","fa-circle-o","fa-dot-circle-o","fa-minus-square","fa-minus-square-o","fa-plus-square","fa-plus-square-o","fa-square","fa-square-o","fa-clipboard"]},{"name":"支付","icons":["fa-cc-amex","fa-cc-diners-club","fa-cc-discover","fa-cc-jcb","fa-cc-mastercard","fa-cc-paypal","fa-cc-stripe","fa-cc-visa","fa-credit-card","fa-credit-card-alt","fa-google-wallet","fa-paypal","fa-clipboard"]},{"name":"图表","icons":["fa-area-chart","fa-bar-chart","fa-bar-chart-o","fa-line-chart","fa-pie-chart","fa-clipboard"]},{"name":"货币","icons":["fa-bitcoin","fa-btc","fa-cny","fa-dollar","fa-eur","fa-euro","fa-gbp","fa-gg","fa-gg-circle","fa-ils","fa-inr","fa-jpy","fa-krw","fa-money","fa-rmb","fa-rouble","fa-rub","fa-ruble","fa-rupee","fa-shekel","fa-sheqel","fa-try","fa-turkish-lira","fa-usd","fa-won","fa-yen","fa-clipboard"]},{"name":"文本编辑","icons":["fa-align-center","fa-align-justify","fa-align-left","fa-align-right","fa-bold","fa-chain","fa-chain-broken","fa-columns","fa-copy","fa-cut","fa-dedent","fa-eraser","fa-file","fa-file-o","fa-file-text","fa-file-text-o","fa-files-o","fa-floppy-o","fa-font","fa-header","fa-indent","fa-italic","fa-link","fa-list","fa-list-alt","fa-list-ol","fa-list-ul","fa-outdent","fa-paperclip","fa-paragraph","fa-paste","fa-repeat","fa-rotate-left","fa-rotate-right","fa-save","fa-scissors","fa-strikethrough","fa-subscript","fa-superscript","fa-table","fa-text-height","fa-text-width","fa-th","fa-th-large","fa-th-list","fa-underline","fa-undo","fa-unlink","fa-clipboard"]},{"name":"指示方向","icons":["fa-angle-double-down","fa-angle-double-left","fa-angle-double-right","fa-angle-double-up","fa-angle-down","fa-angle-left","fa-angle-right","fa-angle-up","fa-arrow-circle-down","fa-arrow-circle-left","fa-arrow-circle-o-down","fa-arrow-circle-o-left","fa-arrow-circle-o-right","fa-arrow-circle-o-up","fa-arrow-circle-right","fa-arrow-circle-up","fa-arrow-down","fa-arrow-left","fa-arrow-right","fa-arrow-up","fa-arrows","fa-arrows-alt","fa-arrows-h","fa-arrows-v","fa-caret-down","fa-caret-left","fa-caret-right","fa-caret-square-o-down","fa-caret-square-o-left","fa-caret-square-o-right","fa-caret-square-o-up","fa-caret-up","fa-chevron-circle-down","fa-chevron-circle-left","fa-chevron-circle-right","fa-chevron-circle-up","fa-chevron-down","fa-chevron-left","fa-chevron-right","fa-chevron-up","fa-exchange","fa-hand-o-down","fa-hand-o-left","fa-hand-o-right","fa-hand-o-up","fa-long-arrow-down","fa-long-arrow-left","fa-long-arrow-right","fa-long-arrow-up","fa-toggle-down","fa-toggle-left","fa-toggle-right","fa-toggle-up","fa-clipboard"]},{"name":"视频播放","icons":["fa-arrows-alt","fa-backward","fa-compress","fa-eject","fa-expand","fa-fast-backward","fa-fast-forward","fa-forward","fa-pause","fa-pause-circle","fa-pause-circle-o","fa-play","fa-play-circle","fa-play-circle-o","fa-random","fa-step-backward","fa-step-forward","fa-stop","fa-stop-circle","fa-stop-circle-o","fa-youtube-play","fa-clipboard"]},{"name":"标志","icons":["fa-warning","fa-500px","fa-adn","fa-amazon","fa-android","fa-angellist","fa-apple","fa-bandcamp","fa-behance","fa-behance-square","fa-bitbucket","fa-bitbucket-square","fa-bitcoin","fa-black-tie","fa-bluetooth","fa-bluetooth-b","fa-btc","fa-buysellads","fa-cc-amex","fa-cc-diners-club","fa-cc-discover","fa-cc-jcb","fa-cc-mastercard","fa-cc-paypal","fa-cc-stripe","fa-cc-visa","fa-chrome","fa-codepen","fa-codiepie","fa-connectdevelop","fa-contao","fa-css3","fa-dashcube","fa-delicious","fa-deviantart","fa-digg","fa-dribbble","fa-dropbox","fa-drupal","fa-edge","fa-eercast","fa-empire","fa-envira","fa-etsy","fa-expeditedssl","fa-fa","fa-facebook","fa-facebook-f","fa-facebook-official","fa-facebook-square","fa-firefox","fa-first-order","fa-flickr","fa-font-awesome","fa-fonticons","fa-fort-awesome","fa-forumbee","fa-foursquare","fa-free-code-camp","fa-ge","fa-get-pocket","fa-gg","fa-gg-circle","fa-git","fa-git-square","fa-github","fa-github-alt","fa-github-square","fa-gitlab","fa-gittip","fa-glide","fa-glide-g","fa-google","fa-google-plus","fa-google-plus-circle","fa-google-plus-official","fa-google-plus-square","fa-google-wallet","fa-gratipay","fa-grav","fa-hacker-news","fa-houzz","fa-html5","fa-imdb","fa-instagram","fa-internet-explorer","fa-ioxhost","fa-joomla","fa-jsfiddle","fa-lastfm","fa-lastfm-square","fa-leanpub","fa-linkedin","fa-linkedin-square","fa-linode","fa-linux","fa-maxcdn","fa-meanpath","fa-medium","fa-meetup","fa-mixcloud","fa-modx","fa-odnoklassniki","fa-odnoklassniki-square","fa-opencart","fa-openid","fa-opera","fa-optin-monster","fa-pagelines","fa-paypal","fa-pied-piper","fa-pied-piper-alt","fa-pied-piper-pp","fa-pinterest","fa-pinterest-p","fa-pinterest-square","fa-product-hunt","fa-qq","fa-quora","fa-ra","fa-ravelry","fa-rebel","fa-reddit","fa-reddit-alien","fa-reddit-square","fa-renren","fa-resistance","fa-safari","fa-scribd","fa-sellsy","fa-share-alt","fa-share-alt-square","fa-shirtsinbulk","fa-simplybuilt","fa-skyatlas","fa-skype","fa-slack","fa-slideshare","fa-snapchat","fa-snapchat-ghost","fa-snapchat-square","fa-soundcloud","fa-spotify","fa-stack-exchange","fa-stack-overflow","fa-steam","fa-steam-square","fa-stumbleupon","fa-stumbleupon-circle","fa-superpowers","fa-telegram","fa-tencent-weibo","fa-themeisle","fa-trello","fa-tripadvisor","fa-tumblr","fa-tumblr-square","fa-twitch","fa-twitter","fa-twitter-square","fa-usb","fa-viacoin","fa-viadeo","fa-viadeo-square","fa-vimeo","fa-vimeo-square","fa-vine","fa-vk","fa-wechat","fa-weibo","fa-weixin","fa-whatsapp","fa-wikipedia-w","fa-windows","fa-wordpress","fa-wpbeginner","fa-wpexplorer","fa-wpforms","fa-xing","fa-xing-square","fa-y-combinator","fa-y-combinator-square","fa-yahoo","fa-yc","fa-yc-square","fa-yelp","fa-yoast","fa-youtube","fa-youtube-play","fa-youtube-square","fa-clipboard"]},{"name":"医疗","icons":["fa-ambulance","fa-h-square","fa-heart","fa-heart-o","fa-heartbeat","fa-hospital-o","fa-medkit","fa-plus-square","fa-stethoscope","fa-user-md","fa-wheelchair","fa-wheelchair-alt","fa-clipboard"]}];
	var tmp = $('.icons .icon-group:hidden');
	$.each(data,function(){
		var info = this;
		var box = tmp.clone().show();
		$('.icons').append(box);
		box.find('h2').html(info.name).hide();
		$.each(info.icons,function(){
			var ic = this+'';
			var li = $('<li><i class="fa"></i> <span></span></li>');
			//li.find('span').html(ic.substr(3));
			li.find('i').addClass(ic);
			box.find('ul').append(li);
			li.tooltip({
				title:ic.substr(3),
				placement:'right'
			});
		});
	});
	
	
});

</script>

<div class="icons">
<div class="icon-group" style="display: none;margin-bottom: 10px;clear: both;top:30px;">
	<h2>分组模板</h2><hr>
    <ul class="fontawesome-icon-list"></ul>
   
</div>
</div>

  </body>
</html>