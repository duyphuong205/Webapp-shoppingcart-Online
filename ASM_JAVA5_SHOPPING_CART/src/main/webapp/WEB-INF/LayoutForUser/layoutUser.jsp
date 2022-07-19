<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Fashion Shop</title>
<!--meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="Toys Shop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
         Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>

<!--//meta tags ends here-->
<!--booststrap-->
<link href="/AssetsForUser/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" media="all">
<!--//booststrap end-->
<!-- font-awesome icons -->
<link href="/AssetsForUser/css/fontawesome-all.min.css" rel="stylesheet"
	type="text/css" media="all">
<!-- //font-awesome icons -->
<!-- For Clients slider -->
<link rel="stylesheet" href="/AssetsForUser/css/flexslider.css"
	type="text/css" media="all" />
<!--flexs slider-->
<link href="/AssetsForUser/css/JiSlider.css" rel="stylesheet">
<!--Shoping cart-->
<link rel="stylesheet" href="/AssetsForUser/css/shop.css"
	type="text/css" />
<!--price range-->
<link rel="stylesheet" type="text/css"
	href="/AssetsForUser/css/jquery-ui1.css">
<!--//Shoping cart-->
<!--stylesheets-->
<link href="/AssetsForUser/css/style.css" rel='stylesheet'
	type='text/css' media="all">
<!--//stylesheets-->
<link
	href="/AssetsForUser//fonts.googleapis.com/css?family=Sunflower:500,700"
	rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700"
	rel="stylesheet">
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
	<!--js working-->
	<script src='/AssetsForUser/js/jquery-2.2.3.min.js'></script>
	<!--//js working-->
	<!-- cart-js -->
	<script src="/AssetsForUser/js/minicart.js"></script>
	<script>
		toys.render();

		toys.cart.on('toys_checkout', function(evt) {
			var items, len, i;

			if (this.subtotal() > 0) {
				items = this.items();

				for (i = 0, len = items.length; i < len; i++) {
				}
			}
		});
	</script>
	<!-- //cart-js -->
	<!--responsiveslides banner-->
	<script src="/AssetsForUser/js/responsiveslides.min.js"></script>
	<script>
		// You can also use "$(window).load(function() {"
		$(function() {
			// Slideshow 4
			$("#slider4").responsiveSlides({
				auto : true,
				pager : false,
				nav : true,
				speed : 900,
				namespace : "callbacks",
				before : function() {
					$('.events').append("<li>before event fired.</li>");
				},
				after : function() {
					$('.events').append("<li>after event fired.</li>");
				}
			});

		});
	</script>
	<!--// responsiveslides banner-->
	<!--slider flexisel -->
	<script src="/AssetsForUser/js/jquery.flexisel.js"></script>
	<script>
		$(window).load(function() {
			$("#flexiselDemo1").flexisel({
				visibleItems : 3,
				animationSpeed : 3000,
				autoPlay : true,
				autoPlaySpeed : 2000,
				pauseOnHover : true,
				enableResponsiveBreakpoints : true,
				responsiveBreakpoints : {
					portrait : {
						changePoint : 480,
						visibleItems : 1
					},
					landscape : {
						changePoint : 640,
						visibleItems : 2
					},
					tablet : {
						changePoint : 768,
						visibleItems : 2
					}
				}
			});

		});
	</script>
	<!-- //slider flexisel -->
	<!-- start-smoth-scrolling -->
	<script src="/AssetsForUser/js/move-top.js"></script>
	<script src="/AssetsForUser/js/easing.js"></script>
	<script>
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 900);
			});
		});
	</script>
	<!-- start-smoth-scrolling -->
	<!-- here stars scrolling icon -->
	<script>
		$(document).ready(function() {

			var defaults = {
				containerID : 'toTop', // fading element id
				containerHoverID : 'toTopHover', // fading element hover id
				scrollSpeed : 1200,
				easingType : 'linear'
			};
			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!-- price range (top products) -->
	<script src="/AssetsForUser/js/jquery-ui.js"></script>
	<script>
		$(window).load(function() {
			$("#slider-range").slider({
				range : true,
				min : 0,
				max : 1000,
				values : [ 0, 300 ],
				slide : function(event, ui) {
					$("#minamount").val(ui.values[0]);
					$("#maxamount").val(ui.values[1]);
				}
			});
		});
	</script>
	<!-- //price range (top products) -->
	<!--bootstrap working-->
	<script src="/AssetsForUser/js/bootstrap.min.js"></script>
</body>
</html>