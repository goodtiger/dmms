<%@ page import="dmms.ColumnInfo" %>



<div class="fieldcontain ${hasErrors(bean: columnInfoInstance, field: 'columnName', 'error')} ">
	<label for="columnName">
		<g:message code="columnInfo.columnName.label" default="Column Name" />
		
	</label>
	<g:textField name="columnName" value="${columnInfoInstance?.columnName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: columnInfoInstance, field: 'columnSize', 'error')} ">
	<label for="columnSize">
		<g:message code="columnInfo.columnSize.label" default="Column Size" />
		
	</label>
	<g:textField name="columnSize" value="${columnInfoInstance?.columnSize}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: columnInfoInstance, field: 'columnTypeName', 'error')} ">
	<label for="columnTypeName">
		<g:message code="columnInfo.columnTypeName.label" default="Column Type Name" />
		
	</label>
	<g:textField name="columnTypeName" value="${columnInfoInstance?.columnTypeName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: columnInfoInstance, field: 'remarks', 'error')} ">
	<label for="remarks">
		<g:message code="columnInfo.remarks.label" default="Remarks" />
		
	</label>
	<g:textField name="remarks" value="${columnInfoInstance?.remarks}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: columnInfoInstance, field: 'table', 'error')} required">
	<label for="table">
		<g:message code="columnInfo.table.label" default="Table" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="table" name="table.id" from="${dmms.TableInfo.list()}" optionKey="id"  optionValue="${columnInfoInstance?.table?.encodeAsHTML()}" value="${columnInfoInstance?.table?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: columnInfoInstance, field: 'tableName', 'error')} ">
	<label for="tableName">
		<g:message code="columnInfo.tableName.label" default="Table Name" />
		
	</label>
	<g:textField name="tableName" value="${columnInfoInstance?.tableName}"/>
</div>

