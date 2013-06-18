<%@ page import="dmms.DatabaseConfig"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'databaseConfig.label', default: 'DatabaseConfig')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-databaseConfig" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="list-databaseConfig" class="content scaffold-list" role="main">
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table>
			<thead>
				<tr>
					<th>Tables</th>
					<th>Remarks</th>
					<th>Operation</th>
					<th>Operation</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${tables}" status="i" var="table">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td width="40%">
							${table.tableName}
						</td>
						<td width="40%">
							${table.remarks}
						</td>
						<td width="10%"><g:link action='showColumns' id="${id}"
								params='[tableName:"${table.tableName}"]'>Columns</g:link>
						</td>
						<td width="10%"><g:link action='storeTable' id="${id}"
								params='[tableName:"${table.tableName}"]'>Store</g:link>
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
</body>
</html>
