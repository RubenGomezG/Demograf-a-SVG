<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="/style/mapa.css" type="text/css"/>
                <title>Municipios</title>
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

<!--                <svg width= "1389" height= "890" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg">-->
<!--                    <image width="1389" height="890" xlink:href="navarra.png"/>-->
<!--                    <circle cx="667" cy="150" r="4" stroke="black" stroke-width="1" fill="red" />-->
<!--                    <circle cx="691" cy="669" r="4" stroke="black" stroke-width="1" fill="red" />-->
<!--                </svg>-->

                <svg width="1389" height="890" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg">
                    <image width="1389" height="890" xlink:href="navarra.png"/>
                    <xsl:for-each select="municipios/municipio">
                        <xsl:variable name="hombres" select="hombres"/>
                        <xsl:variable name="mujeres" select="mujeres"/>
                        <xsl:variable name="gx" select="x"/>
                        <xsl:variable name="gy" select="y"/>
                        <xsl:if test="$hombres > $mujeres">
                            <circle r="5" stroke="black" stroke-width="1" fill="lightgreen"
                                    cx="{($gx * 409.23 - 17297) + 500}" cy="{ ((-437.43) - $gy * 351.25) + 200}">
                                <title><xsl:value-of select="nombre"/></title>

                            </circle>
                        </xsl:if>
                        <xsl:if test="$mujeres > $hombres">
                            <circle r="5" stroke="black" stroke-width="1" fill="violet"
                                    cx="{($gx * 409.23 - 17297) + 500}" cy="{ ((-437.43) - $gy * 351.25) + 200}" >
                                <title><xsl:value-of select="nombre"/></title>
                            </circle>
                        </xsl:if>
                    </xsl:for-each>
                </svg>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>