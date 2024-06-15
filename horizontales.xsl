<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="/style/horizontales.css" type="text/css"/>
                <title>Vascos</title>
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
                <h1>Vascoparlantes por Merindad</h1>
                <div class="container">
                <table>
                    <tr>
                        <th>Merindad</th>
                        <th>Vascos</th>
                        <th>Total</th>
                    </tr>
                    <xsl:for-each select="merindades/merindad">
                        <xsl:sort select="merindad" order="ascending" data-type="text"></xsl:sort>
                        <tr>
                            <th><xsl:value-of select="nombre"/></th>
                            <td><xsl:value-of select="vascoparlantes"/></td>
                            <td><xsl:value-of select="poblacion"/></td>
                        </tr>
                    </xsl:for-each>
                </table>

                <svg width="1600" height="550" xmlns="http://www.w3.org/2000/svg">

                    <xsl:for-each select="merindades/merindad">
                        <xsl:variable name="poblacion" select="poblacion"/>
                        <xsl:variable name="vascos" select="vascoparlantes"/>
                        <xsl:variable name="nombre" select="nombre"/>
                        <xsl:variable name="porcentaje" select="(($vascos div $poblacion) * 100)"/>
                        <xsl:variable name="porcentajeFormateado">
                            <xsl:value-of select="format-number($porcentaje, '0.00')" />
                        </xsl:variable>
                        <xsl:variable name="cadena" select="concat($porcentajeFormateado,' %')"/>

                        <rect y="{position() * 90 + 0}"
                              x="260"
                              height="30"
                              width="{$vascos div 500}"
                              style="fill:rgb(255,0,0);stroke-width:3;stroke:rgb(0,0,0)"/>

                        <rect y="{position() * 90 + 30}"
                              x="260"
                              height="30"
                              width="{$poblacion div 500}"
                              style="fill:rgb(0,255,0);stroke-width:3;stroke:rgb(0,0,0)"/>


                        <text y="{position() * 90 + 20}"
                              x="{270 + $vascos div 500}"><xsl:value-of select="$cadena"/></text>
                        <text x="160"
                              y="{position() * 90 + 30}"
                              fill="black"><xsl:value-of select="$nombre"/></text>

                    </xsl:for-each>

                    <!--                    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg">-->
                    <!--                        <xsl:for-each select="gpx/trk/trkseg/trkpt">-->
                    <!--                            <xsl:variable name="h" select="./ele"/>-->
                    <!--                            <xsl:variable name="base" select="800"/>-->
                    <!--                            <rect x="{position() * 3}"-->
                    <!--                                  y="{$base - $h * 0.1 * 2.5}"-->
                    <!--                                  width="3"-->
                    <!--                                  height="{$h * 0.1 * 2.5}"-->
                    <!--                                  fill="yellow"-->
                    <!--                                  stroke="green"/>-->
                    <!--                        </xsl:for-each>-->
                    <!--                    </svg>-->
                </svg>
                </div>
                <svg height="320" width="100%">
                    <rect x="85"
                          y="20"
                          height="20"
                          width="60"
                          style="fill:rgb(0,255,0);stroke-width:3;stroke:rgb(0,0,0)"/>

                    <text x="160"
                          y="35"
                          fill="black">Total</text>

                    <rect x="85"
                          y="60"
                          height="20"
                          width="60"
                          style="fill:rgb(255,0,0);stroke-width:3;stroke:rgb(0,0,0)"/>

                    <text x="160"
                          y="75"
                          fill="black">Vascos</text>
                </svg>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>