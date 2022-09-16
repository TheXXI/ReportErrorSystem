<div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
        <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
          <span class="fs-4">Report Error System</span>
        </a>
      
        <cfif NOT IsDefined("Session.loggedIn")>
        <button type="button" class="btn btn-success" onclick="window.location.href='login.cfm'">Вход</button>
        <cfelse>
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="/" class="nav-link">Список ошибок</a></li>
            <li class="nav-item"><a href="addError.cfm" class="nav-link">Добавить ошибку</a></li>
            <li class="nav-item"><a href="adduser.cfm" class="nav-link">Добвить пользователя</a></li>
            <li class="nav-item"><a href="users.cfm" class="nav-link">Список пользователей</a></li>
        </ul>
        <span style="margin: 8px 20px 0px 20px;">Пользователь: <b><cfoutput>#session.FIRSTNAME#</cfoutput></b></span> <button type="button" class="btn btn-danger" onclick="window.location.href='exit.cfm'">Выход</button>
        </cfif>

    </header>
</div>