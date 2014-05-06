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
                    <div class="col-sm-3 col-md-2 sidebar">
                        <ul class="nav nav-sidebar">
                            <li class=""><a href="estadisticasA.jsp">Sección A - DATOS GENERALES</a></li>
                            <li class=""><a href="estadisticasB.jsp">Sección B - TAREAS OPERACIONALES</a></li>
                            <li class=""><a href="estadisticasC.jsp">Sección C - SERVICIO DE URGENCIAS</a></li>
                        </ul>
                        <ul class="nav nav-sidebar">
                            <li class="active"><a href="estadisticasD.jsp">Sección D - SERVICIO DE QUIRÓFANO</a></li>
                            <ul class="list-group">
                                <li class="list-group-item"><a href="#a1"><small>-Generales</small></a></li>
                                <li class="list-group-item"><a href="#a2"><small>-Kits Quirúrgicos</small></a></li>
                                <li class="list-group-item"><a href="#a3"><small>-Datos</small></a></li>
                            </ul>
                        </ul>
                        <ul class="nav nav-sidebar">
                            
                        <li class=""><a href="estadisticasE.jsp">Sección E - FARMACIA CONSULTA EXTERNA</a></li>
                        <li class=""><a href="estadisticasF.jsp">Sección F - ALMACENES</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="principal">
                    <a name="a1"></a>
                    <h1 class="page-header">D. SERVICIO DE QUIRÓFANO</h1>
                    <h4>Total de Unidades Censadas: <%=tam_cen%></h4>
                    <div class="row placeholders">
                        <div id="e1" class="col-lg-6"></div>
                    </div>
                    <a name="a2"></a>
                    <h4 class="page-header">Espacio y almacenamiento</h4>
                    <div class="row placeholders">
                        <div id="e2" class="col-lg-6"></div>
                        <div id="e3" class="col-lg-6"></div>
                    </div>
                    <a name="a3"></a>
                    <h2 class="sub-header">Datos</h2>
                    <div class="" id="datos">
                        <table class="table table-striped" id="tabla">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Unidad</th>
                                    <th>Servicio de Quirófano</th>
                                    <th>Surtido de Kits Quirurgicos</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    try {
                                        con.conectar();
                                        int i = 0;
                                        ResultSet rset = con.consulta("SELECT a.campo4, d.* FROM tb_a a, tb_d d where a.id_uni = d.id_uni and a.campo23!='';");
                                        while (rset.next()) {
                                            i++;
                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%=rset.getString(1)%></td>
                                    <td><%=rset.getString(3)%></td>
                                    <td><%=rset.getString(4)%></td>
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
                    text: 'Unidades con Servicio de Quirófano'
                },
                tooltip: {
                    pointFormat: ' cuentan con servicio {point.y} Hospitales'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            format: '<b>{point.name} cuentan con servicio</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                        type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo32,count(campo32) from tb_d where campo32 != '' GROUP BY campo32 ;");
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
                    text: '¿Cómo se surten los Kits Quirúrgicos?'
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
                ResultSet rset = con.consulta("SELECT campo33 FROM tb_d WHERE campo33 NOT IN ('NA', 'N/A', '0') AND campo33 != '';");
                while (rset.next()) {
                    String modulo[] = rset.getString("campo33").split(",");
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
