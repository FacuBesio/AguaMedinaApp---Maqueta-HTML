

<%@page import="ar.com.aguaMedina.repositories.jdbc.ClienteEmpresaRepository_Editar"%>
<%@page import="ar.com.aguaMedina.entities.ClienteEmpresa_Editar"%>
<%@page import="ar.com.aguaMedina.entities.ClienteEmpresa"%>
<%@page import="ar.com.aguaMedina.repositories.jdbc.ClienteEmpresaRepository"%>
<%@page import="ar.com.aguaMedina.repositories.interfaces.I_ClienteEmpresaRepository"%>
<!-- EDITAR CLIENTE PERSONA -->

<%-- 
    Document   : cargar_ClientePersona
    Created on : 21 abr. 2022, 18:16:11
    Author     : usuario
--%>
<%@page import="ar.com.aguaMedina.repositories.jdbc.ClientePersonaRepository_Editar"%>
<%@page import="ar.com.aguaMedina.entities.ClientePersona_Editar"%>
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
<%ClientePersonaRepository_Editar cpe_rep = new ClientePersonaRepository_Editar(Conector.getConecction());%>
<%I_ClienteEmpresaRepository ce_rep = new ClienteEmpresaRepository(Conector.getConecction());%>
<%ClienteEmpresaRepository_Editar cee_rep = new ClienteEmpresaRepository_Editar(Conector.getConecction());%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>AguaMedina - Editar Empresas</title>
<!-- CSS -->
<link rel="stylesheet" href="../css/clienteEmpresa/editar_ClienteEmpresaCSS.css">
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
        <div class="container__main_EditarPersona">
            <!-- CONTAINER PARA SELECCIONAR PERSONA -->
            <div class="container__seleccionar_EditarPersona">
                <form>
                    <table>
                        <h2>EDITAR EMPRESA                                      </h2>
                        <tr>
                            <td>
                                <select name="select__clienteEmpresa">
                                    <option value="Prueba" disabled="" selected="true" style="color: black;">
                                        Seleccione la Empresa a Editar
                                    </option>
                        <% 
                        List<ClienteEmpresa>list_select_ClienteEmpresa = ce_rep.getAll();
                        if (list_select_ClienteEmpresa.isEmpty()|| list_select_ClienteEmpresa == null){
                            out.print("<option disabled=\"\"> Cargue una Empresa por favor </option>");
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
                                <input type="submit" value="EDITAR""/> 
                            </td>
                         </tr>
                    </table>
                </form>
            </div>
        </div>
        
                
    <%           
                //● SELECCION DE CLIENTE PERSONA  
                
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
                } // PARA TENER UN REGISTRO QUE ID PERSONA FUE SELECCIONADO EN UNA BASE DE DATOS Y NO DEPENDER DEL SELECT.
                
                ClienteEmpresa clienteEmpresa_update = new ClienteEmpresa();// PARA TABLA  EDITAR EMPRESAS
                boolean testigo_boolean = false; // PARA CONFIRMACION

                 //● INGRESO DE PARAMETROS 
                if (s1.getId_prueba()>0 && testigo_boolean == false){
                    ClienteEmpresa e = ce_rep.getById(s1.getId_prueba());
                    
    %>
            
            <!-- TABLA PARA EDITAR PERSONAS -->
            <div class="container__tabla_EditarPersonas">
                
                <form>
                    <table>
                        <h2>COMPLETE LOS NUEVOS DATOS                                       </h2>
                        <tr><td>Razon Social     </td><td><input type="text" name="razon_social" maxlength="35"
                                                           value="<%out.print(e.getRazon_social());%>">           </td></tr>
                        <tr><td>CUIT            </td><td><input type="text" name="cuit" maxlength="15"
                                                                value="<%out.print(e.getCuit());%>">           </td></tr>
                        <tr><td>Dirección  </td><td><input type="text" name="direccion" maxlength="35"
                                                           value="<%out.print(e.getDireccion());%>">        </td></tr>
                        <tr><td>Localidad  </td><td><input type="text" name="localidad" maxlength="35"
                                                           value="<%out.print(e.getLocalidad());%>">        </td></tr>
                        <tr><td>Contacto   </td><td><input type="text" name="contacto" maxlength="20"
                                                           value="<%out.print(e.getContacto());%>">         </td></tr>
                        <tr><td>Servicio   </td>
                            <td>
                                <select name="tipo_servicio"  style="">
    <%
                        if (e.getTipo_servicio().equalsIgnoreCase("Bidon 12 lts")){
                            out.print("<option selected=\"true\">Bidon 12 lts</option> "
                                    + "<option>Bidon 20 lts</option>"
                                    + "<option>Servicio Agua</option>");
                        }else if (e.getTipo_servicio().equalsIgnoreCase("Bidon 20 lts")){
                            out.print("<option>Bidon 12 lts</option> "
                                    + "<option selected=\"true\">Bidon 20 lts</option>"
                                    + "<option>Servicio Agua</option>");
                        }else if (e.getTipo_servicio().equalsIgnoreCase("Servicio Agua")){
                            out.print("<option>Bidon 12 lts</option> "
                                    + "<option>Bidon 20 lts</option>"
                                    + "<option selected=\"true\">Servicio Agua</option>");
                        }
    
    
    %>
                                </select>
                            </td>
                        </tr>
                        <tr><td>Bidones    </td><td><input type="number" name="bidones"
                                                           value="<%out.print(e.getBidones());%>">          </td></tr>
                        
                        <tr><td>Maquinas    </td><td><input type="number" name="maquinas"
                                                           value="<%out.print(e.getMaquinas());%>">          </td></tr>
                        <tr><td>Precio ($) </td><td><input type="number" name="precio"
                                                           value="<%out.print(e.getPrecio());%>">            </td></tr>
                        <tr><td>Recorrido      </td>
                            <td>
                                <select name="idRecorrido">
    <% 
                    List<Recorrido>list = re_rep.getAll();
                    if (list.isEmpty()|| list == null){
                        out.print("<option disabled=\"\"> Cargue un Recorrido por favor </option>");
                        }else{
                            for(Recorrido r: list){
                                if (r.getAsistenteZona()==null){
                                r.setAsistenteZona("Sin asistente");
                                }
                            }
                        }
                    
                    for(Recorrido r: list){
                        if (e.getIdRecorrido()== r.getId()){
                            out.print("<option value=" +r.getId()+" selected=\"true\">"+
                                                                        r.getId()+". "+
                                                                        r.getNombreZona()+", "+
                                                                        r.getDia()+" ("+
                                                                        r.getResponsableZona()+" - "+
                                                                        r.getAsistenteZona()+")"
                            + "</option>");
                        }else{
                            out.print("<option value=" +r.getId()+">"+
                                                                        r.getId()+". "+
                                                                        r.getNombreZona()+", "+
                                                                        r.getDia()+" ("+
                                                                        r.getResponsableZona()+" - "+
                                                                        r.getAsistenteZona()+")"
                            + "</option>");
                        }
                    }
    %>
                                </select>
                            </td>
                        </tr>
                        <tr><td>Mail    </td><td><input type="text" name="mail" maxlength="50"
                                                        value="<%out.print(e.getMail());%>">            </td></tr>
                        <tr><td>Fecha Alta    </td><td><input type="text" name="fecha_alta" maxlength="10"
                                                              value="<%out.print(e.getFecha_alta());%>">          </td></tr>
                        <tr><td>Detalles    </td><td><input type="text" name="detalles" maxlength="35"
                                                              value="<%out.print(e.getDetalles());%>">          </td></tr>
                        <tr>
                            <td><input  type="reset" 
                                        value="RESET" 
                                        style=" width: 125px;  
                                                height: 100%;  
                                                padding: 5px; 
                                                font-size: 16px; 
                                                background-color:rgb(159, 197, 58);
                                                border-color:rgb(183, 206, 53);
                                                color: white;
                                                margin-top: 10px;
                                                margin-bottom: 5px;
                                                font-weight: bolder;"/>  
                            </td>
                            <td><input  type="submit" 
                                        value="GUARDAR" 
                                        style=" padding: 5px; 
                                                width: 100%;
                                                height: 100%;
                                                font-size: 16px; 
                                                text-align: center;
                                                background-color:rgb(159, 197, 58);
                                                border-color:rgb(183, 206, 53);
                                                color: white;
                                                margin-top: 10px;
                                                margin-bottom: 5px;
                                                font-weight: bolder;"/>  
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
           
    
    
    
    <%              
                    //● INGRESO DE PARAMETROS
                        //ClientePersona_Editar clientePersona_editar = new ClientePersona_Editar(300,"Maria", "Juana", "Villa Verde 248", 
                                                                                // "Lugares Santos", "1248", "1123548796", 1);
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
                            ClienteEmpresa_Editar clienteEmpresa_editar = new ClienteEmpresa_Editar(
                                                                                                    s1.getId_prueba(),
                                                                                                    true, //testigo_boolean
                                                                                                    razon_social, 
                                                                                                    cuit,
                                                                                                    direccion, 
                                                                                                    localidad, contacto,
                                                                                                    tipo_servicio, bidones,
                                                                                                    maquinas,precio,
                                                                                                    idRecorrido,mail,
                                                                                                    fecha_alta,
                                                                                                    detalles);
                                cee_rep.save(clienteEmpresa_editar);
                                
                        }
                    } catch (NullPointerException | NumberFormatException ex) {
                    //out.print("<h3> Por favor complete los Campos </h3>" );
                    } catch (Exception ex) {
                    System.out.println("*********************");
                        out.print("<h3>Ocurrio un Error. " + e +"</h3>" );
                    System.out.println("*********************");
                    }
                    
                    
                    
                    for (ClienteEmpresa_Editar ee : cee_rep.getAll()){
                    clienteEmpresa_update.setId(ee.getId());
                    testigo_boolean = ee.getTestigo_boolean();
                    clienteEmpresa_update.setRazon_social(ee.getRazon_social());
                    clienteEmpresa_update.setCuit(ee.getCuit());
                    clienteEmpresa_update.setDireccion(ee.getDireccion());
                    clienteEmpresa_update.setLocalidad(ee.getLocalidad());
                    clienteEmpresa_update.setContacto(ee.getContacto());
                    clienteEmpresa_update.setTipo_servicio(ee.getTipo_servicio());
                    clienteEmpresa_update.setBidones(ee.getBidones());
                    clienteEmpresa_update.setMaquinas(ee.getMaquinas());
                    clienteEmpresa_update.setPrecio(ee.getPrecio());
                    clienteEmpresa_update.setIdRecorrido(ee.getIdRecorrido());
                    clienteEmpresa_update.setMail(ee.getMail());
                    clienteEmpresa_update.setFecha_alta(ee.getFecha_alta());
                    clienteEmpresa_update.setDetalles(ee.getDetalles());
                    }
                    
                    //out.print("<h3>clientePersona_update: "+clientePersona_update+"</h3>" );
                    //out.print("<h3>testigo_boolean: "+testigo_boolean+"</h3>" );
                    //s1.setId_prueba((s1.getId_prueba() * (-1))); 
                    //out.print("<h3>testigo_boolean: "+s1+"</h3>" );
                }// ----> /if (s1.getId_prueba()>0){}

                    //● CONFIRMACION
                    if (testigo_boolean == true){
    %>      
           
        <!--● CONFIRMACION-->   
            <div class="container__confirmacion">
                <form>
                    <table>
                        <tr>
                            <td>
        <%          
                    ClienteEmpresa e = ce_rep.getById(clienteEmpresa_update.getId());
                    Recorrido recorrido = re_rep.getById(e.getIdRecorrido());
                    out.print("<h3>¿Confirma la EDICION de la Empresa? </h3>");
                    out.print("<h2>"   
                                    +clienteEmpresa_update.getId()+". " 
                                    +clienteEmpresa_update.getRazon_social()+" "
                                    +clienteEmpresa_update.getCuit()+", "
                                    +clienteEmpresa_update.getDireccion()+" ("
                                    +clienteEmpresa_update.getLocalidad()+") "
                                    +clienteEmpresa_update.getTipo_servicio()+" Bidones: "
                                    +clienteEmpresa_update.getBidones()+" Maquinas: "
                                    +clienteEmpresa_update.getMaquinas()+" $ "
                                    +clienteEmpresa_update.getPrecio()+ "- Recorrido: "
                                    +clienteEmpresa_update.getIdRecorrido()+" ("
                                    +re_rep.getById(clienteEmpresa_update.getIdRecorrido()).getNombreZona()+" - " 
                                    +re_rep.getById(clienteEmpresa_update.getIdRecorrido()).getDia()+") "
                                    +clienteEmpresa_update.getMail()+" / "
                                    +clienteEmpresa_update.getFecha_alta()+" / "
                                    +clienteEmpresa_update.getDetalles()
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
                </form>
            </div>
            <%      
                        //● CONFIRMACION
                        String select_Confirmacion;
                        select_Confirmacion = request.getParameter("select__confirmacion");
                        if ("true".equalsIgnoreCase(select_Confirmacion)){
                            //out.println("<h3>TRUE</h3>");
                            ce_rep.update(clienteEmpresa_update);
                            cee_rep.save(new ClienteEmpresa_Editar());
                            s_rep.save(new select_Corrector(0));
                            response.sendRedirect("editar_ClientesEmpresa.jsp");
                        }else if ("false".equalsIgnoreCase(select_Confirmacion)){
                            //out.println("<h3>FALSE</h3>");
                            s_rep.save(new select_Corrector(0));
                            cee_rep.save(new ClienteEmpresa_Editar());
                            response.sendRedirect("editar_ClientesEmpresa.jsp");
                        }
                        //out.print("<h3>select_Confirmacion: "+select_Confirmacion+"</h3>" );
                        //out.print("<h3>clientePersona_update: "+clientePersona_update+"</h3>" );
                        //out.print("<h3>cp_rep.getById(): "+cp_rep.getById(s1.getId_prueba())+"</h3>" );
                    }  // ----> /if (testigo_boolean == true)
             %>
    </main>
    </header> <!-- CHECKEAR. Se realizo esta Corección para que no se mueva el main al utilizar el Scroll-->
</body>
</html>

