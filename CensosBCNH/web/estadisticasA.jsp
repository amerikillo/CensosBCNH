<%-- 
    Document   : estadisticasE
    Created on : 24-mar-2014, 12:41:21
    Author     : Americo
--%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conn.ConectionDB"%>
<%@ page import="clasesJava.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //----------------------------------Modulo de Sesiones
    HttpSession sesion = request.getSession();
    ElementosRepetidos cuentaEle = new ElementosRepetidos();
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
                #datos {font-size: 9px;}
                #tabla {width: 800px;}
                #principal{margin-left: 0px;}
                #navi {display:none;}
                #cont {display:none;}
            }
        </style>
    </head>
    <body>
        <!--canvas id="canvas" width="600px" height="400px"-->
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
                </div>
            </div>
        </div>
        <div class="container-fluid" >
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar" id="cont">
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="estadisticasA.jsp">Sección A - DATOS GENERALES</a></li>
                        <div>
                            <ul class="list-group">
                                <li class="list-group-item"><a href="#a1"><small>-Generales</small></a></li>
                                <!--li class="list-group-item"><a href="#a2"><small>-Módulos</small></a></li>
                                <li class="list-group-item"><a href="#a3"><small>-Camas</small></a></li>
                                <li class="list-group-item"><a href="#a4"><small>-Población Atendida</small></a></li-->
                                <li class="list-group-item"><a href="#a5"><small>-Datos</small></a></li>
                            </ul>
                        </div>
                        <!--li class=""><a href="estadisticasB.jsp">Sección B - CONSULTA EXTERNA</a></li>
                        <li class=""><a href="estadisticasC.jsp">Sección C - SERVICIO DE URGENCIAS</a></li>
                        <li class=""><a href="estadisticasD.jsp">Sección D - SERVICIO DE QUIRÓFANO</a></li-->
                        <li class=""><a href="estadisticasE.jsp">Sección E - FARMACIA CONSULTA EXTERNA</a></li>
                        <li class=""><a href="estadisticasF.jsp">Sección F - ALMACENES</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="principal">
                    <a name="a1"></a>
                    <h1 class="page-header">A. DATOS GENERALES</h1>
                    <a name="a1"></a>
                    <h4>Total de Unidades Censadas: <%=tam_cen%></h4>
                    <div class="row placeholders">
                        <div id="e1" class="col-lg-6"></div>
                        <div id="e2" class="col-lg-6"></div>
                    </div>
                    <div class="hidden">
                        <div id="e3" class="col-lg-6"></div>
                    </div>
                    <a name="a2"></a>
                    <!--h4>Módulos</h4-->
                    <div class="hidden">
                        <div id="e4" class="col-lg-12"></div>
                    </div>
                    <a name="a3"></a>
                    <!--h4>Camas</h4-->
                    <div class="hidden">
                        <div id="e5" class="col-lg-6"></div>
                        <div id="e6" class="col-lg-6"></div>
                    </div>
                    <!--a name="a4"></a>
                    <h4>Población Atendida</h4-->
                    <div class="hidden">
                        <div id="e7" class="col-lg-6"></div>
                    </div>



                    <a name="a5"></a>
                    <h2 class="sub-header">Datos</h2>
                    <div class="" id="datos">
                        <table class="table table-striped" id="tabla">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Unidad</th>
                                    <th>Juris</th>
                                    <th>Mpio.</th>
                                    <th>No. Mod.</th>
                                    <th>Tipo</th>
                                    <th>Responsable</th>
                                    <th>Tel.</th>
                                    <th>Pob. Atendida</th>
                                    <th>Camas Censables</th>
                                    <th>Camas no Censables</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    try {
                                        con.conectar();
                                        int i = 0;
                                        ResultSet rset = con.consulta("SELECT a.* FROM tb_a a where a.campo23!='' order by a.id_uni+0;");
                                        while (rset.next()) {
                                            String[] result = rset.getString(16).split(" ");
                                            String juris = result[2];
                                            i++;
                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><small><%=rset.getString(5)%></small></td>
                                    <td><small>J.S. <%=juris%></small></td>
                                    <td><small><%=rset.getString(17)%></small></td>
                                    <td><small><%=rset.getString(18)%></small></td>
                                    <td><small><%=rset.getString(6)%></small></td>
                                    <td><small><%=rset.getString(22)%></small></td>
                                    <td><small><%=rset.getString(23)%></small></td>
                                    <td><small><%=rset.getString(15)%></small></td>
                                    <td><small><%=rset.getString(20)%></small></td>
                                    <td><small><%=rset.getString(21)%></small></td>

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

        <!--/canvas-->

    </body>
    <!-- JAVASCRIPT -->
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/highcharts.js"></script>
    <script src="js/modules/exporting.js"></script>
    <script>

        $(function() {
            Highcharts.setOptions({
                colors: ['#058DC7', '#50B432', '#ED561B', '#DDDF00', '#24CBE5', '#64E572', '#FF9655', '#FFF263', '#6AF9C4']
            });

            $('#e1').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: 'Totales por Jurisdicción'
                },
                tooltip: {
                    pointFormat: '{point.y} Hospital(es)'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                        type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo15, count(campo15) from tb_a where campo23!='' group by campo15;");
                while (rset.next()) {
                    String[] result = rset.getString(1).split(" ");
                    String juris = result[2];
                    String nom_js = "";
                    if (result[2].equals("1")) {
                        nom_js = "MEXICALI";
                    }
                    if (result[2].equals("2")) {
                        nom_js = "TIJUANA";
                    }
                    if (result[2].equals("3")) {
                        nom_js = "ENSENADA";
                    }
                    if (result[2].equals("4")) {
                        nom_js = "MEXICALI";
                    }
        %>
                            ['J.S. <%=juris%> <%=nom_js%>', <%=rset.getString(2)%>],
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
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: 'Totales por Municipio'
                },
                tooltip: {
                    pointFormat: '{point.y} Hospital(es)'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                        type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo16, count(campo16) from tb_a where campo23!='' group by campo16;");
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
                    type: 'bar'
                },
                title: {
                    text: 'Totales por tipo de U.A. censada'
                },
                tooltip: {
                    pointFormat: '<b>{point.y} Hospital(es)</b>',
                },
                legend: {
                    enabled: false
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: null
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'No. de Unidades',
                        align: 'high'
                    },
                    labels: {
                        overflow: 'justify'
                    }
                },
                plotOptions: {
                    bar: {
                        dataLabels: {
                            enabled: true
                        }
                    }
                },
                credits: {
                    enabled: false
                },
                series: [{
                        type: 'bar',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo5, count(campo5) from tb_a where campo23!='' group by campo5;");
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
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: 'Escala de módulos'
                },
                tooltip: {
                    pointFormat: '{point.y} Hospital(es)'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            format: '{point.name}: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                        type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                Vector<String> v = new Vector<String>();
                ResultSet rset = con.consulta("SELECT campo18 FROM tb_a WHERE campo18 NOT IN ('NA', 'N/A', '0') AND campo23 != '';");
                while (rset.next()) {
                    String modulo[] = rset.getString("campo18").split(",");
                    for (int i = 0; i < modulo.length; i++) {
                        /*System.out.println((modulo[i]).trim());*/
                        v.add((modulo[i]).trim());
                    }
                }
                Vector<String> vector = cuentaEle.cuentaElementos(v);
                for (int i = 0; i < vector.size(); i++) {
                    String ele = vector.elementAt(i);
                    String valor[] = ele.split(",");
        %>
                            ['<%=valor[0]%>', <%=valor[1]%>],
        <%
                }

                con.cierraConexion();
            } catch (Exception e) {
            }
        %>

                        ]
                    }]
            });


            $('#e5').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Camas Censables por Hospital'
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
                        text: 'No. de Camas Censables',
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
                    pointFormat: '<b>{point.y} Camas Censables</b>',
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
                ResultSet rset = con.consulta("SELECT campo4, campo19 from tb_a where campo23!='';");
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


            $('#e6').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Camas NO Censables por Hospital'
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
                        text: 'No. de Camas No Censables',
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
                    pointFormat: '<b>{point.y} Camas No Censables</b>',
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
                ResultSet rset = con.consulta("SELECT campo4, campo20 from tb_a where campo23!='';");
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

            $('#e7').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Población Atendida'
                },
                tooltip: {
                    // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: 'Población'
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'No. de Hospitales',
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
                    pointFormat: 'En <b>{point.y} Hospital(es) </b>',
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
                ResultSet rset = con.consulta("SELECT campo14, count(campo14) from tb_a where campo23!='' group by id_uni;");
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
