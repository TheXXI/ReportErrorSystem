<cfquery datasource="ReportErrorSystemDatabase" name="errorHistoryAdd">
	insert into errors set description="#description#", details="#details#", urgency="#urgency#", criticality="#criticality#", author_id=#session.userid#
</cfquery>

<cflocation url="/">