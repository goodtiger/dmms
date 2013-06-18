
<%@ page import="dmms.ColumnMapping"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'columnMapping.label', default: 'ColumnMapping')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-columnMapping" class="skip" tabindex="-1"><g:message
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
	<div id="list-columnMapping" class="content scaffold-list" role="main">
		<h1>Column Mapping Manually</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:form action="saveMapping">
			<g:hiddenField name="tableMappingId" id="tableMappingId"
				value="${id}" />
			<table>
				<thead>
					<tr>
						<th>Source Column Name</th>
						<th>Source Column Remarks</th>
						<th>Target Column</th>
						<th>Mapping MEMO</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${sourceColumns}" status="i" var="sourceColumn">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td>
								${sourceColumn.columnName}
							</td>
							<td>
								${sourceColumn.remarks}
							</td>
							<td><select name="${sourceColumn.id }"
								id="${sourceColumn.id }">
									<option value="NO">No Need Mapping</option>
									<g:each in="${targetColumns}" status="j" var="targetColumn">
										<option value="${targetColumn.id}">
											${targetColumn.columnName +":" +targetColumn.remarks}
										</option>
									</g:each>
							</select></td>
							<td> <g:textField name="${sourceColumn.id+"_memo" }" /> 
							</td>
						</tr>
					</g:each>
					<tr class="even">
						<td colspan="3"><g:submitButton name="create" class="save"
								value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</td>
					</tr>
				</tbody>
			</table>
		</g:form>
	</div>
</body>
</html>
