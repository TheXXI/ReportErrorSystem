<cfif NOT IsDefined ('form.login')>
<cflocation url="login.cfm" addtoken="No">
</cfif>

<cfquery datasource="ReportErrorSystemDatabase" name="userQuery">
	select * from users where login = '#FORM.login#' and password = '#FORM.password#'
</cfquery>

<cfif userQuery.RecordCount IS 0>
<cflocation url="login.cfm" addtoken="No">
<cfset StructClear(Session)>
<cfelse>
<cfset Session.LoggedIn = "1">
<cfset Session.FirstName = "#userQuery.login#">
<cfset Session.UserId = "#userQuery.id#">
<cflocation url="index.cfm" addtoken="No">
</cfif>
