<%@ page pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>

	<meta charset="utf-8" />

	<title>Inscription</title>

	<script type="text/javascript" src="<c:url value="/inc/js/jquery-3.1.1.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/inc/js/jquery.validate.js"/>"></script>
	<script src="<c:url value="/inc/js/materialize.js"/>"></script>
	<script src="<c:url value="/inc/js/sweetalert.min.js"/>"></script>

	<link type="text/css" rel="stylesheet" href="<c:url value="/inc/css/materialize.css"/>" />
	<link type="text/css" rel="stylesheet" href="<c:url value="/inc/css/style.css"/>" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="<c:url value="/inc/css/sweetalert.css"/>" />


</head>

<body>

	<header>
		<nav>
			<div class="nav-wrapper teal lighten-2">
				<a href="#" class="brand-logo"></a>
				<ul id="nav-mobile" class="right hide-on-med-and-down">
					<li class="active"><a href="#">Inscription</a></li>
					<li><a href="connexion.jsp">Connexion</a></li>
				</ul>
			</div>
		</nav>
	</header>

	<main>
		<div class="row">
			<div class="col s12 m12 l12 accueil-img">
			</div>
			<div class="col s12 m12 l12 accueil-search">
				<span class="accueil-search-span">
					<span style="color:white; font-size:20px;padding-left: 225px;">Recherchez tous les meilleures plats de Bordeaux !</span>
				</span>
				  <nav class="accueil-nav">
				    <div class="nav-wrapper">
				      <form>
				        <div class="input-field">
				          <input id="search" type="search" required>
				          <label for="search"><i class="material-icons">search</i></label>
				          <i class="material-icons">close</i>
				        </div>
				      </form>
				    </div>
				  </nav>
			</div>
			<div class="col s12 m12 l12" style="text-align: center;">
			<p style="font-size:50px; font-weight: bold;margin-top: 180px;margin-bottom: 150px;">Ils y ont mis leur grain de sel...</p>
			</div>
			<div class="col s12 m3 offset-l2 l2" style="text-align: center;">
			<img class="img-pres" src="http://www.online-image-editor.com//styles/2014/images/example_image.png">
			<p> ectare cirratas, quibus, si nupsissent, per aetatem ter iam nixus poterat suppetere liberorum, ad usque taedium pedibus pavimenta tergentes iactari volucriter gyris, dum exprimunt innumera simulacra, quae finxere fabulae theatrales.</p>
			</div>
			<div class="col s12 m3 offset-l1 l2" style="text-align: center;">
			<img class="img-pres" src="http://www.online-image-editor.com//styles/2014/images/example_image.png">
			<p> ectare cirratas, quibus, si nupsissent, per aetatem ter iam nixus poterat suppetere liberorum, ad usque taedium pedibus pavimenta tergentes iactari volucriter gyris, dum exprimunt innumera simulacra, quae finxere fabulae theatrales.</p>
			</div>
			<div class="col s12 m3 offset-l1 l2" style="text-align: center;">
			<img class="img-pres" src="http://www.online-image-editor.com//styles/2014/images/example_image.png">
			<p> ectare cirratas, quibus, si nupsissent, per aetatem ter iam nixus poterat suppetere liberorum, ad usque taedium pedibus pavimenta tergentes iactari volucriter gyris, dum exprimunt innumera simulacra, quae finxere fabulae theatrales.</p>
			</div>
		</div>
	</main>

	<footer class="page-footer teal lighten-2">
		<div class="container">
			<div class="row">
				<div class="col l6 s12">
					<h5 class="white-text">Footer Content</h5>
					<p class="grey-text text-lighten-4">You can use rows and columns here to organize your footer content.</p>
				</div>
				<div class="col l4 offset-l2 s12">
					<h5 class="white-text">Links</h5>
					<ul>
						<li><a class="grey-text text-lighten-3" href="#!">Link 1</a></li>
						<li><a class="grey-text text-lighten-3" href="#!">Link 2</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="footer-copyright">
			<div class="container">
				© 2016 Copyright
				<a class="grey-text text-lighten-4 right" href="#!">More Links</a>
			</div>
		</div>
	</footer>


-->

</body>
	<script type="text/javascript">
	$(document).ready(function() {
	    $('select').material_select();
	  });
	
	$(function(){
		   $('#btn').click(function(){
		      $('#configForm').toggle() // AFFICHE ET CACHE A CHAQUE CLIQUE SUR LE BOUTTON
		   });
		});
	
	</script>
	
	
	



</html>