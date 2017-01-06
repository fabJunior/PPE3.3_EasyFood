<%@ page pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>

	<meta charset="utf-8" />

	<title>Connexion</title>

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

	<c:import url="/inc/vue/header.jsp"></c:import>
	
	<main>

		<!-- FORM -->

		<div class="row" style="padding-left: 30%; padding-right: 30%; padding-top: 20px;">
			<form id="myform" class="col s12" method="post" action="connexion">

				<!-- LOGIN -->

				<div class="row">
					<div class="input-field col s12">
						<input id="login" name="login" type="text" class="${form.erreurs['pseudo'] == null ? '' : 'invalid'}">
						<c:set var ="pseudoErr" value="${form.erreurs['pseudo']}" scope="page" />
						<c:if test="${pseudoErr == null || empty pseudoErr}">
							<c:set var ="pseudoErr" value="Votre pseudo doit contenir au moints 6 caractères" scope="page" />
						</c:if>
						<label class="active" for="login" data-error="${pseudoErr}" style="width: 100%">Login*</label>
					</div>
				</div>

				<div class="row">
					<!-- MOT DE PASSE -->
					<div class="input-field col s12">
						<input id="password" name="password" type="password" class="${form.erreurs['password'] == null ? '' : 'invalid'}">
						<c:set var ="passwordErr" value="${form.erreurs['password']}" scope="page" />
						<c:if test="${passwordErr == null || empty passwordErr}">
							<c:set var ="passwordErr" value="Votre mot de passe doit contenir au moins 6 caractères" scope="page" />
						</c:if>
						<label class="active" for="password" data-error="${passwordErr}" style="width: 100%">Mot de passe*</label>
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
		</div>


		<div class="row" style="padding-left: 10%; padding-right: 10%">
			<p id="log"></p><!-- Peut être utilisé pour debug -->
		</div>
	</main>
	
	<c:import url="/inc/vue/footer.jsp"></c:import>


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
			
			var form_data= [$("#login"), $("#password")];

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

		$("#login").on("input", function (e) {
			if ($(this).val().length < 6) {
				$(this).removeClass("valid").addClass("invalid");
			} else {
				$(this).removeClass("invalid").addClass("valid");
			}
		});

		$("#password").on("input", function (e) {
			if($(this).val().length < 6) {
				$(this).removeClass("valid").addClass("invalid");
			} else {
				$(this).removeClass("invalid").addClass("valid");
			}
		});

		$("#myform").validate({
			submitHandler: function(form) {
				var form_data= [$("#login"), $("#password")];
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

</body>

</html>