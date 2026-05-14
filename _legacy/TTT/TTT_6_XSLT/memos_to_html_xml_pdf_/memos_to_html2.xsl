<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
	<xsl:template match="/">
		<html lang="en">
			<head>
				<title>Bootstrap 5 Example</title>
				<meta charset="utf-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
					rel="stylesheet"/>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"/>
			</head>
			<body>
				<div class="container-fluid p-5 bg-primary text-white text-center">
					<h1>My First Bootstrap Page</h1>
					<p>Resize this responsive page to see the effect!</p>
				</div>
				<div class="container mt-5">
					<xsl:apply-templates select="//memo"/>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="memo">
		<div>
			<h1>
				<xsl:value-of select="to"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="from"/>
			</h1>
			<xsl:apply-templates select="body/p"/>
		</div>
	</xsl:template>
	
	<xsl:template match="p">
		<p>
			<xsl:if test="@style='bold'">
				<xsl:attribute name="class" select="'fw-bold'"/>
			</xsl:if>
			<xsl:value-of select="."/>
		</p>
	</xsl:template>
	
</xsl:stylesheet>
