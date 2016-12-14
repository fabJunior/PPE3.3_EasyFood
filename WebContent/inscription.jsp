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

	<link type="text/css" rel="stylesheet" href="<c:url value="/inc/css/materialize.css"/>" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


</head>

<body>


	<nav>
		<div class="nav-wrapper teal lighten-2">
			<a href="#" class="brand-logo"></a>
			<ul id="nav-mobile" class="right hide-on-med-and-down">
				<li class="active"><a href="#">Inscription</a></li>
				<li><a href="connexion.jsp">Connexion</a></li>
			</ul>
		</div>
	</nav>


	<!-- FORM -->

	<div class="row" style="padding-left: 10%; padding-right: 10%; padding-top: 20px;">
		<form id="myform" class="col s12" method="post" action="inscription">

			<!-- PSEUDO -->

			<div class="row">
				<div class="input-field col s12">
					<input id="pseudo" name="pseudo" type="text" value="${utilisateur.pseudoU}" class="${form.erreurs['pseudo'] == null ? '' : 'invalid'}">
					<c:set var ="pseudoErr" value="${form.erreurs['pseudo']}" scope="page" />
					<c:if test="${pseudoErr == null || empty pseudoErr}">
						<c:set var ="pseudoErr" value="Votre pseudo doit contenir au moints 6 caractères" scope="page" />
					</c:if>
					<label class="active" for="pseudo" data-error="${pseudoErr}" style="width: 100%">Pseudo*</label>
				</div>
			</div>

			<!-- MOT DE PASSE + CONFIRMATION -->

			<div class="row">
				<!-- MOT DE PASSE -->
				<div class="input-field col s6">
					<input id="password" name="password" type="password" class="${form.erreurs['password'] == null ? '' : 'invalid'}">
					<c:set var ="passwordErr" value="${form.erreurs['password']}" scope="page" />
					<c:if test="${passwordErr == null || empty passwordErr}">
						<c:set var ="passwordErr" value="Votre mot de passe doit contenir au moins 6 caractères" scope="page" />
					</c:if>
					<label class="active" for="password" data-error="${passwordErr}" style="width: 100%">Mot de passe*</label>
				</div>

				<!-- CONFIRMATION -->

				<div class="input-field col s6">
					<input id="password_confirm" name="password_confirm" type="password">
					<c:set var ="password_confirmErr" value="${form.erreurs['password_confirm']}" scope="page" />
					<c:if test="${password_confirmErr == null || empty password_confirmErr}">
						<c:set var ="password_confirmErr" value="Les mots de passe sont differents" scope="page" />
					</c:if>
					<label class="active" for="password_confirm" data-error="${password_confirmErr}" style="width: 100%">Confirmation*</label>
				</div>
			</div>

			<!-- EMAIL -->

			<div class="row">
				<div class="input-field col s12">
					<input id="email" name="email" type="text" value="${utilisateur.mailU}" class="${form.erreurs['email'] == null ? '' : 'invalid'}">
					<c:set var ="emailErr" value="${form.erreurs['email']}" scope="page" />
					<c:if test="${emailErr == null || empty emailErr}">
						<c:set var ="emailErr" value="Veuillez entrer une addresse mail valide" scope="page" />
					</c:if>
					<label class="active" id="lblEmail" for="email" data-error="${emailErr}" style="width: 100%">Email*</label>
				</div>
			</div>

			<!-- SUBMIT -->

			<div class="row">
				<div class="input-field col s12">
					<button class="btn waves-effect waves-light" type="submit" name="action">Submit
						<i class="material-icons right">send</i>
					</button>
				</div>
			</div>
		</form>
		<div class="row">
			<div class="col s12">
				<p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>
			</div>
		</div>
	</div>


	<div class="row" style="padding-left: 10%; padding-right: 10%">
		<p id="log"></p><!-- Peut être utilisé pour debug -->
	</div>



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

		$("#myform").validate({
			submitHandler: function(form) {
				var form_data= [$("#pseudo"), $("#password"), $("#password_confirm"), $("#email")];
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