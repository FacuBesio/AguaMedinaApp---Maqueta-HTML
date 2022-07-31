
<%@page import="ar.com.aguaMedina.utils.html.HtmlTable_ClienteEmpresa"%>
<%@page import="ar.com.aguaMedina.entities.ClienteEmpresa"%>
<%@page import="ar.com.aguaMedina.repositories.jdbc.ClienteEmpresaRepository"%>
<%@page import="ar.com.aguaMedina.repositories.interfaces.I_ClienteEmpresaRepository"%>
<!-- CARGAR CLIENTE PERSONA -->

<%-- 
    Document   : cargar_ClientePersona
    Created on : 21 abr. 2022, 18:16:11
    Author     : usuario
--%>
<%@page import="ar.com.aguaMedina.utils.html.HtmlTable_ClientePersona"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.List"%>
<%@page import="ar.com.aguaMedina.entities.Recorrido"%>
<%@page import="ar.com.aguaMedina.repositories.jdbc.RecorridoRepository"%>
<%@page import="ar.com.aguaMedina.repositories.interfaces.I_RecorridoRepository"%>
<%@page import="ar.com.aguaMedina.connectors.Conector"%>
<%@page import="ar.com.aguaMedina.repositories.jdbc.ClientePersonaRepository"%>
<%@page import="ar.com.aguaMedina.repositories.interfaces.I_ClientePersonaRepository"%>
<%@page import="ar.com.aguaMedina.entities.ClientePersona"%>
<%@page import="ar.com.aguaMedina.utils.html.HtmlTable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%I_ClientePersonaRepository cp_rep = new ClientePersonaRepository(Conector.getConecction());%>
<%I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());%>
<%I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>AguaMedina - Cargar Empresas</title>
<!-- CSS -->
<link rel="stylesheet" href="../css/clienteEmpresa/cargar_ClienteEmpresaCSS.css">
<!-- GoogleFonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,
    300;1,400;1,600;1,700;1,900&display=swap" rel="stylesheet">
</head>
<body>
<!-- HEADER -->
    <header>
    <!-- HEADER SUPERIOR -->
        <div class="header__superior">
            <div class="logo">
                <!--  <img src="imagenes/logoAguaMedina.png"> -->
                <h1 style="color: rgb(183, 206, 52); font-size: 80px;">
                    <strong style="font-weight: 900; color:rgb(0, 147, 180);">Agua</strong>Medina
                    <strong style="font-weight: 800; color:rgb(220, 150, 20);"> App</strong>                                                                                
                </h1>
            </div>
            <div class="search">
                <!-- <input type="search" placeholder="¿Qué deseas buscar?">-->
                 <img src="../imagenes/logoAguaMedina.png" >
            </div>
        </div>
        
        <!-- HEADER CONTAINER MENU -->
        <div class="container__menu">
            <div class="menu">
                <nav>
                    <ul>
                        <li><a href="../index.jsp" style="background-color: rgb(183, 206, 53);">     </a>
                        </li>
                        
                        <li><a href="../recorridos/recorridos_Home.jsp">Recorridos           </a>
                            <ul>
                                <li><a href="../recorridos/cargar_Recorridos.jsp">Cargar Recorridos</a></li>
                                <li><a href="../recorridos/editar_Recorridos.jsp">Editar Recorridos</a></li>
                                <li><a href="../recorridos/borrar_Recorridos.jsp">Borrar Recorridos</a></li>
                                <li><a href="../recorridos/buscar_Recorridos.jsp">Buscar Recorridos</a></li>
                            </ul>
                        </li>
                        
                        <li><a href="../clientesPersona/clientesPersona_Home.jsp">Clientes Persona     </a>
                            <ul>
                                <li><a href="../clientesPersona/cargar_ClientesPersona.jsp">Cargar Personas</a></li>
                                <li><a href="../clientesPersona/editar_ClientesPersona.jsp">Editar Personas</a></li>
                                <li><a href="../clientesPersona/borrar_ClientesPersona.jsp">Borrar Personas</a></li>
                                <li><a href="../clientesPersona/buscar_ClientesPersona.jsp">Buscar Personas</a></li>
                            </ul>
                        </li>
                        
                        <li><a href="clientesEmpresa_Home.jsp" id="selected">Clientes Empresa     </a>
                            <ul>
                                <li><a href="cargar_ClientesEmpresa.jsp">Cargar Empresas</a></li>
                                <li><a href="editar_ClientesEmpresa.jsp">Editar Empresas</a></li>
                                <li><a href="borrar_ClientesEmpresa.jsp">Borrar Empresas</a></li>
                                <li><a href="buscar_ClientesEmpresa.jsp">Buscar Empresas</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

<!-- MAIN -->
    <main>
        <!-- CONTAINER_MAIN -->
        <div class="container__main_CargarPersona">
            <h2 style="width: 100%; text-align: center; "> CARGAR EMPRESA </h2>
             
            <form style="margin-top: 4px;">
                <table>
                    <tr><td>Razon Social    </td><td><input type="text" maxlength="30" name="razon_social">          </td></tr>
                    <tr><td>CUIT            </td><td><input type="text" maxlength="15" name="cuit">          </td></tr>
                    <tr><td>Dirección       </td><td><input type="text" maxlength="30" name="direccion">       </td></tr>
                    <tr><td>Localidad       </td><td><input type="text" maxlength="30" name="localidad">       </td></tr>
                    <tr><td>Contacto        </td><td><input type="text" maxlength="30" name="contacto">        </td></tr>
                    <tr><td>Servicio        </td>
                        <td><select name="tipo_servicio"  style="">
                                <option disabled="" selected="true">Seleccione un Tipo de Servicio</option>
                                <option>Bidon 12 lts</option>
                                <option>Bidon 20 lts</option>
                                <option>Servicio Agua</option>
                                <option>Servicio Agua c/ Hel</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td>Bidones    </td><td><input type="number" min="0" max="1000" name="bidones">         </td></tr>
                    <tr><td>Maquinas   </td><td><input type="number" min="0" max="1000" name="maquinas">         </td></tr>
                    <tr><td>Precio ($) </td><td><input type="number" min="0" max="100000000" name="precio">         </td></tr>
                    <tr><td>Recorrido      </td>
                        <td>
                            <select name="idRecorrido"  style="">
                            <option disabled="" selected="true">Seleccione un Recorrido</option>
                            <% 
                        List<Recorrido>list = re_rep.getAll();
                        if (list.isEmpty()|| list == null){
                            out.print("<option disabled=\"\"> Cargue un Recorrido por favor </option>");
                            } else {
                                for(Recorrido r: list){
                                    if (r.getAsistenteZona()==null){
                                    r.setAsistenteZona("Sin asistente");
                                }
                            }
                        }
                        
                        for(Recorrido r: list)
                        out.print("<option value=" +r.getId()+">"+
                                                                    r.getId()+". "+
                                                                    r.getNombreZona()+", "+
                                                                    r.getDia()+" ("+
                                                                    r.getResponsableZona()+" - "+
                                                                    r.getAsistenteZona()+")"
                        + "</option>");
                        %>
                            </select>
                        </td></tr>
                    <tr>
                    <tr><td>Mail    </td><td><input type="text" maxlength="50" name="mail">         </td></tr>
                    <tr><td>Fecha Alta    </td><td><input type="text" maxlength="10" name="fecha_alta"> </td></tr>
                    <tr><td>Detalles    </td><td><input type="text" maxlength="30" name="detalles"> </td></tr>
                        <td><input  type="reset" 
                                    value="RESET" 
                                    style=" width: 100px;  
                                            height: 100%;  
                                            font-size: 16px; 
                                            background-color:rgb(159, 197, 58);
                                            border-color:rgb(183, 206, 53);
                                            color: white;
                                            margin-top: 2px;
                                            margin-left: -5px;
                                            font-weight: bolder;"/>  
                        </td>
                        <td><input  type="submit" 
                                    value="GUARDAR" 
                                    style=" width: 298px;
                                            height: 100%;
                                            font-size: 16px; 
                                            text-align: center;
                                            background-color:rgb(159, 197, 58);
                                            border-color:rgb(183, 206, 53);
                                            color: white;
                                            margin-top: 2px;
                                            margin-left: 5px;
                                            font-weight: bolder;"/>  
                        </td>
                    </tr>
                    
                  </table>
            </form>
<%      
        try {
            String razon_social = request.getParameter("razon_social");
            String cuit = request.getParameter("cuit");
            String direccion = request.getParameter("direccion");
            String localidad = request.getParameter("localidad");
            String contacto = request.getParameter("contacto");
            String tipo_servicio = request.getParameter("tipo_servicio");
            int bidones = Integer.parseInt(request.getParameter("bidones"));
            int maquinas = Integer.parseInt(request.getParameter("maquinas"));
            int precio = Integer.parseInt(request.getParameter("precio"));
            int idRecorrido = Integer.parseInt(request.getParameter("idRecorrido"));
            String mail = request.getParameter("mail");
            String fecha_alta = request.getParameter("fecha_alta");
            String detalles = request.getParameter("detalles");
            
            if (razon_social == null || razon_social.isEmpty() || razon_social.contains("<")){
                out.print("<h3> Falta ingresar Parametros </h3>");
                
            }else{
                ClienteEmpresa clienteEmpresa = new ClienteEmpresa( razon_social, cuit, direccion, localidad, contacto, 
                                                                    tipo_servicio, bidones, maquinas, precio, idRecorrido,
                                                                    mail, fecha_alta,detalles);
                ce_rep.save(clienteEmpresa);
                Recorrido r2 = re_rep.getById(clienteEmpresa.getIdRecorrido());
                if (clienteEmpresa.getId()!= 0){
                    out.print("<h3>Se guardo exitosamente la Empresa "+clienteEmpresa.getId()+"</h3>");
                    out.print("<h3>"+clienteEmpresa.getRazon_social()+" "
                                    + " - " +r2.getNombreZona()
                                    + "</h3>" );
                }else{
                    out.print("<h3> No se pudo guardar la Empresa! </h3>");
                }
            }
        } catch (NullPointerException | NumberFormatException e) {
            out.print("<h3> Por favor complete los Campos </h3>" );
        } catch (Exception e) {
        System.out.println("*********************");
            out.print("<h3>Ocurrio un Error. " + e +"</h3>" );
        System.out.println("*********************");
        }
       
        %>            

        </div>
        <div class="tabla_CargarPersonas">
            <%
            if (ce_rep.getAll() != null || !(ce_rep.getAll().isEmpty())){
               //TABLA CLIENTE PERSONA
           //TABLA CLIENTE PERSONA
               out.print(HtmlTable_ClienteEmpresa.tabla_ClientesEmpresa());
            }
            %>
        </div>
        
    </main>
</header> <!-- CHECKEAR. Se realizo esta Corección para que no se mueva el main al utilizar el Scroll-->
</body>
</html>
