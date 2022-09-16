<cfif NOT IsDefined("Session.loggedIn")>
<set StructClear(Session)>
<cflocation url="login.cfm"> 
</cfif>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Добавтиь пользователя | Report Error System</title>
</head>
<body>
	<cfinclude template="header.cfm">
    <main class="container">
        <form method="post" action="addUserScript.cfm">

            <input class="form-control" type="text" placeholder="Логин" aria-label="login input" name="login">
            <input class="form-control" type="text" placeholder="Имя" aria-label="name input" name="name">
            <input class="form-control" type="text" placeholder="Фамилия" aria-label="surname input" name="surname">
            <input class="form-control" type="text" placeholder="Пароль" aria-label="password input" name="password">
            
            <input class="btn btn-primary" type="submit" value="Добавить" style="width:100%;">
            
        </form>
    </main>
</body>
</html>