
<%@ page import="dmms.ColumnMapping" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'columnMapping.label', default: 'ColumnMapping')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-columnMapping" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-columnMapping" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list columnMapping">
			
				<g:if test="${columnMappingInstance?.memo}">
				<li class="fieldcontain">
					<span id="memo-label" class="property-label"><g:message code="columnMapping.memo.label" default="Memo" /></span>
					
						<span class="property-value" aria-labelledby="memo-label"><g:fieldValue bean="${columnMappingInstance}" field="memo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${columnMappingInstance?.sourceColumnId}">
				<li class="fieldcontain">
					<span id="sourceColumnId-label" class="property-label"><g:message code="columnMapping.sourceColumnId.label" default="Source Column Id" /></span>
					
						<span class="property-value" aria-labelledby="sourceColumnId-label"><g:fieldValue bean="${columnMappingInstance}" field="sourceColumnId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${columnMappingInstance?.sourceColumnName}">
				<li class="fieldcontain">
					<span id="sourceColumnName-label" class="property-label"><g:message code="columnMapping.sourceColumnName.label" default="Source Column Name" /></span>
					
						<span class="property-value" aria-labelledby="sourceColumnName-label"><g:fieldValue bean="${columnMappingInstance}" field="sourceColumnName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${columnMappingInstance?.sourceColumnSize}">
				<li class="fieldcontain">
					<span id="sourceColumnSize-label" class="property-label"><g:message code="columnMapping.sourceColumnSize.label" default="Source Column Size" /></span>
					
						<span class="property-value" aria-labelledby="sourceColumnSize-label"><g:fieldValue bean="${columnMappingInstance}" field="sourceColumnSize"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${columnMappingInstance?.sourceColumnTypeName}">
				<li class="fieldcontain">
					<span id="sourceColumnTypeName-label" class="property-label"><g:message code="columnMapping.sourceColumnTypeName.label" default="Source Column Type Name" /></span>
					
						<span class="property-value" aria-labelledby="sourceColumnTypeName-label"><g:fieldValue bean="${columnMappingInstance}" field="sourceColumnTypeName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${columnMappingInstance?.tableMapping}">
				<li class="fieldcontain">
					<span id="tableMapping-label" class="property-label"><g:message code="columnMapping.tableMapping.label" default="Table Mapping" /></span>
					
						<span class="property-value" aria-labelledby="tableMapping-label"><g:link controller="tableMapping" action="show" id="${columnMappingInstance?.tableMapping?.id}">${columnMappingInstance?.tableMapping?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${columnMappingInstance?.targetColumnId}">
				<li class="fieldcontain">
					<span id="targetColumnId-label" class="property-label"><g:message code="columnMapping.targetColumnId.label" default="Target Column Id" /></span>
					
						<span class="property-value" aria-labelledby="targetColumnId-label"><g:fieldValue bean="${columnMappingInstance}" field="targetColumnId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${columnMappingInstance?.targetColumnName}">
				<li class="fieldcontain">
					<span id="targetColumnName-label" class="property-label"><g:message code="columnMapping.targetColumnName.label" default="Target Column Name" /></span>
					
						<span class="property-value" aria-labelledby="targetColumnName-label"><g:fieldValue bean="${columnMappingInstance}" field="targetColumnName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${columnMappingInstance?.targetColumnSize}">
				<li class="fieldcontain">
					<span id="targetColumnSize-label" class="property-label"><g:message code="columnMapping.targetColumnSize.label" default="Target Column Size" /></span>
					
						<span class="property-value" aria-labelledby="targetColumnSize-label"><g:fieldValue bean="${columnMappingInstance}" field="targetColumnSize"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${columnMappingInstance?.targetColumnTypeName}">
				<li class="fieldcontain">
					<span id="targetColumnTypeName-label" class="property-label"><g:message code="columnMapping.targetColumnTypeName.label" default="Target Column Type Name" /></span>
					
						<span class="property-value" aria-labelledby="targetColumnTypeName-label"><g:fieldValue bean="${columnMappingInstance}" field="targetColumnTypeName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${columnMappingInstance?.id}" />
					<g:link class="edit" action="edit" id="${columnMappingInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
