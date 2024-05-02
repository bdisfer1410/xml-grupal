<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="html" indent="yes"/>

<!-- MARK: POR HACER, BORRAR LUEGO ESTO
        Importante:
            Se cambió el CSS ligeramente para que los iconos de los botones TEL MAP WEB, se pongan por clases, y no por posición.
            A la final esto es para que si un centro no tiene Web. Pues que se quite dicho botón y la web no salga rara.
        Otros:
        -   Hay unos que no tienen imagen, A lo mejor ponemos una imagen de otro centro o directamente borramos el centro.
 -->

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
            <xsl:attribute name="src">
                <xsl:value-of select="normalize-space(attribute[@name='Imagen']/link/reference)"/>
            </xsl:attribute>
        </img>
        
        <div class="card-head">
            <!-- Darle como título el nombre del centro -->
            <h2><xsl:value-of select="attribute[@name='Titulo_es']/string"/></h2>
            <ul>
                <!-- Buscar los botones -->
                <xsl:variable name="tel" select="attribute[@name='Telefono']/array/string/text()"/>
                <xsl:variable name="map" select="attribute[@name='Posicion']/string"/>
                <xsl:variable name="web" select="attribute[@name='Web']/string"/>

                <!-- Teléfono -->
                <xsl:if test="count($tel) &gt; 0">
                    <li class="tel">
                        <a>
                            <xsl:attribute name="onclick">ask_call_telephone('<xsl:value-of select="normalize-space($tel[1])"/>')</xsl:attribute>
                            TEL
                        </a>
                    </li> 
                </xsl:if>

                <!-- Dirección -->
                <xsl:if test="count($map) &gt; 0">
                    <li class="map">
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>https://www.google.com/maps/@</xsl:text>
                                <!-- Extraer y separar las coordenadas de Posicion -->
                                <xsl:variable name="coords" select="tokenize($map, '#')"/>
                                <xsl:value-of select="$coords[1]"/> <!-- Latitud -->
                                <xsl:text>,</xsl:text>
                                <xsl:value-of select="$coords[2]"/> <!-- Longitud -->
                                <xsl:text>,15z</xsl:text>           <!-- Nivel de zoom -->
                            </xsl:attribute>
                            MAP
                        </a>
                    </li>
                </xsl:if>

                <!-- Página web -->
                <xsl:if test="count($web) &gt; 0">
                    <li class="web">
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="normalize-space($web)"/>
                            </xsl:attribute>
                            WEB
                        </a>
                    </li> 
                </xsl:if>
            </ul>
        </div>
        <div class="card-body fg-blur"> 
            <ul>
                <!-- Descripción -->
                <li>
                    <h3>Descripción</h3>
                    <p><xsl:value-of select="normalize-space(attribute[@name='Descripcion_es']/text)"/></p>
                </li>
                <!-- Capacidad -->
                <li>
                    <h3>Capacidad</h3>
                    <p><xsl:value-of select="normalize-space(attribute[@name='Capacidad']/string)"/></p>
                </li>
                <!-- Servicios -->
                <li>
                    <h3>Servicios</h3>
                    <ul>
                        <xsl:for-each select="attribute[@name='Servicios']/array/string">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>
                </li>
                <!-- Equipamiento -->
                <li>
                    <h3>Equipamiento</h3>
                    <ul>
                        <xsl:for-each select="attribute[@name='Equipamiento']/array/string">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>
                </li>
            </ul>
        </div>
    </section>
</xsl:template>

</xsl:stylesheet>
