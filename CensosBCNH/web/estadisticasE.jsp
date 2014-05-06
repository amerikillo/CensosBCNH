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
    String val = "", user = "", id = "";
    ElementosRepetidos cuentaEle = new ElementosRepetidos();
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
                /*#datos {font-size: 12px;}
                #tabla {width: 800px;}*/
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
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar" id="cont">
                    <ul class="nav nav-sidebar">
                        <li class=""><a href="estadisticasA.jsp">Sección A - DATOS GENERALES</a></li>
                        <!--li class=""><a href="estadisticasB.jsp">Sección B - TAREAS OPERACIONALES</a></li>
                        <li class=""><a href="estadisticasC.jsp">Sección C - SERVICIO DE URGENCIAS</a></li>
                        <li class=""><a href="estadisticasD.jsp">Sección D - SERVICIO DE QUIRÓFANO</a></li-->
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="estadisticasE.jsp">Sección E - FARMACIA CONSULTA EXTERNA</a></li>
                        <ul class="list-group">
                            <!--li class="list-group-item"><a href="#a1"><small>-Generales</small></a></li-->
                            <li class="list-group-item"><a href="#a2"><small>-Personal y Servicio</small></a></li>
                            <li class="list-group-item"><a href="#a3"><small>-COFEPRIS</small></a></li>
                            <li class="list-group-item"><a href="#a4"><small>-Insumo Médico</small></a></li>
                            <li class="list-group-item"><a href="#a5"><small>-Surtido de Médicamento</small></a></li>
                            <!--li class="list-group-item"><a href="#a6"><small>-Características de la Farmacia</small></a></li-->
                            <li class="list-group-item"><a href="#a7"><small>-Equipo de Cómputo y Sistema Informático</small></a></li>
                            <li class="list-group-item"><a href="#a8"><small>-Paciente</small></a></li>
                            <li class="list-group-item"><a href="#a9"><small>-Servicios de la Farmacia</small></a></li>
                            <li class="list-group-item"><a href="#a10"><small>-Inventario y Abasto</small></a></li>
                        </ul>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li class=""><a href="estadisticasF.jsp">Sección F - ALMACENES</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="principal">
                    <a name="a1"></a>
                    <h1 class="page-header">E. FARMACIA CONSULTA EXTERNA</h1>
                    <h4>Total de Unidades Censadas: <%=tam_cen%></h4>

                    <div class="hidden">
                        <div id="e1" class="col-lg-12"></div>
                    </div>
                    <a name="a2"></a>
                    <h4 class="page-header">Personal y Servicio</h4>
                    <div class="row placeholders">
                        <div id="e2" class="col-lg-6"></div>
                        <div id="e3" class="col-lg-6"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e4" class="col-lg-6"></div>
                    </div>
                    <a name="a3"></a>
                    <h4 class="page-header">COFEPRIS</h4>
                    <div class="row placeholders">
                        <div id="e5" class="col-lg-6"></div>
                    </div>
                    <a name="a4"></a>
                    <h4 class="page-header">Insumo Médico</h4>
                    <div class="row placeholders">
                        <div id="e6" class="col-lg-6"></div>
                        <div id="e7" class="hidden"></div>
                        <div id="e8" class="col-lg-6"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e9" class="hidden"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e10" class="col-lg-6"></div>
                    </div>

                    <div class="row placeholders">
                        <div id="e32" class="col-lg-6"></div>
                        <div id="e42" class="col-lg-6"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e43" class="col-lg-6"></div>
                        <div id="e44" class="col-lg-6"></div>
                    </div>
                    
                    <div class="row placeholders">
                        <div id="e30" class="col-lg-6"></div>
                        <div id="e31" class="col-lg-6"></div>
                    </div>
                    <a name="a5"></a>
                    <h4 class="page-header">Surtido de Médicamento</h4>
                    <div class="row placeholders">
                        <div id="e33" class="col-lg-4"></div>
                        <div id="e34" class="col-lg-4"></div>
                        <div id="e35" class="col-lg-4"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e37" class="col-lg-4"></div>
                        <div id="e39" class="col-lg-8"></div>
                    </div>
                    <!--a name="a6"></a>
                    <h4 class="page-header">Características de la Farmacia</h4-->
                    <div class="hidden">
                        <div id="e11" class="col-lg-6"></div>
                    </div>
                    <div class="hidden">
                        <div id="e12" class="col-lg-6"></div>
                        <div id="e13" class="col-lg-6"></div>
                    </div>
                    <div class="hidden">
                        <div id="e14" class="col-lg-6"></div>
                        <div id="e15" class="col-lg-6"></div>
                    </div>
                    
                    <a name="a7"></a>
                    <h4 class="page-header">Equipo de Cómputo y Sistema Informático</h4>
                    <div class="row placeholders">
                        <div id="e16" class="hidden"></div>
                        <div id="e17" class="hidden"></div>
                        <div id="e19" class="col-lg-6"></div>
                    </div>

                    <div class="row placeholders">
                        <div id="e18" class="hidden"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e20" class="col-lg-6"></div>
                        <div id="e21" class="col-lg-6"></div>
                    </div>

                    <div class="row placeholders">
                        <div id="e40" class="hidden"></div>
                        <div id="e41" class="col-lg-6"></div>
                    </div>
                    <a name="a8"></a>
                    <h4 class="page-header">Paciente</h4>
                    <div class="row placeholders">
                        <div id="e22" class="col-lg-6"></div>
                        <div id="e23" class="col-lg-6"></div>
                    </div>

                    <a name="a9"></a>
                    <h4 class="page-header">Servicios de la Farmacia</h4>
                    <div class="row placeholders">
                        <div id="e24" class="col-lg-6"></div>
                        <div id="e27" class="hidden"></div>
                    </div>
                    <div class="hidden">
                        <div id="e25" class="col-lg-6"></div>
                        <div id="e26" class="col-lg-6"></div>
                    </div>

                    <div class="row placeholders">
                        <div id="e28" class="hidden"></div>
                        <div id="e29" class="hidden"></div>
                    </div>

                    <a name="a10"></a>
                    <h4 class="page-header">Inventario y Abasto</h4>
                    <div class="row placeholders">
                        <div id="e36" class="col-lg-6"></div>
                        <div id="e38" class="col-lg-6"></div>
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


            /*
             * Primera Seccion
             */
            $('#e1').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: 'Unidades con Servicio de Farmacia'
                },
                tooltip: {
                    pointFormat: 'cuenta(n) con el Servicio: {point.y} Hospital(es)'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            format: '<b>{point.name} Cuenta(n) con el Servicio</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                        type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo34,count(campo34) from tb_e where campo34 != '' GROUP BY campo34 ;");
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


            /*
             * ----------------------------------------------------------------
             */
            $('#e2').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: 'Horario de Atención'
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
                            format: '<b>{point.name} </b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                        type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo35, campo36, count(id_uni) from tb_e where campo35 != '' GROUP BY campo35,campo36 ;");
                while (rset.next()) {
        %>
                            ['<%=rset.getString(1)%> - <%=rset.getString(2)%>', <%=rset.getString(3)%>],
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>

                                                ]
                                            }]
                                    });

                                    /*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e3').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: 'Personal en Farmacia'
                                        },
                                        tooltip: {
                                            // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        xAxis: {
                                            categories: [],
                                            title: {
                                                text: 'Hospital'
                                            }
                                        },
                                        yAxis: {
                                            min: 0,
                                            title: {
                                                text: 'Personal',
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
                                            pointFormat: '<b>{point.y} Empleados</b>',
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
                ResultSet rset = con.consulta("select campo4,campo37 from tb_e, tb_a where tb_a.id_uni = tb_e.id_uni and campo37 != '' GROUP BY campo4 ;");
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

                                    /*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e4').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: 'Turnos en Farmacia'
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
                                                text: 'Turnos',
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
                                            pointFormat: 'Medicamentos por receta en: <b>{point.y} Turnos</b>',
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
                ResultSet rset = con.consulta("select campo4,campo38 from tb_e, tb_a where tb_a.id_uni = tb_e.id_uni and campo38 != '' GROUP BY campo4 ;");
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

                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e5').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: 'Certificación de la COFEPRIS'
                                        },
                                        tooltip: {
                                            pointFormat: 'Están Certificados: {point.y} Hospitales'
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
                ResultSet rset = con.consulta("select campo39,count(campo39) from tb_e where campo39 != '' GROUP BY campo39 ;");
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


                                    /*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e6').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: 'Insumos que se Manejan'
                                        },
                                        tooltip: {
                                            // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        xAxis: {
                                            categories: [],
                                            title: {
                                                text: 'Tipo'
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
                                            pointFormat: '<b>{point.y} Hospital(es)</b>',
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
                Vector<String> v = new Vector<String>();
                ResultSet rset = con.consulta("SELECT campo40 FROM tb_e WHERE campo40 NOT IN ('NA', 'N/A', '0') AND campo40 != '';");
                while (rset.next()) {
                    String modulo[] = rset.getString("campo40").split(",");
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
                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e7').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: 'Unidades Con Licencia Sanitaria'
                                        },
                                        tooltip: {
                                            pointFormat: '{point.y} Cuentan con Licencia'
                                        },
                                        plotOptions: {
                                            pie: {
                                                allowPointSelect: true,
                                                cursor: 'pointer',
                                                dataLabels: {
                                                    enabled: true,
                                                    color: '#000000',
                                                    connectorColor: '#000000',
                                                    format: '<b>{point.name} cuentan con licencia</b>: {point.percentage:.1f} %'
                                                }
                                            }
                                        },
                                        series: [{
                                                type: 'pie',
                                                name: 'Total',
                                                data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo41,count(campo41) from tb_e where campo41 != '' GROUP BY campo41 ;");
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


                                    
                                    /*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e8').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: '¿Cómo surten los Insumo Médicos?'
                                        },
                                        tooltip: {
                                            // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        xAxis: {
                                            categories: [],
                                            title: {
                                                text: 'Medicamentos por receta'
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
                                            pointFormat: '<b>{point.y} HOspital(es)</b>',
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
                Vector<String> v = new Vector<String>();
                ResultSet rset = con.consulta("SELECT campo42 FROM tb_e WHERE campo42 NOT IN ('NA', 'N/A', '0') AND campo42 != '';");
                while (rset.next()) {
                    String modulo[] = rset.getString("campo42").split(",");
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
                                    /*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e9').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿Quién es el propietario del Insumo?'
                                        },
                                        tooltip: {
                                            pointFormat: ' {point.y} Unidades'
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
                Vector<String> v = new Vector<String>();
                ResultSet rset = con.consulta("SELECT campo43 FROM tb_e WHERE campo43 NOT IN ('NA', 'N/A', '0') AND campo43 != '';");
                while (rset.next()) {
                    String modulo[] = rset.getString("campo43").split(",");
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
                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e10').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿Llevan algún Sistema de Semaforización de Caducidades?'
                                        },
                                        tooltip: {
                                            pointFormat: 'Tienen semaforización: {point.y} Unidades'
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
                ResultSet rset = con.consulta("select campo44,count(campo44) from tb_e where campo44 != '' GROUP BY campo44 ;");
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



                                    /*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e11').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: 'Espacio aproximado en Farmacia en m²'
                                        },
                                        tooltip: {
                                            // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        xAxis: {
                                            categories: [],
                                            title: {
                                                text: 'Area en m²'
                                            }
                                        },
                                        yAxis: {
                                            min: 0,
                                            title: {
                                                text: 'No. de Hospital(es)',
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
                                            pointFormat: 'de espacio en: <b>{point.y} Hospital(es)</b>',
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
                ResultSet rset = con.consulta("select SUBSTRING_INDEX(campo45,'=',-1),count(SUBSTRING_INDEX(campo45,'=',-1)) from tb_e where campo45!='' and campo45!= 'NA' and campo45!= 'N/A' GROUP BY SUBSTRING_INDEX(campo45,'=',-1) order by SUBSTRING_INDEX(campo45,'=',-1)+0;");
                while (rset.next()) {
                    String area = rset.getString(1);
                    try {
                        String medi[] = rset.getString(1).split("=");
                        area = medi[1];
                    } catch (Exception e) {
                    }
                    System.out.println("----" + area + "****");

        %>
                                                            ['<%=area%> m²', <%=rset.getString(2)%>],
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        %>

                                                        ]
                                                    }]
                                    });



                                    /*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e12').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: 'Número de Anaqueles'
                                        },
                                        tooltip: {
                                            // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        xAxis: {
                                            categories: [],
                                            title: {
                                                text: 'Número de Anaqueles'
                                            }
                                        },
                                        yAxis: {
                                            min: 0,
                                            title: {
                                                text: 'No. de Hospital(es)',
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
                                            pointFormat: '<b>{point.y} Hospital(es)</b>',
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
                ResultSet rset = con.consulta("SELECT campo46, count(campo46) from tb_e where campo46!='' group by campo46 order by campo46+0;");
                while (rset.next()) {
        %>
                                                            ['<%=rset.getString(1)%> ', <%=rset.getString(2)%>],
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>

                                                        ]
                                                    }]
                                    });



                                    /*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e13').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: '¿Quién es el Propietario de los Anaqueles?'
                                        },
                                        tooltip: {
                                            // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        xAxis: {
                                            categories: [],
                                            title: {
                                                text: 'Propietarios'
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
                                        legend: {
                                            enabled: false
                                        },
                                        tooltip: {
                                            pointFormat: '<b>{point.y} Hospital(es)</b>',
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
                Vector<String> v = new Vector<String>();
                ResultSet rset = con.consulta("SELECT campo47 FROM tb_e WHERE campo47 NOT IN ('NA', 'N/A', '0') AND campo47 != '';");
                while (rset.next()) {
                    String modulo[] = rset.getString("campo47").split(",");
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
                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e14').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿Cuentan con Refrigerador?'
                                        },
                                        tooltip: {
                                            pointFormat: '{point.y} Unidad(es)'
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
                ResultSet rset = con.consulta("select campo48,count(campo48) from tb_e where campo48 != '' GROUP BY campo48 ;");
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
                                    /*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e15').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: '¿Quién es el Propietario del Refrigerador?'
                                        },
                                        tooltip: {
                                            // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        xAxis: {
                                            categories: [],
                                            title: {
                                                text: 'Medicamentos por receta'
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
                                        legend: {
                                            enabled: false
                                        },
                                        tooltip: {
                                            pointFormat: '<b>{point.y} Hospital(es)</b>',
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
                Vector<String> v = new Vector<String>();
                ResultSet rset = con.consulta("SELECT campo49 FROM tb_e WHERE campo49 NOT IN ('NA', 'N/A', '0') AND campo49 != '';");
                while (rset.next()) {
                    String modulo[] = rset.getString("campo49").split(",");
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
                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e16').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿Cuentan con Equipo de Cómputo?'
                                        },
                                        tooltip: {
                                            pointFormat: 'Tienen Eq. de Cómputo {point.y} Unidades'
                                        },
                                        plotOptions: {
                                            pie: {
                                                allowPointSelect: true,
                                                cursor: 'pointer',
                                                dataLabels: {
                                                    enabled: true,
                                                    color: '#000000',
                                                    connectorColor: '#000000',
                                                    format: '<b>{point.name} tienen Eq. de Cómputo</b>: {point.percentage:.1f} %'
                                                }
                                            }
                                        },
                                        series: [{
                                                type: 'pie',
                                                name: 'Total',
                                                data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo50,count(campo50) from tb_e where campo50 != '' GROUP BY campo48 ;");
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
                                    /*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e17').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: 'Número de Equipos de Cómputo'
                                        },
                                        tooltip: {
                                            // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        xAxis: {
                                            categories: [],
                                            title: {
                                                text: 'Número de Equipos de Cómputo'
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
                                            pointFormat: 'equipo(s) en <b>{point.y} Hospital(es)</b>',
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
                ResultSet rset = con.consulta("SELECT campo4, campo51, count(campo51) from tb_e e, tb_a a where a.id_uni = e.id_uni and campo51!='' group by campo51;");
                while (rset.next()) {
        %>
                                                            ['<%=rset.getString(1)%>', <%=rset.getString(3)%>],
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>

                                                        ]
                                                    }]
                                    });
                                    /*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e18').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: '¿Quién es el Propietario del Equipo de Cómputo?'
                                        },
                                        tooltip: {
                                            // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        xAxis: {
                                            categories: [],
                                            title: {
                                                text: 'Propietarios'
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
                                            pointFormat: '<b>{point.y} Hospital(es)</b>',
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
                Vector<String> v = new Vector<String>();
                ResultSet rset = con.consulta("SELECT campo52 FROM tb_e WHERE campo52 NOT IN ('NA', 'N/A', '0') AND campo52 != '';");
                while (rset.next()) {
                    String modulo[] = rset.getString("campo52").split(",");
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
                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e19').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿Cuentan con Sistema Informático?'
                                        },
                                        tooltip: {
                                            pointFormat: 'cuentan con Sistema Informático {point.y} Unidades'
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
                ResultSet rset = con.consulta("select campo53,count(campo53) from tb_e where campo53 != '' GROUP BY campo53 ;");
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
                                    /*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e20').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: 'Funciones del Sistema Informático'
                                        },
                                        tooltip: {
                                            // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        xAxis: {
                                            categories: [],
                                            title: {
                                                text: 'Funciones'
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
                                            pointFormat: '<b>{point.y} Hospital(es)</b>',
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
                Vector<String> v = new Vector<String>();
                ResultSet rset = con.consulta("SELECT campo54 FROM tb_e WHERE campo54 NOT IN ('NA', 'N/A', '0') AND campo54 != '';");
                while (rset.next()) {
                    String modulo[] = rset.getString("campo54").split(",");
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
                                    /*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e21').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: 'Reportes generados en Farmacia'
                                        },
                                        tooltip: {
                                            // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        xAxis: {
                                            categories: [],
                                            title: {
                                                text: 'Reportes'
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
                                            pointFormat: '<b>{point.y} Hospital(es)</b>',
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
                Vector<String> v = new Vector<String>();
                ResultSet rset = con.consulta("SELECT campo55 FROM tb_e WHERE campo55 NOT IN ('NA', 'N/A', '0') AND campo55 != '';");
                while (rset.next()) {
                    String modulo[] = rset.getString("campo55").split(",");
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
                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e22').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿Validan al Paciente de acuerdo a su Origen?'
                                        },
                                        tooltip: {
                                            pointFormat: 'lo validan: {point.y} Unidades'
                                        },
                                        plotOptions: {
                                            pie: {
                                                allowPointSelect: true,
                                                cursor: 'pointer',
                                                dataLabels: {
                                                    enabled: true,
                                                    color: '#000000',
                                                    connectorColor: '#000000',
                                                    format: '<b>{point.name} lo validan</b>: {point.percentage:.1f} %'
                                                }
                                            }
                                        },
                                        series: [{
                                                type: 'pie',
                                                name: 'Total',
                                                data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo56,count(campo56) from tb_e where campo56 != '' GROUP BY campo56 ;");
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
                                    /*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e23').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: '¿Cómo Validan al Paciente?'
                                        },
                                        tooltip: {
                                            // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        xAxis: {
                                            categories: [],
                                            title: {
                                                text: 'Tipo de Validación'
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
                                            pointFormat: '<b>{point.y} Hospital(es)</b>',
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
                Vector<String> v = new Vector<String>();
                ResultSet rset = con.consulta("SELECT campo57 FROM tb_e WHERE campo57 NOT IN ('NA', 'N/A', '0') AND campo57 != '';");
                while (rset.next()) {
                    String modulo[] = rset.getString("campo57").split(",");
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
                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e24').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿Cuentan con Teléfono?'
                                        },
                                        tooltip: {
                                            pointFormat: 'cuentan con Teléfono {point.y} Hospital(es)'
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
                ResultSet rset = con.consulta("select campo58,count(campo58) from tb_e where campo58 != '' GROUP BY campo58 ;");
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

                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e25').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿Cuentan con Planta de Energía Eléctrica?'
                                        },
                                        tooltip: {
                                            pointFormat: 'Cuentan con Planta: {point.y} Unidades'
                                        },
                                        plotOptions: {
                                            pie: {
                                                allowPointSelect: true,
                                                cursor: 'pointer',
                                                dataLabels: {
                                                    enabled: true,
                                                    color: '#000000',
                                                    connectorColor: '#000000',
                                                    format: '<b>{point.name} Cuentan con planta</b>: {point.percentage:.1f} %'
                                                }
                                            }
                                        },
                                        series: [{
                                                type: 'pie',
                                                name: 'Total',
                                                data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo60,count(campo60) from tb_e where campo60 != '' GROUP BY campo60 ;");
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

                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e26').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿La planta de Energía Eléctrica cubre el suministro de Farmacia?'
                                        },
                                        tooltip: {
                                            pointFormat: 'Cubre con el Suministro: {point.y} Unidades'
                                        },
                                        plotOptions: {
                                            pie: {
                                                allowPointSelect: true,
                                                cursor: 'pointer',
                                                dataLabels: {
                                                    enabled: true,
                                                    color: '#000000',
                                                    connectorColor: '#000000',
                                                    format: '<b>{point.name} Cubre con el Suministro</b>: {point.percentage:.1f} %'
                                                }
                                            }
                                        },
                                        series: [{
                                                type: 'pie',
                                                name: 'Total',
                                                data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo61,count(campo61) from tb_e where campo60 = 'Si' GROUP BY campo61 ;");
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
                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e27').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿Cuentan con Servicio de Internet?'
                                        },
                                        tooltip: {
                                            pointFormat: '{point.y} Unidades'
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
                ResultSet rset = con.consulta("select campo62,count(campo62) from tb_e where campo62 != '' GROUP BY campo62 ;");
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
                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e28').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿Quién es el Proveedor del Servicio de Internet?'
                                        },
                                        tooltip: {
                                            pointFormat: 'Provee {point.y} Hospital(es)'
                                        },
                                        plotOptions: {
                                            pie: {
                                                allowPointSelect: true,
                                                cursor: 'pointer',
                                                dataLabels: {
                                                    enabled: true,
                                                    color: '#000000',
                                                    connectorColor: '#000000',
                                                    format: '<b>{point.name} </b>: {point.percentage:.1f} %'
                                                }
                                            }
                                        },
                                        series: [{
                                                type: 'pie',
                                                name: 'Total',
                                                data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo63,count(campo63) from tb_e where campo62 = 'Si' GROUP BY campo63 ;");
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

                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e29').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿Quién tan rápido es el Servicio de Internet?'
                                        },
                                        tooltip: {
                                            pointFormat: 'En {point.y} Unidades'
                                        },
                                        plotOptions: {
                                            pie: {
                                                allowPointSelect: true,
                                                cursor: 'pointer',
                                                dataLabels: {
                                                    enabled: true,
                                                    color: '#000000',
                                                    connectorColor: '#000000',
                                                    format: '<b>{point.name} </b>: {point.percentage:.1f} %'
                                                }
                                            }
                                        },
                                        series: [{
                                                type: 'pie',
                                                name: 'Total',
                                                data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo64,count(campo64) from tb_e where campo62 = 'Si' GROUP BY campo64 ;");
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
                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e30').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿Almacenan insumo en algún otro lugar?'
                                        },
                                        tooltip: {
                                            pointFormat: '{point.y} Unidades'
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
                ResultSet rset = con.consulta("select campo65,count(campo65) from tb_e where campo65 != '' GROUP BY campo65 ;");
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
                                    /*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e31').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: '¿En qué otro lugar?'
                                        },
                                        tooltip: {
                                            // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        xAxis: {
                                            categories: [],
                                            title: {
                                                text: 'Lugares'
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
                                            pointFormat: '<b>{point.y} Hospital(es)</b>',
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
                Vector<String> v = new Vector<String>();
                ResultSet rset = con.consulta("SELECT campo66 FROM tb_e WHERE campo66 NOT IN ('NA', 'N/A', '0') AND campo66 != '';");
                while (rset.next()) {
                    String modulo[] = rset.getString("campo66").split(",");
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
                                    /*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e32').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: '¿Quién abastece de Insumo Médico?'
                                        },
                                        tooltip: {
                                            // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        xAxis: {
                                            categories: [],
                                            title: {
                                                text: 'Abastecedor'
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
                                            pointFormat: '<b>{point.y} Hospital(es)</b>',
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
                Vector<String> v = new Vector<String>();
                ResultSet rset = con.consulta("SELECT campo67 FROM tb_e WHERE campo67 NOT IN ('NA', 'N/A', '0') AND campo67 != '';");
                while (rset.next()) {
                    String modulo[] = rset.getString("campo67").split(",");
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
                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e33').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿Se lleva un registro de Insumos Solicitados contra Surtidos?'
                                        },
                                        tooltip: {
                                            pointFormat: 'Llevan Registro: {point.y} Unidades'
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
                ResultSet rset = con.consulta("select campo71,count(campo71) from tb_e where campo71 != '' GROUP BY campo71 ;");
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
                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e34').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿Se lleva un registro de Piezas Solicitadas contra Surtidas?'
                                        },
                                        tooltip: {
                                            pointFormat: 'Llevan Registro: {point.y} Unidades'
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
                ResultSet rset = con.consulta("select campo72,count(campo72) from tb_e where campo72 != '' GROUP BY campo72 ;");
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
                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e35').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿Se lleva un registro de Insumos NO Surtidos?'
                                        },
                                        tooltip: {
                                            pointFormat: 'Llevan Registro: {point.y} Unidades'
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
                ResultSet rset = con.consulta("select campo73,count(campo73) from tb_e where campo73 != '' GROUP BY campo73 ;");
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
                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e36').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: 'Porcentaje de Abasto'
                                        },
                                        tooltip: {
                                            // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        xAxis: {
                                            categories: [],
                                            title: {
                                                text: 'Porcentaje'
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
                                            pointFormat: '<b>{point.y} Hospital(es)</b>',
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
                ResultSet rset = con.consulta("select campo74,count(campo74) from tb_e where campo74 != '' GROUP BY campo74 ;");
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
                                    /*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e37').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: 'Insumos solicitados en promedio por Receta'
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
                                                text: 'Cantidad',
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
                                            pointFormat: '<b>{point.y} insumos</b>',
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
                ResultSet rset = con.consulta("SELECT campo75, count(campo75) from tb_e where campo75!='' group by campo75;");
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
                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e38').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿Tienen el Inventario Actualizado?'
                                        },
                                        tooltip: {
                                            pointFormat: 'Tienen el inventario actualizado: {point.y} Unidades'
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
                ResultSet rset = con.consulta("select campo76,count(campo76) from tb_e where campo76 != '' GROUP BY campo76 ;");
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
                                    /*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e39').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: 'Recetas Surtidas por día'
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
                                                text: 'Cantidad',
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
                                            pointFormat: 'recetas en <b>{point.y} Hospital(es)</b>',
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
                ResultSet rset = con.consulta("SELECT campo4, campo77, count(campo77) from tb_e e, tb_a a where a.id_uni = e.id_uni and campo77!='' group by campo77;");
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
                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e40').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿Capturan Recetas?'
                                        },
                                        tooltip: {
                                            pointFormat: 'Capturan Recetas: {point.y} Unidades'
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
                ResultSet rset = con.consulta("select campo78,count(campo78) from tb_e where campo78 != '' GROUP BY campo78 ;");
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
                                    /*
                                     * Primera Seccion
                                     */
                                    $('#e41').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿La captura de Receta va al día?'
                                        },
                                        tooltip: {
                                            pointFormat: 'va la Captura al día: {point.y} Unidades'
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
                ResultSet rset = con.consulta("select campo79,count(campo79) from tb_e where campo79 != '' GROUP BY campo79 ;");
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
/*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e42').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: '¿Cómo Solicitan el Insumo?'
                                        },
                                        tooltip: {
                                            // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        xAxis: {
                                            categories: [],
                                            title: {
                                                text: 'Tipo de Solicitud'
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
                                            pointFormat: '<b>{point.y} Hospital(es)</b>',
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
                Vector<String> v = new Vector<String>();
                ResultSet rset = con.consulta("SELECT campo68 FROM tb_e WHERE campo68 NOT IN ('NA', 'N/A', '0') AND campo68 != '';");
                while (rset.next()) {
                    String modulo[] = rset.getString("campo68").split(",");
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
/*
                                     * Primera Seccion
                                     */
                                    $('#e43').highcharts({
                                        chart: {
                                            plotBackgroundColor: null,
                                            plotBorderWidth: null,
                                            plotShadow: false
                                        },
                                        title: {
                                            text: '¿Cada cuando Abastecen?'
                                        },
                                        tooltip: {
                                            pointFormat: 'en: {point.y} Hospital(es)'
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
                ResultSet rset = con.consulta("select campo69,count(campo69) from tb_e where campo69 != '' GROUP BY campo69 ;");
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
/*
                                     * ----------------------------------------------------------------
                                     */
                                    $('#e44').highcharts({
                                        chart: {
                                            type: 'column'
                                        },
                                        title: {
                                            text: '¿Acción al no tener el Insumo Solicitado?'
                                        },
                                        tooltip: {
                                            // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                        },
                                        xAxis: {
                                            categories: [],
                                            title: {
                                                text: 'Tipo de Acción'
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
                                            pointFormat: '<b>{point.y} Hospital(es)</b>',
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
                Vector<String> v = new Vector<String>();
                ResultSet rset = con.consulta("SELECT campo70 FROM tb_e WHERE campo70 NOT IN ('NA', 'N/A', '0') AND campo70 != '';");
                while (rset.next()) {
                    String modulo[] = rset.getString("campo70").split(",");
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


                                });


    </script>
</html>
