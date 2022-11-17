<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:t="http://www.tei-c.org/ns/1.0"
	exclude-result-prefixes="xs"
	version="2.0">
	
	<!-- 
	* namespace 
	* xpath - //t:title vs /t:TEI/t:teiHeader/t:fileDesc/t:titleStmt/t:title
	* <xsl:apply-templates select="//t:table"/>
	* <xsl:template match="t:table">, <xsl:template match="t:row">, <xsl:template match="t:cell">
	* todo fixing heading - dates Nov. 1st 1828, 2, etc.
	-->
	<xsl:template match="/">
		<html lang="en">
			<head>
				<title>
					<xsl:value-of select="/t:TEI/t:teiHeader/t:fileDesc/t:titleStmt/t:title"/>
				</title>
				<meta charset="utf-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"/>
			</head>
			<body>
				<div class="container-fluid p-5 bg-primary text-white text-center">
					<!--  -->
					<h1>
						<xsl:value-of select="//t:title"/>
					</h1>
					<p>Resize this responsive page to see the effect!</p> 
				</div>
				<div class="container mt-5">
					<!--  -->
					<xsl:apply-templates select="//t:table"/>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="t:table">
		<table>
			<xsl:apply-templates/>
		</table>
	</xsl:template>
	
	<xsl:template match="t:row">
		<tr>
			<xsl:apply-templates/>
		</tr>
	</xsl:template>
	
	<xsl:template match="t:cell">
		<td>
			<xsl:apply-templates/>
		</td>
	</xsl:template>
	
</xsl:stylesheet>