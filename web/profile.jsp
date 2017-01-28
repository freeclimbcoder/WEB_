<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${requestScope.lang}" />
<fmt:setBundle basename="ui.lang.lang" />

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.util.ArrayList, domain.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel='stylesheet' type='text/css' href='css/cart.css'>
        <link rel='stylesheet' type='text/css' href='css/profile.css'>
    </head>
    
    <body>
        <jsp:include page="header.jsp" >
            <jsp:param name="activeTab" value="profile" />
        </jsp:include>
        <br>
        
        <div id="time"></div>
        <br>
        
        
        <fmt:message key="your_name" /> - ${pageContext.request.userPrincipal.name}
        <br>
        <fmt:message key="default_tab" /> - ${initParam.default_tab}

        <br>
        <div id="time"></div>
        <br>

        <div id="comments">
            <c:forEach var="comment" items="${requestScope.comments}">
                <div class="comment">
                    <div class="comment_author">
                        <c:out value="${comment.getUserName()}"/>
                    </div>
                    <div class="comment_date">
                        <c:out value="${comment.getFormatedDate(requestScope.lang)}"/>
                    </div>
                    <div class="comment_text">
                        <c:out value="${comment.getMessage()}"/>
                    </div>
                </div>
            </c:forEach>
            
        </div>
        <br>
        <textarea id ='comment_text'></textarea>
        <br>
        <button id ='comment_button'>comment</button>
        <br>
        <br>

        <c:set var="orders" value="${requestScope.orders}"/>

        <c:forEach var="order" items="${orders}">
            <fmt:message key="order_number" />
            <c:out value="${order.getId()}"/>
            <br>
            <fmt:message key="order_date" />
            <c:out value="${order.getDate()}"/>
            <br>

            <c:choose>
                <c:when test="${order.isDelivery()}">
                   <fmt:message key="delivery" />
                </c:when>
                <c:otherwise>
                    <fmt:message key="pickup" />
                </c:otherwise>
            </c:choose>
            <c:out value="${order.getAddress()}"/>
            <br>

            <fmt:message key="total_cost" />
            $<c:out value="${order.getTotalPrice()}"/>






            <c:forEach var="item" items="${order.getCart().getCartItemList()}">
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

                           
                                <fmt:message key="count" />
                                <c:out value="${item.getAmount()}"/>

                        </div>
                    </div>
                </div>
                <br>                
            </c:forEach>

        </c:forEach>

                <script src='js/comment.js'></script> 
                <script src='js/time.js'></script>           

    </body>
</html>
