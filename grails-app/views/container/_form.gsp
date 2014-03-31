<%@ page import="net.rcenergy.Container" %>



<div class=" ">
	<label for="district">
		<g:message code="container.district.label" default="District" />
		
	</label>
	<g:select id="district" name="district.id" optionValue="name" keys="${net.rcenergy.District.list().id}" from="${net.rcenergy.District.list()}"  value="${containerInstance?.district?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class=" ">
	<label for="supervisor">
		<g:message code="container.supervisor.label" default="Supervisor" />
		
	</label>
	<g:select id="supervisor" name="supervisor.id" from="${supervisorInstanceList}" keys="${supervisorInstanceList?.id}" optionValue="username" value="${containerInstance?.supervisor?.id}" class="many-to-one" noSelection="['null': '']" />
</div>



