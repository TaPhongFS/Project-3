
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerAPI" value="/api/customer"/>
<html>
<head>
    <title>Thêm khách hàng</title>
</head>
<body>

<div class="main-content" id="main-container">
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {
                    }
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Thêm mới khách hàng</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        Dashboard
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                    <form:form modelAttribute="customerEdit" id="listForm" method="GET">
                        <div class="col-xs-12">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-xs-3">Tên khách hàng</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="fullname"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Số điện thoại</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="text" id="ward" name="ward">--%>
                                        <form:input class="form-control" path="phone"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Email</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="text" id="street" name="street">--%>
                                        <form:input class="form-control" path="email"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Tên công ty</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="text" id="structure" name="structure">--%>
                                        <form:input class="form-control" path="companyName"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Nhu Cầu</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="number" id="numberOfBasement"--%>
                                            <%--                                               name="numberOfBasement">--%>
                                        <form:input class="form-control" path="demand"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Tình trạng</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="number" id="floorArea" name="floorArea">--%>
                                        <form:input class="form-control" path="status"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3"></label>
                                    <div class="col-xs-9">
                                        <c:if test="${not empty customerEdit.id}">
                                            <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">
                                                Cập Nhật Khách Hàng
                                            </button>
                                        </c:if>
                                        <c:if test="${empty customerEdit.id}">
                                            <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">
                                                Thêm Mới Khách Hàng
                                            </button>
                                        </c:if>
                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác
                                        </button>
                                    </div>
                                </div>
                                <form:hidden path="id" id="customerId"/>
                            </form>
                        </div>
                    </form:form>

                </div>

            </div>
        </div>
    </div>
</div>

<script>

    $('#btnAddOrUpdateCustomer').click(function () {
        var data = {};
        var formData = $('#listForm').serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        })


        if (data['phone'] != '' && data['fullname'] != '') {
            addOrUpdateBuilding(data);
            if (data['id'] != '') {
                alert("Cập nhật khách hàng thành công!");
                window.location.href = "/admin/customer-list?message=success";
            } else {
                alert("Thêm mới khách hàng thành công!");
                window.location.href = "/admin/customer-list?message=success";
            }
        } else {
            if (data['id'] != '') {
                alert("Cập nhật khách hàng không thành công!");
                window.location.href = "/admin/customer-edit-" + data['id'] + "?phone=required&fullname=required";
            } else {
                alert("Thêm mới khách hàng không thành công!");
                window.location.href = "<c:url value="/admin/customer-edit?phone=required&fullname=required"/>";
            }
        }

    });

    function addOrUpdateBuilding(data) {
        $.ajax({
            type: "POST",
            url: "${customerAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (respond) {
                console.log("Success");
            },
            error: function (respond) {
                console.log("Failed");
                console.log(respond);
            }
        });
    }


    $('#btnCancel').click(function () {
        window.location.href = "/admin/customer-list";
    });
</script>

</body>
</html>
