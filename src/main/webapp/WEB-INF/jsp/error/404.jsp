<%-- 
    Document   : 404
    Created on : 21/04/2018, 16:45:56
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>    
    <body>
        <div class="error-page">
            <h2 class="headline text-yellow"> 404</h2>
            <div class="error-content">
                <h3><i class="fa fa-warning text-yellow"></i> Oops! Página não encontrada.</h3>
                <p>${causa}</p>
                <p>${mensagem}</p>
            </div>
            <!-- /.error-content -->
        </div>
        <!-- /.error-page -->
    </body>
</html>
