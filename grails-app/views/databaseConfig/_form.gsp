<%@ page import="dmms.DatabaseConfig" %>



<div class="fieldcontain ${hasErrors(bean: databaseConfigInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="databaseConfig.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${databaseConfigInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: databaseConfigInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="databaseConfig.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${databaseConfigInstance.constraints.type.inList}" required="" value="${databaseConfigInstance?.type}" valueMessagePrefix="databaseConfig.type"/>
</div>

<div class="fieldcontain ${hasErrors(bean: databaseConfigInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="databaseConfig.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="url" required="" value="${databaseConfigInstance?.url}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: databaseConfigInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="databaseConfig.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${databaseConfigInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: databaseConfigInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="databaseConfig.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${databaseConfigInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: databaseConfigInstance, field: 'tables', 'error')} ">
	<label for="tables">
		<g:message code="databaseConfig.tables.label" default="Tables" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${databaseConfigInstance?.tables?}" var="t">
    <li><g:link controller="tableInfo" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="tableInfo" action="create" params="['databaseConfig.id': databaseConfigInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'tableInfo.label', default: 'TableInfo')])}</g:link>
</li>
</ul>

</div>

