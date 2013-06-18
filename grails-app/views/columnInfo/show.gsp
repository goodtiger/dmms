
<%@ page import="dmms.ColumnInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'columnInfo.label', default: 'ColumnInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-columnInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-columnInfo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list columnInfo">
			
				<g:if test="${columnInfoInstance?.columnName}">
				<li class="fieldcontain">
					<span id="columnName-label" class="property-label"><g:message code="columnInfo.columnName.label" default="Column Name" /></span>
					
						<span class="property-value" aria-labelledby="columnName-label"><g:fieldValue bean="${columnInfoInstance}" field="columnName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${columnInfoInstance?.columnSize}">
				<li class="fieldcontain">
					<span id="columnSize-label" class="property-label"><g:message code="columnInfo.columnSize.label" default="Column Size" /></span>
					
						<span class="property-value" aria-labelledby="columnSize-label"><g:fieldValue bean="${columnInfoInstance}" field="columnSize"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${columnInfoInstance?.columnTypeName}">
				<li class="fieldcontain">
					<span id="columnTypeName-label" class="property-label"><g:message code="columnInfo.columnTypeName.label" default="Column Type Name" /></span>
					
						<span class="property-value" aria-labelledby="columnTypeName-label"><g:fieldValue bean="${columnInfoInstance}" field="columnTypeName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${columnInfoInstance?.remarks}">
				<li class="fieldcontain">
					<span id="remarks-label" class="property-label"><g:message code="columnInfo.remarks.label" default="Remarks" /></span>
					
						<span class="property-value" aria-labelledby="remarks-label"><g:fieldValue bean="${columnInfoInstance}" field="remarks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${columnInfoInstance?.table}">
				<li class="fieldcontain">
					<span id="table-label" class="property-label"><g:message code="columnInfo.table.label" default="Table" /></span>
					
						<span class="property-value" aria-labelledby="table-label"><g:link controller="tableInfo" action="show" id="${columnInfoInstance?.table?.id}">${columnInfoInstance?.table?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${columnInfoInstance?.tableName}">
				<li class="fieldcontain">
					<span id="tableName-label" class="property-label"><g:message code="columnInfo.tableName.label" default="Table Name" /></span>
					
						<span class="property-value" aria-labelledby="tableName-label"><g:fieldValue bean="${columnInfoInstance}" field="tableName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${columnInfoInstance?.id}" />
					<g:link class="edit" action="edit" id="${columnInfoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
