<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>H+ 后台主题UI框架 - Bootstrap Table</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="${res}/hplus4.2/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${res}/hplus4.2/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${res}/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
    <link href="${res}/hplus4.2/css/animate.css" rel="stylesheet">
    <link href="${res}/hplus4.2/css/style.css?v=4.1.0" rel="stylesheet">
    

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        
        <!-- Panel Other -->
        <div class="ibox float-e-margins">

            <div class="ibox-content">
                <div class="row row-lg">

                    <div class="col-sm-12">
                        <!-- Example Events -->
                        <div class="example-wrap">
                            <div class="example">
                                <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                                    <button type="button" class="btn btn-outline btn-default">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline btn-default">
                                        <i class="glyphicon glyphicon-heart" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline btn-default">
                                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                    </button>
                                </div>
                                <table id="exampleTableEvents" data-height="400" data-mobile-responsive="true">
                                    <thead>
                                        <tr>
                                            <th data-field="state" data-checkbox="true"></th>
                                            <th data-field="id">ID</th>
                                            <th data-field="name">名称</th>
                                            <th data-field="price">价格</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                        <!-- End Example Events -->
                    </div>
                </div>
            </div>
        </div>
        <!-- End Panel Other -->
    </div>

    <!-- 全局js -->
    <script src="${res}/hplus4.2/js/jquery.min.js?v=2.1.4"></script>
    <script src="${res}/hplus4.2/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="${res}/hplus4.2/js/content.js?v=1.0.0"></script>


    <!-- Bootstrap table -->
    <script src="${res}/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
    <script src="${res}/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.js"></script>

    <!-- Peity -->
    <%-- <script src="${res}/hplus4.2/js/demo/bootstrap-table-demo.js"></script> --%>
    
    <script type="text/javascript">
    
    $(function(){
    	$('#exampleTableEvents').bootstrapTable({
            url: "${res}/bootstrap_table_test.json",
            search: true,
            pagination: true,
            showRefresh: true,
            showToggle: false,
            showColumns: true,
            iconSize: 'outline',
            toolbar: '#exampleTableEventsToolbar',
            icons: {
              refresh: 'glyphicon-repeat',
              toggle: 'glyphicon-list-alt',
              columns: 'glyphicon-list'
            }
          });
    });
    
    </script>

</body>

</html>
