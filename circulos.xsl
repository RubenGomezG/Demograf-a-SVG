<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Nacimientos</title>
                <link rel="stylesheet" href="/style/tabla.css" type="text/css"/>
            </head>
            <body>
                <nav class="navbar">
                    <div class="logo"><a href="/poblacion.html">Demografia</a></div>

                    <ul class="nav-links">

                        <input type="checkbox" id="checkbox_toggle" />

                        <label for="checkbox_toggle" class="hamburger">&#9776;</label>

                        <div class="menu">
                            <li><a href="/circulos.html">Nacimientos</a></li>
                            <li><a href="/poblacion.html">Poblacion</a></li>
                            <li><a href="/vascoparlantes.html">Vascos</a></li>
                            <li><a href="/merindades.html">Merindades</a></li>
                            <li><a href="/mapa.html">Municipios</a></li>
                        </div>
                    </ul>
                </nav>
                <h1>Nacimientos en Navarra según su año</h1>
                <div class="container">
                <table>
                    <tr>
                        <th>Año</th>
                        <th>Nacimientos</th>
                    </tr>
                    <xsl:for-each select="anios/anio">
                        <xsl:sort select="numero" order="descending" data-type="number"></xsl:sort>
                        <tr>
                            <td><xsl:value-of select="numero"/></td>
                            <td><xsl:value-of select="nacidos"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            <svg height="750" width="1400" xmlns="http://www.w3.org/2000/svg">
                <xsl:variable name="max">
                    <xsl:for-each select="anios/anio">
                        <xsl:sort select="nacidos" data-type="number" order="descending"/>
                        <xsl:if test="position() = 1"  >
                            <xsl:value-of select="nacidos"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="min">
                    <xsl:for-each select="anios/anio">
                        <xsl:sort select="nacidos" data-type="number"/>
                        <xsl:if test="position() = 1"  >
                            <xsl:value-of select="nacidos"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:for-each select="anios/anio">
                    <xsl:sort select="numero" data-type="number" order="ascending"/>
                    <xsl:variable name="nacidos" select="nacidos"/>
                    <circle r="{(($nacidos - 4000)div ($max - 4000)) * 200}" cx="{80 + position()*20}" cy="{630 - position()*15}"
                            stroke="black" stroke-width="1" fill="rgb({255 - 255 * (($nacidos - $min) div ($max - $min))}, {255 * (($nacidos - $min) div ($max - $min))}, 0)"/>
                </xsl:for-each>
            </svg>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>