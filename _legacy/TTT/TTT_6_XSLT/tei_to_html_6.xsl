<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    
    <!-- 
	* call template, named templates
	* param
	-->
    <xsl:template match="/">
        
        <!-- create an additional html document -->
        <xsl:result-document href="person.html" method="html">
            <html lang="en">
                <!-- call getHead -->
                <xsl:call-template name="get_head">
                    <xsl:with-param name="title" select="'Personindex'"/>
                </xsl:call-template>
                <body>
                    <!-- call getNav -->
                    <xsl:call-template name="get_nav_and_header"/>
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
                    <div class="container mt-5">
                        <!--  -->
                        <xsl:apply-templates select="//t:teiHeader//t:listPerson"/>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        
        
        <html lang="en">
            <!-- call getHead -->
            <xsl:call-template name="get_head">
                <xsl:with-param name="title" select="/t:TEI/t:teiHeader/t:fileDesc/t:titleStmt/t:title"/>
            </xsl:call-template>
            <body>
                <!-- call getNav -->
                <xsl:call-template name="get_nav_and_header"/>
                <div class="container-fluid p-5 bg-primary text-white text-center">
                    <h1>
                        <xsl:value-of select="/t:TEI/t:teiHeader/t:fileDesc/t:titleStmt/t:title"/>
                    </h1>
                    <p>
                        <xsl:value-of select="/t:TEI/t:teiHeader/t:fileDesc/t:sourceDesc/t:msDesc"/>
                    </p>
                </div>
                <div class="container mt-5">
                    <!--  -->
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
    
    <!-- select every t:row that has just 1 cell -->
    <xsl:template match="t:row[count(t:cell) = 1]">
        <h3>
            <xsl:value-of select="t:cell"/>
        </h3>
    </xsl:template>
    
    <xsl:template match="t:choice">
        <span title="{t:expan}" class="text-decoration-underline">
            <xsl:value-of select="t:abbr"/>
        </span>
    </xsl:template>
    
    <xsl:template match="t:listPerson">
        <ul class="">
            <xsl:apply-templates select="t:person"/>
        </ul>
    </xsl:template>
    
    <xsl:template match="t:person">
        <li class="list-group-item">
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    
    
    <xsl:template name="get_head">
        <xsl:param name="title"/>
        <head>
            <title>
                <xsl:value-of select="$title"/>
            </title>
            <meta charset="utf-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
                rel="stylesheet"/>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"/>
        </head>
    </xsl:template>
    
    <xsl:template name="get_nav_and_header">
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
                    </ul>
                </div>
            </div>
        </nav>
    </xsl:template>
    
    
    
</xsl:stylesheet>
