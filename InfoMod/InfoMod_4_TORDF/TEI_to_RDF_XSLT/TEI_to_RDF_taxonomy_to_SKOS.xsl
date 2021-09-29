<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/" xmlns:schema="https://schema.org/"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:bk="https://gams.uni-graz.at/o:depcha.bookkeeping#" xmlns:void="http://rdfs.org/ns/void#"
    exclude-result-prefixes="xs" version="2.0">

    <!-- GLOBAL VARIABLES -->
    <!-- we define a base url for building our uris -->
    <xsl:variable name="BASE_URL" select="'https://example.com#'"/>


    <xsl:template match="/">

        <rdf:RDF>
            <xsl:apply-templates select="//tei:taxonomy"/>

        </rdf:RDF>

    </xsl:template>

    <!-- ####################################### -->
    <!-- mapping tei:taxonomy to skos  -->
    <xsl:template match="*[tokenize(@ana, ' ') = 'bk:Index']">
        <skos:ConceptScheme rdf:about="{concat($BASE_URL, 'Taxonomy')}">
            <xsl:if test="tei:gloss">
                <dc:title>
                    <xsl:value-of select="normalize-space(tei:gloss)"/>
                </dc:title>
            </xsl:if>
            <xsl:if test="tei:desc">
                <dc:description>
                    <xsl:value-of select="normalize-space(tei:desc)"/>
                </dc:description>
            </xsl:if>
            <!-- hasTopConcepts -->
            <xsl:for-each select="tei:category">
                <skos:hasTopConcept>
                    <xsl:attribute name="rdf:resource">
                        <xsl:value-of select="concat($BASE_URL, generate-id())"/>
                    </xsl:attribute>
                </skos:hasTopConcept>
            </xsl:for-each>
        </skos:ConceptScheme>
        <xsl:apply-templates select="tei:category"/>
    </xsl:template>

    <!-- ////////////////////////// -->
    <!-- mapping tei:taxonomy/tei:category to skos:Concept  -->
    <xsl:template match="tei:category">

        <skos:Concept rdf:about="{concat($BASE_URL, generate-id())}">
            <skos:inScheme rdf:resource="{concat($BASE_URL, 'Taxonomy')}"/>
            <xsl:for-each select="tei:category">
                <skos:narrower rdf:resource="{concat($BASE_URL, generate-id())}"/>
            </xsl:for-each>
            <xsl:for-each select="parent::tei:category">
                <skos:broader rdf:resource="{concat($BASE_URL, generate-id())}"/>
            </xsl:for-each>
            <xsl:if test="tei:catDesc/tei:term">
                <skos:prefLabel>
                    <xsl:if test="@xml:lang">
                        <xsl:attribute name="xml:lang" select="@xml:lang"/>
                    </xsl:if>
                    <xsl:value-of select="normalize-space(tei:catDesc/tei:term)"/>
                </skos:prefLabel>
            </xsl:if>
            <xsl:if test="tei:catDesc/tei:term/@ref">
                <!-- here you can specify how to handle skos:relatedMatch and @red
                     this could be done better by using the information in the prefixDef -->
                <xsl:choose>
                    <xsl:when test="contains(tei:catDesc/tei:term/@ref, 'wd:')">
                        <skos:relatedMatch
                            rdf:resource="{concat('https://www.wikidata.org/wiki/', substring-after(tei:catDesc/tei:term/@ref, 'wd:'))}"
                        />
                    </xsl:when>
                    <xsl:otherwise>
                        <skos:relatedMatch rdf:resource="{tei:catDesc/tei:term/@ref}"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </skos:Concept>
        <!-- /// -->
        <xsl:apply-templates select="tei:category"/>
    </xsl:template>

</xsl:stylesheet>
