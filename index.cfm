<cfif NOT IsDefined("Session.loggedIn")>
<set StructClear(Session)>
<cflocation url="login.cfm"> 
</cfif>

<cfquery datasource="ReportErrorSystemDatabase" name="errorsQuery">
	select * from errors
</cfquery>
<cfquery datasource="ReportErrorSystemDatabase" name="usersQuery">
	select * from users
</cfquery>

<cfset users = arrayNew(1)>
<cfloop query="usersQuery">
  <cfset user = arrayNew(1)>
  <cfset arrayAppend(user, #usersQuery.id#)>
  <cfset arrayAppend(user, #usersQuery.login#)>
  <cfset arrayAppend(users, user)>
</cfloop>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="style.css">
    <title>Report Error System</title>
</head>
<body>
	<cfinclude template="header.cfm">

	<main class="container">
	<div class="btn-group" role="group" aria-label="Basic mixed styles example" id="buttonsPanel">
		<button type="button" class="btn btn-primary showErrorsButton" id="showAllButton">Все</button>
		<button type="button" class="btn btn-outline-primary showErrorsButton" id="showNewButton">Новые</button>
		<button type="button" class="btn btn-outline-primary showErrorsButton" id="showOpenButton">Открытые</button>
		<button type="button" class="btn btn-outline-primary showErrorsButton" id="showSolvedButton">Решенные</button>
		<button type="button" class="btn btn-outline-primary showErrorsButton" id="showClosedButton">Закрытые</button>
	</div>

	<table class="table" id="errorsTable">
		<thead>
			<tr>
				<th scope="col">Короткое описание</th>
				<th scope="col">Дата создания</th>
				<th scope="col">Статус</th>
				<th scope="col">Срочность</th>
				<th scope="col">Критичность</th>
				<th scope="col">Автор</th>
			</tr>
		</thead>
		<tbody>
		<cfoutput query="errorsQuery">
		
		<cfloop item="item" array="#users#">
			<cfif #item[1]# eq #author_id#>
  				<cfset author_login = #item[2]#>
			</cfif>
		</cfloop>

		<cfset date_and_time = Replace(#datatime#, "T", " ", "all")>

				<cfif status eq "Решенная">
					<tr class="table-success" onclick="location.href='errorDetails.cfm?id=#id#';">
				<cfelseif status eq "Закрытая">
					<tr class="table-secondary" onclick="location.href='errorDetails.cfm?id=#id#';">
				<cfelse> 
					<tr onclick="location.href='errorDetails.cfm?id=#id#';">
				</cfif>
					<td>#description#</td>
					<td>#date_and_time#</td>
					<td>#status#</td>
					<td>

						<cfif urgency eq "Несрочно">
							<span id="blue">
						<cfelseif urgency eq "Срочно">
							<span id="red">
						<cfelseif urgency eq "Очень срочно">
							<span id="red">
						<cfelse>
							<span>
						</cfif>

						#urgency#
						</span>
					</td>
					<td>

						<cfif criticality eq "Некритичная">
							<span id="blue">
						<cfelseif criticality eq "Критичная">
							<span id="red">
						<cfelseif criticality eq "Авария">
							<span id="red">
						<cfelse>
							<span>
						</cfif>

						#criticality#
						</span>
					</td>
					<td>#author_login#</td>
				</tr>
		</cfoutput>
		
		</tbody>
	</table>
</main>
<script src="errors.js"></script>
</body>
</html>