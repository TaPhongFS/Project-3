<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Thêm tòa nhà</title>
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
                    <li class="active">Thêm mới tòa nhà</li>
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
                    <form:form modelAttribute="buildingEdit" id="listForm" method="GET">
                        <div class="col-xs-12">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-xs-3">Tên tòa nhà</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="name"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Quận</label>
                                    <div class="col-xs-2">
                                            <%--                                        <select id="districtId" class="form-control" name="districtId">--%>
                                            <%--                                            <option value="">---Chọn Quận---</option>--%>
                                            <%--                                            <option value="1">Quận 1</option>--%>
                                            <%--                                            <option value="2">Quận 2</option>--%>
                                            <%--                                            <option value="3">Quận 3</option>--%>
                                            <%--                                            <option value="4">Quận 10</option>--%>
                                            <%--                                        </select>--%>
                                        <form:select class="form-control" path="district">
                                            <form:option value="">---Chọn Quận---</form:option>
                                            <form:options items="${districts}"></form:options>
                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Phường</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="text" id="ward" name="ward">--%>
                                        <form:input class="form-control" path="ward"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Đường</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="text" id="street" name="street">--%>
                                        <form:input class="form-control" path="street"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Kết cấu</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="text" id="structure" name="structure">--%>
                                        <form:input class="form-control" path="structure"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Số tầng hầm</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="number" id="numberOfBasement"--%>
                                            <%--                                               name="numberOfBasement">--%>
                                        <form:input class="form-control" path="numberOfBasement"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Diện tích sàn</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="number" id="floorArea" name="floorArea">--%>
                                        <form:input class="form-control" path="floorArea"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Hướng</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="text" id="direction" name="direction">--%>
                                        <form:input class="form-control" path="direction"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Hạng</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="text" id="level" name="level">--%>
                                        <form:input class="form-control" path="level"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Diện tích thuê</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="text" id="rentArea" name="rentArea">--%>
                                        <form:input class="form-control" path="rentArea"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Giá thuê</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="number" id="rentPrice" name="rentPrice">--%>
                                        <form:input class="form-control" path="rentPrice"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Mô tả giá</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="text" id="rentPriceDescription"--%>
                                            <%--                                               name="rentPriceDescription">--%>
                                        <form:input class="form-control" path="rentPriceDescription"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Phí dịch vụ</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="number" id="serviceFee" name="serviceFee">--%>
                                        <form:input class="form-control" path="serviceFee"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Phí ô tô</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="number" id="carFee" name="carFee">--%>
                                        <form:input class="form-control" path="carFee"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Phí mô tô</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="number" id="motorbikeFee" name="motoFee">--%>
                                        <form:input class="form-control" path="motoFee"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Phí ngoài giờ</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="number" id="overtimeFee" name="overtimeFee">--%>
                                        <form:input class="form-control" path="overtimeFee"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Tiền điện</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="number" id="electricityFee"--%>
                                            <%--                                               name="electricityFee">--%>
                                        <form:input class="form-control" path="electricityFee"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Đặt cọc</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="number" id="deposit" name="deposit">--%>
                                        <form:input class="form-control" path="deposit"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Thanh toán</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="number" id="payment" name="payment">--%>
                                        <form:input class="form-control" path="payment"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Thời hạn thuê</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="text" id="rentTime" name="rentTime">--%>
                                        <form:input class="form-control" path="rentTime"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Thời gian trang trí</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="text" id="decorationTime"--%>
                                            <%--                                               name="decorationTime">--%>
                                        <form:input class="form-control" path="decorationTime"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Tên quản lý</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="text" id="managerName" name="managerName">--%>
                                        <form:input class="form-control" path="managerName"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">SĐT quản lý</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="text" id="managerPhoneNumber"--%>
                                            <%--                                               name="managerPhoneNumber">--%>
                                        <form:input class="form-control" path="managerPhone"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Phí môi giới</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="number" id="brokerageFee" name="brokerageFee">--%>
                                        <form:input class="form-control" path="brokerageFee" placeholder="0.0"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Loại tòa nhà</label>
                                    <div class="col-xs-9">
                                        <form:checkboxes items="${typeCodes}" path="typeCode"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Ghi chú</label>
                                    <div class="col-xs-9">
                                            <%--                                        <input class="form-control" type="text" id="note" name="note">--%>
                                        <form:input class="form-control" path="note"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 no-padding-right">Hình đại diện</label>
                                    <form:hidden path="image"/>
                                    <input class="col-sm-3 no-padding-right" type="file" id="uploadImage"/>
                                    <div class="col-sm-6">
                                        <c:set var="imagePath" value="/repository${buildingEdit.image}"/>
                                        <img src="${imagePath}" id="viewImage" width="300px" height="300px"
                                             style="margin-top: 50px">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3"></label>
                                    <div class="col-xs-9">
                                        <c:if test="${not empty buildingEdit.id}">
                                            <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">
                                                Cập Nhật Tòa Nhà
                                            </button>
                                        </c:if>
                                        <c:if test="${empty buildingEdit.id}">
                                            <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">
                                                Thêm Mới
                                            </button>
                                        </c:if>
                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác
                                        </button>
                                    </div>
                                </div>
                                <form:hidden path="id" id="buildingId"/>
                            </form>
                        </div>
                    </form:form>

                </div>


            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->


</div><!-- /.main-container -->

<script>

    var imageBase64 = '';
    var imageName = '';

    $('#btnAddOrUpdateBuilding').click(function () {
        var data = {};
        var typeCode = [];
        var formData = $('#listForm').serializeArray();
        $.each(formData, function (i, v) {
            if (v.name != 'typeCode') {
                data["" + v.name + ""] = v.value;
            } else {
                typeCode.push(v.value);
            }
        })

        if ('' !== imageBase64) {
            data['imageBase64'] = imageBase64;
            data['imageName'] = imageName;
        }

        data['typeCode'] = typeCode;

        if (typeCode != '' && data['district'] != '') {
            addOrUpdateBuilding(data);
            if (data['id'] != '') {
                alert("Cập nhật tòa nhà thành công!");
                window.location.href = "/admin/building-list?message=success";
            } else {
                alert("Thêm mới tòa nhà thành công!");
                window.location.href = "/admin/building-list?message=success";
            }
        } else {
            if (data['id'] != '') {
                alert("Cập nhật tòa nhà không thành công!");
                window.location.href = "/admin/building-edit-" + data['id'] + "?typeCode=required&district=required";
            } else {
                alert("Thêm mới tòa nhà không thành công!");
                window.location.href = "<c:url value="/admin/building-edit?typeCode=required&district=required"/>";
            }
        }

    });

    function addOrUpdateBuilding(data) {
        $.ajax({
            type: "POST",
            url: "${buildingAPI}",
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

    $('#uploadImage').change(function (event) {
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function (e) {
            imageBase64 = e.target.result;
            imageName = file.name; // ten hinh khong dau, khoang cach. vd: a-b-c
        };
        reader.readAsDataURL(file);
        openImage(this, "viewImage");
    });

    function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' + imageView).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $('#btnCancel').click(function () {
        window.location.href = "/admin/building-list";
    });
</script>
</body>
</html>
