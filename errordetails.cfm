<cfif NOT IsDefined("Session.loggedIn")>
<set StructClear(Session)>
<cflocation url="login.cfm"> 
</cfif>

<cfset errorIdentifier = URL['id']>
<cfquery datasource="ReportErrorSystemDatabase" name="errorQuery">
	select * from errors where id='#errorIdentifier#'
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
    <cfoutput query="errorQuery">
        <title>#description# | Report Error System</title>
    </cfoutput>

</head>
<body>
	<cfinclude template="header.cfm">
    <main class="container">

    <cfoutput query="errorQuery">
    <cfset date_and_time = Replace(#datatime#, "T", " ", "all")>

    <cfset authorIdentifier = #author_id#>

    <h4>#description#</h4>
    <p>#date_and_time#</p>
    <p>#details#</p>

    <div class="informaion">
    <hr>
        <span id="infoElement">Статус: #status#</span> 
        <span id="infoElement">Срочность:

        <cfif urgency eq "Несрочно">
			<span id="blue">#urgency#</span>
		<cfelseif urgency eq "Срочно">
			<span id="red">#urgency#</span>
	    <cfelseif urgency eq "Очень срочно">
			<span id="red">#urgency#</span>
		<cfelse>
			#urgency#
		</cfif>
        
        </span>
        <span id="infoElement">Критичность: 

        <cfif criticality eq "Некритичная">
			<span id="blue">#criticality#</span>
	    <cfelseif criticality eq "Критичная">
			<span id="red">#criticality#</span>
		<cfelseif criticality eq "Авария">
			<span id="red">#criticality#</span>
		<cfelse>
			#criticality#
		</cfif>
        
        
        </span>

        <span id="infoElement">Автор:

            <cfloop item="item" array="#users#">
                <cfif #item[1]# eq #author_id#>
                    #item[2]#
                </cfif>
            </cfloop>
        </span>
        </cfoutput>

        <hr>
        </div>

        <cfoutput query="errorQuery">
            <cfif status eq "Закрытая">
            <cfelse>
                <form method="post" action="errorUpdaterScript.cfm?id=#errorIdentifier#">
                    <select class="form-select" aria-label="status" name="status">

                        <cfif status eq "Новая">
                            <option value="Открытая">Открытая</option>
                        <cfelseif status eq "Открытая">
				            <option value="Решенная">Решенная</option>
                        <cfelseif status eq "Решенная">
                            <option value="Закрытая">Закрытая</option>
                            <option value="Открытая">Открытая</option>
                        </cfif>

                    </select>
                    <div class="form-floating">
                        <textarea class="form-control" id="floatingTextarea" name="comment"></textarea>
                        <label for="floatingTextarea">Комментарий</label>
                    </div>
                    <input class="btn btn-primary" type="submit" value="Сменить статус">
                </form>
                <hr>
        </cfif>
    </cfoutput>
        

        <h5>История изменений:</h5>

        <cfquery datasource="ReportErrorSystemDatabase" name="errorsHistory">
		select * from errors_history where error_id='#errorIdentifier#'
	    </cfquery>

        <table class="table">
            <thead>
                <tr>
                <th scope="col">Пользовтель</th>
                <th scope="col">Дейстиве</th>
                <th scope="col">Дата</th>
                <th scope="col">Комментарий</th>
                </tr>
            </thead>
            <tbody>

                <cfoutput query="errorsHistory">
                    <cfset date_and_time = Replace(#datatime#, "T", " ", "all")>
                    <tr>
                        <td>
                            <cfloop item="item" array="#users#">
                                <cfif #item[1]# eq #author_id#>
                                    #item[2]#
                                </cfif>
                            </cfloop>
                        </td>
                        <td>Поменял статус на: #new_status#</td>
                        <td>#date_and_time#</td>
                        <td>#comment#</td>
                    </tr>
                </cfoutput>

            </tbody>
        </table>
    
    </main>
</body>
</html>