<cfquery datasource="ReportErrorSystemDatabase" name="errorUpdate">
	update errors set status="#status#" where id=#id#
</cfquery>

<cfquery datasource="ReportErrorSystemDatabase" name="errorHistoryAdd">
	insert into errors_history set new_status='#status#', comment='#comment#', author_id=#session.userid#, error_id =#id#
</cfquery>

<cflocation url="/errorDetails.cfm?id=#id#">
