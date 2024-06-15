<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="/style/foro.css" type="text/css"/>
                <title>Poblacion</title>
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
                <h1>Población de Navarra según el año</h1>
                <p>Navarra es una comunidad autónoma situada en el norte de España, limitando al norte con Francia y al sur con la Comunidad Autónoma del País Vasco. La población navarra es conocida por su diversidad cultural y su historia única. A pesar de ser una de las regiones más pequeñas de España, Navarra cuenta con una población de aproximadamente 660,000 habitantes.</p>
                <div class="container">
                <table>
                    <tr>
                        <th>Año</th>
                        <th>Población</th>
                    </tr>
                    <xsl:for-each select="anios/anio">
                        <xsl:sort select="numero" order="descending" data-type="number"></xsl:sort>
                        <tr>
                            <td><xsl:value-of select="numero"/></td>
                            <td><xsl:value-of select="poblacion"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <svg width="100%" height="650" xmlns="http://www.w3.org/2000/svg">
                    <rect y="100"
                          x="100"
                          height="400"
                          width="5"
                          style="fill:rgb(0,0,0);stroke-width:0;stroke:rgb(0,0,0)"/>
                    <rect y="500"
                          x="100"
                          height="5"
                          width="800"
                          style="fill:rgb(0,0,0);stroke-width:0;stroke:rgb(0,0,0)"/>
                    <xsl:variable name="coordX" select="105" />
                    <xsl:variable name="cadena">
                        <xsl:text>M</xsl:text>
                        <xsl:value-of select="$coordX"/>
                        <xsl:text>,500 </xsl:text>
                        <xsl:for-each select="anios/anio">
                            <xsl:sort select="numero" data-type="number"/>
                            <xsl:variable name="poblacion" select="poblacion"/>
                            <xsl:variable name="coordY" select="500 - $poblacion div 2000" />
                            <xsl:variable name="coordX" select="$coordX" />
                            <xsl:text>L</xsl:text>
                            <xsl:value-of select="$coordX + position() * 20"/>
                            <xsl:text>,</xsl:text>
                            <xsl:value-of select="$coordY"/>
                            <xsl:text> </xsl:text>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:for-each select="anios/anio">
                        <xsl:sort select="numero" data-type="number"/>
                        <xsl:variable name="poblacion" select="poblacion"/>
                        <xsl:variable name="anio" select="numero"/>
                        <xsl:variable name="coordX" select="$coordX + position() * 20"/>
                        <xsl:variable name="coordY" select="500 - ($poblacion div 2000) -70"/>
                        <text x="{$coordX}"
                              y="{$coordY}" writing-mode="tb" glyph-orientation-vertical = "90">
                            <xsl:value-of select="$poblacion"/>
                        </text>
                        <text x="{$coordX}"
                              y="{520}" writing-mode="tb" glyph-orientation-vertical = "90">
                            <xsl:value-of select="$anio"/>
                        </text>
                    </xsl:for-each>

                    <path d="{$cadena}" style="stroke:rgb(0,0,0); stroke-width:3; fill:none;"></path>
                </svg>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>