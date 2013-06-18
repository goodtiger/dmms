<%@ page import="dmms.ColumnMapping" %>



<div class="fieldcontain ${hasErrors(bean: columnMappingInstance, field: 'memo', 'error')} ">
	<label for="memo">
		<g:message code="columnMapping.memo.label" default="Memo" />
		
	</label>
	<g:textField name="memo" value="${columnMappingInstance?.memo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: columnMappingInstance, field: 'sourceColumnId', 'error')} required">
	<label for="sourceColumnId">
		<g:message code="columnMapping.sourceColumnId.label" default="Source Column Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sourceColumnId" type="number" value="${columnMappingInstance.sourceColumnId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: columnMappingInstance, field: 'sourceColumnName', 'error')} ">
	<label for="sourceColumnName">
		<g:message code="columnMapping.sourceColumnName.label" default="Source Column Name" />
		
	</label>
	<g:textField name="sourceColumnName" value="${columnMappingInstance?.sourceColumnName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: columnMappingInstance, field: 'sourceColumnSize', 'error')} ">
	<label for="sourceColumnSize">
		<g:message code="columnMapping.sourceColumnSize.label" default="Source Column Size" />
		
	</label>
	<g:textField name="sourceColumnSize" value="${columnMappingInstance?.sourceColumnSize}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: columnMappingInstance, field: 'sourceColumnTypeName', 'error')} ">
	<label for="sourceColumnTypeName">
		<g:message code="columnMapping.sourceColumnTypeName.label" default="Source Column Type Name" />
		
	</label>
	<g:textField name="sourceColumnTypeName" value="${columnMappingInstance?.sourceColumnTypeName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: columnMappingInstance, field: 'tableMapping', 'error')} required">
	<label for="tableMapping">
		<g:message code="columnMapping.tableMapping.label" default="Table Mapping" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tableMapping" name="tableMapping.id" from="${dmms.TableMapping.list()}" optionKey="id" required="" value="${columnMappingInstance?.tableMapping?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: columnMappingInstance, field: 'targetColumnId', 'error')} required">
	<label for="targetColumnId">
		<g:message code="columnMapping.targetColumnId.label" default="Target Column Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="targetColumnId" type="number" value="${columnMappingInstance.targetColumnId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: columnMappingInstance, field: 'targetColumnName', 'error')} ">
	<label for="targetColumnName">
		<g:message code="columnMapping.targetColumnName.label" default="Target Column Name" />
		
	</label>
	<g:textField name="targetColumnName" value="${columnMappingInstance?.targetColumnName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: columnMappingInstance, field: 'targetColumnSize', 'error')} ">
	<label for="targetColumnSize">
		<g:message code="columnMapping.targetColumnSize.label" default="Target Column Size" />
		
	</label>
	<g:textField name="targetColumnSize" value="${columnMappingInstance?.targetColumnSize}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: columnMappingInstance, field: 'targetColumnTypeName', 'error')} ">
	<label for="targetColumnTypeName">
		<g:message code="columnMapping.targetColumnTypeName.label" default="Target Column Type Name" />
		
	</label>
	<g:textField name="targetColumnTypeName" value="${columnMappingInstance?.targetColumnTypeName}"/>
</div>

