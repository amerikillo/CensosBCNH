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

    ConectionDB con = new ConectionDB();

    try {
        id_uni = request.getParameter("id_uni");
    } catch (Exception e) {
        id_uni = "";
    }
    int ban = 0;
    String var[];
    String valuech = "";
    id_uni = (String) sesion.getAttribute("id_uni");
    try {
        con.conectar();
        ResultSet rset = con.consulta("select * from tb_a as a, tb_b as b, tb_c as c, tb_d as d, tb_e as e, tb_f as f, tb_g as g, tb_unidades as clave where clave.id_uni=a.id_uni and clave.id_uni=b.id_uni and clave.id_uni=c.id_uni and clave.id_uni=d.id_uni and clave.id_uni=e.id_uni and clave.id_uni=f.id_uni and clave.id_uni=g.id_uni and clave.id_uni = '" + id_uni + "' group by clave.id_uni;");
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
<html>
    <head>
        <!--Cosas de Bootstrap-->
        <link href="css/bootstrap.css" rel="stylesheet" />
        <!----->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>:: CAPTURA DE CENSOS ::</title>
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
                <div class="col-lg-5 text-primary">
                    <h2>Captura de Censos Hospitales</h2>
                </div>
                <div class="col-lg-7" style="padding-top: 15px;">
                    <a href="indexCap.jsp" class="btn btn-primary">Men&uacute;</a>
                    <a data-toggle="modal" href="#myModal2" class="btn btn-default">Instrucciones</a>
                    <a data-toggle="modal" href="#myModal" class="btn btn-default">Sistemas</a>
                    <a href="indexCap.jsp" class="btn btn-default">Salir</a>
                </div>
            </div>
            <hr>
            <form class="form-horizontal" action="GuardaSeccion" method="post" name="formularioHospitales">

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
                        <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" readonly onkeypress="return tabular(event, this);" />
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
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return tabular(event, this);" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Fecha y Hora:</b>
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" readonly onkeypress="return tabular(event, this);" />
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
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" readonly onkeypress="return tabular(event, this);" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Categoria:</b>
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" readonly onkeypress="return tabular(event, this);" />
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
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return tabular(event, this);" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Referencias:</b>
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return tabular(event, this);" />
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
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return tabular(event, this);" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Ciudad o Población:</b>
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return tabular(event, this);" />
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
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" readonly onkeypress="return tabular(event, this);" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Código Postal:</b>
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" maxlength="5" onkeypress="return isNumberKey(event, this);" />
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
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>" onkeypress="LP_data();
                                        anade(this);
                                        return isNumberKey(event, this);" maxlength="14" value="<%=rset.getString(nombreC)%>" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Página Web:</b>
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return tabular(event, this);" />
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaC();" id="<%=nombreC%>">
                                    <option value="">-- ESCOJA CANTIDAD --</option>
                                    <option value="1 A 500 HABITANTES" <% if (rset.getString(nombreC).equals("1 A 500 HABITANTES")) {
                                            out.println("selected");
                                        }%> >1 A 500 HABITANTES</option>
                                    <option value="501 A 1,000 HABITANTES" <% if (rset.getString(nombreC).equals("501 A 1,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >501 A 1,000 HABITANTES</option>
                                    <option value="1,001 A 2,500 HABITANTES" <% if (rset.getString(nombreC).equals("1,001 A 2,500 HABITANTES")) {
                                            out.println("selected");
                                        }%> >1,001 A 2,500 HABITANTES</option>
                                    <option value="2,501 A 5,000 HABITANTES" <% if (rset.getString(nombreC).equals("2,501 A 5,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >2,501 A 5,000 HABITANTES</option>
                                    <option value="5,001 A 10,000 HABITANTES" <% if (rset.getString(nombreC).equals("5,001 A 10,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >5,001 A 10,000 HABITANTES</option>
                                    <option value="10,001 A 25,000 HABITANTES" <% if (rset.getString(nombreC).equals("10,001 A 25,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >10,001 A 25,000 HABITANTES</option>
                                    <option value="25,001 A 50,000 HABITANTES" <% if (rset.getString(nombreC).equals("25,001 A 50,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >25,001 A 50,000 HABITANTES</option>
                                    <option value="50,001 A 100,000 HABITANTES" <% if (rset.getString(nombreC).equals("50,001 A 100,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >50,001 A 100,000 HABITANTES</option>
                                    <option value="100,001 A 250,000 HABITANTES" <% if (rset.getString(nombreC).equals("100,001 A 250,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >100,001 A 250,000 HABITANTES</option>
                                    <option value="250,001 A 500,000 HABITANTES" <% if (rset.getString(nombreC).equals("250,001 A 500,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >250,001 A 500,000 HABITANTES</option>
                                    <option value="500,001 A 1,000,000 HABITANTES" <% if (rset.getString(nombreC).equals("500,001 A 1,000,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >500,001 A 1,000,000 HABITANTES</option>
                                    <option value="1,000,001 A 5,000,000 HABITANTES" <% if (rset.getString(nombreC).equals("1,000,001 A 5,000,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >1,000,001 A 5,000,000 HABITANTES</option>
                                    <option value="+ DE 5,000,000 HABITANTES" <% if (rset.getString(nombreC).equals("+ DE 5,000,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >+ DE 5,000,000 HABITANTES</option>

                                </select>

                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Jurisdicción Sanitaria Perteneciente:</b>
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" readonly onkeypress="return tabular(event, this);" />
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
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" readonly onkeypress="return tabular(event, this);" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Número de Servicios:</b>
                                <br />
                                Indicar el número de servicios que tiene el hospital, como cirugía, urgencias, pediatría, odontología, etc.
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control" maxlength="5" name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return isNumberKey(event, this);" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>

                        <br />
                        <div class="row">
                            <div class="col-lg-2 control-label">
                                <b>Seleccione los servicios:</b>
                                <br />
                                Describir todos los que tiene el hospital, como cirugía, urgencias, pediatría, odontología, etc.
                            </div>
                            <div class="col-lg-4">
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" 
                                       <%
                                           var = rset.getString(nombreC).split(",");
                                           for (int i = 0; i < var.length; i++) {
                                               ////System.out.println("*****" + var[i]);
                                               if (var[i].equals("Otorrinolaringología")) {
                                                   out.println("checked");
                                               }
                                           }
                                       %>
                                       value="Otorrinolaringología">Otorrinolaringología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Oftalmología")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Oftalmología">Oftalmología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Hematología")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Hematología">Hematología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Audiología y Foniatría")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Audiología y Foniatría">Audiología y Foniatría<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Urología")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Urología">Urología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Nefrología")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Nefrología">Nefrología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Ortopedia")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Ortopedia">Ortopedia<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Gastroenterología")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Gastroenterología">Gastroenterología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Cirugía plástica")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Cirugía plástica">Cirugía plástica<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Dermatología")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Dermatología">Dermatología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Geriatría")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Geriatría">Geriatría<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Oncología")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Oncología">Oncología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Gineco-Obtetricia")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Gineco-Obtetricia">Gineco-Obtetricia<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Terapia Médica Intensiva")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Terapia Médica Intensiva">Terapia Médica Intensiva<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Anestesiología")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Anestesiología">Anestesiología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Quirófano Central")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Quirófano Central">Quirófano Central<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Clínica del Dolor")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Clínica del Dolor">Clínica del Dolor<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Laboratorio")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Laboratorio">Laboratorio<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Radiología e Imagenología")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Radiología e Imagenología">Radiología e Imagenología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Cirugía general")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Cirugía general">Cirugía general<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Medicina interna")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Medicina interna">Medicina interna<br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-4">
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC%>" 
                                       <%
                                           var = rset.getString(nombreC).split(",");
                                           for (int i = 0; i < var.length; i++) {
                                               ////System.out.println("*****" + var[i]);
                                               if (var[i].equals("Alergia e Inmunología")) {
                                                   out.println("checked");
                                               }
                                           }
                                       %>
                                       value="Alergia e Inmunología">Alergia e Inmunología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Patología")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Patología">Patología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Genética")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Genética">Genética<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Consulta Externa")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Consulta Externa">Consulta Externa<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Medicina preventiva")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Medicina preventiva">Medicina preventiva<br>

                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Urgencias")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Urgencias">Urgencias<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Banco de sangre")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Banco de sangre">Banco de sangre<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Medicina física y rehabilitación")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Medicina física y rehabilitación">Medicina física y rehabilitación<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Neurología y Neurocirugía")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Neurología y Neurocirugía">Neurología y Neurocirugía<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Reumatología")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Reumatología">Reumatología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Estomatología")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Estomatología">Estomatología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Endocrinología")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Endocrinología">Endocrinología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Salud mental")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Salud mental">Salud mental<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Infectología")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Infectología">Infectología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Neumología")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Neumología">Neumología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Medicina Experimental")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Medicina Experimental">Medicina Experimental<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Cardiología")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Cardiología">Cardiología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Pediatría")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Pediatría">Pediatría<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Estomatología")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Estomatología">Estomatología<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Farmacología Clínica")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Farmacología Clínica">Farmacología Clínica<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Otorrinolaringología") && !var[i].equals("Oftalmología") && !var[i].equals("Hematología") && !var[i].equals("Audiología y Foniatría") && !var[i].equals("Urología") && !var[i].equals("Nefrología") && !var[i].equals("Ortopedia") && !var[i].equals("Gastroenterología") && !var[i].equals("Cirugía plástica") && !var[i].equals("Dermatología") && !var[i].equals("Geriatría") && !var[i].equals("Oncología") && !var[i].equals("Gineco-Obtetricia") && !var[i].equals("Terapia Médica Intensiva") && !var[i].equals("Anestesiología") && !var[i].equals("Quirófano Central") && !var[i].equals("Clínica del Dolor") && !var[i].equals("Laboratorio") && !var[i].equals("Radiología e Imagenología") && !var[i].equals("Cirugía general") && !var[i].equals("Medicina interna") && !var[i].equals("Oftalmología") && !var[i].equals("Alergia e Inmunología") && !var[i].equals("Patología") && !var[i].equals("Genética") && !var[i].equals("Consulta Externa") && !var[i].equals("Medicina preventiva") && !var[i].equals("Urgencias") && !var[i].equals("Banco de sangre") && !var[i].equals("Medicina física y rehabilitación") && !var[i].equals("Neurología y Neurocirugía") && !var[i].equals("Reumatología") && !var[i].equals("Estomatología") && !var[i].equals("Endocrinología") && !var[i].equals("Salud mental") && !var[i].equals("Infectología") && !var[i].equals("Neumología") && !var[i].equals("Medicina Experimental") && !var[i].equals("Cardiología") && !var[i].equals("Pediatría") && !var[i].equals("Estomatología") && !var[i].equals("Farmacología Clínica")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-2 control-label">
                                <b>Número de Camas Censables:</b>
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  maxlength="5" onkeypress="return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" />
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
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  maxlength="5" onkeypress="return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Nombre del Responsable del Hospital:</b>
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return tabular(event, this);" />
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
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  onkeypress="LP_data();
                                        anade(this);
                                        return isNumberKey(event, this);" maxlength="14"  value="<%=rset.getString(nombreC)%>" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Correo Electrónico del Responsable:</b>
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return tabular(event, this);" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>

                        <br />
                        <button type="submit" name="guarda_seccion" value="A" class="btn btn-primary btn-lg btn-block" onclick="return validara()">Guardar Sección A</button>
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
                                <b>Número de Consultorios de Primer Nivel:</b>
                                <br>
                                Indicar el número de consultorios que tiene la unidad
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control" maxlength="6" name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return isNumberKey(event, this);" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Número de Consultorios de Segundo Nivel:</b>
                                <br/>
                                Indicar el número de consultorios que tiene la unidad
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control" maxlength="6" name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return isNumberKey(event, this);" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-2 control-label">
                                <b>Consultas Promedio Diarias por Consultorio de Primer Nivel:</b>
                                <br/>
                                Indicar el número de consultas que en promedio da cada consultorio al día
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control" maxlength="6" name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return isNumberKey(event, this);" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-2 control-label">
                                <b>Consultas Promedio Diarias por Consultorio de Segundo Nivel:</b>
                                <br/>
                                Indicar el número de consultas que en promedio da cada consultorio al día
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control" maxlength="6" name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return isNumberKey(event, this);" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>

                        <button type="submit" name="guarda_seccion" value="B" class="btn btn-primary btn-lg btn-block" onclick="return validar_b()">Guardar Sección B</button>
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
                            <div class="col-lg-4">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="validaServU();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cómo se surte de Insumos?</b>
                            </div>
                            <div class="col-lg-4">
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" 
                                       <%
                                           var = rset.getString(nombreC).split(",");
                                           for (int i = 0; i < var.length; i++) {
                                               ////System.out.println("*****" + var[i]);
                                               if (var[i].equals("Receta Colectiva a Farmacia")) {
                                                   out.println("checked");
                                               }
                                           }
                                       %>
                                       value="Receta Colectiva a Farmacia"> Receta Colectiva a Farmacia<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Requerimiento o pedido a Farmacia")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Requerimiento o pedido a Farmacia"> Requerimiento o pedido a Farmacia<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Receta Colectiva a Almacén")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Receta Colectiva a Almacén"> Receta Colectiva a Almacén<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Requerimiento o pedido a Almacén")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Requerimiento o pedido a Almacén"> Requerimiento o pedido a Almacén<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Receta Colectiva a Farmacia") && !var[i].equals("Requerimiento o pedido a Farmacia") && !var[i].equals("Receta Colectiva a Almacén") && !var[i].equals("Requerimiento o pedido a Almacén")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Quién elabora el requerimiento o receta colectiva?</b>
                            </div>
                            <div class="col-lg-4">
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" 
                                       <%
                                           var = rset.getString(nombreC).split(",");
                                           for (int i = 0; i < var.length; i++) {
                                               ////System.out.println("*****" + var[i]);
                                               if (var[i].equals("Enfermera")) {
                                                   out.println("checked");
                                               }
                                           }
                                       %>
                                       value="Enfermera">Enfermera<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Encargado de Farmacia")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Encargado de Farmacia">Encargado de Farmacia<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Encargado de Almacén")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Encargado de Almacén">Encargado de Almacén<br>

                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Enfermera") && !var[i].equals("Encargado de Farmacia") && !var[i].equals("Encargado de Almacén")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>_" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>_" />
                                <%
                                    valuech = "";
                                %>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>El resurtido es por dosis o por presentación completa</b>
                            </div>
                            <div class="col-lg-4">
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" 
                                       <%
                                           var = rset.getString(nombreC).split(",");
                                           for (int i = 0; i < var.length; i++) {
                                               ////System.out.println("*****" + var[i]);
                                               if (var[i].equals("Por uni dosis (ampuleo o pastilleo)")) {
                                                   out.println("checked");
                                               }
                                           }
                                       %>
                                       value="Por uni dosis (ampuleo o pastilleo)">Por uni dosis (ampuleo o pastilleo)<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (var[i].equals("Por caja o presentación completa")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Por caja o presentación completa">Por caja o presentación completa<br>

                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        ////System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Por uni dosis (ampuleo o pastilleo)") && !var[i].equals("Por caja o presentación completa")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>__" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>__" />
                                <%
                                    valuech = "";
                                %>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <button type="submit" name="guarda_seccion" value="C" class="btn btn-primary btn-lg btn-block" onclick="return validar_c()">Guardar Sección C</button>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaD();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />


                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cómo se surten los Kits Quirúrgicos?</b>
                            </div>
                            <div class="col-lg-4">
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Receta Colectiva a Farmacia")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Receta Colectiva a Farmacia"> Receta Colectiva a Farmacia<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Requerimiento o pedido a Farmacia")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Requerimiento o pedido a Farmacia"> Requerimiento o pedido a Farmacia<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Receta Colectiva a Almacén")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Receta Colectiva a Almacén"> Receta Colectiva a Almacén<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Requerimiento o pedido a Almacén")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Requerimiento o pedido a Almacén"> Requerimiento o pedido a Almacén<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Receta Colectiva a Farmacia") && !var[i].equals("Requerimiento o pedido a Farmacia") && !var[i].equals("Receta Colectiva a Almacén") && !var[i].equals("Requerimiento o pedido a Almacén")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <button type="submit" name="guarda_seccion" value="D" class="btn btn-primary btn-lg btn-block" onclick="return validar_d()">Guardar Sección D</button>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="servFarmacia();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                                <select name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" class="form-control" id="<%=nombreC%>">
                                    <%
                                        for (int i = 0; i <= 24; i++) {
                                            out.println("<option ");
                                            if (rset.getString(nombreC).equals(i + ":00")) {
                                                out.println("selected");
                                            }
                                            out.println(">" + i + ":00</option>");
                                            if (i != 24) {

                                                out.println("<option ");
                                                if (rset.getString(nombreC).equals(i + ":30")) {
                                                    out.println("selected");
                                                }
                                                out.println(">" + i + ":30</option>");
                                            }
                                        }
                                    %>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-4">
                                A:
                                <select name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" class="form-control" id="<%=nombreC%>">
                                    <%
                                        for (int i = 0; i <= 24; i++) {
                                            out.println("<option ");
                                            if (rset.getString(nombreC).equals(i + ":00")) {
                                                out.println("selected");
                                            }
                                            out.println(">" + i + ":00</option>");
                                            if (i != 24) {

                                                out.println("<option ");
                                                if (rset.getString(nombreC).equals(i + ":30")) {
                                                    out.println("selected");
                                                }
                                                out.println(">" + i + ":30</option>");
                                            }
                                        }
                                    %>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuanto personal atiende?</b>
                                <br>Contemplar el total de los turnos
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return isNumberKey(event, this);" />
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuántos turnos existen?</b>
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return isNumberKey(event, this);" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />


                        <div class="row">
                            <div class="col-lg-6 control-label">
                                <b>¿El personal  cuenta con el certificado de la COFEPRIS para el manejo y dispensación de medicamento?</b>
                                <br>COFEPRIS = Comisión Federal para la Protección de Riesgos Sanitarios
                            </div>
                            <div class="col-lg-4">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Qué Insumos Médicos manejan?</b>
                            </div>
                            <div class="col-lg-4">
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Medicamento")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Medicamento">Medicamento<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Material de Curación")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Material de Curación">Material de Curación<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Soluciones")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Soluciones">Soluciones<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Medicamento Controlado")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Medicamento Controlado">Medicamento Controlado<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Medicamento de Red Fría")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Medicamento de Red Fría"> Medicamento de Red Fría<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Medicamento") && !var[i].equals("Material de Curación") && !var[i].equals("Soluciones") && !var[i].equals("Medicamento Controlado") && !var[i].equals("Medicamento de Red Fría")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cómo surten los Insumos Médicos?</b>
                            </div>
                            <div class="col-lg-4">
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Receta de Paciente (Consulta Externa)")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Receta de Paciente (Consulta Externa)">Receta de Paciente (Consulta Externa)<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Receta Colectiva de Pisos o Servicios")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Receta Colectiva de Pisos o Servicios">Receta Colectiva de Pisos o Servicios<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Soluciones")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Soluciones">Soluciones<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Pedido o Requerimiento")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Pedido o Requerimiento">Pedido o Requerimiento<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Receta de Paciente (Consulta Externa)") && !var[i].equals("Receta Colectiva de Pisos o Servicios") && !var[i].equals("Soluciones") && !var[i].equals("Pedido o Requerimiento")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Secretaría de Salud")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Secretaría de Salud">Secretaría de Salud<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Secretaría de Salud")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>_" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>Espacio aproximado de Farmacia en mts</b>
                                <br/>
                                Indicar: Largo y Ancho en metros y el total en metros cuadrados (est.); Ejemplo: 2 x 3 = 6 m2
                            </div>
                            <div class="col-lg-4">

                                <div class="row">
                                    <div class="col-sm-6">
                                        <input type="text" name="largoFarm" id="largoFarm" maxlength="4" class="form-control" placeholder="Largo" onkeypress="return isNumberKey(event, this);" onkeyup="areaFarm();" value="" />
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" name="anchoFarm" maxlength="4" class="form-control" id="anchoFarm" placeholder="Ancho" onkeypress="return isNumberKey(event, this);" onkeyup="areaFarm();" value="" />
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-lg-12">
                                        <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" class="form-control" id="<%=nombreC%>" value="<%=rset.getString(nombreC)%>" onkeypress="return isNumberKey(event, this);" readonly />
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
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return isNumberKey(event, this);" />
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
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Secretaría de Salud")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Secretaría de Salud">Secretaría de Salud<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Secretaría de Salud")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>


                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuentan con Refrigerador en la Farmacia?</b>
                            </div>
                            <div class="col-lg-4">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaRefriF();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si y funciona" <% if (rset.getString(nombreC).equals("Si y funciona")) {
                                            out.println("selected");
                                        }%> >Si y funciona</option>
                                    <option value="Si pero no funciona" <% if (rset.getString(nombreC).equals("Si pero no funciona")) {
                                            out.println("selected");
                                        }%> >Si pero no funciona</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Secretaría de Salud")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Secretaría de Salud">Secretaría de Salud<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Secretaría de Salud")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaEqCF();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return isNumberKey(event, this);" />
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
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Secretaría de Salud")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Secretaría de Salud">Secretaría de Salud<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Secretaría de Salud")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaSisF();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("No cuenta con Sistema Informático en Farmacia")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="No cuenta con Sistema Informático en Farmacia">No cuenta con Sistema Informático en Farmacia<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Registro de Movimientos al inventario")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Registro de Movimientos al inventario">Registro de Movimientos al inventario<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Consulta de existencias")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Consulta de existencias">Consulta de existencias<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Consulta de movimientos al inventario (Kardex)")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Consulta de movimientos al inventario (Kardex)">Consulta de movimientos al inventario (Kardex)<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Captura de Recetas")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Captura de Recetas">Captura de Recetas<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Emisión de comprobante de entrega al paciente")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Emisión de comprobante de entrega al paciente">Emisión de comprobante de entrega al paciente<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Registro y consulta de Médicos")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Registro y consulta de Médicos">Registro y consulta de Médicos<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Registro y consulta de Pacientes")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Registro y consulta de Pacientes">Registro y consulta de Pacientes<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Registro de Programa de Afiliación (SP, OP, PA)")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Registro de Programa de Afiliación (SP, OP, PA)">Registro de Programa de Afiliación (SP, OP, PA)<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Registro de Diagnóstico o Padecimiento (CIE-10)")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Registro de Diagnóstico o Padecimiento (CIE-10)">Registro de Diagnóstico o Padecimiento (CIE-10)<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Consulta de estadísticas")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Consulta de estadísticas">Consulta de estadísticas<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Elaboración de reportes")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Elaboración de reportes">Elaboración de reportes<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("No cuenta con Sistema Informático en Farmacia") && !var[i].equals("Registro de Movimientos al inventario") && !var[i].equals("Consulta de existencias") && !var[i].equals("Consulta de movimientos al inventario (Kardex)") && !var[i].equals("Captura de Recetas") && !var[i].equals("Emisión de comprobante de entrega al paciente") && !var[i].equals("Registro y consulta de Médicos") && !var[i].equals("Registro y consulta de Pacientes") && !var[i].equals("Registro de Programa de Afiliación (SP, OP, PA)") && !var[i].equals("Registro de Diagnóstico o Padecimiento (CIE-10)") && !var[i].equals("Consulta de estadísticas") && !var[i].equals("Elaboración de reportes")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Qué tipo de reportes generan en la Farmacia?</b>
                                <br>
                                Indicar todas las opciones que tenga el Sistema Informático
                            </div>
                            <div class="col-lg-4">
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Solicitado contra Surtido")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Solicitado contra Surtido">Solicitado contra Surtido<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Reporte de No Surtidos")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Reporte de No Surtidos">Reporte de No Surtidos<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Origen del Insumo")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Origen del Insumo">Origen del Insumo<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Consumos por Clave")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Consumos por Clave">Consumos por Clave<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Captura de Recetas")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Captura de Recetas">Captura de Recetas<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Consumos por Médico")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Consumos por Médico">Consumos por Médico<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Consumos por Paciente")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Consumos por Paciente">Consumos por Paciente<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Consumos por Servicio")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Consumos por Servicio">Consumos por Servicio<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Reporte de Abastecimiento")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Reporte de Abastecimiento">Reporte de Abastecimiento<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Reporte de Existencias")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Reporte de Existencias">Reporte de Existencias<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("No genera reportes")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="No genera reportes">No genera reportes<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Solicitado contra Surtido") && !var[i].equals("Reporte de No Surtidos") && !var[i].equals("Origen del Insumo") && !var[i].equals("Consumos por Clave") && !var[i].equals("Captura de Recetas") && !var[i].equals("Consumos por Médico") && !var[i].equals("Consumos por Paciente") && !var[i].equals("Consumos por Servicio") && !var[i].equals("Reporte de Abastecimiento") && !var[i].equals("Reporte de Existencias") && !var[i].equals("No genera reportes")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>_" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="ValidaOriPac();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Se escanea el código de barras de la poliza del paciente")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Se escanea el código de barras de la poliza del paciente" />Se escanea el código de barras de la poliza del paciente<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Se captura el número de afiliación de la poliza del paciente")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Se captura el número de afiliación de la poliza del paciente">Se captura el número de afiliación de la poliza del paciente<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Se verifica la fecha de vencimiento de la poliza de manera visual")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Se verifica la fecha de vencimiento de la poliza de manera visual">Se verifica la fecha de vencimiento de la poliza de manera visual<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("No se realiza ninguna validación del origen del paciente")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="No se realiza ninguna validación del origen del paciente">No se realiza ninguna validación del origen del paciente<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Se escanea el código de barras de la poliza del paciente") && !var[i].equals("Se captura el número de afiliación de la poliza del paciente") && !var[i].equals("Se verifica la fecha de vencimiento de la poliza de manera visual") && !var[i].equals("No se realiza ninguna validación del origen del paciente")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="validaTelF();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Cuál es el número de teléfono?</b>
                                <br>
                                Indicar número con Clave LADA
                            </div>
                            <div class="col-lg-3"><input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  onkeypress="LP_data();
                                    anade(this);
                                    return isNumberKey(event, this);" maxlength="14"  value="<%=rset.getString(nombreC)%>" />
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="validaPlantaF();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿La planta de energía eléctrica para emergencias cubre el suministro a la Farmacia?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="validaInternetF();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Cuál es el proveedor de Internet?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Megacable" <% if (rset.getString(nombreC).equals("Megacable")) {
                                            out.println("selected");
                                        }%> >Megacable</option>
                                    <option value="Cablemas" <% if (rset.getString(nombreC).equals("Cablemas")) {
                                            out.println("selected");
                                        }%> >Cablemas</option>
                                    <option value="Infinitum / Prodigy" <% if (rset.getString(nombreC).equals("Infinitum / Prodigy")) {
                                            out.println("selected");
                                        }%> >Infinitum / Prodigy</option>
                                    <option value="Axtel" <% if (rset.getString(nombreC).equals("Axtel")) {
                                            out.println("selected");
                                        }%> >Axtel</option>
                                    <option value="Bestel" <% if (rset.getString(nombreC).equals("Bestel")) {
                                            out.println("selected");
                                        }%> >Bestel</option>
                                    <option value="Telcel Móvil" <% if (rset.getString(nombreC).equals("Telcel Móvil")) {
                                            out.println("selected");
                                        }%> >Telcel Móvil</option>
                                    <option value="Iusacel Móvil" <% if (rset.getString(nombreC).equals("Iusacel Móvil")) {
                                            out.println("selected");
                                        }%> >Iusacel Móvil</option>
                                    <option value="Telnor" <% if (rset.getString(nombreC).equals("Telnor")) {
                                            out.println("selected");
                                        }%> >Telnor</option>
                                    <option value="Ninguno (No hay servicio)" <% if (rset.getString(nombreC).equals("Ninguno (No hay servicio)")) {
                                            out.println("selected");
                                        }%> >Ninguno (No hay servicio)</option>
                                </select>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Muy Rápido" <% if (rset.getString(nombreC).equals("Muy Rápido")) {
                                            out.println("selected");
                                        }%> >Muy Rápido</option>
                                    <option value="Rápido" <% if (rset.getString(nombreC).equals("Rápido")) {
                                            out.println("selected");
                                        }%> >Rápido</option>
                                    <option value="Normal" <% if (rset.getString(nombreC).equals("Normal")) {
                                            out.println("selected");
                                        }%> >Normal</option>
                                    <option value="Lento" <% if (rset.getString(nombreC).equals("Lento")) {
                                            out.println("selected");
                                        }%> >Lento</option>
                                    <option value="Muy Lento" <% if (rset.getString(nombreC).equals("Muy Lento")) {
                                            out.println("selected");
                                        }%> >Muy Lento</option>
                                    <option value="No hay servicio" <% if (rset.getString(nombreC).equals("No hay servicio")) {
                                            out.println("selected");
                                        }%> >No hay servicio</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Almacenan Insumo en otro lugar?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="validaAlmF();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                            <div class="col-lg-3">
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return tabular(event, this);" />
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
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Secretaría de Salud a través del Almacén Estatal")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Secretaría de Salud a través del Almacén Estatal">Secretaría de Salud a través del Almacén Estatal<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Varios Proveedores de Insumos Médicos")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Varios Proveedores de Insumos Médicos">Varios Proveedores de Insumos Médicos<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Un solo Proveedor de Insumos Médicos")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Un solo Proveedor de Insumos Médicos">Un solo Proveedor de Insumos Médicos<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Jurisdicción Sanitaria")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Jurisdicción Sanitaria">Jurisdicción Sanitaria<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Secretaría de Salud a través del Almacén Estatal") && !var[i].equals("Varios Proveedores de Insumos Médicos") && !var[i].equals("Un solo Proveedor de Insumos Médicos") && !var[i].equals("Jurisdicción Sanitaria")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Se realiza un pedido o requerimiento al Proveedor correspondiente")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Se realiza un pedido o requerimiento al Proveedor correspondiente">Se realiza un pedido o requerimiento al Proveedor correspondiente<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Se informa al Director y/o Administrador del Hospital")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Se informa al Director y/o Administrador del Hospital">Se informa al Director y/o Administrador del Hospital<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("No se realiza ninguna acción")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="No se realiza ninguna acción">No se realiza ninguna acción<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Compra Directa")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Compra Directa">Compra Directa<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Se realiza un pedido o requerimiento al Proveedor correspondiente") && !var[i].equals("Se informa al Director y/o Administrador del Hospital") && !var[i].equals("No se realiza ninguna acción") && !var[i].equals("Compra Directa")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>_" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>

                                    <option value="NA" <% if (rset.getString(nombreC).equals("NA")) {
                                            out.println("selected");
                                        }%> >NA</option>
                                    <option value="DIARIO" <% if (rset.getString(nombreC).equals("DIARIO")) {
                                            out.println("selected");
                                        }%> >DIARIO</option>
                                    <option value="CADA 2 DÍAS" <% if (rset.getString(nombreC).equals("CADA 2 DÍAS")) {
                                            out.println("selected");
                                        }%> >CADA 2 DÍAS</option>
                                    <option value="CADA 3 DÍAS" <% if (rset.getString(nombreC).equals("CADA 3 DÍAS")) {
                                            out.println("selected");
                                        }%> >CADA 3 DÍAS</option>
                                    <option value="SEMANAL" <% if (rset.getString(nombreC).equals("SEMANAL")) {
                                            out.println("selected");
                                        }%> >SEMANAL</option>
                                    <option value="QUINCENAL" <% if (rset.getString(nombreC).equals("QUINCENAL")) {
                                            out.println("selected");
                                        }%> >QUINCENAL</option>
                                    <option value="MENSUAL" <% if (rset.getString(nombreC).equals("MENSUAL")) {
                                            out.println("selected");
                                        }%> >MENSUAL</option>
                                    <option value="CADA 2 MESES" <% if (rset.getString(nombreC).equals("CADA 2 MESES")) {
                                            out.println("selected");
                                        }%> >CADA 2 MESES</option>
                                    <option value="CADA 3 MESES" <% if (rset.getString(nombreC).equals("CADA 3 MESES")) {
                                            out.println("selected");
                                        }%> >CADA 3 MESES</option>
                                    <option value="DE 4 A 6 MESES" <% if (rset.getString(nombreC).equals("DE 4 A 6 MESES")) {
                                            out.println("selected");
                                        }%> >DE 4 A 6 MESES</option>
                                    <option value="DE 6 A 8 MESES" <% if (rset.getString(nombreC).equals("DE 6 A 8 MESES")) {
                                            out.println("selected");
                                        }%> >DE 6 A 8 MESES</option>
                                    <option value="DE 8 MESES A UN AÑO" <% if (rset.getString(nombreC).equals("DE 8 MESES A UN AÑO")) {
                                            out.println("selected");
                                        }%> >DE 8 MESES A UN AÑO</option>
                                    <option value="MAS DEL AÑO" <% if (rset.getString(nombreC).equals("MAS DEL AÑO")) {
                                            out.println("selected");
                                        }%> >MAS DEL AÑO</option>
                                </select>
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
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Se realiza un pedido o requerimiento al área correspondiente")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Se realiza un pedido o requerimiento al área correspondiente">Se realiza un pedido o requerimiento al área correspondiente<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Se informa al Director y/o Administrador del Hospital")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Se informa al Director y/o Administrador del Hospital">Se informa al Director y/o Administrador del Hospital<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("No se realiza ninguna acción")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="No se realiza ninguna acción">No se realiza ninguna acción<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Compra Directa")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Compra Directa">Compra Directa<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Se realiza un pedido o requerimiento al área correspondiente") && !var[i].equals("Se informa al Director y/o Administrador del Hospital") && !var[i].equals("No se realiza ninguna acción") && !var[i].equals("Compra Directa")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Se lleva un registro de Piezas Solicitadas contra Surtidas?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Cúal es el Porcentaje de Abasto actual?</b>
                                <br>
                                Total de Piezas Solicitadas contra Surtidas vía recetas (pacientes y colectivas)
                            </div>
                            <div class="col-lg-3">
                                <select name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" class="form-control" id="<%=nombreC%>">
                                    <%
                                        for (int i = 0; i <= 10; i++) {
                                            out.println("<option ");
                                            if (rset.getString(nombreC).equals(i + "0%")) {
                                                out.println("selected");
                                            }
                                            out.println(">" + i + "0%</option>");
                                        }
                                    %>
                                </select>
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
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return isNumberKey(event, this);" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿El Inventario se encuentra actualizado?</b>
                                <br>
                                Es decir si las existencias al día
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return isNumberKey(event, this);" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Capturan recetas?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿La captura de recetas va al día?</b>
                                <br />
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Me puede proporcionar copia del inventario?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>

                        </div>
                        <br/>

                        <button type="submit" name="guarda_seccion" value="E" class="btn btn-primary btn-lg btn-block" onclick="return validar_e()">Guardar Sección E</button>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="servAlmacen();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>

                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>Tipo de almacén</b>
                            </div>
                            <div class="col-lg-4">
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Intrahospitalaria Medicamento")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Intrahospitalaria Medicamento">Intrahospitalaria Medicamento<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Intrahospitalaria Material de Curación")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Intrahospitalaria Material de Curación">Intrahospitalaria Material de Curación<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("CEYE")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="CEYE">CEYE<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("CENDI")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="CENDI">CENDI<br>

                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Intrahospitalaria Medicamento") && !var[i].equals("Intrahospitalaria Material de Curación") && !var[i].equals("CEYE") && !var[i].equals("CENDI")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <select name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" class="form-control" id="<%=nombreC%>">
                                    <%
                                        for (int i = 0; i <= 24; i++) {
                                            out.println("<option ");
                                            if (rset.getString(nombreC).equals(i + ":00")) {
                                                out.println("selected");
                                            }
                                            out.println(">" + i + ":00</option>");
                                            if (i != 24) {

                                                out.println("<option ");
                                                if (rset.getString(nombreC).equals(i + ":30")) {
                                                    out.println("selected");
                                                }
                                                out.println(">" + i + ":30</option>");
                                            }
                                        }
                                    %>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-4">
                                A:
                                <select name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" class="form-control" id="<%=nombreC%>">
                                    <%
                                        for (int i = 0; i <= 24; i++) {
                                            out.println("<option ");
                                            if (rset.getString(nombreC).equals(i + ":00")) {
                                                out.println("selected");
                                            }
                                            out.println(">" + i + ":00</option>");
                                            if (i != 24) {

                                                out.println("<option ");
                                                if (rset.getString(nombreC).equals(i + ":30")) {
                                                    out.println("selected");
                                                }
                                                out.println(">" + i + ":30</option>");
                                            }
                                        }
                                    %>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuanto personal atiende?</b>
                                <br>Contemplar el total de los turnos
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return isNumberKey(event, this);" />
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cuántos turnos existen?</b>
                            </div>
                            <div class="col-lg-4">
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return isNumberKey(event, this);" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-6 control-label">
                                <b>¿El personal cuenta con el certificado de la COFEPRIS para el manejo y dispensación de medicamento?</b>
                                <br>COFEPRIS = Comisión Federal para la Protección de Riesgos Sanitarios
                            </div>
                            <div class="col-lg-4">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Qué Insumos Médicos manejan?</b>
                            </div>
                            <div class="col-lg-4">
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Medicamento")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Medicamento">Medicamento<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Material de Curación")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Material de Curación">Material de Curación<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Soluciones")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Soluciones">Soluciones<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Medicamento Controlado")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Medicamento Controlado">Medicamento Controlado<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Medicamento de Red Fría")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Medicamento de Red Fría"> Medicamento de Red Fría<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Medicamento") && !var[i].equals("Material de Curación") && !var[i].equals("Soluciones") && !var[i].equals("Medicamento Controlado") && !var[i].equals("Medicamento de Red Fría")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿Cómo surten los Insumos Médicos?</b>
                            </div>
                            <div class="col-lg-4">
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Receta de Paciente (Consulta Externa)")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Receta de Paciente (Consulta Externa)">Receta de Paciente (Consulta Externa)<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Receta Colectiva de Pisos o Servicios")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Receta Colectiva de Pisos o Servicios">Receta Colectiva de Pisos o Servicios<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Soluciones")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Soluciones">Soluciones<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Pedido o Requerimiento")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Pedido o Requerimiento">Pedido o Requerimiento<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Receta de Paciente (Consulta Externa)") && !var[i].equals("Receta Colectiva de Pisos o Servicios") && !var[i].equals("Soluciones") && !var[i].equals("Pedido o Requerimiento")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %> <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Secretaría de Salud")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Secretaría de Salud">Secretaría de Salud<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Secretaría de Salud")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>_" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                    <div class="col-sm-6"><input type="text" name="largoAlm" maxlength="4" class="form-control" id="largoAlm" onkeypress="return isNumberKey(event, this);" onkeyup="areaAlm();" value="" /></div>
                                    <div class="col-sm-6"><input type="text" name="anchoAlm" maxlength="4" class="form-control" id="anchoAlm" onkeypress="return isNumberKey(event, this);" onkeyup="areaAlm();" value="" /></div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12"><input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="4" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" readonly /></div>
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
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return tabular(event, this);" />
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
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Secretaría de Salud")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Secretaría de Salud">Secretaría de Salud<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Secretaría de Salud")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>_" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="validaAnden();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>

                            <div class="col-lg-3 control-label">
                                <b>¿Cuentan con Rampa para carga y descarga?</b>
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                            <div class="col-lg-3">
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return tabular(event, this);" />
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaRefriA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si y funciona" <% if (rset.getString(nombreC).equals("Si y funciona")) {
                                            out.println("selected");
                                        }%> >Si y funciona</option>
                                    <option value="Si pero no funciona" <% if (rset.getString(nombreC).equals("Si pero no funciona")) {
                                            out.println("selected");
                                        }%> >Si pero no funciona</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Secretaría de Salud")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Secretaría de Salud">Secretaría de Salud<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Secretaría de Salud")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaEqCA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return isNumberKey(event, this);" />
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
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Secretaría de Salud")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Secretaría de Salud">Secretaría de Salud<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Secretaría de Salud")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaSisA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("No cuenta con Sistema Informático en Almacén")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="No cuenta con Sistema Informático en Almacén">No cuenta con Sistema Informático en Almacén<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Registro de Movimientos al inventario")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Registro de Movimientos al inventario">Registro de Movimientos al inventario<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Consulta de existencias")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Consulta de existencias">Consulta de existencias<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Consulta de movimientos al inventario (Kardex)")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Consulta de movimientos al inventario (Kardex)">Consulta de movimientos al inventario (Kardex)<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Captura de Recetas")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Captura de Recetas">Captura de Recetas<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Emisión de comprobante de entrega al paciente")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Emisión de comprobante de entrega al paciente">Emisión de comprobante de entrega al paciente<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Registro y consulta de Médicos")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Registro y consulta de Médicos">Registro y consulta de Médicos<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Registro y consulta de Pacientes")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Registro y consulta de Pacientes">Registro y consulta de Pacientes<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Registro de Programa de Afiliación (SP, OP, PA)")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Registro de Programa de Afiliación (SP, OP, PA)">Registro de Programa de Afiliación (SP, OP, PA)<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Registro de Diagnóstico o Padecimiento (CIE-10)")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Registro de Diagnóstico o Padecimiento (CIE-10)">Registro de Diagnóstico o Padecimiento (CIE-10)<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Consulta de estadísticas")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Consulta de estadísticas">Consulta de estadísticas<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Elaboración de reportes")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Elaboración de reportes">Elaboración de reportes<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("No cuenta con Sistema Informático en Farmacia") && !var[i].equals("Registro de Movimientos al inventario") && !var[i].equals("Consulta de existencias") && !var[i].equals("Consulta de movimientos al inventario (Kardex)") && !var[i].equals("Captura de Recetas") && !var[i].equals("Emisión de comprobante de entrega al paciente") && !var[i].equals("Registro y consulta de Médicos") && !var[i].equals("Registro y consulta de Pacientes") && !var[i].equals("Registro de Programa de Afiliación (SP, OP, PA)") && !var[i].equals("Registro de Diagnóstico o Padecimiento (CIE-10)") && !var[i].equals("Consulta de estadísticas") && !var[i].equals("Elaboración de reportes")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Solicitado contra Surtido")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Solicitado contra Surtido">Solicitado contra Surtido<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Reporte de No Surtidos")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Reporte de No Surtidos">Reporte de No Surtidos<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Origen del Insumo")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Origen del Insumo">Origen del Insumo<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Consumos por Clave")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Consumos por Clave">Consumos por Clave<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Captura de Recetas")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Captura de Recetas">Captura de Recetas<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Consumos por Médico")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Consumos por Médico">Consumos por Médico<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Consumos por Paciente")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Consumos por Paciente">Consumos por Paciente<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Consumos por Servicio")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Consumos por Servicio">Consumos por Servicio<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Reporte de Abastecimiento")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Reporte de Abastecimiento">Reporte de Abastecimiento<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Reporte de Existencias")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Reporte de Existencias">Reporte de Existencias<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("No genera reportes")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="No genera reportes">No genera reportes<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Solicitado contra Surtido") && !var[i].equals("Reporte de No Surtidos") && !var[i].equals("Origen del Insumo") && !var[i].equals("Consumos por Clave") && !var[i].equals("Captura de Recetas") && !var[i].equals("Consumos por Médico") && !var[i].equals("Consumos por Paciente") && !var[i].equals("Consumos por Servicio") && !var[i].equals("Reporte de Abastecimiento") && !var[i].equals("Reporte de Existencias") && !var[i].equals("No genera reportes")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>_" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="validaTelA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Cuál es el número de teléfono?</b>
                                <br>
                                Indicar número con Clave LADA
                            </div>
                            <div class="col-lg-3"><input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  onkeypress="LP_data();
                                    anade(this);
                                    return isNumberKey(event, this);" maxlength="14"  value="<%=rset.getString(nombreC)%>" />
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="validaInternetA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Cuál es el proveedor de Internet?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Megacable" <% if (rset.getString(nombreC).equals("Megacable")) {
                                            out.println("selected");
                                        }%> >Megacable</option>
                                    <option value="Cablemas" <% if (rset.getString(nombreC).equals("Cablemas")) {
                                            out.println("selected");
                                        }%> >Cablemas</option>
                                    <option value="Infinitum / Prodigy" <% if (rset.getString(nombreC).equals("Infinitum / Prodigy")) {
                                            out.println("selected");
                                        }%> >Infinitum / Prodigy</option>
                                    <option value="Axtel" <% if (rset.getString(nombreC).equals("Axtel")) {
                                            out.println("selected");
                                        }%> >Axtel</option>
                                    <option value="Bestel" <% if (rset.getString(nombreC).equals("Bestel")) {
                                            out.println("selected");
                                        }%> >Bestel</option>
                                    <option value="Telcel Móvil" <% if (rset.getString(nombreC).equals("Telcel Móvil")) {
                                            out.println("selected");
                                        }%> >Telcel Móvil</option>
                                    <option value="Iusacel Móvil" <% if (rset.getString(nombreC).equals("Iusacel Móvil")) {
                                            out.println("selected");
                                        }%> >Iusacel Móvil</option>
                                    <option value="Telnor" <% if (rset.getString(nombreC).equals("Telnor")) {
                                            out.println("selected");
                                        }%> >Telnor</option>
                                    <option value="Ninguno (No hay servicio)" <% if (rset.getString(nombreC).equals("Ninguno (No hay servicio)")) {
                                            out.println("selected");
                                        }%> >Ninguno (No hay servicio)</option>
                                </select>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Muy Rápido" <% if (rset.getString(nombreC).equals("Muy Rápido")) {
                                            out.println("selected");
                                        }%> >Muy Rápido</option>
                                    <option value="Rápido" <% if (rset.getString(nombreC).equals("Rápido")) {
                                            out.println("selected");
                                        }%> >Rápido</option>
                                    <option value="Normal" <% if (rset.getString(nombreC).equals("Normal")) {
                                            out.println("selected");
                                        }%> >Normal</option>
                                    <option value="Lento" <% if (rset.getString(nombreC).equals("Lento")) {
                                            out.println("selected");
                                        }%> >Lento</option>
                                    <option value="Muy Lento" <% if (rset.getString(nombreC).equals("Muy Lento")) {
                                            out.println("selected");
                                        }%> >Muy Lento</option>
                                    <option value="No hay servicio" <% if (rset.getString(nombreC).equals("No hay servicio")) {
                                            out.println("selected");
                                        }%> >No hay servicio</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Almacenan Insumo en otro lugar aparte?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="validaAlmA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                            <div class="col-lg-3">
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return tabular(event, this);" />
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
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Secretaría de Salud a través del Almacén Estatal")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Secretaría de Salud a través del Almacén Estatal">Secretaría de Salud a través del Almacén Estatal<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Varios Proveedores de Insumos Médicos")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Varios Proveedores de Insumos Médicos">Varios Proveedores de Insumos Médicos<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Un solo Proveedor de Insumos Médicos")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Un solo Proveedor de Insumos Médicos">Un solo Proveedor de Insumos Médicos<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>"  <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Jurisdicción Sanitaria")) {
                                            out.println("checked");
                                        }
                                    }
                                       %> value="Jurisdicción Sanitaria">Jurisdicción Sanitaria<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Secretaría de Salud a través del Almacén Estatal") && !var[i].equals("Varios Proveedores de Insumos Médicos") && !var[i].equals("Un solo Proveedor de Insumos Médicos") && !var[i].equals("Jurisdicción Sanitaria")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Se realiza un pedido o requerimiento al Proveedor correspondiente")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Se realiza un pedido o requerimiento al Proveedor correspondiente">Se realiza un pedido o requerimiento al Proveedor correspondiente<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Se informa al Director y/o Administrador del Hospital")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Se informa al Director y/o Administrador del Hospital">Se informa al Director y/o Administrador del Hospital<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("No se realiza ninguna acción")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="No se realiza ninguna acción">No se realiza ninguna acción<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Compra Directa")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Compra Directa">Compra Directa<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Se realiza un pedido o requerimiento al Proveedor correspondiente") && !var[i].equals("Se informa al Director y/o Administrador del Hospital") && !var[i].equals("No se realiza ninguna acción") && !var[i].equals("Compra Directa")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>

                                    <option value="NA" <% if (rset.getString(nombreC).equals("NA")) {
                                            out.println("selected");
                                        }%> >NA</option>
                                    <option value="DIARIO" <% if (rset.getString(nombreC).equals("DIARIO")) {
                                            out.println("selected");
                                        }%> >DIARIO</option>
                                    <option value="CADA 2 DÍAS" <% if (rset.getString(nombreC).equals("CADA 2 DÍAS")) {
                                            out.println("selected");
                                        }%> >CADA 2 DÍAS</option>
                                    <option value="CADA 3 DÍAS" <% if (rset.getString(nombreC).equals("CADA 3 DÍAS")) {
                                            out.println("selected");
                                        }%> >CADA 3 DÍAS</option>
                                    <option value="SEMANAL" <% if (rset.getString(nombreC).equals("SEMANAL")) {
                                            out.println("selected");
                                        }%> >SEMANAL</option>
                                    <option value="QUINCENAL" <% if (rset.getString(nombreC).equals("QUINCENAL")) {
                                            out.println("selected");
                                        }%> >QUINCENAL</option>
                                    <option value="MENSUAL" <% if (rset.getString(nombreC).equals("MENSUAL")) {
                                            out.println("selected");
                                        }%> >MENSUAL</option>
                                    <option value="CADA 2 MESES" <% if (rset.getString(nombreC).equals("CADA 2 MESES")) {
                                            out.println("selected");
                                        }%> >CADA 2 MESES</option>
                                    <option value="CADA 3 MESES" <% if (rset.getString(nombreC).equals("CADA 3 MESES")) {
                                            out.println("selected");
                                        }%> >CADA 3 MESES</option>
                                    <option value="DE 4 A 6 MESES" <% if (rset.getString(nombreC).equals("DE 4 A 6 MESES")) {
                                            out.println("selected");
                                        }%> >DE 4 A 6 MESES</option>
                                    <option value="DE 6 A 8 MESES" <% if (rset.getString(nombreC).equals("DE 6 A 8 MESES")) {
                                            out.println("selected");
                                        }%> >DE 6 A 8 MESES</option>
                                    <option value="DE 8 MESES A UN AÑO" <% if (rset.getString(nombreC).equals("DE 8 MESES A UN AÑO")) {
                                            out.println("selected");
                                        }%> >DE 8 MESES A UN AÑO</option>
                                    <option value="MAS DEL AÑO" <% if (rset.getString(nombreC).equals("MAS DEL AÑO")) {
                                            out.println("selected");
                                        }%> >MAS DEL AÑO</option>
                                </select>
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
                                <input type="checkbox" onkeypress="return tabular(event, this);"  name="<%=nombreC = nomCam + (contCam += 1)%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Se realiza un pedido o requerimiento al área correspondiente")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Se realiza un pedido o requerimiento al área correspondiente">Se realiza un pedido o requerimiento al área correspondiente<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Se informa al Director y/o Administrador del Hospital")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Se informa al Director y/o Administrador del Hospital">Se informa al Director y/o Administrador del Hospital<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("No se realiza ninguna acción")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="No se realiza ninguna acción">No se realiza ninguna acción<br>
                                <input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (var[i].equals("Compra Directa")) {
                                            out.println("checked");
                                        }
                                    }
                                       %>  value="Compra Directa">Compra Directa<br>
                                <%
                                    var = rset.getString(nombreC).split(",");
                                    for (int i = 0; i < var.length; i++) {
                                        //System.out.println("*****" + var[i]);
                                        if (!var[i].equals("Se realiza un pedido o requerimiento al área correspondiente") && !var[i].equals("Se informa al Director y/o Administrador del Hospital") && !var[i].equals("No se realiza ninguna acción") && !var[i].equals("Compra Directa")) {
                                            //out.println("checked");
                                            valuech = valuech + var[i] + ",";
                                        }
                                    }


                                %><input type="checkbox" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value = "" id="<%=contCam%>" onchange="otroChk(this);" />
                                Otro<input class="form-control" onkeypress="return tabular(event, this);" name="<%=nombreC%>" value="<%=valuech%>" readOnly="true" id="<%=contCam + 1%>" />
                                <%
                                    valuech = "";
                                %>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Se lleva un registro de Piezas Solicitadas contra Surtidas?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Cúal es el Porcentaje de Abasto actual?</b>
                                <br>
                                Total de Piezas Solicitadas contra Surtidas vía recetas (pacientes y colectivas)
                            </div>
                            <div class="col-lg-3">
                                <select name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" class="form-control" id="<%=nombreC%>">
                                    <%
                                        for (int i = 0; i <= 10; i++) {
                                            out.println("<option ");
                                            if (rset.getString(nombreC).equals(i + "0%")) {
                                                out.println("selected");
                                            }
                                            out.println(">" + i + "0%</option>");
                                        }
                                    %>
                                </select>
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
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return isNumberKey(event, this);" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿El Inventario se encuentra actualizado?</b>
                                <br>
                                Es decir si las existencias al día
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                                <input class="form-control"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  value="<%=rset.getString(nombreC)%>" onkeypress="return isNumberKey(event, this);" />
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Capturan recetas?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br/>
                                <%//out.print(nombreC);%>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-lg-3 control-label">
                                <b>¿La captura de recetas va al día?</b>
                                <br />
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>
                            <div class="col-lg-3 control-label">
                                <b>¿Me puede proporcionar copia del inventario?</b>
                                <br>
                            </div>
                            <div class="col-lg-3">
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaA();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="Si" <% if (rset.getString(nombreC).equals("Si")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="No" <% if (rset.getString(nombreC).equals("No")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <br>
                                <%//out.print(nombreC);%>
                            </div>

                        </div>
                        <br/>
                        <button type="submit" name="guarda_seccion" value="F" class="btn btn-primary btn-lg btn-block" onclick="return validar_f()">Guardar Sección F</button>
                    </div>
                </div>

                <a name="g"></a>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        G. Observaciones
                    </div>
                    <div class="panel-body">
                        <textarea  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>" class="form-control"><%=rset.getString(nombreC)%></textarea>
                        <br/>
                        <button type="submit" name="guarda_seccion" value="G" class="btn btn-primary btn-lg btn-block" onclick="return validar_g()">Guardar Sección G</button>
                    </div>
                </div>
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
                        <h4 class="modal-title">INSTRUCCIONES DE LLENADO</h4>
                    </div>
                    <div class="modal-body">
                        <img src="imagenes/GNKL_Small.JPG" />Previamente debes de checar que haya conexi&oacute;n a Internet<br>
                        <ul>
                            <li>Seleccione la Unidad a consultar, y a continuación de clic en el boton "Ver"</li>
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
<%
        }
    } catch (Exception e) {
        //out.println("Hola");
        System.out.println(e.getMessage());
    }
    con.cierraConexion();
    if (ban == 0) {
        out.println("<script>alert('Se detectó un error al momento de la carga, por favor ingrese nuevamente.')</script>");
        out.println("<script>window.location = 'indexCap.jsp'</script>");
    }
%>
<script src="js/funcionesBasicas.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.js"></script>
<script src="js/bootstrap-modal.js"></script>
<script src ="Scripts/jquery-1.6.1.min.js" type = "text/javascript" ></script>
<script type="text/javascript">
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