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
                        <li class=""><a href="http://166.78.128.202:8080/CensosBCNR/indexSelec.html">Men&uacute;</a></li>
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
                        <li class=""><a href="estadisticasB.jsp">Sección B - CONSULTA EXTERNA</a></li>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="estadisticasC.jsp">Sección C - SERVICIO DE URGENCIAS</a></li>
                        <ul class="list-group">
                            <li class="list-group-item"><a href="#a1"><small>-Generales</small></a></li>
                            <li class="list-group-item"><a href="#a2"><small>-Surtido</small></a></li>
                            <li class="list-group-item"><a href="#a3"><small>-Requerimiento</small></a></li>
                            <li class="list-group-item"><a href="#a4"><small>-Resurtido</small></a></li>
                            <li class="list-group-item"><a href="#a5"><small>-Datos</small></a></li>
                        </ul>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li class=""><a href="estadisticasD.jsp">Sección D - SERVICIO DE QUIRÓFANO</a></li>
                        <li class=""><a href="estadisticasE.jsp">Sección E - FARMACIA CONSULTA EXTERNA</a></li>
                        <li class=""><a href="estadisticasF.jsp">Sección F - ALMACENES</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="principal">
                    <a name="a1"></a>
                    <h1 class="page-header">C. Servicio de Urgencias</h1>
                    <h4>Total de Unidades Censadas: <%=tam_cen%></h4>
                    <div class="row placeholders">
                        <div id="e1" class="col-lg-6"></div>
                    </div>
                    <a name="a2"></a>
                    <h4 class="page-header">Surtido</h4>
                    <div class="row placeholders">
                        <div id="e2" class="col-lg-12"></div>
                    </div>
                    <a name="a3"></a>
                    <h4 class="page-header">Requerimiento</h4>
                    <div class="row placeholders">
                        <div id="e3" class="col-lg-12"></div>
                    </div>
                    <a name="a4"></a>
                    <h4 class="page-header">Resurtido</h4>
                    <div class="row placeholders">
                        <div id="e4" class="col-lg-12"></div>
                    </div>
                    
                    <a name="a5"></a>
                    <h2 class="sub-header">Datos</h2>
                    <div class="" id="datos">
                        <table class="table table-striped" id="tabla">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Unidad</th>
                                    <th>Servicio de Urgencias</th>
                                    <th>¿Cómo Surten Insumos?</th>
                                    <th>Elabora Requerimiento</th>
                                    <th>Tipo de Resurtido</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    try {
                                        con.conectar();
                                        int i = 0;
                                        ResultSet rset = con.consulta("SELECT a.campo4, c.* FROM tb_a a, tb_c c where a.id_uni = c.id_uni and a.campo23!='';");
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
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: 'Unidades con Servicio de Urgencias'
                },
                tooltip: {
                    pointFormat: 'Tienen Servicio de Urgencias: {point.y} Hospital(es)'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            format: '<b>{point.name} tienen Servicio de Urgencias</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                        type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo28,count(campo28) from tb_c where campo28 != '' GROUP BY campo28 ;");
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
                    text: '¿Cómo se surte de Insumos?'
                },
                tooltip: {
                    // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: 'Tipo de Surtido'
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
                ResultSet rset = con.consulta("SELECT campo29 FROM tb_c WHERE campo29 NOT IN ('NA', 'N/A', '0') AND campo29 != '';");
                while (rset.next()) {
                    String modulo[] = rset.getString("campo29").split(",");
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
            
            
            
            $('#e3').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: '¿Quién elabora el requerimiento o receta colectiva?'
                },
                tooltip: {
                    // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: 'Personal'
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
                    pointFormat: 'en <b>{point.y} Unidades</b>',
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
                ResultSet rset = con.consulta("SELECT campo30 FROM tb_c WHERE campo30 NOT IN ('NA', 'N/A', '0') AND campo30 != '';");
                while (rset.next()) {
                    String modulo[] = rset.getString("campo30").split(",");
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
            
            
            
            $('#e4').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'El resurtido es por dosis o por presentación completa'
                },
                tooltip: {
                    // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: 'Tipo de Resurtido'
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
                ResultSet rset = con.consulta("SELECT campo31 FROM tb_c WHERE campo31 NOT IN ('NA', 'N/A', '0') AND campo31 != '';");
                while (rset.next()) {
                    String modulo[] = rset.getString("campo31").split(",");
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
