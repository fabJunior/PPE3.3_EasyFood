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

		<!-- FORM -->
		
		<div class="row">
      		<div class="col s12"></div>
      		
      		
     		
    <div class="col s4">
    <h4>Mes boutons Miam</h4>
    
    
     		
     		
  <ul class="collapsible popout" data-collapsible="accordion">
  	
  	<c:forEach var="i" begin="1" end="5">
  
    <li>
      <div class="collapsible-header"><i class="material-icons">whatshot</i>Bouton Miam <c:out value="${i}"/></div>
      <div class="collapsible-body">
      		<p>Commande associée : <c:out value="${i}"/> <br>
      		Dernière commande : 29/11/16 <br>
      		Produits associés : Ramen x 2
      		
      		<a class="waves-effect waves-light btn center "><i id="btn" class="material-icons right">settings</i>Configuration</a>
      		
      		</p>
      		
      </div>
    </li>
    
    	</c:forEach>
    	
  </ul>
  </div>
     		
      		<div id="configForm" class="col s8" ">
      		    <h4>Configuration du bouton Miam</h4>
      		
      	
		    <form class="col s8">
		    
		      <div class="row">
		      
		        <div class="input-field col s6">
		          <i class="material-icons prefix">mode_edit</i>
		          <textarea id="icon_prefix2" class="materialize-textarea"></textarea>
		          <label for="icon_prefix2">Nom du bouton</label> 
		        </div>
		       
		         <div class="input-field col s6">
				    <select multiple>
				      <option value="" disabled selected></option>
				      <option value="1">Option 1</option>
				      <option value="2">Option 2</option>
				      <option value="3">Option 3</option>
				    </select>
				    <label>Produits associés</label>
				  </div>
		         
				    
				
		        
		      </div>
		      
		    </form>
		  
		  </div>
      		
      		</div>
   		 </div>

		

		<div class="row" style="padding-left: 10%; padding-right: 10%">
			<p id="log"></p><!-- Peut être utilisé pour debug -->
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