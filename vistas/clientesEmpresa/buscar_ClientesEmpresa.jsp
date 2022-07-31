                                            
                                    <%@page import="ar.com.aguaMedina.enums.Dia"%>
<%@page import="ar.com.aguaMedina.utils.html.HtmlTable_ClienteEmpresa"%>
<!-- BUSCAR CLIENTE PERSONA -->

<%-- 
    Document   : cargar_ClientePersona
    Created on : 21 abr. 2022, 18:16:11
    Author     : usuario
--%>

<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.List"%>
<%@page import="ar.com.aguaMedina.utils.html.HtmlTable_ClientePersona"%>
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
<%I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>AguaMedina - Buscar Empresas</title>
<!-- CSS -->
<link rel="stylesheet" href="../css/clienteEmpresa/buscar_ClienteEmpresaCSS.css">
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
        <div class="container__main_BuscarPersona">
            <!--<h2 style="width: 100%; text-align: center; font-weight: bolder; font-size: 30px;">♦ BUSCAR PERSONA ♦</h2>-->
            <form>
                <table>
                    <tr><td style="font-size: 20px; font-weight: bolder;"> BUSCAR POR        </td>
                        <td>
                            <select name="filtro">
                                <option value="Prueba" disabled="" selected="true" style="color: black;">
                                    Seleccione un Filtro
                                </option>
                                <option value="Razon_Social" >Razon Social</option>
                                <option value="Cuit" >CUIT</option>
                                <option value="Direccion">Dirección     </option>
                                <option value="Localidad">Localidad     </option>
                                <option value="Servicio">Servicio     </option>
                                <option value="Recorrido">Recorrido     </option>
                                <option value="Dia">Día                 </option> 
                            </select>
                        </td>
                        
                    </tr>
                    <tr><td><input  type="submit" value="RESET"
                                    style=" width: 150px; 
                                            background-color:rgb(159, 197, 58); 
                                            border-color:rgb(183, 206, 53);
                                            color: white;
                                            margin-top: 5px;"/>      
                        </td>
                         <td><input  type="submit" value="SELECCIONAR"
                                     style="background-color:rgb(159, 197, 58); 
                                            border-color:rgb(183, 206, 53);
                                            color: white;
                                            margin-top: 5px;
                                            margin-left: 5px;"/>            
                        </td>
                    </tr>
                </table>
                <table>
    <%  
//  ● FILTROS  
        String filtro = request.getParameter("filtro");
        boolean selectRazonSocial=false;
        boolean selectCuit=false;
        boolean selectDireccion=false;
        boolean selectLocalidad=false;
        boolean selectServicio=false;
        boolean selectRecorrido=false;
        boolean selectDia=false;
     
    //  ♦ RAZON SOCIAL
        if ("Razon_Social".equalsIgnoreCase(filtro)){
            selectRazonSocial=true;     
    %>
                    <tr>
                        <td style="font-weight: bolder; width: 250px; height: 50px;">RAZON SOCIAL:     </td>
                        <td><input type="text" name="buscarRazonSocial" style="width: 250px; height: 50px; margin-right: 10px;"/>        </td>
                    </tr>
    <%  
        }

    //  ♦ CUIT
        if ("Cuit".equalsIgnoreCase(filtro)){
            selectCuit=true;     
    %>      
                    <tr>
                        <td style="font-weight: bolder; width: 250px; height: 50px;">CUIT:   </td>
                        <td><input type="text" name="buscarCuit" style="width: 250px; height: 50px; margin-right: 10px;"/>        </td>
                    </tr>
    <%  
        }
    
    //  ♦ DIRECCIÓN
        if ("Direccion".equalsIgnoreCase(filtro)){
            selectDireccion=true;     
    %>
                    <tr> <td style="font-weight: bolder; width: 250px; height: 50px;">DIRECCIÓN: </td>
                        <td><input type="text" name="buscarDireccion" style="width: 250px; height: 50px; margin-right: 10px;"/>     </td>
                    </tr>
    <%
        }
  
        //  ♦ LOCALIDAD
        if ("Localidad".equalsIgnoreCase(filtro)){
            selectLocalidad=true;     
    %>
                    <tr><td style="font-weight: bolder; width: 250px; height: 50px;">LOCALIDAD:  </td>
                        <td><input type="text" name="buscarLocalidad" style="width: 250px; height: 50px; margin-right: 10px;"/>    </td>
                    </tr>
     <%
        }
        
        //  ♦ SERVICIO
        if ("Servicio".equalsIgnoreCase(filtro)){
            selectLocalidad=true;     
    %>
                    <tr><td style="font-weight: bolder;">TIPO SERVICIO:  </td></tr>
                    <tr>
                        <td>
                            <select name="buscarServicio"  style=" width: 250px; padding: 10px; font-weight: bolder; color: black;
                                                              margin-top: 5px; margin-left: -5px; text-transform: capitalize;">
                                <option disabled="" selected="true">Seleccione un Servicio</option>
                                <option>Bidon 12 lts</option>
                                <option>Bidon 20 lts</option>
                                <option>Servicio Agua</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td><input  type="reset" value="RESET"
                                    style=" width: 150px; 
                                            background-color:rgb(159, 197, 58); 
                                            border-color:rgb(183, 206, 53);
                                            color: white;
                                            margin-top: 20px;
                                            margin-left: -225px;"/>      
                        </td>
                         <td><input  type="submit" value="SELECCIONAR"
                                     style="background-color:rgb(159, 197, 58); 
                                            border-color:rgb(183, 206, 53);
                                            color: white;
                                            margin-top: 20px;
                                            margin-left: -225px"/>            
                        </td>
                    </tr>
        <%
            }
        
        //  ♦ RECORRIDO
        if ("Recorrido".equalsIgnoreCase(filtro)){
            selectRecorrido=true;     
    %>                  
                    <tr><td>RECORRIDO</td></tr>
                    <tr>
                        <td>
                            <select name="buscarRecorrido"  style=" width: 375px; 
                                                                    padding: 10px; 
                                                                    font-weight: bolder;
                                                                    color: black;
                                                                    margin-top: 5px;
                                                                    ">
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
                        
                        out.print("<option disabled=\"\" selected=\"true\"> Seleccione Recorrido</option>");
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
                        </td>
                    </tr>
                    <tr><td><input  type="submit" value="RESET"
                                    style=" width: 150px; 
                                            background-color:rgb(159, 197, 58); 
                                            border-color:rgb(183, 206, 53);
                                            color: white;
                                            margin-top: 20px;
                                            margin-left: -225px;"/>      
                        </td>
                         <td><input  type="submit" value="SELECCIONAR"
                                     style="background-color:rgb(159, 197, 58); 
                                            border-color:rgb(183, 206, 53);
                                            color: white;
                                            margin-top: 20px;
                                            margin-left: -225px"/>            
                        </td>
                    </tr>
    <%
        }
    //  ♦ DÍA
        if ("dia".equalsIgnoreCase(filtro)){
            selectDia=true;     
    %>
                    <tr><td style="font-weight: bolder;">DIA</td></tr>
                    <tr>
                        <td>
                            <select name="buscarDia"  style=" width: 250px; padding: 10px; font-weight: bolder; color: black;
                                                              margin-top: 5px; margin-left: -5px; text-transform: capitalize;">
        <% 
                        out.print("<option disabled=\"\" selected=\"true\"> Seleccione Día</option>");
                        for(Dia d: Dia.values())
                        out.print("<option value=" +d+">"+d.toString().toLowerCase()+"</option>");
        %>
                            </select>
                        </td>
                    </tr>
                    <tr><td><input  type="reset" value="RESET"
                                    style=" width: 150px; 
                                            background-color:rgb(159, 197, 58); 
                                            border-color:rgb(183, 206, 53);
                                            color: white;
                                            margin-top: 20px;
                                            margin-left: -225px;"/>      
                        </td>
                         <td><input  type="submit" value="SELECCIONAR"
                                     style="background-color:rgb(159, 197, 58); 
                                            border-color:rgb(183, 206, 53);
                                            color: white;
                                            margin-top: 20px;
                                            margin-left: -225px"/>            
                        </td>
                    </tr>
        <%
            }
        %>
    
                </table>
            </form>
        </div>
        
                    
                    
        <!--TABLA BUSCAR PERSONAS -->
        <div class="container__tabla_BuscarPersonas">
     <%
    
    //  ♦ RAZON SOCIAL
        String buscadorRazonSocial;
        buscadorRazonSocial = request.getParameter("buscarRazonSocial");
        if ((buscadorRazonSocial == null || buscadorRazonSocial.isEmpty()) & selectRazonSocial== true){
            out.print(HtmlTable_ClienteEmpresa.tabla_ClientesEmpresa());
        }else if (buscadorRazonSocial != null && !(buscadorRazonSocial.isEmpty())){
    %>          
            <h3><%out.print("Resultados de busqueda para RAZON SOCIAL que contenga: '" + buscadorRazonSocial+"'");%></h3>
    <%      
            //out.print(new HtmlTable().getTable(cp_rep.getLikeNombre(buscador2)));
            out.print(HtmlTable_ClienteEmpresa.tabla_ClientesEmpresaLikeRazonSocial(buscadorRazonSocial));
        }
        
    //  ♦ CUIT
        String buscadorCuit;
        buscadorCuit = request.getParameter("buscarCuit");
        if ((buscadorCuit == null || buscadorCuit.isEmpty()) & selectCuit== true){
            out.print(HtmlTable_ClienteEmpresa.tabla_ClientesEmpresa());
        }else if (buscadorCuit != null && !(buscadorCuit.isEmpty())){
    %>          
            <h3><%out.print("Resultados de busqueda para CUIT que contenga: '" + buscadorCuit+"'");%></h3>
    <%      
            //out.print(new HtmlTable().getTable(cp_rep.getLikeNombre(buscador2)));
            out.print(HtmlTable_ClienteEmpresa.tabla_ClientesEmpresaLikeCuit(buscadorCuit));
        }

    //  ♦ DIRECCIÓN
        String buscadorDireccion;
        buscadorDireccion = request.getParameter("buscarDireccion");
        if ((buscadorDireccion == null || buscadorDireccion.isEmpty()) & selectDireccion== true){
            out.print(HtmlTable_ClienteEmpresa.tabla_ClientesEmpresa());
        }else if (buscadorDireccion != null && !(buscadorDireccion.isEmpty())){
    %>          
            <h3><%out.print("Resultados de busqueda para DIRECCIÓNES que contengan: '" + buscadorDireccion+"'");%></h3>
    <%
            //out.print(new HtmlTable().getTable(cp_rep.getLikeDireccion(buscadorDireccion)));
            out.print(HtmlTable_ClienteEmpresa.tabla_ClientesEmpresaLikeDireccion(buscadorDireccion));
            
        }
    
    //  ♦ LOCALIDAD
        String buscadorLocalidad;
        buscadorLocalidad = request.getParameter("buscarLocalidad");
        if ((buscadorLocalidad == null || buscadorLocalidad.isEmpty()) & selectLocalidad== true){
            out.print(HtmlTable_ClienteEmpresa.tabla_ClientesEmpresa());
        }else if (buscadorLocalidad != null && !(buscadorLocalidad.isEmpty())){
    %>          
            <h3><%out.print("Resultados de busqueda para LOCALIDADES que contengan: '" + buscadorLocalidad+"'");%></h3>
    <%
            //out.print(new HtmlTable().getTable(cp_rep.getLikeLocalidad(buscadorLocalidad)));
            out.print(HtmlTable_ClienteEmpresa.tabla_ClientesEmpresaLikeLocalidad(buscadorLocalidad));
        }
        
    //  ♦ TIPO DE SERVICIO
        String buscadorServicio;
        buscadorServicio = request.getParameter("buscarServicio");
        if ((buscadorServicio == null || buscadorServicio.isEmpty()) & selectServicio== true){
            out.print(HtmlTable_ClienteEmpresa.tabla_ClientesEmpresa());
        }else if (buscadorServicio != null && !(buscadorServicio.isEmpty())){
    %>          
            <h3><%out.print("Resultados de busqueda para TIPO DE SERVICIO que contengan: '" + buscadorServicio+"'");%></h3>
    <%
            //out.print(new HtmlTable().getTable(cp_rep.getLikeLocalidad(buscadorLocalidad)));
            out.print(HtmlTable_ClienteEmpresa.tabla_ClientesEmpresaLikeTipoServicio(buscadorServicio));
        }
    
    //  ♦ RECORRIDO
        String buscadorRecorrido;
        buscadorRecorrido = request.getParameter("buscarRecorrido");
        if ((buscadorRecorrido == null || buscadorRecorrido.isEmpty()) & selectRecorrido == true){
            out.print(HtmlTable_ClienteEmpresa.tabla_ClientesEmpresa());
        }else if (buscadorRecorrido != null && !(buscadorRecorrido.isEmpty())){
            Recorrido r = re_rep.getById(Integer.parseInt(buscadorRecorrido));
                
    %>         
            <h3><%out.print("Resultados de busqueda para RECORRIDO: '"+ r.getId()+". "+r.getNombreZona()
                            +", "+r.getDia()+"'");%></h3>
    <%
           //out.print(new HtmlTable().getTable(cp_rep.getLikeRecorrido(Integer.parseInt(buscadorRecorrido))));
           out.print(HtmlTable_ClienteEmpresa.tabla_ClientesEmpresaLikeRecorrido(Integer.parseInt(buscadorRecorrido)));
        }
    //  ♦ DIA
        String buscadorDia;
        buscadorDia = request.getParameter("buscarDia");
        if ((buscadorDia == null || buscadorDia.isEmpty()) & selectDia== true){
            out.print(HtmlTable_ClienteEmpresa.tabla_ClientesEmpresa());
        }else if (buscadorDia != null && !(buscadorDia.isEmpty())){
    %>          
            <h3><%out.print("Resultados de busqueda para Dias que contengan: '" + buscadorDia+"'");%></h3>
    <%
           out.print(HtmlTable_ClienteEmpresa.tabla_ClientesEmpresaDia(buscadorDia));
        }

    //  ♦ CORRECTOR
        boolean buscadorCorrector = false;
        if ( (buscadorRazonSocial== null || buscadorRazonSocial.isEmpty())
            & (buscadorCuit== null || buscadorCuit.isEmpty())
            & (buscadorDireccion== null || buscadorDireccion.isEmpty())
            & (buscadorLocalidad== null || buscadorLocalidad.isEmpty())
            & (buscadorServicio== null || buscadorServicio.isEmpty())
            & (buscadorRecorrido== null || buscadorRecorrido.isEmpty())
            & (buscadorDia== null || buscadorDia.isEmpty())
            ){
            buscadorCorrector = true;
        }
    
    //  ♦ NULL
        if (filtro == null & buscadorCorrector) {
        out.print(HtmlTable_ClienteEmpresa.tabla_ClientesEmpresa());
        }
     %>      
        </div>
    </main>
    </header> <!-- CHECKEAR. Se realizo esta Corección para que no se mueva el main al utilizar el Scroll-->
</body>
</html>