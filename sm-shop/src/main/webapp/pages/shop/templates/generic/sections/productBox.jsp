<%
response.setCharacterEncoding("UTF-8");
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="/WEB-INF/java_spring-tags.tld" prefix="sm" %> 
 
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
										<c:forEach items="${requestScope.ITEMS}" var="product">
										<div class="single-new-product single-new-product-override">
												<div class="product-img">
													<c:if test="${product.image!=null}"><a href="<c:url value="/shop/product/" /><c:out value="${product.description.friendlyUrl}"/>.html"><img src="<sm:shopProductImage imageName="${product.image.imageName}" sku="${product.sku}"/>" class="first_img"/></a></c:if>
												</div>
												<div class="product-content text-center">
													<h3>${product.description.name}</h3>
													<h4><c:choose>
															<c:when test="${product.discounted}">
																<del><c:out value="${product.originalPrice}" /></del>&nbsp;<span class="specialPrice"><c:out value="${product.finalPrice}" /></span>
															</c:when>
															<c:otherwise>
																<c:out value="${product.finalPrice}" />
															</c:otherwise>
														</c:choose>
													</h4>
													<br>
													<h5>
														<a href="<c:url value="/shop/product/" /><c:out value="${product.description.friendlyUrl}"/>.html<sm:breadcrumbParam productId="${product.id}"/>"><s:message code="button.label.view" text="Details" /></a> <c:choose><c:when test="${requestScope.FEATURED==true}"><c:if test="${requestScope.CONFIGS['displayAddToCartOnFeaturedItems']==true}">/ <a class="addToCart" href="#" productId="${product.id}"><s:message code="button.label.addToCart" text="Add to cart" /></a></c:if></c:when><c:otherwise>/ <a class="addToCart" href="#" productId="${product.id}"><s:message code="button.label.addToCart" text="Add to cart" /></a></c:otherwise></c:choose>
													</h5>
												</div>
										</div>
										</c:forEach>   