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
                        <li class=""><a href="estadisticasE.jsp">Sección E - FARMACIA CONSULTA EXTERNA</a></li>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="estadisticasE.jsp">Sección F - ALMACENES</a></li>
                        <ul class="list-group">
                            <!--li class="list-group-item"><a href="#a1"><small>-Generales</small></a></li-->
                            <li class="list-group-item"><a href="#a2"><small>-Personal y Servicio</small></a></li>
                            <li class="list-group-item"><a href="#a3"><small>-COFEPRIS</small></a></li>
                            <li class="list-group-item"><a href="#a4"><small>-Insumo Médico</small></a></li>
                            <li class="list-group-item"><a href="#a5"><small>-Surtido de Médicamento</small></a></li>
                            <li class="list-group-item"><a href="#a6"><small>-Características del Almacén</small></a></li>
                            <li class="list-group-item"><a href="#a7"><small>-Equipo de Cómputo y Sistema Informático</small></a></li>
                            <li class="list-group-item"><a href="#a8"><small>-Paciente</small></a></li>
                            <li class="list-group-item"><a href="#a9"><small>-Servicios de la Almacén</small></a></li>
                            <li class="list-group-item"><a href="#a10"><small>-Inventario y Abasto</small></a></li>
                        </ul>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="principal">
                    <a name="a1"></a>
                    <h1 class="page-header">F. ALMACENES</h1>
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
                        <div id="e42" class="hidden"></div>
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
                        <div id="e32" class="col-lg-6"></div>
                        <div id="e41" class="col-lg-6"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e43" class="col-lg-6"></div>
                        <div id="e45" class="col-lg-6"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e44" class="col-lg-6"></div>
                    </div>

                    <div class="row placeholders">
                        <div id="e40" class="col-lg-6"></div>
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
                        <div id="e39" class="col-lg-4"></div>
                    </div>

                    <div class="row placeholders">
                        <div id="e25" class="col-lg-6"></div>
                        <div id="e26" class="hidden"></div>
                    </div>
                    <a name="a6"></a>
                    <h4 class="page-header">Características del Almacén</h4>
                    <div class="row placeholders">
                        <div id="e11" class="col-lg-6"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e12" class="col-lg-6"></div>
                        <div id="e13" class="hidden"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e10" class="col-lg-6"></div>
                        <div id="e14" class="col-lg-6"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e30" class="col-lg-6"></div>
                        <div id="e15" class="hidden"></div>
                    </div>

                    <a name="a7"></a>
                    <h4 class="page-header">Equipo de Cómputo y Sistema Informático</h4>
                    <div class="row placeholders">
                        <div id="e16" class="hidden"></div>
                        <div id="e17" class="hidden"></div>
                    </div>

                    <div class="row placeholders">
                        <div id="e18" class="hidden"></div>
                        <div id="e19" class="hidden"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e20" class="col-lg-6"></div>
                        <div id="e21" class="col-lg-6"></div>
                    </div>

                    <a name="a8"></a>
                    <h4 class="page-header">Paciente</h4>
                    <div class="row placeholders">
                        <div id="e22" class="col-lg-6"></div>
                        <div id="e23" class="col-lg-6"></div>
                    </div>

                    <a name="a9"></a>
                    <h4 class="page-header">Servicios del Almacén</h4>
                    <div class="row placeholders">
                        <div id="e24" class="col-lg-6"></div>
                        <div id="e27" class="hidden"></div>
                    </div>

                    <div class="row placeholders">
                        <div id="e28" class="hidden"></div>
                        <div id="e29" class="hidden"></div>
                    </div>

                    <a name="a10"></a>
                    <h4 class="page-header">Inventario y Abasto</h4>
                    <div class="row placeholders">
                        <div id="e36" class="col-lg-6"></div>
                        <div id="e38" class="hidden"></div>
                    </div>


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
                text: 'Unidades con Servicio de Almacén'
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
            ResultSet rset = con.consulta("select campo82,count(campo82) from tb_f where campo82 != '' GROUP BY campo82 ;");
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
            ResultSet rset = con.consulta("select campo84, campo85, count(id_uni) from tb_f where campo84 != '' GROUP BY campo84,campo85 ;");
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
                                $('#e42').highcharts({
                                    chart: {
                                        type: 'column'
                                    },
                                    title: {
                                        text: 'Tipo de Almacén'
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
                                            text: 'Hospital',
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
            ResultSet rset = con.consulta("SELECT campo83 FROM tb_f WHERE campo83 NOT IN ('NA', 'N/A', '0') AND campo83 != '';");
            while (rset.next()) {
                String modulo[] = rset.getString("campo83").split(",");
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
                                $('#e3').highcharts({
                                    chart: {
                                        type: 'column'
                                    },
                                    title: {
                                        text: 'Personal en Almacén'
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
            ResultSet rset = con.consulta("select campo4,campo86 from tb_f, tb_a where tb_a.id_uni = tb_f.id_uni and campo86 != '' GROUP BY campo4 ;");
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
                                        text: 'Turnos en Almacén'
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
            ResultSet rset = con.consulta("select campo4,campo87 from tb_f, tb_a where tb_a.id_uni = tb_f.id_uni and campo87 != '' GROUP BY campo4 ;");
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
            ResultSet rset = con.consulta("select campo88,count(campo88) from tb_f where campo88 != '' GROUP BY campo88 ;");
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
            ResultSet rset = con.consulta("SELECT campo89 FROM tb_f WHERE campo89 NOT IN ('NA', 'N/A', '0') AND campo89 != '';");
            while (rset.next()) {
                String modulo[] = rset.getString("campo89").split(",");
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
            ResultSet rset = con.consulta("select campo90,count(campo90) from tb_f where campo90 != '' GROUP BY campo90 ;");
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
            ResultSet rset = con.consulta("SELECT campo91 FROM tb_f WHERE campo91 NOT IN ('NA', 'N/A', '0') AND campo91 != '';");
            while (rset.next()) {
                String modulo[] = rset.getString("campo91").split(",");
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
                                        text: 'Propietario del Insumo'
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
            Vector<String> v = new Vector<String>();
            ResultSet rset = con.consulta("SELECT campo92 FROM tb_f WHERE campo92 NOT IN ('NA', 'N/A', '0') AND campo92 != '';");
            while (rset.next()) {
                String modulo[] = rset.getString("campo92").split(",");
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
                                        text: '¿Cuentan con Rampa para carga y descarga?'
                                    },
                                    tooltip: {
                                        pointFormat: 'Tienen rampa: {point.y} Unidades'
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
            ResultSet rset = con.consulta("select campo97,count(campo97) from tb_f where campo97 != '' GROUP BY campo97 ;");
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
                                        text: 'Espacio aproximado en Almacen en m²'
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
            ResultSet rset = con.consulta("select SUBSTRING_INDEX(campo93,'=',-1),count(SUBSTRING_INDEX(campo93,'=',-1)) from tb_f where campo93!='' and campo93!= 'NA' and campo93!= 'N/A' GROUP BY SUBSTRING_INDEX(campo93,'=',-1) order by SUBSTRING_INDEX(campo93,'=',-1)+0;");
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
            ResultSet rset = con.consulta("SELECT campo94, count(campo94) from tb_f where campo94!='' group by campo94 order by campo94+0;");
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
            ResultSet rset = con.consulta("SELECT campo95 FROM tb_f WHERE campo95 NOT IN ('NA', 'N/A', '0') AND campo95 != '';");
            while (rset.next()) {
                String modulo[] = rset.getString("campo95").split(",");
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
                                        text: '¿Cuentan con Andén para Carga y Descarga?'
                                    },
                                    tooltip: {
                                        pointFormat: 'Cuentan con andén: {point.y} Unidades'
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
            ResultSet rset = con.consulta("select campo96,count(campo96) from tb_f where campo96 != '' GROUP BY campo96 ;");
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
            ResultSet rset = con.consulta("SELECT campo100 FROM tb_f WHERE campo100 NOT IN ('NA', 'N/A', '0') AND  campo99!='No' and campo100 != '';");
            while (rset.next()) {
                String modulo[] = rset.getString("campo100").split(",");
                for (int i = 0; i < modulo.length; i++) {
                    /*System.out.println((modulo[i]).trim());*/
                    if (!modulo[i].equals("NA")) {
                        v.add((modulo[i]).trim());
                    }
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
            ResultSet rset = con.consulta("select campo101,count(campo101) from tb_f where campo101 != '' GROUP BY campo101 ;");
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
            ResultSet rset = con.consulta("SELECT campo4, campo102, count(campo102) from tb_f f, tb_a a where a.id_uni = f.id_uni and campo102!='' group by campo102;");
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
            ResultSet rset = con.consulta("SELECT campo103 FROM tb_f WHERE campo103 NOT IN ('NA', 'N/A', '0') AND campo103 != '';");
            while (rset.next()) {
                String modulo[] = rset.getString("campo103").split(",");
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
            ResultSet rset = con.consulta("select campo104,count(campo104) from tb_f where campo104 != '' GROUP BY campo104 ;");
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
            ResultSet rset = con.consulta("SELECT campo105 FROM tb_f WHERE campo105 NOT IN ('NA', 'N/A', '0') AND campo105 != '';");
            while (rset.next()) {
                String modulo[] = rset.getString("campo105").split(",");
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
                                        text: 'Reportes generados en Almacén'
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
            ResultSet rset = con.consulta("SELECT campo106 FROM tb_f WHERE campo106 NOT IN ('NA', 'N/A', '0') AND campo106 != '';");
            while (rset.next()) {
                String modulo[] = rset.getString("campo106").split(",");
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
            ResultSet rset = con.consulta("select campo107,count(campo107) from tb_f where campo107 != '' GROUP BY campo107 ;");
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
                                        text: '¿Capturan Recetas?'
                                    },
                                    tooltip: {
                                        pointFormat: 'Capturan en: {point.y} Unidades'
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
            ResultSet rset = con.consulta("select campo126,count(campo126) from tb_f where campo126 != '' GROUP BY campo126 ;");
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
                                        text: '¿La Captura de Recetas va al día?'
                                    },
                                    tooltip: {
                                        pointFormat: 'Va al día en: {point.y} Unidades'
                                    },
                                    plotOptions: {
                                        pie: {
                                            allowPointSelect: true,
                                            cursor: 'pointer',
                                            dataLabels: {
                                                enabled: true,
                                                color: '#000000',
                                                connectorColor: '#000000',
                                                format: '<b>{point.name} va al día</b>: {point.percentage:.1f} %'
                                            }
                                        }
                                    },
                                    series: [{
                                            type: 'pie',
                                            name: 'Total',
                                            data: [
    <%                                try {
            con.conectar();
            ResultSet rset = con.consulta("select campo127,count(campo127) from tb_f where campo127 = 'Si' GROUP BY campo127 ;");
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
            ResultSet rset = con.consulta("select campo109,count(campo109) from tb_f where campo109 != '' GROUP BY campo109 ;");
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
            ResultSet rset = con.consulta("select campo110,count(campo110) from tb_f where campo109 = 'Si' GROUP BY campo110 ;");
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
            ResultSet rset = con.consulta("select campo111,count(campo111) from tb_f where campo109 = 'Si' GROUP BY campo111 ;");
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
                                        text: '¿Cuentan con Refrigerador?'
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
            ResultSet rset = con.consulta("select campo99,count(campo99) from tb_f where campo99 != '' GROUP BY campo99 ;");
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
            ResultSet rset = con.consulta("SELECT campo113 FROM tb_f WHERE campo113 NOT IN ('NA', 'N/A', '0') AND campo113 != '';");
            while (rset.next()) {
                String modulo[] = rset.getString("campo113").split(",");
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
            ResultSet rset = con.consulta("select campo119,count(campo119) from tb_f where campo119 != '' GROUP BY campo119 ;");
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
            ResultSet rset = con.consulta("select campo120,count(campo120) from tb_f where campo120 != '' GROUP BY campo120 ;");
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
            ResultSet rset = con.consulta("select campo121,count(campo121) from tb_f where campo121 != '' GROUP BY campo121 ;");
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
            ResultSet rset = con.consulta("select campo122,count(campo122) from tb_f where campo122 != '' GROUP BY campo122 ;");
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
            ResultSet rset = con.consulta("SELECT campo4, campo123, count(campo123) from tb_f f, tb_a a where a.id_uni = f.id_uni and campo123!='' group by campo123;");
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
            ResultSet rset = con.consulta("select campo124,count(campo124) from tb_f where campo124 != '' GROUP BY campo124 ;");
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
                                        pointFormat: '<b>{point.y} Recetas</b>',
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
            ResultSet rset = con.consulta("SELECT campo4, campo125, count(campo125) from tb_f f, tb_a a where a.id_uni = f.id_uni and campo125!='' group by campo125;");
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
                                        text: '¿Almacenan Insumo en alguna otra parte?'
                                    },
                                    tooltip: {
                                        pointFormat: 'Almacenan en otro lugar en: {point.y} Unidades'
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
            ResultSet rset = con.consulta("select campo112,count(campo112) from tb_f where campo112 != '' GROUP BY campo112 ;");
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
                                        text: '¿Cuentan con sub almacenes?'
                                    },
                                    tooltip: {
                                        pointFormat: 'Cuentan con sub almacenes: {point.y} Unidades'
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
            ResultSet rset = con.consulta("select campo115,count(campo115) from tb_f where campo115 != '' GROUP BY campo115 ;");
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
                                $('#e43').highcharts({
                                    chart: {
                                        type: 'column'
                                    },
                                    title: {
                                        text: '¿Cómo Solicitan Insumo?'
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
            ResultSet rset = con.consulta("SELECT campo116 FROM tb_f WHERE campo116 NOT IN ('NA', 'N/A', '0') AND campo116 != '';");
            while (rset.next()) {
                String modulo[] = rset.getString("campo116").split(",");
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
                                            text: 'Acción'
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
            ResultSet rset = con.consulta("SELECT campo118 FROM tb_f WHERE campo118 NOT IN ('NA', 'N/A', '0') AND campo118 != '';");
            while (rset.next()) {
                String modulo[] = rset.getString("campo118").split(",");
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
                                $('#e45').highcharts({
                                    chart: {
                                        plotBackgroundColor: null,
                                        plotBorderWidth: null,
                                        plotShadow: false
                                    },
                                    title: {
                                        text: '¿Cada cuanto Abastecen?'
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
            ResultSet rset = con.consulta("select campo117,count(campo117) from tb_f where campo117 != '' GROUP BY campo117 ;");
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
