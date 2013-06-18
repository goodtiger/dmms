
<%@ page import="dmms.TableInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tableInfo.label', default: 'TableInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tableInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tableInfo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="tableInfo.database.label" default="Database" /></th>
					
						<g:sortableColumn property="memo" title="${message(code: 'tableInfo.memo.label', default: 'Memo')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'tableInfo.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="remarks" title="${message(code: 'tableInfo.remarks.label', default: 'Remarks')}" />
					
						<g:sortableColumn property="tableType" title="${message(code: 'tableInfo.tableType.label', default: 'Table Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tableInfoInstanceList}" status="i" var="tableInfoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tableInfoInstance.id}">${tableInfoInstance?.database?.encodeAsHTML()}</g:link></td>
					
						<td>${fieldValue(bean: tableInfoInstance, field: "memo")}</td>
					
						<td>${fieldValue(bean: tableInfoInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: tableInfoInstance, field: "remarks")}</td>
					
						<td>${fieldValue(bean: tableInfoInstance, field: "tableType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tableInfoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
