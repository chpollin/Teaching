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
    <xsl:variable name="BASE_URL" select="'https://example.com/'"/>
    

    <xsl:template match="/">
        
        <rdf:RDF>
            <!-- void:Dataset -->
            <xsl:call-template name="voidDataset"/>

            <!-- bk:Transaction -->
            <xsl:apply-templates select="//*[tokenize(@ana, ' ') = 'bk:entry']"/>
        </rdf:RDF>
        
    </xsl:template>
    
    <!-- /////////////////////////// -->
    <xsl:template match="*[tokenize(@ana, ' ') = 'bk:entry']">
        <bk:Transaction rdf:about="{concat($BASE_URL, generate-id())}">
            
            <bk:entry>
                <xsl:value-of select="normalize-space(.)"/>
            </bk:entry>
            
            <!-- bk:when -->
            <xsl:if test=".//*[tokenize(@ana, ' ') = 'bk:when'][@when]">
                <bk:when>
                    <xsl:value-of select=".//*[tokenize(@ana, ' ') = 'bk:when']/@when"/>
                </bk:when>
            </xsl:if>
            
            <!-- bk:money -->
            <xsl:for-each select=".//.[tokenize(@ana, ' ') = 'bk:money']">
                <bk:consistsOf>
                    <bk:Transfer rdf:about="{concat($BASE_URL, generate-id())}">
                        <bk:transfers>
                            <bk:Money rdf:about="{concat($BASE_URL, generate-id(), position())}">
                                <xsl:call-template name="print_unit_quantity"/>
                            </bk:Money>
                        </bk:transfers>
                    </bk:Transfer>
                </bk:consistsOf>
            </xsl:for-each>
            
            <!-- bk:commodity -->
            <xsl:for-each select=".//.[tokenize(@ana, ' ') = 'bk:commodity']">
                <bk:consistsOf>
                    <bk:Transfer rdf:about="{concat($BASE_URL, generate-id())}">
                        <bk:transfers>
                            <bk:Commodity rdf:about="{concat($BASE_URL, generate-id(), position())}">
                                <xsl:call-template name="print_unit_quantity"/>
                                <xsl:if test="@commodity">
                                    <bk:quantity>
                                        <xsl:value-of select="@commodity"/>
                                    </bk:quantity>
                                </xsl:if>
                            </bk:Commodity>
                        </bk:transfers>
                    </bk:Transfer>
                </bk:consistsOf>
            </xsl:for-each>
            
        </bk:Transaction>
        
    </xsl:template>


    <!-- /////////////////////////// -->
    <!-- creates a void:Dataset to express metadate about the lod resource -->
    <xsl:template name="voidDataset">
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
                <void:vocabulary rdf:resoruce="https://gams.uni-graz.at/o:depcha.bookkeeping#"/>
            </void:Dataset>
        </xsl:if>
    </xsl:template>
    
    
    <!-- /////////////////////////// -->
    <!-- creats bk:unit and bk:quantity for bk:EconomicGood -->
    <xsl:template name="print_unit_quantity">
        <xsl:if test="@unit">
            <bk:unit>
                <xsl:value-of select="@unit"/>
            </bk:unit>
        </xsl:if>
        <xsl:if test="@quantity">
            <bk:quantity>
                <xsl:value-of select="@quantity"/>
            </bk:quantity>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>