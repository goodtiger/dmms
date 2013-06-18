
<%@ page import="dmms.TableInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tableInfo.label', default: 'TableInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tableInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tableInfo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tableInfo">
			
				<g:if test="${tableInfoInstance?.columns}">
				<li class="fieldcontain">
					<span id="columns-label" class="property-label"><g:message code="tableInfo.columns.label" default="Columns" /></span>
					
						<g:each in="${tableInfoInstance.columns}" var="c">
						<span class="property-value" aria-labelledby="columns-label"><g:link controller="columnInfo" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${tableInfoInstance?.database}">
				<li class="fieldcontain">
					<span id="database-label" class="property-label"><g:message code="tableInfo.database.label" default="Database" /></span>
					
						<span class="property-value" aria-labelledby="database-label"><g:link controller="databaseConfig" action="show" id="${tableInfoInstance?.database?.id}">${tableInfoInstance?.database?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tableInfoInstance?.memo}">
				<li class="fieldcontain">
					<span id="memo-label" class="property-label"><g:message code="tableInfo.memo.label" default="Memo" /></span>
					
						<span class="property-value" aria-labelledby="memo-label"><g:fieldValue bean="${tableInfoInstance}" field="memo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tableInfoInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="tableInfo.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${tableInfoInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tableInfoInstance?.remarks}">
				<li class="fieldcontain">
					<span id="remarks-label" class="property-label"><g:message code="tableInfo.remarks.label" default="Remarks" /></span>
					
						<span class="property-value" aria-labelledby="remarks-label"><g:fieldValue bean="${tableInfoInstance}" field="remarks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tableInfoInstance?.tableType}">
				<li class="fieldcontain">
					<span id="tableType-label" class="property-label"><g:message code="tableInfo.tableType.label" default="Table Type" /></span>
					
						<span class="property-value" aria-labelledby="tableType-label"><g:fieldValue bean="${tableInfoInstance}" field="tableType"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tableInfoInstance?.id}" />
					<g:link class="edit" action="edit" id="${tableInfoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
