<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/" xmlns:schema="https://schema.org/"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:bk="https://gams.uni-graz.at/o:depcha.bookkeeping#" 
    xmlns:void="http://rdfs.org/ns/void#"
    xmlns:owl ="http://www.w3.org/2002/07/owl#"
    exclude-result-prefixes="xs" version="2.0">

    <!-- GLOBAL VARIABLES -->
    <!-- we define a base url for building our uris -->
    <xsl:variable name="BASE_URL" select="'https://example.com#'"/>


    <xsl:template match="/">

        <rdf:RDF>
            <xsl:apply-templates select="//tei:listPerson/tei:person"/>
        </rdf:RDF>

    </xsl:template>

    <!-- //////////////////////////////////// -->
    <!-- templates mapping to foaf and schema -->
    <xsl:template match="tei:listPerson/tei:person">
        <xsl:variable name="Person_URI" select="concat($BASE_URL, @xml:id)"/>
        <schema:Person rdf:about="{$Person_URI}">
            <xsl:apply-templates>
                <xsl:with-param name="Between-URI" select="$Person_URI"/>
            </xsl:apply-templates>
        </schema:Person>
    </xsl:template>
    
    <!-- //////////////////////////////////// -->
    <xsl:template match="tei:persName"> 
        <xsl:apply-templates/>
        <rdfs:label>
            <xsl:value-of select="normalize-space(.)"/>
        </rdfs:label>
    </xsl:template>
    
    <!-- //////////////////////////////////// -->
    <xsl:template match="tei:forename">
        <foaf:givenName>
            <xsl:value-of select="normalize-space(.)"/>
        </foaf:givenName>
    </xsl:template>
    
    <!-- //////////////////////////////////// -->
    <xsl:template match="tei:surname">
        <foaf:familyName>
            <xsl:value-of select="normalize-space(.)"/>
        </foaf:familyName>
    </xsl:template>
    
    <!-- //////////////////////////////////// -->
    <xsl:template match="tei:genName">
        <tei:genName>
            <xsl:value-of select="normalize-space(.)"/>
        </tei:genName>
    </xsl:template>
    
    <!-- //////////////////////////////////// -->
    <xsl:template match="tei:roleName">
        <tei:roleName>
            <xsl:value-of select="normalize-space(.)"/>
        </tei:roleName>
    </xsl:template>
    
    <!-- //////////////////////////////////// -->
    <xsl:template match="tei:nameLink">
        <tei:nameLink>
            <xsl:value-of select="normalize-space(.)"/>
        </tei:nameLink>
    </xsl:template>
    
    <!-- //////////////////////////////////// -->
    <xsl:template match="tei:name">
        <rdfs:label>
            <xsl:value-of select="normalize-space(.)"/>
        </rdfs:label>
        <schema:name>
            <xsl:value-of select="normalize-space(.)"/>
        </schema:name>
    </xsl:template>
    
    <!-- //////////////////////////////////// -->
    <xsl:template match="tei:addName">
        <schema:additionalName>
            <xsl:value-of select="normalize-space(.)"/>
        </schema:additionalName>
    </xsl:template>
    
    <!-- //////////////////////////////////// -->
    <xsl:template match="tei:affiliation">
        <schema:affiliation>
            <xsl:value-of select="normalize-space(.)"/>
        </schema:affiliation>
    </xsl:template>
	
	<!-- //////////////////////////////////// -->
	<!-- skip -->
	<xsl:template match="tei:note"/>
	
	<!-- //////////////////////////////////// -->
	<!-- skip -->
	<xsl:template match="tei:idno[@type='wikidata']">
		<owl:sameAs rdf:resource="{.}"/>
	</xsl:template>
	
	
	

</xsl:stylesheet>
