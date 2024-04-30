<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="html" indent="yes"/>

<!-- MARK: PUNTO DE ENTRADA
     Aquí se genera el HTML, su Head y Body.
     Todo es estático excepto los enlaces de Nav, y las tarjets de Main.
 -->
<xsl:template match="/">
    <html lang="es">
        <head>
            <!-- CONFIFURACIÓN -->
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title> Alojamientos Juveniles </title>
            <!-- EXTERNO -->
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lexend"/>
            <link rel="stylesheet" href="style.css"/>
            <script src="script.js" defer=""/>
        </head>
      
        <body>
            <div class="container fg-blur">
                <header>
                    <h1> Alojamientos Juveniles </h1>
                    <ul class="author">
                        <li> Bruno Di Sabatino </li>
                        <li> Ángel Leal </li>
                    </ul>
                </header>
                <nav class="fg-blur closed">
                    <a class="clickable" href="fuente.xml"> Ver XML </a>
                    <div id="dropdown">
                        <button class="clickable"> </button>
                        <ul>
                            <!-- GENERAR ENLACES -->
                            <xsl:for-each select="/document/list/element">
                                <li>
                                    <a>
                                        <xsl:attribute name="href">#<xsl:value-of select="attribute[@name='Identificador']/string"/></xsl:attribute>
                                        <xsl:value-of select="attribute[@name='Titulo_es']/string"/>
                                    </a>
                                </li>
                            </xsl:for-each>
                            <!-- FIN -->
                        </ul>
                    </div>
                    <a class="clickable " href="#"> Volver arriba </a>
                </nav>
                <!-- GENERAR TARJETAS -->
                <main>
                    <xsl:apply-templates />
                </main>
                <!-- FIN -->
                <footer>
                    Diseño Web realizado para la actividad Proyecto de Transformación XML, módulo LMSGI, 1º DAM, IES FUENGIROLA 1
                </footer>
            </div>
        </body>
    </html>
</xsl:template>

<!-- MARK: TARJETAS
     Aquí se genera los Sections.
 -->
<xsl:template match="/document/list/element">
    <section class="card">
        <!-- Darle al ancla el valor de Identificador -->
        <xsl:attribute name="id">
            <xsl:value-of select="attribute[@name='Identificador']/string"/>
        </xsl:attribute>

        <!-- Poner la URL de Imagen -->
        <img>
            <xsl:attribute name="src"><xsl:value-of select="normalize-space(attribute[@name='Imagen']/link/reference)"/></xsl:attribute>
        </img>
        
        <div class="card-head">
            <!-- Añadir imágen -->
            <h2>Rio Carrión </h2>
            <ul>
                <li><a onclick="ask_call_telephone('979165973')">TEL</a></li> 
                <li><a href="https://www.google.com/maps/@41.62820471969123, -4.747935900000001">MAP</a></li>
                <li><a href="http://www.elcallejonalbergue.es/">WEB</a></li> 
            </ul>
        </div>
        <div class="card-body fg-blur"> 
            <ul>
                <li>
                    <h3> Descripción</h3>
                    <p>El albergue de propiedad privada, se encuentra situado en Carrión de los Condes, al
                        norte de la ciudad de Palencia a 40 km, en pleno corazón del románico, a la vera del
                        río Carrión y junto al Camino de Santiago. Capital de la Comarca, cargada de monumentos
                        y de historia, es un lugar ideal para disfrutar de la naturaleza y para contemplar el románico
                            en todo su esplendor.
                    </p>
                </li>
                <li>
                    <h3> Capacidad </h3>
                        <p>El albergue dispone de 211 plazas en Albergue y 202 en casas prefabricadas</p>
                </li>
                <li>
                    <h3>Servicios </h3>
                    <ul>
                        <li>Alojamiento</li>
                        <li>Internet</li>
                        <li>Lavandería de usuarios</li>
                        <li>Manutención</li>
                    </ul>
                </li>
                <li>
                    <h3>Equipamiento </h3>
                    <ul>
                        <li>Biblioteca</li>
                        <li>Sala de TV y vídeo</li>
                        <li>Sala de reuniones (con audiovisuales)</li>
                        <li>Sala de usos multiples</li>
                        <li>Salas de Estar</li>
                    </ul>
                </li>
            </ul>
        </div>
    </section>
</xsl:template>

</xsl:stylesheet>
