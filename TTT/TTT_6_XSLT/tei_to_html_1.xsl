<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	exclude-result-prefixes="xs"
	version="2.0">
	
	<!-- this is a comment :) -->
	<!-- this is the first rule and it matches on the root element (/) of the input xml -->
	<xsl:template match="/">
		<!-- to create new elements, you can simply write them inside a <xsl:template> -->
		<root>
			<!-- xsl:value-of prints the text node of the current selection ("/") -->
			<xsl:value-of select="."/>
		</root>
	</xsl:template>
	
</xsl:stylesheet>