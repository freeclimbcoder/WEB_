<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${requestScope.lang}" />
<fmt:setBundle basename="ui.lang.lang" />
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="domain.*"%>
<%
    Goods goods = Shop.getGoodsById((Integer) request.getAttribute("id"), (String) request.getAttribute("lang"));
    if (goods == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }


%>
<!DOCTYPE html>
<html>
    <meta charset='utf-8'>
    <head>
        <title>
            <fmt:message key="shop" />
        </title>
        <link rel='stylesheet' type='text/css' href='css/style.css'>

    </head>
    <body>
        <jsp:include page="header.jsp" />
        <br>

        <div class='content'>
            <h2><%=goods.getName()%></h2>

            <div class='lay_horisontal'>
                <div class='photo_cont'>
                    <img src='<%=goods.getMainPhoto()%>'>
                </div>
                <div class='lay_vertical'>
                    <div class='price'> $<%=goods.getPrice()%> </div>

                    <div class='buy_button'
                         product_id='<%=goods.getId()%>'>
                        <fmt:message key="buy" />
                    </div>
                </div>
            </div>

            <div class='info'>
                <ul>
                    <li><a href='#' id='description_tab'>
                            <fmt:message key="information" />
                        </a></li>
                    <li><a href='#' id='propertys_tab'>
                            <fmt:message key="properties" />
                        </a></li>
                    <li><a href='#' id='reviews_tab'>
                            <fmt:message key="reviews" />
                        </a></li>
                </ul>
                <div class='descr'>

                    <%=goods.getInformation()%>

                </div>

                <div class='prop'>
                    <% for (Property property : goods.getProperties()) {%> 
                    <%=property.getProperty()%>

                    <b><%=property.getValue()%></b> 
                    <br/> 

                    <%}%>

                </div>

                <div class='reviews'>
                    <% for (Review review : goods.getReviews()) {%>
                    <b><%=review.getAuthor()%></b> 
                    <br/> <%=review.getReview()%><br/> 

                    <%}%>
                </div>

            </div>
        </div>
    <service_inf value = '<%=getServletContext().getInitParameter("default_tab")%>'/>
    <script src="js/buy_buttons.js"></script>
    <script type='text/javascript' src='js/script.js'></script> 
</body>
</html>
