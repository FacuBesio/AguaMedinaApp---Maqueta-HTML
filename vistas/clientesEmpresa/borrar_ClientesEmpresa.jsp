
                                    <%@page import="ar.com.aguaMedina.repositories.jdbc.ClienteEmpresaRepository"%>
<%@page import="ar.com.aguaMedina.repositories.interfaces.I_ClienteEmpresaRepository"%>
<%@page import="ar.com.aguaMedina.entities.ClienteEmpresa"%>
<!-- BORRAR CLIENTE PERSONA -->

<%-- 
    Document   : cargar_ClientePersona
    Created on : 21 abr. 2022, 18:16:11
    Author     : usuario
--%>
<%@page import="ar.com.aguaMedina.entities.select_Corrector"%>
<%@page import="ar.com.aguaMedina.repositories.jdbc.select_CorrectorRepository"%>
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
<%I_RecorridoRepository re_rep = new RecorridoRepository(Conector.getConecction());%>
<%select_CorrectorRepository s_rep = new select_CorrectorRepository(Conector.getConecction());%>
<%I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>AguaMedina - Borrar Empresas</title>
<!-- CSS -->
<link rel="stylesheet" href="../css/clienteEmpresa/borrar_ClienteEmpresaCSS.css">
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
        <div class="container__main_BorrarPersona">
            <!-- CONTAINER PARA SELECCIONAR PERSONA -->
            <form>
                <div class="container__seleccionar_EliminarPersona"> 
                    <table>
                        <h2>BORRAR EMPRESA                                       </h2>
                        <tr>
                            <td>
                                <select name="select__clienteEmpresa">
                                    <option value="Prueba" disabled="" selected="true" style="color: black;">
                                        Seleccione la Empresa a Borrar
                                    </option>
    <%      
            List<ClienteEmpresa>list_select_ClienteEmpresa = ce_rep.getAll();
            if (list_select_ClienteEmpresa.isEmpty()|| list_select_ClienteEmpresa == null){
                out.print("<option disabled=\"\"> Cargue un Cliente Persona por favor </option>");
            } 

            for(ClienteEmpresa e: list_select_ClienteEmpresa){
            Recorrido recorrido = re_rep.getById(e.getIdRecorrido());
            out.print("<option value=" +e.getId()+">"   
                                                    +e.getId()+". " 
                                                    +e.getRazon_social()+" "
                                                    +e.getCuit()+", "
                                                    +e.getDireccion()+" ("
                                                    +e.getLocalidad()+") "
                                                    +e.getTipo_servicio()+" Bid: "
                                                    +e.getBidones()+" Maq: "
                                                    +e.getMaquinas()+" $ "
                                                    +e.getPrecio()+ " - Rec: "
                                                    +e.getIdRecorrido()+" "
                                                    +recorrido.getNombreZona()+" - " 
                                                    + recorrido.getDia()+" / "
                                                    +e.getMail()+" / "
                                                    +e.getFecha_alta()+" / "
                                                    +e.getDetalles()
                                                    +"</option>");
            }
    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="reset" value="RESET"/> 
                                <input type="submit" value="BORRAR"/> 
                            </td>
                        </tr>
                    </table>
                </div>

    <%
            //  ● BORRAR  
            String select_ClienteEmpresa = request.getParameter("select__clienteEmpresa");
            //boolean selectCheck=false;
            //boolean check = false;
            int id_selectClienteEmpresa = 0;
            //out.println("select_ClientePersona: "+select_ClientePersona);
            if (select_ClienteEmpresa !=null && !(select_ClienteEmpresa.isEmpty())) {
              //  check=true;
                //selectCheck=true;
                id_selectClienteEmpresa = Integer.parseInt(select_ClienteEmpresa);
                select_Corrector sc = new select_Corrector(id_selectClienteEmpresa);
                s_rep.save(sc);
                
                //out.println("id_selectClientePersona: "+id_selectClientePersona);
            }

            select_Corrector s1 = new select_Corrector();
             for (select_Corrector s : s_rep.getAll()){
            s1.setId_prueba(s.getId_prueba());
            }


            if (s1.getId_prueba()>0){
            
        
    %>      
                <!--CONFIRMACION-->        
                <div class="container__confirmacion_EliminarPersona"> 
                    <table>
                        <tr>
                            <td>
                        <%      ClienteEmpresa e = ce_rep.getById(id_selectClienteEmpresa);
                                Recorrido recorrido = re_rep.getById(e.getIdRecorrido());
                                out.print("<h3>¿Confirma la ELIMINACIÓN de la Empresa?</h3>");
                                out.print("<h2>"   
                                                +e.getId()+". " 
                                                    +e.getRazon_social()+" "
                                                    +e.getCuit()+", "
                                                    +e.getDireccion()+" ("
                                                    +e.getLocalidad()+") "
                                                    +e.getTipo_servicio()+" Bid: "
                                                    +e.getBidones()+" Maq: "
                                                    +e.getMaquinas()+" $ "
                                                    +e.getPrecio()+ " - Rec: "
                                                    +e.getIdRecorrido()+" "
                                                    +recorrido.getNombreZona()+" - " 
                                                    + recorrido.getDia()+" / "
                                                    +e.getMail()+" / "
                                                    +e.getFecha_alta()+" / "
                                                    +e.getDetalles()
                                                    +"</h2>");

                        %>

                            </td> 
                        </tr>
                        <tr>
                            <td>
                            <select name="select__confirmacion">
                                                    <option value="false">No</option>
                                                    <option value="true">Si</option>
                                                </select>
                            <input type="submit" value="OK"/> 
                            </td>
                            </tr>
                    </table>
                </div>     
            </form>

 
    <%  
                String select_Confirmacion;
                select_Confirmacion = request.getParameter("select__confirmacion");
                //out.println("select__confirmacion: "+ select_Confirmacion);
                if ("true".equalsIgnoreCase(select_Confirmacion)){
                    out.println("<h3>. select_Confirmacion: TRUE</h3>");
                    for (select_Corrector s : s_rep.getAll())
                    {ce_rep.remove(s.getId_prueba());}
                    s_rep.save(new select_Corrector(0));
                    //response.reset();
                    response.sendRedirect("borrar_ClientesEmpresa.jsp");
                }else if ("false".equalsIgnoreCase(select_Confirmacion)){
                    s_rep.save(new select_Corrector(0));
                    response.sendRedirect("borrar_ClientesEmpresa.jsp");
                }
            }
    %>
    
        </div>     
    </main>
    </header> <!-- CHECKEAR. Se realizo esta Corección para que no se mueva el main al utilizar el Scroll-->
</body>
</html>