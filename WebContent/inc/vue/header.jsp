<%@ page pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header>
	<nav>
		<div class="nav-wrapper teal lighten-2">
			<a href="#" class="brand-logo"></a>
			<ul id="nav-mobile" class="right hide-on-med-and-down">

				<li class="${pageContext.request.servletPath == '/inscription.jsp' ? 'active' : '' }">

					<c:url var="urlInscription" value="/inscription.jsp"/>

					<c:if test="${pageContext.request.servletPath == '/inscription.jsp'}">
						<c:set var="urlInscription" value="#"/>
					</c:if>

					<a href="${urlInscription}">Inscription</a>

				</li>

				<li class="${pageContext.request.servletPath == '/connexion.jsp' ? 'active' : '' }">

					<c:url var="urlConnexion" value="/connexion.jsp"/>

					<c:if test="${pageContext.request.servletPath == '/connexion.jsp'}">
						<c:set var="urlConnexion" value="#"/>
					</c:if>

					<a href="${urlConnexion}">Connexion</a>
				</li>
			</ul>
		</div>
	</nav>
</header>