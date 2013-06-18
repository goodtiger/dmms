
<%@ page import="dmms.ColumnInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'columnInfo.label', default: 'ColumnInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-columnInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-columnInfo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="columnName" title="${message(code: 'columnInfo.columnName.label', default: 'Column Name')}" />
					
						<g:sortableColumn property="columnSize" title="${message(code: 'columnInfo.columnSize.label', default: 'Column Size')}" />
					
						<g:sortableColumn property="columnTypeName" title="${message(code: 'columnInfo.columnTypeName.label', default: 'Column Type Name')}" />
					
						<g:sortableColumn property="remarks" title="${message(code: 'columnInfo.remarks.label', default: 'Remarks')}" />
					
						<th><g:message code="columnInfo.table.label" default="Table" /></th>
					
						<g:sortableColumn property="tableName" title="${message(code: 'columnInfo.tableName.label', default: 'Table Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${columnInfoInstanceList}" status="i" var="columnInfoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${columnInfoInstance.id}">${fieldValue(bean: columnInfoInstance, field: "columnName")}</g:link></td>
					
						<td>${fieldValue(bean: columnInfoInstance, field: "columnSize")}</td>
					
						<td>${fieldValue(bean: columnInfoInstance, field: "columnTypeName")}</td>
					
						<td>${fieldValue(bean: columnInfoInstance, field: "remarks")}</td>
					
						<td>${fieldValue(bean: columnInfoInstance, field: "table")}</td>
					
						<td>${fieldValue(bean: columnInfoInstance, field: "tableName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${columnInfoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
