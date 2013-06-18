
<%@ page import="dmms.TableMapping" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tableMapping.label', default: 'TableMapping')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tableMapping" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="listTables">Auto Create</g:link></li>
			</ul>
		</div>
		<div id="list-tableMapping" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="memo" title="${message(code: 'tableMapping.memo.label', default: 'Memo')}" />
					
						<g:sortableColumn property="sourceTableId" title="${message(code: 'tableMapping.sourceTableId.label', default: 'Source Table Id')}" />
					
						<g:sortableColumn property="sourceTableName" title="${message(code: 'tableMapping.sourceTableName.label', default: 'Source Table Name')}" />
					
						<g:sortableColumn property="sourceTableRemarks" title="${message(code: 'tableMapping.sourceTableRemarks.label', default: 'Source Table Remarks')}" />
					
						<g:sortableColumn property="sourceTableMemo" title="${message(code: 'tableMapping.sourceTableMemo.label', default: 'Source Table Memo')}" />
					
						<g:sortableColumn property="sourceTableType" title="${message(code: 'tableMapping.sourceTableType.label', default: 'Source Table Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tableMappingInstanceList}" status="i" var="tableMappingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tableMappingInstance.id}">${fieldValue(bean: tableMappingInstance, field: "memo")}</g:link></td>
					
						<td>${fieldValue(bean: tableMappingInstance, field: "sourceTableId")}</td>
					
						<td>${fieldValue(bean: tableMappingInstance, field: "sourceTableName")}</td>
					
						<td>${fieldValue(bean: tableMappingInstance, field: "sourceTableRemarks")}</td>
					
						<td>${fieldValue(bean: tableMappingInstance, field: "sourceTableMemo")}</td>
					
						<td>${fieldValue(bean: tableMappingInstance, field: "sourceTableType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tableMappingInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
