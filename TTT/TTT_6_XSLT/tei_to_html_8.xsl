<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    
    <!-- 
	* styling with Bootsgtrap 5 & th class="text-center"
	* for-each, for-each-group
	* selecting data from listPerson
	-->
    <xsl:template match="/">
        
        <!-- /////////// -->
        <!-- person.html -->
        <xsl:result-document href="person.html" method="html">
            <html lang="en">
                <!-- call getHead -->
                <xsl:call-template name="get_head">
                    <xsl:with-param name="title" select="'Personenindex'"/>
                </xsl:call-template>
                <body>
                    <!-- call getNav -->
                    <xsl:call-template name="get_nav_and_header"/>
                    <!-- content -->
                    <div class="container mt-5">
                        <xsl:apply-templates select="//t:teiHeader//t:listPerson"/>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        
        <!-- /////////// -->
        <!-- transaction_by_person.html -->
        <xsl:result-document href="transaction_by_person.html" method="html">
            <html lang="en">
                <!-- call getHead -->
                <xsl:call-template name="get_head">
                    <xsl:with-param name="title" select="'Übersicht der Transaktionen nach Person'"/>
                </xsl:call-template>
                <body>
                    <!-- call getNav -->
                    <xsl:call-template name="get_nav_and_header"/>
                    <!-- content -->
                    <div class="container mt-5">
                    <!--<ul>
                        <xsl:for-each select="//t:name[@ana = 'bk:to']">
                           <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>-->
                    <!--<ul>
                        <xsl:for-each-group select="//t:row[@ana='bk:entry'][.//t:name[@ana = 'bk:to']]" group-by=".//t:name/@ref">
                            <li><xsl:value-of select="current-grouping-key()"/><br/><xsl:value-of select="current-group()"/></li>
                        </xsl:for-each-group>
                    </ul>-->
                    <xsl:for-each-group select="//t:row[@ana='bk:entry'][.//t:name[@ana = 'bk:to']]" group-by=".//t:name[@ana = 'bk:to']/@ref">
                        <h3>
                            <!-- pers_WCDH260 -->
                            <xsl:variable name="PERSON_ID" select="substring-after(current-grouping-key(), '#')"/>
                            <!-- pers_WCDH260 -->
                            <xsl:variable name="PERSON" select="//t:listPerson/t:person[@xml:id = $PERSON_ID]"/>
                            <xsl:value-of select="$PERSON/t:persName/t:surname"/>
                            <xsl:if test="$PERSON/t:persName/t:forename">
                             <xsl:text>, </xsl:text>
                             <xsl:value-of select="$PERSON/t:persName/t:forename"/>
                            </xsl:if>
                            <xsl:value-of select="concat(' [@xml:id=', $PERSON_ID, ']')"/>
                            <xsl:text> - Number of Transactions: </xsl:text>
                            <xsl:value-of select="count(current-group())"/>
                            
                        </h3>
                        <ul>
                            <xsl:for-each select="current-group()">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ul>
                    </xsl:for-each-group>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        
        <!-- output.html aka edition -->
        <html lang="en">
            <!-- call getHead -->
            <xsl:call-template name="get_head">
                <xsl:with-param name="title" select="'Edition'"/>
            </xsl:call-template>
            <body>
                <!-- call getNav -->
                <xsl:call-template name="get_nav_and_header"/>
                <!-- content -->
                <div class="container mt-5">
                    <xsl:apply-templates select="//t:table"/>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="t:head">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <xsl:template match="t:date">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="t:table">
        <table class="my-5">
            <xsl:attribute name="class" select="'table'"/>
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    
    <xsl:template match="t:row[count(t:cell) > 1]">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="t:cell">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
    <xsl:template match="t:row[count(t:cell) = 1]">
        <th class="text-center">
            <xsl:value-of select="t:cell"/>
        </th>
    </xsl:template>
    
    <xsl:template match="t:choice">
        <span title="{t:expan}" class="text-decoration-underline">
            <xsl:value-of select="t:abbr"/>
        </span>
    </xsl:template>
    
    <xsl:template match="t:listPerson">
        <ul class="list-group">
            <xsl:apply-templates select="t:person">
                <!-- sort -->
                <xsl:sort select="t:persName/t:surname[1]"/>
            </xsl:apply-templates>
        </ul>
    </xsl:template>
    
    <xsl:template match="t:name">
        <span class="bg-info">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="t:person">
        <li class="list-group-item">
            <xsl:value-of select="t:persName"/>
            <!-- xsl:if; Boolean Operators  -->
            <xsl:if test="t:birth/@when or t:death/@when">
                <xsl:text> (</xsl:text>
                <!-- birth -->
                <xsl:if test="t:birth/@when">
                    <xsl:call-template name="formate_date">
                        <xsl:with-param name="when" select="t:birth/@when"/>
                    </xsl:call-template>
                </xsl:if>
                <xsl:text>-</xsl:text>
                <!-- death -->
                <xsl:if test="t:death/@when">
                    <xsl:call-template name="formate_date">
                        <xsl:with-param name="when" select="t:death/@when"/>
                    </xsl:call-template>
                </xsl:if>
                <xsl:text>)</xsl:text>
            </xsl:if>
        </li>
    </xsl:template>
    
    
    <xsl:template name="formate_date">
        <xsl:param name="when"/>
        <xsl:choose>
            <!-- check if just year; like 1796 -->
            <xsl:when test="$when castable as xs:gYear">
                <xsl:value-of select="$when"/>
            </xsl:when>
            <!-- check if a valid year + month; like 1796-09  -->
            <xsl:when test="$when castable as xs:gYearMonth">
                <xsl:variable name="month" select="substring-after($when, '-')"/>
                <xsl:variable name="year" select="substring-before($when, '-')"/>
                <xsl:value-of select="concat($month, '.', $year)"/>
            </xsl:when>
            <!-- check if a valid date; 1796-09-12 -->
            <xsl:when test="$when castable as xs:date">
                <xsl:value-of select="format-date($when,'[D].[M].[Y]')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat('no date:', $when)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- get_head -->
    <xsl:template name="get_head">
        <xsl:param name="title"/>
        <head>
            <title><xsl:value-of select="$title"/></title>
            <meta charset="utf-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
                rel="stylesheet"/>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"/>
        </head>
    </xsl:template>
    
    <!-- get_nav_and_header -->
    <xsl:template name="get_nav_and_header">
        <xsl:param name="title"/>
        <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top ">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Navbar</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"/>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="output.html"
                                >Edition</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page"
                                href="person.html">Person</a>
                        </li>
                        <li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page"
                                href=" transaction_by_person.html">Übersicht der Transaktionen nach Person</a>
                        </li> 
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid p-5 bg-primary text-white text-center">
            <h1>
                <xsl:value-of select="/t:TEI/t:teiHeader/t:fileDesc/t:titleStmt/t:title"
                />
            </h1>
            <p>
                <xsl:value-of
                    select="/t:TEI/t:teiHeader/t:fileDesc/t:sourceDesc/t:msDesc"/>
            </p>
        </div>
    </xsl:template>

</xsl:stylesheet>
