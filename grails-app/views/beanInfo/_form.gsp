<%@ page import="dmms.BeanInfo" %>



<div class="fieldcontain ${hasErrors(bean: beanInfoInstance, field: 'memo', 'error')} required">
	<label for="memo">
		<g:message code="beanInfo.memo.label" default="Memo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="memo" required="" value="${beanInfoInstance?.memo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beanInfoInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="beanInfo.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${beanInfoInstance?.name}"/>
</div>

