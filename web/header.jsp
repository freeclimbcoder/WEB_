<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${requestScope.lang}" />
<% String lang = (String) request.getAttribute("lang");%>
<fmt:setBundle basename="ui.lang.lang" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset='utf-8'>
    <head>
        <title>
            <fmt:message key="shop" />
        </title>
        <link rel='stylesheet' type='text/css' href='css/header.css'>

    </head>
    <body>
        <div class='header'>
            <div class='lang_sel'>
                <ul>
                    <li><a  class = 'lang_link' id ='ru'>Русский</a></li>
                    <li><a class = 'lang_link' id ='en'>English</a></li>
                    <li><a class = 'lang_link' id ='ua'>Українська</a></li>
            </div>

            <h1> 
                <fmt:message key="shop" />
            </h1>

            <div class='menu'>
                <ul>
                    <li
                        <c:if test="${'profile'eq param.activeTab}">
                            class='active_tab'
                        </c:if>
                        ><a href='profile'>
                            <c:choose> 
                                <c:when test="${not empty pageContext.request.userPrincipal}">
                                    <c:out value="${pageContext.request.userPrincipal.name}" />
                                </c:when>
                                <c:otherwise>
                                    <fmt:message key="enter" />
                                </c:otherwise>
                            </c:choose>
                        </a></li>
                    <li
                        <c:if test="${'catalog'eq param.activeTab}">
                            class='active_tab'
                        </c:if>
                        ><a href='list'>
                            <fmt:message key="catalog" />
                        </a></li>
                    <li
                        <c:if test="${'cart'eq param.activeTab}">
                            class='active_tab'
                        </c:if>
                        ><a href='cart'>
                            <fmt:message key="cart" />
                        </a></li>

                    <c:if test="${not empty pageContext.request.userPrincipal}">
                        <c:if test="${(sessionScope.cart != null) &&(! sessionScope.cart.isEmpty()) }">
                            <li<c:if test="${'order'eq param.activeTab}">
                                    class='active_tab'
                                </c:if>
                                ><a href='order'>
                                    
                                    <fmt:message key="make_order" />
                                </a>  
                            </li>
                        </c:if>
                    </c:if>   
                    <c:if test="${not empty pageContext.request.userPrincipal}">
                        <li><a class='logout' >
                                <fmt:message key="log_out" />
                            </a>  
                        </li>
                    </c:if>    
                </ul>

            </div>
        </div>

        <script src="js/header.js"></script> 
        <c:if test="${not empty pageContext.request.userPrincipal}">
            <script src="js/logout.js"></script>     
        </c:if>    

    </body>
</html>