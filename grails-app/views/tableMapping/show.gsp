
<%@ page import="dmms.TableMapping" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tableMapping.label', default: 'TableMapping')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tableMapping" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tableMapping" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tableMapping">
			
				<g:if test="${tableMappingInstance?.memo}">
				<li class="fieldcontain">
					<span id="memo-label" class="property-label"><g:message code="tableMapping.memo.label" default="Memo" /></span>
					
						<span class="property-value" aria-labelledby="memo-label"><g:fieldValue bean="${tableMappingInstance}" field="memo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tableMappingInstance?.sourceTableId}">
				<li class="fieldcontain">
					<span id="sourceTableId-label" class="property-label"><g:message code="tableMapping.sourceTableId.label" default="Source Table Id" /></span>
					
						<span class="property-value" aria-labelledby="sourceTableId-label"><g:fieldValue bean="${tableMappingInstance}" field="sourceTableId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tableMappingInstance?.sourceTableName}">
				<li class="fieldcontain">
					<span id="sourceTableName-label" class="property-label"><g:message code="tableMapping.sourceTableName.label" default="Source Table Name" /></span>
					
						<span class="property-value" aria-labelledby="sourceTableName-label"><g:fieldValue bean="${tableMappingInstance}" field="sourceTableName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tableMappingInstance?.sourceTableRemarks}">
				<li class="fieldcontain">
					<span id="sourceTableRemarks-label" class="property-label"><g:message code="tableMapping.sourceTableRemarks.label" default="Source Table Remarks" /></span>
					
						<span class="property-value" aria-labelledby="sourceTableRemarks-label"><g:fieldValue bean="${tableMappingInstance}" field="sourceTableRemarks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tableMappingInstance?.sourceTableMemo}">
				<li class="fieldcontain">
					<span id="sourceTableMemo-label" class="property-label"><g:message code="tableMapping.sourceTableMemo.label" default="Source Table Memo" /></span>
					
						<span class="property-value" aria-labelledby="sourceTableMemo-label"><g:fieldValue bean="${tableMappingInstance}" field="sourceTableMemo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tableMappingInstance?.sourceTableType}">
				<li class="fieldcontain">
					<span id="sourceTableType-label" class="property-label"><g:message code="tableMapping.sourceTableType.label" default="Source Table Type" /></span>
					
						<span class="property-value" aria-labelledby="sourceTableType-label"><g:fieldValue bean="${tableMappingInstance}" field="sourceTableType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tableMappingInstance?.targetTableId}">
				<li class="fieldcontain">
					<span id="targetTableId-label" class="property-label"><g:message code="tableMapping.targetTableId.label" default="Target Table Id" /></span>
					
						<span class="property-value" aria-labelledby="targetTableId-label"><g:fieldValue bean="${tableMappingInstance}" field="targetTableId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tableMappingInstance?.targetTabelName}">
				<li class="fieldcontain">
					<span id="targetTabelName-label" class="property-label"><g:message code="tableMapping.targetTabelName.label" default="Target Tabel Name" /></span>
					
						<span class="property-value" aria-labelledby="targetTabelName-label"><g:fieldValue bean="${tableMappingInstance}" field="targetTabelName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tableMappingInstance?.targetTableRemarks}">
				<li class="fieldcontain">
					<span id="targetTableRemarks-label" class="property-label"><g:message code="tableMapping.targetTableRemarks.label" default="Target Table Remarks" /></span>
					
						<span class="property-value" aria-labelledby="targetTableRemarks-label"><g:fieldValue bean="${tableMappingInstance}" field="targetTableRemarks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tableMappingInstance?.targetTableMemo}">
				<li class="fieldcontain">
					<span id="targetTableMemo-label" class="property-label"><g:message code="tableMapping.targetTableMemo.label" default="Target Table Memo" /></span>
					
						<span class="property-value" aria-labelledby="targetTableMemo-label"><g:fieldValue bean="${tableMappingInstance}" field="targetTableMemo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tableMappingInstance?.targetTableType}">
				<li class="fieldcontain">
					<span id="targetTableType-label" class="property-label"><g:message code="tableMapping.targetTableType.label" default="Target Table Type" /></span>
					
						<span class="property-value" aria-labelledby="targetTableType-label"><g:fieldValue bean="${tableMappingInstance}" field="targetTableType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tableMappingInstance?.columnMppings}">
				<li class="fieldcontain">
					<span id="columnMppings-label" class="property-label"><g:message code="tableMapping.columnMppings.label" default="Column Mppings" /></span>
					
						<g:each in="${tableMappingInstance.columnMppings}" var="c">
						<span class="property-value" aria-labelledby="columnMppings-label"><g:link controller="columnMapping" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tableMappingInstance?.id}" />
					<g:link class="edit" action="edit" id="${tableMappingInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:link class="edit" controller="ColumnMapping" action="showColumns" id="${tableMappingInstance?.id}">Show Columns</g:link>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
