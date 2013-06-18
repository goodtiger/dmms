
<%@ page import="dmms.DatabaseConfig" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'databaseConfig.label', default: 'DatabaseConfig')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-databaseConfig" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-databaseConfig" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'databaseConfig.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'databaseConfig.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="url" title="${message(code: 'databaseConfig.url.label', default: 'Url')}" />
					
						<g:sortableColumn property="username" title="${message(code: 'databaseConfig.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'databaseConfig.password.label', default: 'Password')}" />
						
						<th>operation</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${databaseConfigInstanceList}" status="i" var="databaseConfigInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${databaseConfigInstance.id}">${fieldValue(bean: databaseConfigInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: databaseConfigInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: databaseConfigInstance, field: "url")}</td>
					
						<td>${fieldValue(bean: databaseConfigInstance, field: "username")}</td>
					
						<td>${fieldValue(bean: databaseConfigInstance, field: "password")}</td>
						<td><g:link class="save" action="showTables" id="${databaseConfigInstance.id}">Show Tables</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${databaseConfigInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
