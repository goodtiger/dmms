
<%@ page import="dmms.DatabaseConfig" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'databaseConfig.label', default: 'DatabaseConfig')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-databaseConfig" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-databaseConfig" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list databaseConfig">
			
				<g:if test="${databaseConfigInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="databaseConfig.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${databaseConfigInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${databaseConfigInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="databaseConfig.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${databaseConfigInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${databaseConfigInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="databaseConfig.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${databaseConfigInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${databaseConfigInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="databaseConfig.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${databaseConfigInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${databaseConfigInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="databaseConfig.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${databaseConfigInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${databaseConfigInstance?.tables}">
				<li class="fieldcontain">
					<span id="tables-label" class="property-label"><g:message code="databaseConfig.tables.label" default="Tables" /></span>
					
						<g:each in="${databaseConfigInstance.tables}" var="t">
						<span class="property-value" aria-labelledby="tables-label"><g:link controller="tableInfo" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${databaseConfigInstance?.id}" />
					<g:link class="edit" action="edit" id="${databaseConfigInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
