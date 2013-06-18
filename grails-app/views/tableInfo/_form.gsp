<%@ page import="dmms.TableInfo" %>



<div class="fieldcontain ${hasErrors(bean: tableInfoInstance, field: 'tableType', 'error')} required">
	<label for="tableType">
		<g:message code="tableInfo.tableType.label" default="Table Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tableType" from="${tableInfoInstance.constraints.tableType.inList}" required="" value="${tableInfoInstance?.tableType}" valueMessagePrefix="tableInfo.tableType"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tableInfoInstance, field: 'columns', 'error')} ">
	<label for="columns">
		<g:message code="tableInfo.columns.label" default="Columns" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tableInfoInstance?.columns?}" var="c">
    <li><g:link controller="columnInfo" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="columnInfo" action="create" params="['tableInfo.id': tableInfoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'columnInfo.label', default: 'ColumnInfo')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: tableInfoInstance, field: 'database', 'error')} required">
	<label for="database">
		<g:message code="tableInfo.database.label" default="Database" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="database" name="database.id" from="${dmms.DatabaseConfig.list()}" optionKey="id" required="" value="${tableInfoInstance?.database?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tableInfoInstance, field: 'memo', 'error')} ">
	<label for="memo">
		<g:message code="tableInfo.memo.label" default="Memo" />
		
	</label>
	<g:textField name="memo" value="${tableInfoInstance?.memo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tableInfoInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="tableInfo.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${tableInfoInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tableInfoInstance, field: 'remarks', 'error')} ">
	<label for="remarks">
		<g:message code="tableInfo.remarks.label" default="Remarks" />
		
	</label>
	<g:textField name="remarks" value="${tableInfoInstance?.remarks}"/>
</div>

