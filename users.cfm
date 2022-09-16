<cfif NOT IsDefined("Session.loggedIn")>
<set StructClear(Session)>
<cflocation url="login.cfm"> 
</cfif>

<cfquery datasource="ReportErrorSystemDatabase" name="usersQuery">
	select * from users
</cfquery>

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
	<table class="table" id="errorsTable">
		<thead>
			<tr>
                <th scope="col">ID</th>
				<th scope="col">Логин</th>
				<th scope="col">Имя</th>
				<th scope="col">Фамилия</th>
                <th scope="col">Пароль</th>
			</tr>
		</thead>
		<tbody>
		<cfoutput query="usersQuery">

            <tr>
                <td>#id#</td>
                <td>#login#</td>
                <td>#name#</td>
                <td>#surname#</td>
                <td>#password#</td>
            </tr>

		</cfoutput>
		</tbody>
	</table>

	</main>
</body>
</html>