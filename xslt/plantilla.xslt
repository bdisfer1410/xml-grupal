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
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="attribute[@name='Identificador']/string"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="attribute[@name='Titulo_es']/string"/>
                                    </a>
                                </li>
                            </xsl:for-each>
                            <!-- FIN -->
                        </ul>
                    </div>
                    <a class="clickable " href="#"> Volver arriba </a>
                </nav>
                <main>
                    <xsl:apply-templates/>
                </main>
                <footer>
                    Diseño Web realizado para la actividad Proyecto de Transformación XML, módulo LMSGI, 1º DAM, IES FUENGIROLA 1
                </footer>
            </div>
        </body>
    </html>
</xsl:template>

<xsl:template match="/document/list/element">
    aaaaaaaaaaa
</xsl:template>

</xsl:stylesheet>
