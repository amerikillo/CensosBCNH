<%-- 
    Document   : exrpotarExcel
    Created on : 26-mar-2014, 12:39:00
    Author     : Americo
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conn.ConectionDB"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    ConectionDB con = new ConectionDB();
    response.setContentType("application/vnd.ms-excel");
    response.setHeader("Content-Disposition", "attachment;filename=\"Información de Censos.xls\"");

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <table border="1">

            <tr>
                <td>No. de Unidad</td>
                <td>Encuestador</td>
                <td>A.1 Encuestado</td>
                <td>A.2 Fecha y Hora</td>
                <td>A.3 Nombre del Hospital</td>
                <td>A.4 Categoría</td>
                <td>A.5 Dirección</td>
                <td>A.6 Referencias</td>
                <td>A.7 Colonia</td>
                <td>A.8 Ciudad o Población</td>
                <td>A.9 Municipio</td>
                <td>A.10 CP</td>
                <td>A.11 Teléfonos</td>
                <td>A.12 Página Web</td>
                <td>A.13 Pob. Atendida</td>
                <td>A.14 Jurisdicción</td>
                <td>A.15 Coordinación</td>
                <td>A.16 No. de Servicios</td>
                <td>A.17 Servicios</td>
                <td>A.18 Camas Censables</td>
                <td>A.19 Camas NO Censables</td>
                <td>A.20 Responsable</td>
                <td>A.21 Tel Responsable</td>
                <td>A.22 Correo Responsable</td>
                <td>B.1 Nº de Pasantes</td>
                <td>B.2 Nº de Enfermeras</td>
                <td>B.3 Horario de Atención Desde</td>
                <td>B.4 Horario de Atención Hasta</td>
                <td>C.1 ¿La Unidad cuenta con Servicios?</td>
                <td>C.2 ¿Cuántos Servicios?</td>
                <td>C.3 Describa los Servicios</td>
                <td>C.4 Clima Predominante</td>
                <td>D.1 ¿Existe Sistema Informático de Captura    de Recetas?</td>
                <td>D.2 ¿Cuántas Recetas Promedio por día se    expiden?</td>
                <td>E.1 ¿Existe servicio de Farmacia?</td>
                <td>E.2 Horario de Atención INICIO</td>
                <td>E.3 Horario de Atención FIN</td>
                <td>E.4 ¿Cuanto personal atiende? </td>
                <td>E.5¿Cuántos turnos existen? </td>
                <td>E.6 ¿El personal cuenta con el certificado de la COFEPRIS para el manejo y dispensación de medicamento? </td>
                <td>E.7 ¿Qué Insumos Médicos manejan?</td>
                <td>E.8 ¿Cuentan con Licencia Sanitaria para el manejo de medicamento controlado?</td>
                <td>E.9 ¿Cómo surten los Insumos Médicos?</td>
                <td>E.10 ¿Quién es el propietario del Insumo?</td>
                <td>E.11 ¿Llevan algún control de semaforización de caducidades?</td>
                <td>E.12 Espacio aproximado de Farmacia mts</td>
                <td>E.13 Número de Anaqueles </td>
                <td>E.14 ¿Quién es el propietario de los Anaqueles? </td>
                <td>E.15 ¿Cuentan con Refrigerador?</td>
                <td>E.16 ¿Quién es el propietario del Refrigerador? </td>
                <td>E.17 ¿Cuentan con Equipo de Cómputo?</td>
                <td>E.18 Número de Equipos de Cómputo</td>
                <td>E.19 ¿Quién es el propietario de los Equipos de Cómputo? </td>
                <td>E.20 ¿Cuentan con algún Sistema Informático? </td>
                <td>E.21 ¿Cuáles son las funciones del Sistema Informático? </td>
                <td>E.22 ¿Qué tipo de reportes generan? </td>
                <td>E.23 ¿Existe algún tipo de validación de acuerdo al origen del paciente? </td>
                <td>E.24 ¿Cómo validan el origen del paciente?	</td>
                <td>E.25 ¿Cuentan con teléfono? </td>
                <td>E.26 ¿Cuál es el número de teléfono? </td>
                <td>E.27 ¿Cuentan con planta de energía eléctrica para emergencias? </td>
                <td>E.28 ¿La planta de energía eléctrica para emergencias cubre el suministro a la Farmacia? </td>
                <td>E.29 ¿Cuentan con servicio de Internet? </td>
                <td>E.30 ¿Cuál es el proveedor de Internet? </td>
                <td>E.31 ¿Qué tan rápido es el servicio de Internet? </td>
                <td>E.32 ¿Almacenan Insumo en otro lugar aparte? </td>
                <td>E.33 ¿En qué otro lugar (aparte de la Farmacia) almacenan insumos? </td>
                <td>E.34 ¿Quién abastece de Insumos Médicos? </td>
                <td>E.35 ¿Cómo solicitan insumo? </td>
                <td>E.36 ¿Cada cuanto abastecen? </td>
                <td>E.37 ¿Qué se hace en caso de que no se tenga algún insumo solicitado? </td>
                <td>E.38 ¿Se lleva un registro de Insumos Solicitados contra Surtidos? </td>
                <td>E.39 ¿Se lleva un registro de Piezas Solicitadas contra Surtidas? </td>
                <td>E.40 ¿Se lleva un registro de Insumos No Surtidos? </td>
                <td>E.41 ¿Cúal es el Porcentaje de Abasto actual? </td>
                <td>E.42 ¿Cuántos insumos solicitan en promedio por receta? </td>
                <td>E.43 ¿El Inventario se encuentra actualizado? </td>
                <td>E.44 Número de Recetas Surtidas por Día </td>
                <td>E.45 ¿Capturan recetas? </td>
                <td>E.46 ¿La captura de recetas va al día? </td>
                <td>E.47 ¿Me puede proporcionar copia del inventario? </td>
                <td>E.48 ¿Me puede proporcionar copia de una receta? </td>
                <td>F.1 ¿Existe servicio de Almacén? </td>
                <td>F.2 Tipo de Almacén </td>
                <td>F.3 Horario de Atención INICIO</td>
                <td>F.4 Horario de Atención FIN</td>
                <td>F.5 ¿Cuanto personal atiende?</td>
                <td>F.6 ¿Cuántos turnos existen?</td>
                <td>F.7 ¿El personal cuenta con el certificado de la COFEPRIS para el manejo y dispensación de medicamento? </td>
                <td>F.8 ¿Qué Insumos Médicos manejan?</td>
                <td>F.9 ¿Cuentan con Licencia Sanitaria para el manejo de medicamento controlado?</td>
                <td>F.10 ¿Cómo surten los Insumos Médicos?</td>
                <td>F.11 ¿Quién es el propietario del Insumo?</td>
                <td>F.12 Espacio aproximado de Almacén mts</td>
                <td>F.13 Número de Anaqueles </td>
                <td>F.14 ¿Quién es el propietario de los Anaqueles? </td>
                <td>F.15 ¿Cuentan con Anden para carga y descarga?</td>
                <td>F.16 ¿Cuentan con Rampa para carga y descarga?</td>
                <td>F.17 ¿Cuáles son las condiciones para carga y descarga? </td>
                <td>F.18 ¿Cuentan con Refrigerador?</td>
                <td>F.19 ¿Quién es el propietario del Refrigerador? </td>
                <td>F.20 ¿Cuentan con Equipo de Cómputo?</td>
                <td>F.21 Número de Equipos de Cómputo </td>
                <td>F.22 ¿Quién es el propietario de los Equipos de Cómputo? </td>
                <td>F.23 ¿Cuentan con algún Sistema Informático? </td>
                <td>F.24 ¿Cuáles son las funciones del Sistema Informático? </td>
                <td>F.25 ¿Qué tipo de reportes generan? </td>
                <td>F.26 ¿Cuentan con teléfono? </td>
                <td>F.27 ¿Cuál es el número de teléfono? </td>
                <td>F.28 ¿Cuentan con servicio de Internet? </td>
                <td>F.29 ¿Cuál es el proveedor de Internet? </td>
                <td>F.30 ¿Qué tan rápido es el servicio de Internet? </td>
                <td>F.31 ¿Almacenan Insumo en otro lugar aparte? </td>
                <td>F.32 ¿En qué otro lugar (aparte del Almacén) almacenan insumos? </td>
                <td>F.33 ¿Quién abastece de Insumos Médicos? </td>
                <td>F.34 ¿Cuentan con sub almacenes en los pisos? </td>
                <td>F.35 ¿Cómo solicitan insumo? </td>
                <td>F.36 ¿Cada cuanto abastecen? </td>
                <td>F.37 ¿Qué se hace en caso de que no se tenga algún insumo solicitado? </td>
                <td>F.38 ¿Se lleva un registro de Insumos Solicitados contra Surtidos? </td>
                <td>F.39 ¿Se lleva un registro de Piezas Solicitadas contra Surtidas? </td>
                <td>F.40 ¿Se lleva un registro de Insumos No Surtidos? </td>
                <td>F.41 ¿Cúal es el Porcentaje de Abasto actual? </td>
                <td>F.42 ¿Cuántos insumos solicitan en promedio por receta? </td>
                <td>F.43 ¿El Inventario se encuentra actualizado? </td>
                <td>F.44 Número de Recetas Surtidas por Día </td>
                <td>F.45 ¿Capturan recetas? </td>
                <td>F.46 ¿La captura de recetas va al día? </td>
                <td>F.47 ¿Me puede proporcionar copia del inventario? </td>
                <td>F.48 ¿Me puede proporcionar copia de una receta? </td>
                <td>G.1 Observaciones </td>
            </tr>
            <%              try {
                    con.conectar();
                    ResultSet rset = con.consulta("select * from tb_a as a, tb_b as b, tb_c as c, tb_d as d, tb_e as e, tb_f as f, tb_g as g, tb_unidades as clave where clave.id_uni=a.id_uni and clave.id_uni=b.id_uni and clave.id_uni=c.id_uni and clave.id_uni=d.id_uni and clave.id_uni=e.id_uni and clave.id_uni=f.id_uni and clave.id_uni = g.id_uni and a.campo23!='' order by a.id_uni+0");
                    while (rset.next()) {
                        out.println("<tr>");
                        for (int i = 1; i <= 137; i++) {
                            if (i == 25 || i == 30 || i == 35 || i == 38 || i == 87||i==136) {
                                i++;
                            }
							%>
							<td><%=rset.getString(i)%></td>
							<%
                        }
                    }
                    out.println("</tr>");
                    con.cierraConexion();
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            %>
        </table>
        <h1>&nbsp;</h1>
    </body>
</html>
