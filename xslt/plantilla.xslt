<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/">
    <html>
        <head>
            <title>Libros del Catálogo</title>
        </head>
        <body>
            <xsl:apply-templates/>
        </body>
    </html>
</xsl:template>

<xsl:template match="/document/list/element/attribute[@name='Identificador']">
    <p>
        <xsl:value-of select="."/>
    </p>
</xsl:template>

</xsl:stylesheet>
