<%-- 
    Document   : estadisticasE
    Created on : 24-mar-2014, 12:41:21
    Author     : Americo
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conn.ConectionDB"%>
<%@ page import="clasesJava.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //----------------------------------Modulo de Sesiones
    HttpSession sesion = request.getSession();
    String val = "", user = "", id = "";
    String id_uni = "";
    session.getId();
    if (sesion.getAttribute("valida") != null) {
        val = (String) sesion.getAttribute("valida");
        user = (String) sesion.getAttribute("nombre");
        id = (String) sesion.getAttribute("id");
        id_uni = request.getParameter("id_uni");
    }
    if (!val.equals("valida")) {
        //response.sendRedirect("index.jsp");
    }
//out.print (val+user+id+session.getId());
//--------------------------------------------------------
    int tam_cen = 0;
    ConectionDB con = new ConectionDB();
    ClasesProc objR = new ClasesProc();
    tam_cen = objR.regresaCont();


%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estadísticas de Hospitales</title>
        <!--Estilos de BootStrap-->
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/dashboard.css" rel="stylesheet" />
        <!---->
        <style type="text/css" media="print">
            @media print {
                #datos {font-size: 11px;}
                #tabla {width: 800px;}
                #principal{margin-left: 0px;}
                #navi {display:none;}
                #cont {display:none;}
            }
        </style>
    </head>
    <body>
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="navi">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Estadísticas de Hospitales</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <ul class="nav navbar-nav navbar-right">
                            <li class=""><a href="http://166.78.128.202:8080/CensosBCNR/indexSelec.html">Men&uacute;</a></li>
                        <li class=""><a href="consultaCensosH.jsp">Censos Hospitales</a></li>
                        <li class=""><a href="http://166.78.128.202:8080/CensosBCNR/consultaCensosR.jsp">Censos 1er Nivel</a></li>
                        <li class=""><a href="http://166.78.128.202:8080/CensosBCNR/consultaJuris.jsp">Censos Jurisdicciones</a></li>
                        <li class=""><a href="http://166.78.128.202:8080/CensosBCNR/consultaJuris.jsp">Entrevistas Jurisdicciones</a></li>
                        <!--li class=""><a href="http://166.78.128.202:8080/CensosBCNR/index.jsp">Inventarios</a></li>
                        <li><a data-toggle="modal" href="#myModal2">Instrucciones</a></li>
                        <li><a data-toggle="modal" href="#myModal">Sistemas</a></li-->
                        <li class="active"><A HREF="javascript:window.print()">Imprimir</A></li>
                        <li class=""><A HREF="exportarExcel.jsp">Exportar Información</A></li>
                        <li><a href="http://166.78.128.202:8080/CensosBCNR/index.jsp">Salir</a></li>
                        </ul>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar" id="cont">
                    <ul class="nav nav-sidebar">
                        <li class=""><a href="estadisticasA.jsp">Sección A - DATOS GENERALES</a></li>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="estadisticasB.jsp">Sección B - CONSULTA EXTERNA</a></li>
                        <ul class="list-group">
                            <li class="list-group-item"><a href="#a1"><small>-Generales</small></a></li>
                            <li class="list-group-item"><a href="#a2"><small>-Datos</small></a></li>
                        </ul>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li class=""><a href="estadisticasC.jsp">Sección C - SERVICIO DE URGENCIAS</a></li>
                        <li class=""><a href="estadisticasD.jsp">Sección D - SERVICIO DE QUIRÓFANO</a></li>
                        <li class=""><a href="estadisticasE.jsp">Sección E - FARMACIA CONSULTA EXTERNA</a></li>
                        <li class=""><a href="estadisticasF.jsp">Sección F - ALMACENES</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main " id="principal">
                    <a name="a1"></a>
                    <h1 class="page-header">B. CONSULTA EXTERNA</h1>
                    <h4>Total de Unidades Censadas: <%=tam_cen%></h4>
                    <div class="row placeholders">
                        <div id="e1" class="col-lg-6"></div>
                        <div id="e2" class="col-lg-6"></div>
                    </div>

                    <div class="row placeholders">
                        <div id="e3" class="col-lg-6"></div>
                        <div id="e4" class="col-lg-6"></div>
                    </div>




                    <a name="a2"></a>
                    <h2 class="sub-header">Datos</h2>
                    <div class="" id="datos">
                        <table class="table table-striped" id="tabla">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Unidad</th>
                                    <th>Consultorios 1er Nivel</th>
                                    <th>Consultorios 2do Nivel</th>
                                    <th>Consultas 1er Nivel</th>
                                    <th>Consultas 2do Nivel</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    try {
                                        con.conectar();
                                        int i = 0;
                                        ResultSet rset = con.consulta("SELECT a.campo4, b.* FROM tb_a a, tb_b b where a.id_uni = b.id_uni and a.campo23!='';");
                                        while (rset.next()) {
                                            i++;
                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%=rset.getString(1)%></td>
                                    <td><%=rset.getString(3)%></td>
                                    <td><%=rset.getString(4)%></td>
                                    <td><%=rset.getString(5)%></td>
                                    <td><%=rset.getString(6)%></td>
                                </tr>
                                <%
                                        }
                                        con.cierraConexion();
                                    } catch (Exception e) {
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <!-- JAVASCRIPT -->
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/highcharts.js"></script>
    <script src="js/modules/exporting.js"></script>
    <script type="text/javascript">
        $(function() {
            Highcharts.setOptions({
                colors: ['#058DC7', '#50B432', '#ED561B', '#DDDF00', '#24CBE5', '#64E572', '#FF9655', '#FFF263', '#6AF9C4']
            });


            $('#e1').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Número de Consultorios de Primer Nivel por Unidad'
                },
                tooltip: {
                    // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: 'Hospitales'
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'No. de Consultorios',
                        align: 'high'
                    },
                    labels: {
                        overflow: 'justify'
                    }
                },
                legend: {
                    enabled: false
                },
                tooltip: {
                    pointFormat: 'Cuenta con: <b>{point.y} Consultorios 1er Nivel</b>',
                },
                        /*plotOptions: {
                         bar: {
                         dataLabels: {
                         enabled: true
                         }
                         }
                         },*/
                        series: [{
                                name: 'Total',
                                data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT a.campo4, b.campo24 from tb_a a, tb_b b where a.id_uni=b.id_uni and a.campo23!='';");
                while (rset.next()) {
        %>
                                    ['<%=rset.getString(1)%>', <%=rset.getString(2)%>],
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>

                                ]
                            }]
            });


            $('#e2').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Número de Consultorios de Segundo Nivel por Unidad'
                },
                tooltip: {
                    // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: 'Hospitales'
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'No. de Consultorios',
                        align: 'high'
                    },
                    labels: {
                        overflow: 'justify'
                    }
                },
                legend: {
                    enabled: false
                },
                tooltip: {
                    pointFormat: 'Cuenta con: <b>{point.y} Consultorios 2do Nivel</b>',
                },
                        /*plotOptions: {
                         bar: {
                         dataLabels: {
                         enabled: true
                         }
                         }
                         },*/
                        series: [{
                                name: 'Total',
                                data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT a.campo4, b.campo25 from tb_a a, tb_b b where a.id_uni=b.id_uni and a.campo23!='';");
                while (rset.next()) {
        %>
                                    ['<%=rset.getString(1)%>', <%=rset.getString(2)%>],
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>

                                ]
                            }]
            });


            $('#e3').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Consultas Promedio por Consultorio de Primer Nivel por Unidad'
                },
                tooltip: {
                    // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: 'Hospitales'
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'No. de Consultas',
                        align: 'high'
                    },
                    labels: {
                        overflow: 'justify'
                    }
                },
                legend: {
                    enabled: false
                },
                tooltip: {
                    pointFormat: '<b>{point.y} Consultas Diarias</b>',
                },
                        /*plotOptions: {
                         bar: {
                         dataLabels: {
                         enabled: true
                         }
                         }
                         },*/
                        series: [{
                                name: 'Total',
                                data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT a.campo4, b.campo26 from tb_a a, tb_b b where a.id_uni=b.id_uni and a.campo23!='';");
                while (rset.next()) {
        %>
                                    ['<%=rset.getString(1)%>', <%=rset.getString(2)%>],
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>

                                ]
                            }]
            });


            $('#e4').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Consultas Promedio por Consultorio de Segundo Nivel por Unidad'
                },
                tooltip: {
                    // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: 'Hospitales'
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'No. de Consultas',
                        align: 'high'
                    },
                    labels: {
                        overflow: 'justify'
                    }
                },
                legend: {
                    enabled: false
                },
                tooltip: {
                    pointFormat: '<b>{point.y} Consultas Diarias</b>',
                },
                        /*plotOptions: {
                         bar: {
                         dataLabels: {
                         enabled: true
                         }
                         }
                         },*/
                        series: [{
                                name: 'Total',
                                data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT a.campo4, b.campo27 from tb_a a, tb_b b where a.id_uni=b.id_uni and a.campo23!='';");
                while (rset.next()) {
        %>
                                    ['<%=rset.getString(1)%>', <%=rset.getString(2)%>],
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>

                                ]
                            }]
            });


        });
    </script>
</html>
