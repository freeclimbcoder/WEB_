<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${requestScope.lang}" />
<fmt:setBundle basename="ui.lang.lang" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="item" class="domain.Goods" scope="request" />

<head>
	<link rel='stylesheet' type='text/css' href='css/list_styles.css'>
</head>
<body>
    <div class="main_div">
       
	<div id="image">
            <img src="<jsp:getProperty name="item" property="mainPhoto"/>">
	</div>
        <div id="layout_vertical">
            <a href="product?id=<jsp:getProperty name="item" property="id"/>">
            
            <h2><jsp:getProperty name="item" property="name"/></h2>
            </a>
            <div id="description">	
                <jsp:getProperty name="item" property="information"/>           
            </div>
	</div>

	<div class="layout_vertical_right">
            <div id="price">
                $<jsp:getProperty name="item" property="price"/>    
            </div>
            <div class="buy_button" 
                 product_id="<jsp:getProperty name="item" property="id"/>">
                 <fmt:message key="buy" />
            </div>
	</div>
    </div>
            
</body>
