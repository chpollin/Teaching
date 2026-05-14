<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	exclude-result-prefixes="xs"
	version="2.0">
	
	
	<!-- 
	* <xsl:template match="/">
	* comment
	* <xsl:value-of select="."/>
	* Apply Transformation Scenario
	-->
	
	<!-- this is a comment :) -->
	
	<xsl:template match="/">
		<root>
			<xsl:value-of select="."/>
		</root>
	</xsl:template>
	
</xsl:stylesheet>