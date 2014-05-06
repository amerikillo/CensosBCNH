<%-- 
    Document   : capturaCensosH2
    Created on : 17-abr-2014, 8:48:34
    Author     : Americo
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="conn.ConectionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //----------------------------------Módulo de Sesiones
    HttpSession sesion = request.getSession();
    String id_uni = "";
    session.getId();

    try {
        id_uni = request.getParameter("id_uni");
    } catch (Exception e) {
        id_uni = "";
    }
    ConectionDB con = new ConectionDB();

    DecimalFormatSymbols simbolo = new DecimalFormatSymbols();
    simbolo.setDecimalSeparator('.');
    simbolo.setGroupingSeparator(',');
    DecimalFormat format = new DecimalFormat("###,###.##", simbolo);

    int ban = 0;
    String var[];
    String valuech = "";
    id_uni = (String) sesion.getAttribute("id_uni");

    int ban_inv = 0;
    try {
        con.conectar();
        ResultSet rset = con.consulta("select id_uni from inventarios where id_uni = '" + request.getParameter("id_uni") + "'");
        while (rset.next()) {
            ban_inv = 1;
        }
        con.cierraConexion();
    } catch (Exception e) {

    }

%>
<html>
    <head>
        <!--Cosas de Bootstrap-->
        <link href="css/blueberry2.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/cupertino/jquery-ui-1.10.3.custom.css" />
        <link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.css">
        <!----->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>:: CONSULTA DE CENSOS ::</title>
        <style type="text/css">
            .scrollup{
                width:40px;
                height:40px;
                opacity:0.3;
                position:fixed;
                bottom:50px;
                right:100px;
                display:none;
                text-indent:-9999px;
                background: url('icon_top.png') no-repeat;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-primary">
                    <h2>Consulta de Censos Hospitales - BAJA CALIFORNIA</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <a href="http://166.78.128.202:8080/CensosBCNR/indexSelec.html" class="btn btn-primary">Men&uacute;</a>
                    <a href="estadisticasA.jsp" class="btn btn-info">Estadísticas</a>
                    <a href="http://166.78.128.202:8080/CensosBCNR/consultaCensosR.jsp" class="btn btn-default">Censos 1er Nivel</a>
                    <a href="http://166.78.128.202:8080/CensosBCNR/consultaJuris.jsp" class="btn btn-default">Almacenes Jurisdiccionales</a>
                    <a href="http://166.78.128.202:8080/CensosBCNR/conEntrevistaJuris.jsp" class="btn btn-default">Oficinas Jurisdiccionales</a>
                    <a data-toggle="modal" href="#myModal2" class="btn btn-default">Instrucciones</a>
                    <a data-toggle="modal" href="#myModal" class="btn btn-default">Sistemas</a>
                    <a href="http://166.78.128.202:8080/CensosBCNR" class="btn btn-default">Salir</a>
                </div>
            </div>
            <hr>
            <form class="form-horizontal" action="" method="post" name="formularioHospitales">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Seleccione la Unidad
                    </div>
                    <div class="panel-body">
                        <select name="id_uni" id="id_uni" class="form-control" onchange="document.formularioHospitales.submit()">
                            <option>-- Seleccione Hospital --</option>
                            <%                                                    con.conectar();
                                ResultSet rset2 = con.consulta("select t.id_uni, t.nombre_gnk, t.juris from tb_unidades t, tb_a ta where t.id_uni = ta.id_uni and ta.campo23!='' order by id_uni asc");
                                while (rset2.next()) {
                                    out.println("<option value = '" + rset2.getString("id_uni") + "'>" + rset2.getString("juris") + " - " + rset2.getString("nombre_gnk") + "</option>");
                                }
                                con.cierraConexion();
                            %>
                        </select>
                    </div>
                </div>
                <%                    try {
                        con.conectar();
                        ResultSet rset = con.consulta("select * from tb_a as a, tb_b as b, tb_c as c, tb_d as d, tb_e as e, tb_f as f, tb_g as g, tb_unidades as clave where clave.id_uni=a.id_uni and clave.id_uni=b.id_uni and clave.id_uni=c.id_uni and clave.id_uni=d.id_uni and clave.id_uni=e.id_uni and clave.id_uni=f.id_uni and clave.id_uni=g.id_uni and clave.id_uni = '" + request.getParameter("id_uni") + "' group by clave.id_uni;");
                        while (rset.next()) {
                            //id_uni = "1009";
                            String nomCam = "campo", nombreC = "";
                            int contCam = 0;
                            ban = 1;
                            DecimalFormatSymbols simbolos = new DecimalFormatSymbols();
                            simbolos.setDecimalSeparator('.');
                            simbolos.setGroupingSeparator(',');
                            DecimalFormat forma2 = new DecimalFormat("##,###.##", simbolos);
                %>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Secciones
                    </div>
                    <div class="panel-body">
                        <a href="#a" class="btn btn-primary">A</a>
                        <a href="#b" class="btn btn-primary">B</a>
                        <a href="#c" class="btn btn-primary">C</a>
                        <a href="#d" class="btn btn-primary">D</a>
                        <a href="#e" class="btn btn-primary">E</a>
                        <a href="#f" class="btn btn-primary">F</a>
                        <a href="#g" class="btn btn-primary">G</a>
                        <a href="#pic" class="btn btn-primary">Pictográfico</a>
                        <%
                            String uni_mapa = "";
                            try {
                                con.conectar();
                                ResultSet rset_mapa = con.consulta("select ubi_mapa_1 from tb_mapas where id_uni = '" + request.getParameter("id_uni") + "' ");
                                while (rset_mapa.next()) {
                                    uni_mapa = rset_mapa.getString(1);
                        %>
                        <a href="#mapa" class="btn btn-primary">Ver Mapa</a>
                        <%
                                }
                                con.cierraConexion();
                            } catch (Exception e) {

                            }
                        %>
                        <%
                            if (ban_inv == 1) {
                        %>
                        <a href="#inv" class="btn btn-primary">Inventario</a>
                        <%
                            }
                        %>
                    </div>
                </div>
                <a name="a" ></a>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        CENSOS DE HOSPITALES
                    </div>
                    <div class="panel-body">
                        <input name="id_uni" class="hidden" value="1009" />
                        Elaborado por:
                        <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" />
                        <%
                            String enc = rset.getString(nombreC);
                            if (enc.equals("Ricardo Wence")) {
                                enc = "Ricardo Hernandez - Mario García";
                            }
                            if (enc.equals("Ana González") || enc.equals("Ana Gonzlez")) {
                                enc = "Ana González - Bernardo González";
                            }
                            if (enc.equals("Gerardo Chvez") || enc.equals("Gerardo Chvez")) {
                                enc = "Gerardo Chávez - Edgar Zapata";
                            }
                            if (enc.equals("Roberto Sixtos")) {
                                enc = "Eulises Abad - Roberto Sixtos";
                            }
                            out.println(enc);
                        %>
                        </textarea>
                        <br>
                        <%//out.print(nombreC);%>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        A. DATOS GENERALES
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-2 control-label">
                                <b>Nombre del Encuestado:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Fecha y Hora:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-2 control-label">
                                <b>Nombre del Hospital:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Categoria:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-2 control-label">
                                <b>Dirección:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Referencias:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea  name="<%=nombreC = nomCam + (contCam += 1)%>" rows="5"  readonly class="form-control" id="<%=nombreC%>" onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>

                        <br />
                        <div class="row">
                            <div class="col-lg-2 control-label">
                                <b>Colonia:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Ciudad o Población:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>

                        <br />
                        <div class="row">
                            <div class="col-lg-2 control-label">
                                <b>Municipio:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Código Postal:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>

                        <br />
                        <div class="row">
                            <div class="col-lg-2 control-label">
                                <b>Teléfono(s):</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Página Web:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>

                        <br />
                        <div class="row">
                            <div class="col-lg-2 control-label">
                                <b>Población Atendida:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>

                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Jurisdicció Sanitaria Perteneciente:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>

                        <br />
                        <div class="row">
                            <div class="col-lg-2 control-label">
                                <b>Coordinación Municipal Perteneciente:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Número de Servicios:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>

                        <br />
                        <div class="row">
                            <div class="col-lg-2 control-label">
                                <b>Descripción de los Servicios:</b>
                            </div>
                            <div class="col-lg-10">
                                <textarea  name="<%=nombreC = nomCam + (contCam += 1)%>" rows="8"  readonly class="form-control" id="<%=nombreC%>" onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>

                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-lg-2 control-label">
                                <b>Número de Camas Censables:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>

                        <br />
                        <div class="row">
                            <div class="col-lg-2 control-label">
                                <b>Número de Camas NO Censables:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Nombre del Responsable del Hospital:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>

                        <br />
                        <div class="row">
                            <div class="col-lg-2 control-label">
                                <b>Teléfono del Responsable:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Correo Electrónico del Responsable:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>

                        <br />

                    </div>
                </div>


                <a name="b"></a>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        B. Consulta Externa
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-2 control-label">
                                <b>Número de Constultorios de Primer Nivel:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Número de Consultorios de Segundo Nivel:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-2 control-label">
                                <b>Consultas Promedio Diarias por Consultorio de Primer Nivel:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Consultas Promedio Diarias por Consultorio de Segundo Nivel:</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>

                    </div>
                </div>


                <a name="c"></a>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        C. SERVICIO DE URGENCIAS
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Existe servicio de Urgencias?</b>
                            </div>
                            <div class="col-lg-9">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cómo se surte de Insumos?</b>
                            </div>
                            <div class="col-lg-9">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Quién elabora el requerimiento o receta colectiva?</b>
                            </div>
                            <div class="col-lg-9">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>El resurtido es por dosis o por presentación completa</b>
                            </div>
                            <div class="col-lg-9">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                    </div>
                </div>

                <a name="d"></a>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        D. SERVICIO DE QUIRÓFANO
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Existe servicio de Quirófano?</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />


                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cómo se surten los Kits Quirúrgicos?</b>
                            </div>
                            <div class="col-lg-9">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                    </div>
                </div>

                <a name="e"></a>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        E. DATOS DE LA FARMACIA CONSULTA EXTERNA
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Existe servicio de Farmacia?</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />


                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>Horario de Atención</b>
                            </div>

                            <div class="col-lg-3">
                                De:
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-4">
                                A:
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuanto personal atiende?</b>
                                <br>
                                Contemplar el total de los turnos
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuántos turnos existen?</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />


                        <div class="row">
                            <div class="col-lg-6 control-label">
                                <b>¿El personal cuenta con el certificado de la COFEPRIS para el manejo y dispensación de medicamento?</b>
                                <br>
                                COFEPRIS = Comisión Federal para la Protección de Riesgos Sanitarios
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Qué Insumos Médicos manejan?</b>
                            </div>
                            <div class="col-lg-7">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuentan con Licencia Sanitaria  para el manejo de medicamento controlado?	</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cómo surten los Insumos Médicos?</b>
                            </div>
                            <div class="col-lg-7">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Quién es el propietario del Insumo?</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Llevan algún control de semaforización de caducidades?</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>Espacio aproximado de Farmacia mts</b>
                            </div>
                            <div class="col-lg-4">

                                <div class="row">
                                    <div class="col-lg-12">
                                        <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                    </div>
                                </div>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>


                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>Número de Anaqueles</b>
                                <br>
                                Indicar el número total de anaqueles en la Farmacia y de cuántos niveles; Ejemplo: 4 de 3
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>


                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Quién es el propietario de los Anaqueles?</b>
                                <br>
                                Indicar el nombre del proveedor en caso de ser necesario
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>


                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuentan con Refrigerador?</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Quién es el propietario del Refrigerador?</b>
                                <br>
                                Indicar el nombre del proveedor en caso de ser necesario
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuentan con Equipo de Cómputo?</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>Número de Equipos de Cómputo</b>
                                <br>
                                Indicar el número total de equipos de computo FUNCIONALES (verificar que enciendan)
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Quién es el propietario de los Equipos de Cómputo?</b>
                                <br>
                                Indicar el nombre del proveedor en caso de ser necesario
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuentan con algún Sistema Informático?</b>
                                <br />
                                Sistema Informático = Sistema de Cómputo
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuáles son las funciones del Sistema Informático?</b>
                                <br>
                                Indicar todas las opciones que tenga el Sistema Informático
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" rows="7" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Qué tipo de reportes generan?</b>
                                <br>
                                Indicar todas las opciones que tenga el Sistema Informático
                            </div>
                            <div class="col-lg-4">
                                <textarea  name="<%=nombreC = nomCam + (contCam += 1)%>" rows="7"  readonly class="form-control" id="<%=nombreC%>" onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Existe algún tipo de validación de acuerdo al origen del paciente?</b>
                                <br />
                                Es decir si validan si el paciente pertenece a algún programa como Seguro Popular, Oportunidades, etc.
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cómo validan el origen del paciente?	</b>
                                <br>
                                Es decir si validan si el paciente pertenece a algún programa como Seguro Popular, Oportunidades, etc.
                            </div>
                            <div class="col-lg-6">
                                <textarea  name="<%=nombreC = nomCam + (contCam += 1)%>"  readonly class="form-control" id="<%=nombreC%>" onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>


                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuentan con teléfono?</b>
                                <br />
                                Si la respuesta es "Sí" indicar a un lado el número
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Cuál es el número de teléfono?</b>
                                <br>
                                Indicar número con Clave LADA
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuentan con planta de energía eléctrica para emergencias?</b>
                                <br />
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿La planta de energía eléctrica para emergencias cubre el suministro a la Farmacia?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuentan con servicio de Internet?</b>
                                <br />
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Cuál es el proveedor de Internet?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>


                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Qué tan rápido es el servicio de Internet?</b>
                                <br />
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Almacenan Insumo en otro lugar aparte?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">

                            <div class="col-lg-3 control-label">
                                <b>¿En qué otro lugar (aparte de la Farmacia) almacenan insumos?</b>
                                <br>
                                Ejemplos: bodega, covacha, sub almacen, cuartito, etc.
                            </div>
                            <div class="col-lg-6">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" rows="5" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Quién abastece  de Insumos Médicos?</b>
                                <br>
                            </div>
                            <div class="col-lg-6">
                                <textarea  name="<%=nombreC = nomCam + (contCam += 1)%>" rows="5"  readonly class="form-control" id="<%=nombreC%>" onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cómo solicitan insumo?</b>
                                <br>
                            </div>
                            <div class="col-lg-6">
                                <textarea  name="<%=nombreC = nomCam + (contCam += 1)%>" rows="5"  readonly class="form-control" id="<%=nombreC%>" onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cada cuanto abastecen?</b>
                                <br>
                            </div>
                            <div class="col-lg-6">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Qué se hace en caso de que no se tenga algún insumo solicitado?</b>
                                <br>
                            </div>
                            <div class="col-lg-6">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Se lleva un registro de Insumos Solicitados contra Surtidos?</b>
                                <br />
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Se lleva un registro de Piezas Solicitadas contra Surtidas?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Se lleva un registro de Insumos No Surtidos?</b>
                                <br />
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Cúal es el Porcentaje de Abasto actual?</b>
                                <br>
                                Total de Piezas Solicitadas contra Surtidas vía recetas (pacientes y colectivas)
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>


                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuántos insumos solicitan en promedio por receta?</b>
                                <br />
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿El Inventario  se encuentra actualizado?</b>
                                <br>
                                Es decir si las existencias al día
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>


                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>Número de Recetas Surtidas por Día</b>
                                <br />
                                Indicar el número de recetas que en promedio se surten diariamente
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Capturan recetas?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿La captura de recetas  va al día?</b>
                                <br />
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Me puede proporcionar copia del inventario?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Me puede proporcionar copia de una receta?</b>
                                <br />
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>

                        </div>
                        <br/>


                    </div>
                </div>

                <a name="f"></a>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        F. DATOS DE LOS ALMACENES
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Existe servicio de Almacén?</b>
                                <br />
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>

                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>Tipo de Almacén</b>
                                <br />
                            </div>
                            <div class="col-lg-7">
                                <textarea  name="<%=nombreC = nomCam + (contCam += 1)%>" rows="7"  readonly class="form-control" id="<%=nombreC%>" onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>

                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>Horario de Atención</b>
                            </div>

                            <div class="col-lg-3">
                                De:
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-4">
                                A:
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuanto personal atiende?</b>
                                <br>
                                Contemplar el total de los turnos
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuántos turnos existen?</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-6 control-label">
                                <b>¿El personal  cuenta con el certificado de la COFEPRIS para el manejo y dispensación de medicamento?</b>
                                <br>
                                COFEPRIS = Comisión Federal para la Protección de Riesgos Sanitarios
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Qué Insumos Médicos manejan?</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuentan con Licencia Sanitaria para el manejo de medicamento controlado?	</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cómo surten los Insumos Médicos?</b>
                            </div>
                            <div class="col-lg-7">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Quién es el propietario del Insumo?</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>Espacio aproximado de Almacén mts</b>
                            </div>
                            <div class="col-lg-4">

                                <div class="row">
                                    <div class="col-sm-12"><textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea></div>
                                    <br>
                                </div>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>


                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>Número de Anaqueles</b>
                                <br>
                                Indicar el número total de anaqueles en el Almacén y de cuántos niveles; Ejemplo: 4 de 3
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>


                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Quién es el propietario de los Anaqueles?</b>
                                <br>
                                Indicar el nombre del proveedor en caso de ser necesario
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuentan con Anden para carga y descarga?</b>
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>

                            <div class="col-lg-3 control-label">
                                <b>¿Cuentan con Rampa para carga y descarga?</b>
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuáles son las condiciones para carga y descarga?</b>
                                <br/>
                                Indicar la accesabilidad para cargar y descargar (Patin, Diablo, Tipo de vehículo que puede entrar)
                            </div>
                            <div class="col-lg-7">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>

                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuentan con Refrigerador?</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Quién es el propietario del Refrigerador?</b>
                                <br>
                                Indicar el nombre del proveedor en caso de ser necesario
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuentan con Equipo de Cómputo?</b>
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>Número de Equipos de Cómputo</b>
                                <br>
                                Indicar el número total de equipos de cómputo FUNCIONALES (verificar que enciendan)
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Quién es el propietario de los Equipos de Cómputo?</b>
                                <br>
                                Indicar el nombre del proveedor en caso de ser necesario
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuentan con algún Sistema Informático?</b>
                                <br />
                                Sistema Informático = Sistema de Cómputo
                            </div>
                            <div class="col-lg-4">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuáles son las funciones del Sistema Informático?</b>
                                <br>
                                Indicar todas las opciones que tenga el Sistema Informático
                            </div>
                            <div class="col-lg-7">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Qué tipo de reportes generan?</b>
                                <br>
                                Indicar todas las opciones que tenga el Sistema Informático
                            </div>
                            <div class="col-lg-7">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuentan con teléfono?</b>
                                <br />
                                Si la respuesta es "Sí" indicar a un lado el número
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Cuál es el número de teléfono?</b>
                                <br>
                                Indicar número con Clave LADA
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuentan con servicio de Internet?</b>
                                <br />
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Cuál es el proveedor de Internet?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>


                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Qué tan rápido es el servicio de Internet?</b>
                                <br />
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Almacenan Insumo en otro lugar aparte?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">

                            <div class="col-lg-3 control-label">
                                <b>¿En qué otro lugar (aparte del Almacén) almacenan insumos?</b>
                                <br>
                                Ejemplos: bodega, covacha, sub almacen, cuartito, etc.
                            </div>
                            <div class="col-lg-6">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" rows="5" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Quién abastece  de Insumos Médicos?</b>
                                <br>
                            </div>
                            <div class="col-lg-6">
                                <textarea  name="<%=nombreC = nomCam + (contCam += 1)%>" rows="5"  readonly class="form-control" id="<%=nombreC%>" onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuentan con sub almacenes en los pisos?</b>
                                <br>
                            </div>
                            <div class="col-lg-6">
                                <textarea  name="<%=nombreC = nomCam + (contCam += 1)%>"  readonly class="form-control" id="<%=nombreC%>" onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>


                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cómo solicitan insumo?</b>
                                <br>
                            </div>
                            <div class="col-lg-6">
                                <textarea  name="<%=nombreC = nomCam + (contCam += 1)%>" rows="5"  readonly class="form-control" id="<%=nombreC%>" onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cada cuanto abastecen?</b>
                                <br>
                            </div>
                            <div class="col-lg-6">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Qué se hace en caso de que no se tenga algún insumo solicitado?</b>
                                <br>
                            </div>
                            <div class="col-lg-6">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Se lleva un registro de Insumos Solicitados contra Surtidos?</b>
                                <br />
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Se lleva un registro de Piezas Solicitadas contra Surtidas?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Se lleva un registro de Insumos No Surtidos?</b>
                                <br />
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Cúal es el Porcentaje de Abasto actual?</b>
                                <br>
                                Total de Piezas Solicitadas contra Surtidas vía recetas (pacientes y colectivas)
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>


                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuántos insumos solicitan en promedio por receta?</b>
                                <br />
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿El Inventario  se encuentra actualizado?</b>
                                <br>
                                Es decir si las existencias al día
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>


                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>Número de Recetas Surtidas por Día</b>
                                <br />
                                Indicar el número de recetas que en promedio se surten diariamente
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Capturan recetas?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿La captura de recetas  va al día?</b>
                                <br />
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Me puede proporcionar copia del inventario?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Me puede proporcionar copia de una receta?</b>
                                <br />
                            </div>
                            <div class="col-lg-3">
                                <textarea class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  readonly onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>

                        </div>
                        <br/>
                    </div>
                </div>

                <a name="g"></a>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        G. Observaciones
                    </div>
                    <div class="panel-body">
                        <textarea  name="<%=nombreC = nomCam + (contCam += 1)%>" rows="12"  readonly class="form-control" id="<%=nombreC%>" onkeypress="return tabular(event, this);" /><%=rset.getString(nombreC)%></textarea>
                    </div>
                </div>

                <a name="pic"></a>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Pictográfico
                    </div>
                    <div class="panel-body">
                        <div class="blueberry">
                            <a name="pic" id="pic"></a>
                            <ul class="slides">
                                <%
                                    try {
                                        con.conectar();

                                        //out.print(qery);
                                        ResultSet rsetimg = con.consulta("select imagen from tb_imagenes where id_uni = '" + request.getParameter("id_uni") + "'");
                                        while (rsetimg.next()) {
                                            out.print("<li><img src='imagenes/" + request.getParameter("id_uni") + "/" + rsetimg.getString("imagen") + "' /></li>");
                                        }
                                        con.cierraConexion();
                                    } catch (Exception e) {
                                    }
                                %> 
                            </ul>
                        </div>
                    </div>
                </div>

                <a name='mapa'></a>
                <%
                    if (!uni_mapa.equals("")) {
                %>
                <div class="panel panel-primary">

                    <!-- Default panel contents -->
                    <div class="panel-heading">Mapa</div>
                    <div class="panel-body">
                        <div class="col-lg-12">
                            <%
                                try {
                                    con.conectar();
                                    ResultSet rset_mapa = con.consulta("select ubi_mapa_1, ubi_mapa_2 from tb_mapas where id_uni = '" + request.getParameter("id_uni") + "' ");
                                    while (rset_mapa.next()) {
                            %>
                            <iframe class="col-lg-12" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="<%=rset_mapa.getString(1)%>"></iframe><br /><small><a href="<%=rset_mapa.getString(2)%>" target="_blank">Ver mapa más grande</a></small>
                                    <%
                                            }
                                            con.cierraConexion();
                                        } catch (Exception e) {

                                        }
                                    %>
                                    <%
                                        }
                                    %>
                        </div>
                    </div>
                </div>

                <a name="inv"></a>
                <!----------------Inventario------------------>
                <%
                    if (ban_inv == 1) {
                %>
                <div class="panel panel-primary">

                    <!-- Default panel contents -->
                    <div class="panel-heading">Inventario</div>
                    <div class="panel-body">
                        <%                        String canti = "", fecha = "";
                            try {
                                con.conectar();
                                ResultSet rset_inv = con.consulta("select u.nombre_gnk, i.fecha, sum(i.cant) as cant from tb_unidades u, inventarios i where i.id_uni = '" + request.getParameter("id_uni") + "' and u.id_uni = i.id_uni");
                                while (rset_inv.next()) {
                                    fecha = rset_inv.getString("fecha");
                                    canti = rset_inv.getString("cant");
                                    canti = "" + format.format(Integer.parseInt(canti));
                                }
                                con.cierraConexion();
                            } catch (Exception e) {
                            }
                        %>
                        <div class="form-group form-horizontal">

                            <div class="col-sm-3 form-horizontal">
                                Cantidad de piezas
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control" type="text" value="<%=canti%>" />
                            </div>
                            <div class="col-sm-3 form-horizontal">
                                Fecha de Captura
                            </div>
                            <div class="col-sm-2">
                                <input class="form-control" type="text" value="<%=fecha%>" />
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="dataTable">
                            <thead>
                            <th>Clave</th>
                            <th>Descripción</th>
                            <!--td>Cad</td-->
                            <th>Existencias</th>
                            </thead>
                            <tbody>
                                <!--Loop start, you could use a repeat region here-->
                                <%
                                    try {
                                        con.conectar();
                                        ResultSet rset_inv = con.consulta("select i.cla_pro, i.lot_pro, i.cad_pro, sum(i.cant) as cant, c.descrip from inventarios i, clave_med c where i.cla_pro = c.clave and i.id_uni = '" + request.getParameter("id_uni") + "' group by i.cla_pro, i.lot_pro, i.cad_pro ORDER BY i.cla_pro+0");
                                        while (rset_inv.next()) {
                                %>
                                <tr>
                                    <td><%=rset_inv.getString("cla_pro")%></td>
                                    <td><%=rset_inv.getString("descrip")%></td>
                                    <td><%=rset_inv.getInt("cant")%></td>
                                </tr>
                                <%
                                        }
                                        con.cierraConexion();
                                    } catch (Exception e) {

                                    }
                                %>
                                <!--Loop end-->
                            </tbody>
                        </table>
                    </div>
                </div>
                <%
                    }
                %>
                <!---------------------------------->


                <%
                        }
                    } catch (Exception e) {
                        //out.println("Hola");
                        out.println(e.getMessage());
                    }
                    con.cierraConexion();
                    if (ban == 0) {
                        //out.println("<script>alert('Se detectó un error al momento de la carga, por favor ingrese nuevamente.')</script>");
                        //out.println("<script>window.location = 'indexCap.jsp'</script>");
                    }
                %>
            </form>
        </div>

        <!-- 
    Mensaje de Acerca de...
        -->
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">INSTRUCCIONES DE CONSULTA</h4>
                    </div>
                    <div class="modal-body">
                        <img src="imagenes/GNKL_Small.JPG" />Previamente debes de checar que haya conexi&oacute;n a Internet<br>
                        <ul>
                            <li>Seleccione la Unidad a consultar</li>
                        </ul>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <!--button type="button" class="btn btn-primary">Guardar Info</button-->
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <!-- 
         fin Mensaje de Acerca de...
        -->                            
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Ingresa tus Datos</h4>
                    </div>
                    <div class="modal-body">
                        <form name="form_com" method="post" id="form_com">
                            Nombre: <input type="text" class="form-control" autofocus placeholder="Ingrese su Nombre" name="txtf_nom" id="txtf_nom" />
                            Cuenta de Correo: <input type="text" class="form-control"  placeholder="Ingrese su Cuenta de Correo" name="txtf_cor" id="txtf_cor" onblur="validarEmail(this.form.txtf_cor.value);" />
                            Deje su Comentario: <textarea name="txta_com" cols="10" rows="5" class="form-control" id="txta_com"></textarea>
                            <div class="modal-footer">

                                <input type="submit" class="btn btn-primary" value="Guardar" id="btn_com" onClick="return verificaCom(document.forms.form_com);" />
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            </div>

                        </form>
                    </div>

                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <a href="#" class="scrollup">Scroll</a>
    </body>
</html>

<!--script src="js/funcionesBasicas.js"></script-->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<!--script src="js/bjqs-1.3.min.js"></script-->
<script src="js/jquery-ui-1.10.3.custom.js"></script>
<!--script src="js/libs/jquery.secret-source.min.js"></script-->
<script src="js/jquery.blueberry.js"></script>
<script src="js/jquery.dataTables.js"></script>
<script src="js/dataTables.bootstrap.js"></script>
<script>
                                    $(document).ready(function() {
                                        $('#dataTable').dataTable();
                                    });
</script>
<script type="text/javascript">

    $(window).load(function() {
        $('.blueberry').blueberry();
    });

    $(document).ready(function() {

        $(window).scroll(function() {
            if ($(this).scrollTop() > 100) {
                $('.scrollup').fadeIn();
            } else {
                $('.scrollup').fadeOut();
            }
        });
        $('.scrollup').click(function() {
            $("html, body").animate({scrollTop: 0}, 600);
            return false;
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#form').submit(function() {

            //alert("Ingresó");
            return false;
        });
        $('#form_com').submit(function() {
            //alert("huges");
            return false;
        });
        $("#btn_com").click(function() {

            var nom = $('#txtf_nom').val();
            var cor = $('#txtf_cor').val();
            var com = $('#txta_com').val();
            //alert(id+" "+id);
            if (nom == '' || cor == '' || com == '') {
                return false;
            }
            else {
                var dataString = $('#form_com').serialize();
                //alert('Datos serializados: '+dataString);
                var dir = 'servletCorreo';
                $.ajax({
                    url: dir,
                    type: "POST",
                    data: dataString,
                    success: function(data) {
                        alert("Sus datos han sido Enviados");
                        location.reload();
                        //$("#form_com").fadeOut("slow");
                        /*$('#txtf_nom').value='huge';
                         $('#txtf_cor').value='';
                         $('#txta_com').value='';*/
                    },
                });
            }
        });
    });</script>
<script>