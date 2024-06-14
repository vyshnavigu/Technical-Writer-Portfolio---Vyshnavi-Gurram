<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title><xsl:value-of select="confluenceandsharepoint/title"/></title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <h1><xsl:value-of select="confluenceandsharepoint/title"/></h1>
                <xsl:apply-templates select="confluenceandsharepoint/introduction"/>
                <xsl:apply-templates select="confluenceandsharepoint/similarities"/>
                <xsl:apply-templates select="confluenceandsharepoint/prosandcons"/>
                <xsl:apply-templates select="confluenceandsharepoint/conclusion"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="introduction">
        <h2><xsl:value-of select="sectionTitle"/></h2>
        <p><xsl:value-of select="content"/></p>
        <img src="{image/@src}" alt="{image/@alt}"/>
    </xsl:template>
    
    <xsl:template match="similarities">
        <h2><xsl:value-of select="sectionTitle"/></h2>
        <p><xsl:value-of select="content"/></p>
        <table>
            <tr>
                <th>Similarity</th>
                <th>Description</th>
            </tr>
            <xsl:for-each select="table/row">
                <tr>
                    <xsl:for-each select="cell">
                        <td><xsl:value-of select="."/></td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
    
    <xsl:template match="prosandcons">
        <h2><xsl:value-of select="sectionTitle"/></h2>
        <h3><xsl:value-of select="subtitle[1]"/></h3>
        <table>
            <tr>
                <th>Pros</th>
                <th>Cons</th>
            </tr>
            <xsl:for-each select="table[1]/row">
                <tr>
                    <td><xsl:value-of select="cell[1]"/></td>
                    <td><xsl:value-of select="cell[2]"/></td>
                </tr>
            </xsl:for-each>
        </table>
        <h3><xsl:value-of select="subtitle[2]"/></h3>
        <table>
            <tr>
                <th>Pros</th>
                <th>Cons</th>
            </tr>
            <xsl:for-each select="table[2]/row">
                <tr>
                    <td><xsl:value-of select="cell[1]"/></td>
                    <td><xsl:value-of select="cell[2]"/></td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
    <xsl:template match="conclusion">
        <h2><xsl:value-of select="sectionTitle"/></h2>
        <p><xsl:value-of select="content"/></p>
    </xsl:template>
</xsl:stylesheet>