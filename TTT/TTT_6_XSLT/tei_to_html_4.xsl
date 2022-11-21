<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:t="http://www.tei-c.org/ns/1.0"
	exclude-result-prefixes="xs"
	version="2.0">
	
	<!-- 
	* class="my-5" and creating attributes, <xsl:attribute name="class" select="'table'"/>
	* t:choice with underline and @title
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
	
	<!--<xsl:template match="t:date">
		<xsl:apply-templates/>
	</xsl:template>-->
	
	<xsl:template match="t:table">
		<table>
			<xsl:attribute name="class" select="'my-5 table'"/>
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
	
</xsl:stylesheet>