<%@ page import="dmms.TableMapping" %>



<div class="fieldcontain ${hasErrors(bean: tableMappingInstance, field: 'memo', 'error')} ">
	<label for="memo">
		<g:message code="tableMapping.memo.label" default="Memo" />
		
	</label>
	<g:textField name="memo" value="${tableMappingInstance?.memo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tableMappingInstance, field: 'sourceTableId', 'error')} required">
	<label for="sourceTableId">
		<g:message code="tableMapping.sourceTableId.label" default="Source Table Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sourceTableId" type="number" value="${tableMappingInstance.sourceTableId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: tableMappingInstance, field: 'sourceTableName', 'error')} required">
	<label for="sourceTableName">
		<g:message code="tableMapping.sourceTableName.label" default="Source Table Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sourceTableName" required="" value="${tableMappingInstance?.sourceTableName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tableMappingInstance, field: 'sourceTableRemarks', 'error')} required">
	<label for="sourceTableRemarks">
		<g:message code="tableMapping.sourceTableRemarks.label" default="Source Table Remarks" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sourceTableRemarks" required="" value="${tableMappingInstance?.sourceTableRemarks}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tableMappingInstance, field: 'sourceTableMemo', 'error')} ">
	<label for="sourceTableMemo">
		<g:message code="tableMapping.sourceTableMemo.label" default="Source Table Memo" />
		
	</label>
	<g:textField name="sourceTableMemo" value="${tableMappingInstance?.sourceTableMemo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tableMappingInstance, field: 'sourceTableType', 'error')} required">
	<label for="sourceTableType">
		<g:message code="tableMapping.sourceTableType.label" default="Source Table Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sourceTableType" required="" value="${tableMappingInstance?.sourceTableType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tableMappingInstance, field: 'targetTableId', 'error')} required">
	<label for="targetTableId">
		<g:message code="tableMapping.targetTableId.label" default="Target Table Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="targetTableId" type="number" value="${tableMappingInstance.targetTableId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: tableMappingInstance, field: 'targetTabelName', 'error')} required">
	<label for="targetTabelName">
		<g:message code="tableMapping.targetTabelName.label" default="Target Tabel Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="targetTabelName" required="" value="${tableMappingInstance?.targetTabelName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tableMappingInstance, field: 'targetTableRemarks', 'error')} required">
	<label for="targetTableRemarks">
		<g:message code="tableMapping.targetTableRemarks.label" default="Target Table Remarks" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="targetTableRemarks" required="" value="${tableMappingInstance?.targetTableRemarks}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tableMappingInstance, field: 'targetTableMemo', 'error')} ">
	<label for="targetTableMemo">
		<g:message code="tableMapping.targetTableMemo.label" default="Target Table Memo" />
		
	</label>
	<g:textField name="targetTableMemo" value="${tableMappingInstance?.targetTableMemo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tableMappingInstance, field: 'targetTableType', 'error')} required">
	<label for="targetTableType">
		<g:message code="tableMapping.targetTableType.label" default="Target Table Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="targetTableType" required="" value="${tableMappingInstance?.targetTableType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tableMappingInstance, field: 'columnMppings', 'error')} ">
	<label for="columnMppings">
		<g:message code="tableMapping.columnMppings.label" default="Column Mppings" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tableMappingInstance?.columnMppings?}" var="c">
    <li><g:link controller="columnMapping" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="columnMapping" action="create" params="['tableMapping.id': tableMappingInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'columnMapping.label', default: 'ColumnMapping')])}</g:link>
</li>
</ul>

</div>

