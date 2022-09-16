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
    <title>Добавтиь ошибку | Report Error System</title>

</head>
<body>
	<cfinclude template="header.cfm">
    <main class="container">
        <form method="post" action="addErrorScript.cfm">

            <input class="form-control" type="text" placeholder="Короткое описание" aria-label="login input" name="description">
            <div class="form-floating">
                <textarea class="form-control" id="floatingTextarea" name="details"></textarea>
                <label for="floatingTextarea">Подробное описание</label>
            </div>

            Срочность:
            <select class="form-select" aria-label="status" name="urgency">
                <option value="Совсем несрочно">Совсем несрочно</option>
                <option value="Несрочно">Несрочно</option>
                <option value="Срочно">Срочно</option>
                <option value="Очень Срочно">Очень Срочно</option>
            </select>

            Критичность:
            <select class="form-select" aria-label="status" name="criticality">
                <option value="Запрос на изменение">Запрос на изменение</option>
                <option value="Некритичная">Некритичная</option>
                <option value="Критичная">Критичная</option>
                <option value="Авария">Авария</option>
            </select>
            <input class="btn btn-primary" type="submit" value="Добавить" style="width:100%;">
            
        </form>
    </main>
</body>
</html>