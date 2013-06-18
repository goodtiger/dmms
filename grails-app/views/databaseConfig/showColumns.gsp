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
					<th>COLUMN_NAME</th>
					<th>REMARKS</th>
					<th>COLUMN_TYPE</th>
					<th>COLUMN_SIZE</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${columns}" status="i" var="column">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>
							${column.columnName}
						</td>
						<td>
							${column.remarks}
						</td>
						<td>
							${column.columnTypeName}
						</td>
						<td>
							${column.columnSize}
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
</body>
</html>
