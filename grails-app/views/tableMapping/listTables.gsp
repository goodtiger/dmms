
<%@ page import="dmms.TableMapping"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'tableMapping.label', default: 'TableMapping')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-tableMapping" class="skip" tabindex="-1"><g:message
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
	<div id="list-tableMapping" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:form action="saveMapping">
			
			<table>
				<thead>
					<tr>
						<th>Source Table</th>
						<th>Target Table</th>

					</tr>
				</thead>
				<tbody>
					<tr class="even">
						<td><g:select name="sourceTable" from="${tables}"
								optionKey="id" optionValue="name" /></td>
						<td><g:select name="targetTable" from="${tables}"
								optionKey="id" optionValue="name" /></td>
					</tr>
					<tr class="even">
					<td colspan="2">
						<g:submitButton name="create" class="save"
							value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</td>
					</tr>
				</tbody>
			</table>
		</g:form>
	</div>
</body>
</html>
