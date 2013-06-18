
<%@ page import="dmms.ColumnMapping" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'columnMapping.label', default: 'ColumnMapping')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-columnMapping" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-columnMapping" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="memo" title="${message(code: 'columnMapping.memo.label', default: 'Memo')}" />
					
						<g:sortableColumn property="sourceColumnId" title="${message(code: 'columnMapping.sourceColumnId.label', default: 'Source Column Id')}" />
					
						<g:sortableColumn property="sourceColumnName" title="${message(code: 'columnMapping.sourceColumnName.label', default: 'Source Column Name')}" />
					
						<g:sortableColumn property="sourceColumnSize" title="${message(code: 'columnMapping.sourceColumnSize.label', default: 'Source Column Size')}" />
					
						<g:sortableColumn property="sourceColumnTypeName" title="${message(code: 'columnMapping.sourceColumnTypeName.label', default: 'Source Column Type Name')}" />
					
						<th><g:message code="columnMapping.tableMapping.label" default="Table Mapping" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${columnMappingInstanceList}" status="i" var="columnMappingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${columnMappingInstance.id}">${fieldValue(bean: columnMappingInstance, field: "memo")}</g:link></td>
					
						<td>${fieldValue(bean: columnMappingInstance, field: "sourceColumnId")}</td>
					
						<td>${fieldValue(bean: columnMappingInstance, field: "sourceColumnName")}</td>
					
						<td>${fieldValue(bean: columnMappingInstance, field: "sourceColumnSize")}</td>
					
						<td>${fieldValue(bean: columnMappingInstance, field: "sourceColumnTypeName")}</td>
					
						<td>${fieldValue(bean: columnMappingInstance, field: "tableMapping")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${columnMappingInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
