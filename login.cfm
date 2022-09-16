<cfif IsDefined("Session.loggedIn")>
<set StructClear(Session)>
<cflocation  url="/"> 
</cfif>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Вход | Report Error System</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
	<cfinclude template="header.cfm">
    <main class="container">

    <div class="loginform">
    <h3>Вход</h3>
    <form action="login_action.cfm" method="post">
        <input class="form-control" type="text" placeholder="Логин" name="login">

        <input class="form-control" type="password" placeholder="Пароль" name="password">
        <input class="btn btn-primary" type="submit" value="Войти" style="width:100%;">

    </form>
    </div>
    
    </main>
</body>
</html>