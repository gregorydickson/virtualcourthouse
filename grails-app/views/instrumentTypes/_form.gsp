<%@ page import="net.rcenergy.InstrumentTypes" %>



<div class="fieldcontain ${hasErrors(bean: instrumentTypesInstance, field: 'instrumentType', 'error')} ">
	<label for="instrumentType">
		<g:message code="instrumentTypes.instrumentType.label" default="Instrument Type" />
		
	</label>
	<g:textField name="instrumentType" value="${instrumentTypesInstance?.instrumentType}"/>
</div>

