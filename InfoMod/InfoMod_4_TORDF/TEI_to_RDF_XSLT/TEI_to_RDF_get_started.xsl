<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" 
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:schema="https://schema.org/"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:bk="https://gams.uni-graz.at/o:depcha.bookkeeping#"
    xmlns:void="http://rdfs.org/ns/void#" 
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- GLOBAL VARIABLES -->
    <!-- we define a base url for building our uris -->
    <xsl:variable name="BASE_URL" select="'https://example.com#'"/>
    
    <!-- root -->
    <xsl:template match="/">
        
        <rdf:RDF>
            <!-- a new subject void:Dataset is created and we can use dcterms: and void: to add metadata to it.  -->
            <xsl:if test="//tei:publicationStmt/tei:idno[@type = 'PID']">
                <void:Dataset rdf:about="{concat($BASE_URL, //tei:publicationStmt/tei:idno[@type = 'PID'])}">
                    <xsl:if test="//tei:fileDesc/tei:titleStmt/tei:title">
                        <dcterms:title>
                            <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:title"/>
                        </dcterms:title>
                    </xsl:if>
                    <xsl:if test="//tei:fileDesc/tei:publicationStmt/tei:publisher">
                        <dcterms:publisher>
                            <xsl:value-of select="//tei:fileDesc/tei:publicationStmt/tei:publisher"/>
                        </dcterms:publisher>
                    </xsl:if>
                    <!-- define all used vocabularies -->
                    <void:vocabulary rdf:resource="https://gams.uni-graz.at/o:depcha.bookkeeping#"/>
                </void:Dataset>
            </xsl:if>
            
            <!-- we want to extract all annotations of transaction. -->
            <xsl:apply-templates select="//*[tokenize(@ana, ' ') = 'bk:entry']"/>
        </rdf:RDF>
        
    </xsl:template>
    
    <xsl:template match="*[tokenize(@ana, ' ') = 'bk:entry']">
        <bk:Transaction rdf:about="{concat($BASE_URL, generate-id())}">
            <bk:entry>
                <xsl:value-of select="normalize-space(.)"/>
            </bk:entry>
        	<rdfs:label>
        		<xsl:value-of select="normalize-space(.)"/>
        	</rdfs:label>
        </bk:Transaction>
    </xsl:template>
    
</xsl:stylesheet>