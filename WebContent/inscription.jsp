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


	<div class="row" style="padding-left: 10%; padding-right: 10%">
		<form id="myform" class="col s12" method="post" action="inscription">
			<div class="row">
				<div class="input-field col s12">
					<input id="pseudo" name="pseudo" type="text" class="validate">
					<label for="pseudo">Pseudo*</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s6">
					<input id="password" name="password" type="password">
					<label for="password" data-error="Votre mot de passe doit conteir au moins 6 caractères" style="width: 100%">Mot de passe*</label>
				</div>
				<div class="input-field col s6">
					<input id="password_confirm" name="password_confirm" type="password">
					<label for="password_confirm" data-error="Les mots de passe sont differents" style="width: 100%">Comfirmation*</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<input id="email" name="email" type="text">
					<label for="email" data-error="Veuillez entrer une addresse mail valide" style="width: 100%">Email*</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<button class="btn waves-effect waves-light" type="submit" name="action">Submit
						<i class="material-icons right">send</i>
					</button>
				</div>
			</div>
		</form>
		<div class="row">
			<div class="cold s12">
				<p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>
			</div>
		</div>
	</div>


	<script type="text/javascript">
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
			var re = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/gi;
			var str = $(this).val();
			if (!str.match(re) || $(this).val().length == 0) {
				$(this).removeClass("valid").addClass("invalid");
			} else {
				$(this).removeClass("invalid").addClass("valid");
			}
		});

		$("#pseudo").on("input", function (e) {
			if ($(this).val().length == 0) {
				$(this).removeClass("valid").addClass("invalid");
			} else {
				$(this).removeClass("invalid").addClass("valid");
			}
		});

		$("#myform").validate({
			submitHandler: function(form) {
				var form_data= [$("#pseudo"), $("#password"), $("#password_confirm"), $("#email")];
				var error_free=true;
				
				for (var input in form_data){
					var valid = form_data[input].hasClass("valid");
					
					if (!valid){
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