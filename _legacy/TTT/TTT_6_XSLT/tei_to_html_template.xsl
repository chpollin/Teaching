<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
	exclude-result-prefixes="xs" version="2.0">
	<!-- 
	* Christopher Pollin, 2022, Textkodierung und Textanalyse mit TEI
	-->
	<xsl:template match="/">
		<html lang="en">
			<head>
				<title>
					<xsl:value-of select="/t:TEI/t:teiHeader/t:fileDesc/t:titleStmt/t:title[1]"/>
				</title>
				<meta charset="utf-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
					rel="stylesheet"/>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"/>
			</head>
			<body>
				<div class="container-fluid p-5 bg-primary text-white text-center">
					<!--  -->
					<h1>
						<xsl:value-of select="/t:TEI/t:teiHeader/t:fileDesc/t:titleStmt/t:title[1]"
						/>
					</h1>
					<p>Template</p>
				</div>
				<div class="container mt-5">
					<!--  -->
					<xsl:apply-templates select="//*:body"/>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
