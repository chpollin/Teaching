<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	exclude-result-prefixes="xs"
	version="2.0">
	
	<!-- this XSL transform our data into a simple html file. add in the output scenario .html -->
	<xsl:template match="/">
		<html lang="en">
			<head>
				<title>Bootstrap 5 Example</title>
				<meta charset="utf-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"/>
			</head>
			<body>
				<div class="container-fluid p-5 bg-primary text-white text-center">
					<h1>My First Bootstrap Page</h1>
					<p>Resize this responsive page to see the effect!</p> 
				</div>
				<div class="container mt-5">
					<p>
						<xsl:value-of select="."/>
					</p>
				</div>
			</body>
		</html>
	</xsl:template>
	
</xsl:stylesheet>