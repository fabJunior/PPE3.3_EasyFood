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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_rHgcJYJn99sKmgSNIK6ryEcOQKzlg1E&v=3.exp&libraries=places"></script>

	<link type="text/css" rel="stylesheet" href="<c:url value="/inc/css/materialize.css"/>" />
	<link type="text/css" rel="stylesheet" href="<c:url value="/inc/css/style.css"/>" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="<c:url value="/inc/css/sweetalert.css"/>" />


</head>

<body>

	<c:import url="/inc/vue/header.jsp"></c:import>
	
	<main>

		<!-- FORM -->

		<div class="row" style="padding-left: 10%; padding-right: 10%; padding-top: 20px;">
			<form id="myform" class="col s12" method="post" action="inscription">


				<div class="row">

					<!-- PSEUDO -->

					<div class="input-field col s6">
          				<i class="material-icons prefix">account_circle</i>
						<input id="pseudo" name="pseudo" type="text" value="${utilisateur.pseudoU}" class="${form.erreurs['pseudo'] == null ? '' : 'invalid'}">
						<c:set var ="pseudoErr" value="${form.erreurs['pseudo']}" scope="page" />
						<c:if test="${pseudoErr == null || empty pseudoErr}">
							<c:set var ="pseudoErr" value="Votre pseudo doit contenir au moints 6 caractères" scope="page" />
						</c:if>
						<label class="active" for="pseudo" data-error="${pseudoErr}" style="width: 100%">Pseudo*</label>
					</div>

					<!-- EMAIL -->
				
					<div class="input-field col s6">
          				<i class="material-icons prefix">email</i>
						<input id="email" name="email" type="text" value="${utilisateur.mailU}" class="${form.erreurs['email'] == null ? '' : 'invalid'}">
						<c:set var ="emailErr" value="${form.erreurs['email']}" scope="page" />
						<c:if test="${emailErr == null || empty emailErr}">
							<c:set var ="emailErr" value="Veuillez entrer une addresse mail valide" scope="page" />
						</c:if>
						<label class="active" id="lblEmail" for="email" data-error="${emailErr}" style="width: 100%">Email*</label>
					</div>
				</div>

				<!-- MOT DE PASSE + CONFIRMATION -->

				<div class="row">
					<!-- MOT DE PASSE -->
					<div class="input-field col s6">
          				<i class="material-icons prefix">lock</i>
						<input id="password" name="password" type="password" class="${form.erreurs['password'] == null ? '' : 'invalid'}">
						<c:set var ="passwordErr" value="${form.erreurs['password']}" scope="page" />
						<c:if test="${passwordErr == null || empty passwordErr}">
							<c:set var ="passwordErr" value="Votre mot de passe doit contenir au moins 6 caractères" scope="page" />
						</c:if>
						<label class="active" for="password" data-error="${passwordErr}" style="width: 100%">Mot de passe*</label>
					</div>

					<!-- CONFIRMATION -->
					<div class="input-field col s6">
          				<!-- <i class="material-icons prefix">lock_outline</i> -->
						<input id="password_confirm" name="password_confirm" type="password">
						<c:set var ="password_confirmErr" value="${form.erreurs['password_confirm']}" scope="page" />
						<c:if test="${password_confirmErr == null || empty password_confirmErr}">
							<c:set var ="password_confirmErr" value="Les mots de passe sont differents" scope="page" />
						</c:if>
						<label class="active" for="password_confirm" data-error="${password_confirmErr}" style="width: 100%">Confirmation*</label>
					</div>
				</div>

				<!-- PRENOM + NOM -->

				<div class="row">
					<div class="input-field col s6">
						<i class="material-icons prefix">assignment</i>
						<input id="prenom" name="prenom" type="text" class="${form.erreurs['prenom'] == null ? '' : 'invalid'}">
						<c:set var ="prenomErr" value="${form.erreurs['prenom']}" scope="page" />
						<c:if test="${prenomdErr == null || empty prenomErr}">
							<c:set var ="prenomErr" value="Votre prénom ne peut pas être vide" scope="page" />
						</c:if>
						<label class="active" for="prenom" data-error="${prenomErr}" style="width: 100%">Prénom*</label>
					</div>
					<div class="input-field col s6">
						<!-- <i class="material-icons prefix">assignment</i> -->
						<input id="nom" name="nom" type="text" class="${form.erreurs['nom'] == null ? '' : 'invalid'}">
						<c:set var ="nomErr" value="${form.erreurs['nom']}" scope="page" />
						<c:if test="${nomdErr == null || empty nomErr}">
							<c:set var ="nomErr" value="Votre nom ne peut pas être vide" scope="page" />
						</c:if>
						<label class="active" for="nom" data-error="${nomErr}" style="width: 100%">Nom*</label>
					</div>
				</div>

				<!-- Adresse -->

				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">location_on</i>
						<input id="adresse" name="adresse" type="text" placeholder="" onFocus="geolocate()"  class="${form.erreurs['adresse'] == null ? '' : 'invalid'}">
						<c:set var ="adresseErr" value="${form.erreurs['adresse']}" scope="page" />
						<c:if test="${adresseErr == null || empty adresseErr}">
							<c:set var ="adresseErr" value="Veuillez sélectionner une adresse" scope="page" />
						</c:if>
						<label class="active" for="adresse" data-error="${adresseErr}" style="width: 100%">Adresse*</label>
					</div>
				</div>

				<!-- CLIENT/RESTAURANT -->

				<h4>
					<span class="teal-text text-lighten-2">Je suis un :</span>
				</h4>

				<div class="row">
					<div class="input-field col s6">
						<input name="type" type="radio" id="cli" value="cli" checked/>
						<label for="cli">Client</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<input name="type" type="radio" id="resto" value="resto" />
						<label for="resto">Restaurant</label>
					</div>
				</div>

				<!-- SUBMIT -->

				<div class="row">
					<div class="input-field col s12">
						<button class="btn waves-effect waves-light" type="submit" name="action">Submit
							<i class="material-icons right">send</i>
						</button>
						<span class="new badge" data-badge-caption="* informations obligatoires "></span>
					</div>
				</div>
			</form>
		</div>


		<div class="row" style="padding-left: 10%; padding-right: 10%">
			<p id="log"></p><!-- Peut être utilisé pour debug -->
		</div>
	</main>
	
	<c:import url="/inc/vue/footer.jsp"></c:import>

	<script>
		var autocomplete

		function initialize() {

			var input = document.getElementById('adresse');
			autocomplete = new google.maps.places.Autocomplete(input);

			autocomplete.addListener('place_changed', fillInAddress);
		}

		function geolocate() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(position) {
					var geolocation = {
						lat: position.coords.latitude,
						lng: position.coords.longitude
					};
					var circle = new google.maps.Circle({
						center: geolocation,
						radius: position.coords.accuracy
					});
					autocomplete.setBounds(circle.getBounds());
				});
			}
		}

		function fillInAddress() {
			$("#adresse").removeClass("invalid").addClass("valid");
		}

		google.maps.event.addDomListener(window, 'load', initialize);
	</script>

	<script type="text/javascript">
		$.fn.extend({ 
			disableSelection: function() { 
				this.each(function() { 
					if (typeof this.onselectstart != 'undefined') {
						this.onselectstart = function() { return false; };
					} else if (typeof this.style.MozUserSelect != 'undefined') {
						this.style.MozUserSelect = 'none';
					} else {
						this.onmousedown = function() { return false; };
					}
				}); 
			} 
		});

		$(document).ready(function() {
			$('label').disableSelection();
			
			var form_data= [$("#pseudo"), $("#password"), $("#password_confirm"), $("#email")];

			//Fausse erreur, la syntaxe est bonne
			for (var input of form_data) {
				if(input.val().length > 0 && !(input.hasClass("valid") || input.hasClass("invalid")))
				{
					input.trigger("input");
				}
			}

			if (${!empty form.resultat}) {
				if (${empty form.erreurs}) {
					swal("Super!", "${form.resultat}", "success");
				}else{
					swal("Arf!", "${form.resultat}", "error");
				}
			}

		});

		/*Retire les validation par défaut (peut engendrer un bug où un champ est valid et invalid à la fois)*/
		$.validator.setDefaults({
			onkeyup: function () {
				return false;
			}()
		});

		$.validator.setDefaults({
			onfocusout: function () {
				return false;
			}()
		});

		$.validator.setDefaults({
			onfocusin: function () {
				return false;
			}()

		});

		$("#password").on("input", function (e) {
			if($(this).val().length < 6) {
				$(this).removeClass("valid").addClass("invalid");
			} else {
				$(this).removeClass("invalid").addClass("valid");
			}

			if ($(this).val() != $("#password_confirm").val()) {
				$("#password_confirm").removeClass("valid").addClass("invalid");
			} else {
				$("#password_confirm").removeClass("invalid").addClass("valid");
			}
		});

		$("#password_confirm").on("input", function (e) {
			if ($("#password").val() != $(this).val()) {
				$(this).removeClass("valid").addClass("invalid");
			} else {
				$(this).removeClass("invalid").addClass("valid");
			}
		});

		$("#email").on("input", function (e) {
			$("#lblEmail").attr("data-error", "Veuillez entrer une addresse mail valide");
			var re = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/gi;
			var str = $(this).val();
			if (!str.match(re) || $(this).val().length == 0) {
				$(this).removeClass("valid").addClass("invalid");
			} else {
				$(this).removeClass("invalid").addClass("valid");
			}
		});

		$("#pseudo").on("input", function (e) {
			if ($(this).val().length < 6) {
				$(this).removeClass("valid").addClass("invalid");
			} else {
				$(this).removeClass("invalid").addClass("valid");
			}
		});

		$("#prenom").on("input", function (e) {
			if ($(this).val() == "") {
				$(this).removeClass("valid").addClass("invalid");
			} else {
				$(this).removeClass("invalid").addClass("valid");
			}
		});

		$("#nom").on("input", function (e) {
			if ($(this).val() == "") {
				$(this).removeClass("valid").addClass("invalid");
			} else {
				$(this).removeClass("invalid").addClass("valid");
			}
		});

		$("#adresse").on("input", function (e) {
			$(this).removeClass("valid").addClass("invalid");
		});

		$("#myform").validate({
			submitHandler: function(form) {
				var form_data= [$("#pseudo"), $("#password"), $("#password_confirm"), $("#email"), $("#nom"), $("#prenom"), $("#adresse")];
				var error_free=true;

				//Fausse erreur, la syntaxe est bonne
				for (var input of form_data){
					var valid = input.hasClass("valid");

					if (!valid){
						input.removeClass("valid").addClass("invalid");
						error_free=false;
					}
				}

				if (error_free){

					// Get the place details from the autocomplete object.
					var place = autocomplete.getPlace();
					var componentForm = {
						street_number: 'short_name', 	//num rue
						route: 'long_name',				// nom rue
						locality: 'long_name',			// ville
						postal_code: 'short_name'		//cp
					};
					var componentFormName = {
						street_number: 'numAdr', 	//num rue
						route: 'nomAdr',			// nom rue
						locality: 'villeAdr',		// ville
						postal_code: 'cpAdr'		//cp
					};

					var arr = new Array();

					// Get each component of the address from the place details
					// and fill the corresponding field on the form.
					for (var i = 0; i < place.address_components.length; i++) {
						var addressType = place.address_components[i].types[0];
						if (componentForm[addressType]) {
							var val = place.address_components[i][componentForm[addressType]];
							eval("var " + componentFormName[addressType] + " = val");
						}
					}

					$("<input>", { type: "hidden", name: "numAdr", value: numAdr }).appendTo("#myform");
					$("<input>", { type: "hidden", name: "nomAdr", value: nomAdr }).appendTo("#myform");
					$("<input>", { type: "hidden", name: "villeAdr", value: villeAdr }).appendTo("#myform");
					$("<input>", { type: "hidden", name: "cpAdr", value: cpAdr }).appendTo("#myform");
					
					form.submit();
				}
			}
		});


	</script>
	<!--
	<fieldset>

		<legend>Inscription</legend>

		<p>Vous pouvez vous inscrire via ce formulaire.</p>


		<label for="email">Adresse email <span class="requis">*</span></label>

		<input type="email" id="email" name="email" value="<c:out value="${utilisateur.mailU}"/>" size="20" maxlength="60" />

		<span class="erreur">${form.erreurs['email']}</span>

		<br />


		<label for="password">Mot de passe <span class="requis">*</span></label>

		<input type="password" id="password" name="password" value="" size="20" maxlength="20" />

		<span class="erreur">${form.erreurs['password']}</span>

		<br />


		<label for="confirmation">Confirmation du mot de passe <span class="requis">*</span></label>

		<input type="password" id="confirmation" name="confirmation" value="" size="20" maxlength="20" />

		<span class="erreur">${form.erreurs['confirmation']}</span>

		<br />


		<label for="pseudo">pseudo d'utilisateur</label>

		<input type="text" id="pseudo" name="pseudo" value="<c:out value="${utilisateur.nomU}"/>" size="20" maxlength="20" />

		<span class="erreur">${form.erreurs['pseudo']}</span>

		<br />


		<input type="submit" value="Inscription" class="sansLabel" />

		<br />



		<p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>

	</fieldset>
-->

</body>

</html>