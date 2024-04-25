<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/">
    <html>
        <head>
            <title>Libros del Catálogo</title>
        </head>
        <body>
            <h1>TOTAL LIBROS CATÁLOGO [<xsl:value-of select="count(/document/list/element/attribute[@name='Identificador'])"/>]</h1>
            <xsl:apply-templates/>
        </body>
    </html>
</xsl:template>

<xsl:template match="book">
    <p>
        <xsl:text>Libro </xsl:text><xsl:number/>.<xsl:text> </xsl:text><xsl:value-of select="bookname"/>
    </p>
</xsl:template>

</xsl:stylesheet>
