<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${requestScope.lang}" />
<fmt:setBundle basename="ui.lang.lang" />

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.util.ArrayList, domain.Cart, domain.CartItem"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel='stylesheet' type='text/css' href='css/cart.css'>
    </head>
    <c:set var="cart" value="${sessionScope.cart}"/>
    <body>
        <jsp:include page="header.jsp" >
            <jsp:param name="activeTab" value="cart" />
        </jsp:include>
        <br>
        <c:choose>
            <c:when test="${cart.isEmpty()}">
                <div class="empty_message"> 
                    <fmt:message key="empty_cart_message" />
                </div>
            </c:when>



            <c:otherwise>   
                <c:forEach var="item" items="${cart.getCartItemList()}">

                    <div class="main_div">
                        <div id="image">
                            <img src="<c:out value="${item.getPicture()}"/>"/>
                        </div>
                        <div id="layout_vertical">


                            <h2> <c:out value="${item.getName()}"/> </h2>

                            <div id="description">	
                                <c:out value="${item.getDescription()}"/>           
                            </div>
                        </div>

                        <div class="layout_vertical_right">
                            <div id="price">$<c:out value="${item.getPrice()}"/> </div>
                            <div class="amount">
                                <div class="amount_button" action="remove" 
                                     product_id="<c:out value="${item.getId()}"/>">
                                    -
                                </div>
                                <div class="amount_value"><c:out value="${item.getAmount()}"/></div>
                                <div class="amount_button" action="add"
                                     product_id="<c:out value="${item.getId()}"/>">
                                    +
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>                

                </c:forEach>
                <div class="total">
                    <div class="total_price">
                        $<c:out value="${cart.getTotalPrice()}"/>
                    </div>
                    <div class="total_phrase">
                        <fmt:message key="total_cost" /> 
                    </div>

                </div>
                    <div class="make_order_button">
                        <a href="order">
                            Оформить заказ
                        </a>
                    </div>

                <script src="js/cart.js"></script>

            </c:otherwise>         
        </c:choose>         



        <br>

    </body>
</html>
