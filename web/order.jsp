<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${requestScope.lang}" />
<fmt:setBundle basename="ui.lang.lang" />
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="domain.*"%>

<!DOCTYPE html>
<html>
    <meta charset='utf-8'>
    <head>
        <title>
            <fmt:message key="shop" />
        </title>
        <link rel='stylesheet' type='text/css' href='css/style.css'>
        <link rel='stylesheet' type='text/css' href='css/order.css'>

    </head>
    <body>
        <jsp:include page="header.jsp" >
                    <jsp:param name="activeTab" value="order" />
        </jsp:include>            

        <div class="pickup">
            <div class="radio">
                <input type="radio" name="type" id="pickup" value="pickup" checked="true"> 
                <label for="pickup" ><fmt:message key="pickup" /> </label> 

            </div>
            <div class="map" id="map">
            </div>
            <ul class="shop_list">
                <li>
                    <input type="radio" name="address" id="addr_1"value="Казансая 25" checked="true">
                    <label for="addr_1">Казанская 25</label> 
                </li>
                <li>
                    <input type="radio" name="address" id="addr_2" value="Ветеранов 130">
                    <label for="addr_2">Ветеранов 130</label> 
                </li>
                <li>
                    <input type="radio" name="address" id="addr_3" value=" Невский 21">  
                    <label for="addr_3">Невский 21</label> 
                </li>
            </ul>
        </div>

        <br>
        <div class="delivery">
            <div class="radio">
                <input type="radio" name="type" id="delivery" value="delivery">
                <label for="delivery"><fmt:message key="delivery" /> </label> 
            </div>	
            <input type="text" name="address" id="address" >
            <br><br>
            <button type="button" id="order_button"><fmt:message key="make_order" /></button>
        </div>
        <script src="js/order.js"></script>
        <script src="http://api-maps.yandex.ru/2.1/?lang=ru_RU"></script>
        <script src="js/map.js"></script>
    </body>
</html>
