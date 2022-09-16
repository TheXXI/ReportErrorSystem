<cfquery datasource="ReportErrorSystemDatabase" name="usersAdd">
	insert into users set login="#login#", name="#name#", surname="#surname#", password="#password#"
</cfquery>

<cflocation url="users.cfm">