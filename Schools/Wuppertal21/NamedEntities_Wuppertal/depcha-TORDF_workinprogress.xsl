<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:functx="http://www.functx.com"
    xmlns:gn="http://www.geonames.org/ontology#" 
    xmlns:gams="https://gams.uni-graz.at/o:gams-ontology#"
    xmlns:om="http://ontology.eil.utoronto.ca/icity/OM/"
    xmlns:time="http://www.w3.org/2006/time#"
    xmlns:schema="https://schema.org/"
    xmlns:bk="https://gams.uni-graz.at/o:depcha.bookkeeping#" xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:foaf="http://xmlns.com/foaf/spec/">
    <xsl:strip-space elements="*"/>
    
    
    <!-- XPath -->
    <!-- select all bk:money from a specific bk:when/year -->
    <!-- //*[@ana='bk:entry'][.//date[@ana='bk:when'][year-from-date(@when)=1934]]//*[tokenize(@ana, ' ') = 'bk:money'] -->

    <!--<xsl:include href="https://gams.uni-graz.at/gamsdev/pollin/depcha/trunk/www/depcha-templates.xsl"/>-->
    <!-- VARIABLES -->   
    <!-- //////////////////////////////// -->
    <!-- global Variables -->
    <xsl:variable name="TEIHeader" select="//t:teiHeader"/>
	<xsl:variable name="TEI" select="/"/>
    <xsl:variable name="Currrent_TEI_PID" select="//t:publicationStmt/t:idno[@type = 'PID']"/>
    <xsl:variable name="Currrent_Context">
        <xsl:choose>
            <xsl:when test="contains($TEIHeader//t:ref[@type = 'context']/@target, 'info:fedora/')">
                <xsl:value-of select="substring-after($TEIHeader//t:ref[@type = 'context']/@target, 'info:fedora/')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$TEIHeader//t:ref[@type = 'context']/@target"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <!-- BK URI -->
    <xsl:variable name="BK_URI">
        <xsl:choose>
            <xsl:when test="//t:listPrefixDef/t:prefixDef/@ident = 'bk'">
                <xsl:value-of select="substring-before(//t:listPrefixDef/t:prefixDef/@replacementPattern, '$')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>bk prefix Def missing</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="BASE-URL" select="'https://gams.uni-graz.at/'"/>

    <!-- ////////////////////////// -->
    <!-- check PID -->
    <xsl:template match="/">
        <rdf:RDF>
            <xsl:choose>
                <xsl:when test="$Currrent_TEI_PID">
                    
                    <!-- ////////////////// -->
                    <!-- Create bk:Dataset with bk:date, bk:income, bk:expens, bk:unit -->
                    <!--<xsl:call-template name="createDataSet"/>-->
                  
                    <!-- ////////////////// -->
                    <!-- create bk:Transaction -->
                    <xsl:apply-templates select="//t:text//*[tokenize(@ana, ' ') = 'bk:entry']"/>
                    
                    <!-- ////////////////// -->
                    <!-- create bk:Sum -->
                    <xsl:apply-templates select="//t:text//*[tokenize(@ana, ' ') = 'bk:sum']"/>
                    
                    <!-- ////////////////// -->
                    <!-- create bk:Total -->
                    <xsl:apply-templates select="//t:text//*[tokenize(@ana, ' ') = 'bk:total']"/>
                    
                    <!-- ////////////////// -->
                    <!-- create bk:Between, bk:Account -->
                    <xsl:choose>
                        <xsl:when test="//t:teiHeader//t:listPerson[@ana='bk:Between']/t:person">
                            <xsl:apply-templates select="//t:teiHeader//t:listPerson[@ana='bk:Between']/t:person"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:comment>Error: not listperson defined: todo: define extraction</xsl:comment>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    <!-- ////////////////// -->
                    <!-- create bk:Between, bk:Account -->
                    
                    <!-- ////////////////// -->
                    <!-- create bk:Between, bk:Account -->
                    <!--<xsl:for-each-group select="//.[tokenize(@ana, ' ') = 'bk:to'][not(local-name() ='measure')] | //.[tokenize(@ana, ' ') = 'bk:from'][not(local-name() ='measure')]" group-by=".//@ref | .//@corresp">
	            	    <xsl:variable name="Between-URI">
	            	        <xsl:choose>
	            	            <xsl:when test="contains(current-grouping-key(), '#')">
	            	                <xsl:value-of select="concat($BASE-URL, $Currrent_TEI_PID, current-grouping-key())"/>
	            	            </xsl:when>
	            	            <xsl:otherwise>
	            	                <xsl:value-of select="concat($BASE-URL, $Currrent_TEI_PID, '#', current-grouping-key())"/>
	            	            </xsl:otherwise>
	            	        </xsl:choose>
	            	    </xsl:variable>
                        <!-\- TODO -\->
                        <!-\-<xsl:choose>
                            <xsl:when test="$TEIHeader//t:listPerson[@ana='bk:Between']">
                                <xsl:for-each select="t:person">
                                    <xsl:variable name="Between-URI"/>
                                    <bk:Between rdf:about="{$Between-URI}">
                                </xsl:for-each>
                            </xsl:when>
                        </xsl:choose>-\->
                        
                      
                        
                        <!-\-<bk:Between rdf:about="{$Between-URI}">
                            <xsl:choose>
                                <xsl:when test="//t:teiHeader//t:listPerson[@ana='bk:Between']">
                                    <xsl:apply-templates select="//t:teiHeader//t:listPerson[@ana='bk:Between']/t:person[@xml:id = substring-after(current-grouping-key(), '#')]"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>Error: no persList exists - t:listPerson[@ana='bk:Between']</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>-\->
                           
                            
                            
                            <!-\-<xsl:choose>
                                <!-\\- a person list in the tei-header exists -\\->
                                <xsl:when test="$TEIHeader//t:listPerson[@ana='bk:Between']/t:person[@xml:id = substring-after(current-grouping-key(), '#')]">
                                     
                                    <xsl:apply-templates select="//t:teiHeader//t:listPerson[@ana='bk:Between']/t:person[@xml:id = substring-after(current-grouping-key(), '#')]"/>
                                    <!-\\-<xsl:call-template name="maplistPersontoFOAF">
                                            <xsl:with-param name="Person" select="//t:teiHeader//t:listPerson[@ana='bk:Between']/t:person[@xml:id = substring-after(current-grouping-key(), '#')]"/>
                                        </xsl:call-template>-\\->
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:for-each-group select="current-group()" group-by="current-grouping-key()">
                                        <bk:name>
                                            <!-\\- here is the place for further normalizing of data -\\->
                                            <xsl:choose>
                                                <xsl:when test="@corresp">
                                                    <xsl:value-of select="normalize-space($TEIHeader//t:taxonomy//*[@xml:id = substring-after(current-grouping-key(), '#')])"/>
                                                </xsl:when>
                                                <xsl:when test=".//@ref">
                                                    <xsl:choose>
                                                        <xsl:when test="$TEIHeader//t:taxonomy[@ana='bk:Between']//*[@xml:id = substring-after(current-grouping-key(), '#')]">
                                                            <xsl:value-of select="normalize-space($TEIHeader//t:taxonomy//*[@xml:id = substring-after(current-grouping-key(), '#')])"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="normalize-space(.)"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="normalize-space(.)"/>
                                                </xsl:otherwise>
                                            </xsl:choose>				    				
                                        </bk:name>
                                    </xsl:for-each-group>
                                </xsl:otherwise>
                            </xsl:choose>-\->
				    	<!-\-</bk:Between>-\->
	            	</xsl:for-each-group>-->
                    
                    <!-- ////////////////////////// -->
                    <!-- bk:Taxonomy to SKOS -->
                    <xsl:choose>
                        <xsl:when test="$TEIHeader//*[tokenize(@ana, ' ') = 'bk:Taxonomy']">
                            <xsl:apply-templates select="$TEIHeader//*[tokenize(@ana, ' ') = 'bk:Taxonomy']"/>
                        </xsl:when>
                        <xsl:when test="$TEIHeader//*[tokenize(@ana, ' ') = 'bk:Account']">
                            <xsl:apply-templates select="$TEIHeader//*[tokenize(@ana, ' ') = 'bk:Account']"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:comment>No bk:Taxonomy defined</xsl:comment>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    <!-- ////////////////////////// -->
                    <!-- mapping t:unitDef to http://www.ontology-of-units-of-measure.org/resource/om-2/Unit -->
                    <xsl:apply-templates select="//t:unitDef"/>
                  
                    
                </xsl:when>
                <xsl:otherwise>
                	<xsl:text>ERROR: No PID defined in idno/@type="PID"</xsl:text>
                </xsl:otherwise>
            </xsl:choose>   
        </rdf:RDF>
    </xsl:template>
    
    <!-- ////////////////////////// -->
    <!-- mapping t:unitDef to http://www.ontology-of-units-of-measure.org/resource/om-2/Unit -->
    <xsl:template match="t:unitDef">
        
        <xsl:variable name="Unit_Elementname">
            <xsl:choose>
                <xsl:when test="@type = 'weight'">
                    <xsl:text>om:MassUnit</xsl:text>
                </xsl:when>
                <xsl:when test="@type = 'currency'">
                    <xsl:text>om:AmountOfMoneyUnit</xsl:text>
                </xsl:when>
                <xsl:when test="@type = 'length'">
                    <xsl:text>om:LengthUnit</xsl:text>
                </xsl:when>
                <xsl:when test="@type = 'capacity'">
                    <xsl:text>om:VolumeUnit</xsl:text>
                </xsl:when>
                <xsl:when test="@type = 'surface'">
                    <xsl:text>om:AreaUnit</xsl:text>
                </xsl:when>
                <xsl:when test="@type = 'time'">
                    <xsl:text>om:TimeUnit</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>om:Unit</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <!-- om:Unit -->
        <!-- https://enterpriseintegrationlab.github.io/icity/OM/doc/index-en.html -->
        <xsl:variable name="Unit_URI" select="concat($BASE-URL, $Currrent_TEI_PID, '#', @xml:id)"/>
        <xsl:element name="{$Unit_Elementname}">
            <xsl:attribute name="rdf:about">
                <xsl:value-of select="$Unit_URI"/>
            </xsl:attribute>
            <xsl:if test="t:label">
                <rdfs:label>
                    <xsl:value-of select="t:label"/>
                </rdfs:label>
            </xsl:if>
            <!-- time -->
            <xsl:if test="@from or @to or @when">
                <!-- Supports the association of a temporal entity (instant or interval) to any thing -->
                <time:hasTime>
                    <time:TemporalEntity rdf:about="{concat($Unit_URI, 'TE')}">
                        <xsl:if test="@from">
                            <time:hasBeginning>
                                <xsl:value-of select="@from"/>
                            </time:hasBeginning>
                        </xsl:if>
                        <xsl:if test="@to">
                            <time:hasEnd>
                                <xsl:value-of select="@to"/>
                            </time:hasEnd>
                        </xsl:if>
                        <xsl:if test="@when">
                            <time:hasTime>
                                <xsl:value-of select="@when"/>
                            </time:hasTime>
                        </xsl:if>
                    </time:TemporalEntity>
                </time:hasTime>
            </xsl:if>
            <!-- coverage/space -->
            <xsl:if test="t:country or t:country">
                <dc:coverage>
                    <xsl:value-of select="t:country|t:country"/>
                </dc:coverage>
            </xsl:if>
        </xsl:element>
        <!-- if a information about conversion exists define a om:System_of_units -->
        <xsl:if test="t:conversion[@fromUnit]">
            <om:System_of_units rdf:about="{concat($Unit_URI, 'SU')}">
                <!-- hasBaseUnit is the unit you want to converto to -->
                <om:hasBaseUnit rdf:resource="{$Unit_URI}"/> 
            </om:System_of_units>
        </xsl:if>
           
        
        
    </xsl:template>
    
    
    <!-- ////////////////////////// -->
    <!--  -->
    <xsl:template match="*[tokenize(@ana, ' ') = 'bk:Taxonomy']">
        <skos:ConceptScheme rdf:about="{concat($BASE-URL, $Currrent_Context)}">
            <xsl:if test="t:gloss">
                <dc:title>
                    <xsl:value-of select="normalize-space(t:gloss)"/>
                </dc:title>
            </xsl:if>
            <xsl:if test="t:desc">
                <dc:description>
                    <xsl:value-of select="normalize-space(t:desc)"/>
                </dc:description>
            </xsl:if>
            <!-- hasTopConcepts -->
            <xsl:for-each select="t:category">
                <skos:hasTopConcept rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID, '#', @xml:id)}"/>
            </xsl:for-each>
        </skos:ConceptScheme>
        <xsl:apply-templates select="t:category"/>
    </xsl:template>
    
    <!-- ////////////////////////// -->
    <!--  -->
    <xsl:template match="t:category">
        <xsl:variable name="ConceptorBKAccount">
            <xsl:choose>
                <xsl:when test="ancestor::t:taxonomy[@ana ='bk:Account']">
                    <xsl:value-of select="'bk:Account'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'skos:Concept'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:element name="{$ConceptorBKAccount}">
            <xsl:attribute name="rdf:about" select="concat($BASE-URL, $Currrent_TEI_PID, '#', @xml:id)"/>
            <skos:inScheme rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID)}"/>
            <xsl:for-each select="t:category">
                <skos:narrower rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID, '#', @xml:id)}"/>
            </xsl:for-each>
            <xsl:for-each select="parent::t:category">
                <skos:broader rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID, '#', @xml:id)}"/>
            </xsl:for-each>
            <xsl:if test="t:catDesc/t:term">
                <skos:prefLabel>
                    <xsl:if test="@xml:lang">
                        <xsl:attribute name="xml:lang" select="@xml:lang"/>
                    </xsl:if>
                    <xsl:value-of select="normalize-space(t:catDesc/t:term)"/>                            
                </skos:prefLabel>
            </xsl:if>
            <xsl:if test="t:catDesc/t:term/@ref">
                <!-- here get the prefix for wikidata -->
                <xsl:choose>
                    <xsl:when test="contains(t:catDesc/t:term/@ref, 'wd:')">
                        <skos:relatedMatch rdf:resource="{concat('https://www.wikidata.org/wiki/', t:catDesc/t:term/@ref)}"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <skos:relatedMatch rdf:resource="{t:catDesc/t:term/@ref}"/>
                    </xsl:otherwise>
                </xsl:choose>
                
            </xsl:if> 
        </xsl:element>
        <!-- /// -->
        <xsl:apply-templates select="t:category"/>
    </xsl:template>
    
    

    

    
    <!-- ////////////////////////// -->
	<!-- bk_Entry -->
    <!-- goes through all Entries in a given TEI. Entries must be defined with @ana='bk:entry'. -->
    <xsl:template match="t:text//*[tokenize(@ana, ' ') = 'bk:entry']">
        <xsl:variable name="Position" select="count(preceding::node()[tokenize(@ana, ' ') = 'bk:entry'])"/>
        
        <!-- /////////// -->
        <!-- bk_Where -->
        <!-- todo -->
        
        <!-- /////////// -->
        <!--  BK:FROM -->
        <xsl:variable name="bk_From">
            <xsl:call-template name="getFromTO">
                <xsl:with-param name="Direction" select="'bk:from'"/>
            </xsl:call-template>
        </xsl:variable>
        <!--  BK:TO @ref -->
        <xsl:variable name="bk_From_ref">
            <xsl:call-template name="getFromTO_ref">
                <xsl:with-param name="Direction" select="'bk:from'"/>
            </xsl:call-template>
        </xsl:variable>
        
        <!-- /////////// -->
        <!-- BK:TO -->
        <xsl:variable name="bk_To">
            <xsl:call-template name="getFromTO">
                <xsl:with-param name="Direction" select="'bk:to'"/>
            </xsl:call-template>
        </xsl:variable>
        <!--  BK:TO @ref -->
        <xsl:variable name="bk_To_ref">
            <xsl:call-template name="getFromTO_ref">
                <xsl:with-param name="Direction" select="'bk:to'"/>
            </xsl:call-template>
        </xsl:variable>
        
        <!-- /////////// -->
        <!-- bk_Agent -->
        <xsl:variable name="bk_Agent">
        	<xsl:choose>
        		<xsl:when test=".//.[tokenize(@ana, ' ') = 'bk:agent']">
        			<xsl:value-of select=".//.[tokenize(@ana, ' ') = 'bk:agent']"/>
        		</xsl:when>
        		<xsl:otherwise/>
        	</xsl:choose>
        </xsl:variable>
    	<xsl:variable name="bk_Agent-ID">
    		<xsl:choose>
        		<xsl:when test=".//.[tokenize(@ana, ' ') = 'bk:agent']/@ref">
        		    <xsl:call-template name="getRefwithHash">
        		        <xsl:with-param name="Path" select=".//.[tokenize(@ana, ' ') = 'bk:agent']/@ref"/>
        		    </xsl:call-template> 
        		</xsl:when>
        		<xsl:otherwise/>
        	</xsl:choose>
        </xsl:variable>
        
        <!-- /////////// -->
        <!-- TRANSACTION -->
        <xsl:variable name="Transaction-ID" select="concat($BASE-URL, $Currrent_TEI_PID, '#T',  $Position)"/>
        <!-- | .//.[tokenize(@ana, ' ') = 'bk:price'] -->
        <xsl:variable name="bk_Measurables" select=".//.[tokenize(@ana, ' ') = 'bk:money'] | .//.[tokenize(@ana, ' ') = 'bk:service'] | .//.[tokenize(@ana, ' ') = 'bk:commodity']"/>
        <xsl:variable name="bk_Between_REF" select="$bk_To_ref | $bk_From_ref"/>
        
        <bk:Transaction rdf:about="{$Transaction-ID}">
            
            <xsl:call-template name="getBasicProperties"/>
            
            
            <!-- for each bk_measurable grouped by @commodity: there is a transfer for all bk_measurable entities. $ + sh are in the same transfer -->
            <xsl:for-each-group select="$bk_Measurables" group-by="@ana">
                <xsl:variable name="Transfer-ID" select="concat($Transaction-ID, 'T', position())"/>
                <bk:consistsOf rdf:resource="{$Transfer-ID}"/>
            </xsl:for-each-group>
              
           <!-- /////////// -->
           <!-- transactionStatus pp. ; in full -->
             <xsl:for-each select=".//.[tokenize(@ana, ' ') = 'bk:status']">
                <bk:status>
                  <xsl:value-of select="."/>
                </bk:status>
            </xsl:for-each>
            
         <!-- ////////////////////////// -->
         <!-- FULLTEXT for fulltextsearch with whitespace cleaning and normalization -->
    	<!--<gams:textualContent>
        	<xsl:for-each select=".//text()">
				<xsl:value-of select="normalize-space(.)"/>
				<xsl:text> </xsl:text>
			</xsl:for-each>
    		<!-\- add FROM, TO -\->
    		<!-\- TODO -\->
    		<!-\-<xsl:for-each-group select="$bk_Between_REF" group-by=".">
	    		<xsl:for-each select="distinct-values($TEI//.[@ref = current-grouping-key()])">
	    				<xsl:value-of select="."/><xsl:text> </xsl:text>
	    		</xsl:for-each>	    	
    		</xsl:for-each-group>-\->
    		<xsl:for-each-group select="$bk_Measurables" group-by="@ana">
    			 <xsl:value-of select="@quantity"/>
    			 <xsl:text> </xsl:text>
    			 <xsl:value-of select="@unit"/>
    			 <xsl:text> </xsl:text>
    			 <xsl:if test="not(@commodity ='currency')">
    			 	<xsl:value-of select="@commodity"/>
    			 	<xsl:text> </xsl:text>
    			 </xsl:if>
    		</xsl:for-each-group>
    		<xsl:if test="$bk_From">
	    		<xsl:value-of select="$bk_From"/>
    		</xsl:if>
    		<xsl:if test="$bk_To">
	    		<xsl:value-of select="$bk_To"/>
    		</xsl:if>
    		<xsl:if test="not($bk_Agent = '')">
    			<xsl:value-of select="$bk_Agent"/>
    		</xsl:if>
    	</gams:textualContent>-->
    </bk:Transaction>
    <!-- END TRANSACTON -->
        
        <!-- /////////// -->
        <!-- TRANSFERS -->
        <xsl:for-each-group select="$bk_Measurables" group-by="@ana">
            <xsl:variable name="Transfer-ID" select="concat($Transaction-ID, 'T', position())"/>
            <xsl:variable name="Measurable-ID" select="concat($BASE-URL, $Currrent_TEI_PID,  '#E',  $Position, 'M', position())"/>
            <bk:Transfer rdf:about="{$Transfer-ID}">  
                <!-- ////////////////////////////////////// -->
                <xsl:choose>
                    <xsl:when test="count(current-group()) > 1">
                        <xsl:for-each select="current-group()">
                            <bk:transfers rdf:resource="{concat($Measurable-ID, position())}"/>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <bk:transfers rdf:resource="{$Measurable-ID}"/>
                    </xsl:otherwise>
                </xsl:choose>
                
                <!-- bk_to; bk_from -->
                <!-- additional bk_to  ana="bk:money bk:to" defines to whom the measurable belongs   -->
                <xsl:choose>
                    <!-- CASE, this is turned arround  -->
                    <xsl:when test="contains(@ana,  'bk:to')">
                        <bk:from rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID,  $bk_To_ref)}"/>
                        <bk:to rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID,  $bk_From_ref)}"/>
                    </xsl:when>
                    <!-- CASE -->
                    <xsl:when test="contains(@ana, 'bk:from')">
                        <bk:from rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID,  $bk_From_ref)}"/>
                        <bk:to rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID,  $bk_To_ref)}"/>
                    </xsl:when>
                    <!-- there is no annotation like ana="bk:money bk:to" so its the default way to define the transfer from to  -->
                    <xsl:when test="$bk_From_ref or $bk_To_ref">
                        <bk:from rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID,  $bk_From_ref)}"/>
                        <bk:to rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID,  $bk_To_ref)}"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:comment>Error: problem identifying bk:to; bk:from; bk:Agent. The @ana need further bk:to bk:from like measure ana="bk:money bk:to"</xsl:comment>
                        <xsl:value-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
                
                <!-- /////////// -->
                <!-- bk:by bk:Agent, if the <masure @ana> conains a  bk:agent the connection to the bk_Agent is build-->
                <xsl:if test="contains(current-grouping-key(), 'bk:agent')">
                    <bk:by rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID, 'A',  $Position, $bk_Agent-ID)}"/>
                </xsl:if>
                
            </bk:Transfer>
        </xsl:for-each-group>
    	<!-- END TRANSFER -->
        
        <!-- /////////// -->
        <!-- MEASURABLES -->
        <xsl:for-each-group select="$bk_Measurables" group-by="@ana">
            <xsl:variable name="Measurable-ID" select="concat($BASE-URL, $Currrent_TEI_PID,  '#E',  $Position, 'M', position())"/>
            <xsl:choose>
                <xsl:when test="contains(@ana, 'bk:money') or contains(@ana, 'bk:service') or contains(@ana, 'bk:commodity')">
                    <xsl:variable name="firstChar" select="upper-case(substring(substring-after(@ana, ':'),1,1))"/>
                    <xsl:variable name="SubClassofMeasurables">
                        <xsl:choose>
                            <!-- if @ana="bk:money bk:to" -->
                            <xsl:when test="contains(@ana, ' ')">
                                <xsl:value-of select="substring-before(concat($firstChar, substring(substring-after(@ana, ':'), 2),' '[not(last())]), ' ')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat($firstChar, substring(substring-after(@ana, ':'), 2),' '[not(last())])"/> 
                            </xsl:otherwise>
                        </xsl:choose> 
                    </xsl:variable>
                    <!-- create bk:Money, bk:Commodity, bk_Service -->
                    <xsl:choose>
                        <!-- more than 1 measure, like 1 dollar 50 cents -->
                        <xsl:when test="count(current-group()) > 1">
                            <xsl:for-each select="current-group()">
                                <xsl:element name="{concat('bk:', $SubClassofMeasurables)}">
                                    <xsl:attribute name="rdf:about" select="concat($Measurable-ID, position())"/>
                                    <xsl:if test="@unit"> 
                                        <xsl:call-template name="getUnit"/>
                                    </xsl:if>
                                    <xsl:if test="@quantity">
                                        <xsl:call-template name="getQuantity"/>
                                    </xsl:if>
                                    <xsl:if test="@commodity and not(@commodity = 'currency')">
                                        <xsl:call-template name="getCommodity"/>
                                    </xsl:if>
                                    <!--<bk:text>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </bk:text>-->
                                    <xsl:for-each-group select=".//.[tokenize(@ana, ' ') = 'bk:price']" group-by=".">
                                    <xsl:variable name="Price-ID" select="concat($BASE-URL, $Currrent_TEI_PID,  '#E', $Position, 'P', position())"/>
                                    <bk:price rdf:resource="{$Price-ID}"/>
                                    </xsl:for-each-group>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:when>
                        <!-- 1 measure -->
                        <xsl:otherwise>
                            <xsl:element name="{concat('bk:', $SubClassofMeasurables)}">
                                <xsl:attribute name="rdf:about" select="$Measurable-ID"/>
                                <xsl:if test="@unit">
                                    <bk:unit>
                                        <xsl:value-of select="@unit"/>
                                    </bk:unit>
                                </xsl:if>
                                <!-- /// -->
                                <xsl:call-template name="getQuantity"/>
                                <xsl:if test="@commodity and not(@commodity = 'currency')">
                                    <!-- /// -->
                                    <xsl:call-template name="create_bk_commodity">
                                        <xsl:with-param name="commodity" select="@commodity"/>
                                    </xsl:call-template>
                                	<xsl:variable name="DBpediaTerm">
                                		<xsl:choose>
                                			<xsl:when test="contains(@commodity, ' ')">
                                				<!-- Potatoe, pine wood = Pine -->
                                				<xsl:value-of select="concat(upper-case(substring(substring-before(@commodity, ' '),1,1)), substring(substring-before(@commodity, ' '),2))"/>
                                			</xsl:when>
                                			<xsl:otherwise>
                                				<xsl:value-of select="concat(upper-case(substring(@commodity,1,1)), substring(@commodity,2))"/>
                                			</xsl:otherwise>
                                		</xsl:choose>
                                	</xsl:variable>
                                	<rdfs:seeAlso rdf:resource="{concat('https://dbpedia.org/resource/', $DBpediaTerm)}"/>
                                </xsl:if>
                            	<!-- wikidata reference in TEI -->
                            	<xsl:for-each select="tokenize(@ana, ' ')">
                            		<xsl:if test="contains(., '#wiki_')">
                            			<!-- rdfs:seeAlso !!! todo rdfs:namepsace -->
                            			<rdfs:seeAlso rdf:resource="{concat('https://www.wikidata.org/wiki/', substring-after(., '#wiki_'))}"/>
                            		</xsl:if>
                            	</xsl:for-each>                            	
                            	<!--<bk:text>
                                    <xsl:value-of select="normalize-space(.)"/>
                                </bk:text>-->
                            </xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:comment>ERROR: Failed to create bk:Measurable: missing @ana;</xsl:comment>
                </xsl:otherwise>
            </xsl:choose> 
        </xsl:for-each-group>
        
        <!-- PRICE -->
       <!-- <xsl:for-each-group select=".//.[tokenize(@ana, ' ') = 'bk:price']" group-by=".">
            <xsl:variable name="Price-ID" select="concat($BASE-URL, $Currrent_TEI_PID,  '#E', $Position, 'P', position())"/>
            <bk:Price rdf:about="{$Price-ID}">
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
                <xsl:if test="@commodity and not(@commodity = 'currency')">
                    <bk:commodity>
                        <xsl:value-of select="@commodity"/>
                    </bk:commodity>
                </xsl:if>
                <bk:text>
                    <xsl:value-of select="normalize-space(.)"/>
                </bk:text>
            </bk:Price>
            
            
        </xsl:for-each-group>-->
        
    	<!-- END MEASURABLE-->
    	
    	<!-- /////////// -->
        <!-- BETWEEN -->
    	<!--<xsl:for-each-group select="$bk_Between_REF" group-by=".">
	    	<bk:Between rdf:about="{concat($BASE-URL, $Currrent_TEI_PID, '#E', $Position, current-grouping-key())}">
	    		<xsl:for-each select="distinct-values($TEI//.[@ref = current-grouping-key()])">
	    			<bk:name>
	    				<xsl:value-of select="."/>
	    		     </bk:name>
	    		</xsl:for-each>
	    	</bk:Between>
    	</xsl:for-each-group>-->
        
        <!-- /////////// -->
        <!-- Agent -->
        <xsl:if test="not($bk_Agent = '')">
         <xsl:for-each-group select="$bk_Agent" group-by=".">
             <bk:Agent rdf:about="{concat($BASE-URL, $Currrent_TEI_PID, 'A',  $Position, $bk_Agent-ID)}">
                     <bk:name>
                         <xsl:if test="./@ref = $bk_Agent-ID">
                             <xsl:value-of select="normalize-space(.)"/>
                         </xsl:if>
                     </bk:name>
             </bk:Agent>
         </xsl:for-each-group>
        </xsl:if>
    </xsl:template>

    <!-- ////////////////////////////////////////////////////////////////////// -->
    <!-- MAP listPerson to FOAF and SCHEMA  -->
    <!-- https://schema.org/Person -->
    <xsl:template name="maplistPersontoFOAF">
        <xsl:param name="Person"/>

        <!--<bk:name>
            <xsl:choose>
                <xsl:when test="$Person/t:persName">
                    <xsl:choose>
                        <xsl:when test="$Person/t:persName/t:name">
                            <xsl:apply-templates select="$Person/t:persName/t:name"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="$Person/t:persName/t:surname">
                                <xsl:apply-templates select="$Person/t:persName/t:surname"/><xsl:text>, </xsl:text>
                            </xsl:if>
                            <xsl:for-each select="$Person/t:persName/t:forename">
                                <xsl:value-of select="normalize-space(.)"/>
                                <xsl:if test="not(position()=last())">
                                    <xsl:text> </xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="$Person/t:name">
                    <xsl:apply-templates select="$Person/t:name"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:comment>Error in called Template 'maplistPersontoFOAF' not t:persName or t:name</xsl:comment>
                </xsl:otherwise>
            </xsl:choose>
        </bk:name>-->
        <!--  -->
        <xsl:if test="$Person/t:persName/t:forename">
            <foaf:firstName>
                <xsl:for-each select="$Person/t:persName/t:forename">
                    <xsl:value-of select="."/>
                    <xsl:if test="not(position()=last())">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </foaf:firstName>
        </xsl:if>
        <xsl:if test="$Person/t:persName/t:surname">
            <foaf:familyName>
                <xsl:for-each select="$Person/t:persName/t:surname">
                    <xsl:value-of select="."/>
                    <xsl:if test="not(position()=last())">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </foaf:familyName>
        </xsl:if>
        <!--  -->
        <xsl:if test="$Person/t:persName/t:addName">
            <!-- todo -->
        </xsl:if>
        <!-- ToDO -->
        <xsl:if test="$Person/t:persName/t:nameLink">
            <t:nameLink><xsl:apply-templates select="$Person/t:persName/t:nameLink"/></t:nameLink>
        </xsl:if>
        
    </xsl:template>
    
    <!-- //////////////////////////////////// -->
    <!-- templates mapping to foaf and schema -->
    
    <xsl:template match="t:listPerson[@ana='bk:Between']/t:person">
        <xsl:variable name="Between-URI" select="concat($BASE-URL, $Currrent_TEI_PID, '#', @xml:id)"/>
        <bk:Between rdf:about="{$Between-URI}">
             <xsl:apply-templates>
                 <xsl:with-param name="Between-URI" select="$Between-URI"/>
             </xsl:apply-templates>
        </bk:Between>

    </xsl:template>
    
    <xsl:template match="t:persName">
        <!--<bk:name>-->
            <xsl:apply-templates/>
        <!--</bk:name>-->
    </xsl:template>
    
    <xsl:template match="t:forename">
        <foaf:givenName>
            <xsl:apply-templates/>
        </foaf:givenName>
    </xsl:template>
    
    <xsl:template match="t:surname">
        <foaf:familyName>
            <xsl:apply-templates/>
        </foaf:familyName>
    </xsl:template>
    
    <xsl:template match="t:genName">
         <t:genName>
             <xsl:apply-templates/>
         </t:genName>
    </xsl:template>
    
    <!-- todo -->
    <!--<xsl:template match="t:roleName">
        <t:roleName>
            <xsl:apply-templates/>
        </t:roleName>
    </xsl:template>-->
    
    <xsl:template match="t:addName">
        <schema:additionalName>
            <xsl:apply-templates/>
        </schema:additionalName>
    </xsl:template>
    
    <!-- affiliation -->
    <xsl:template match="t:affiliation">
        <schema:affiliation>
            <xsl:apply-templates/>
        </schema:affiliation>
    </xsl:template>
    
    <!-- state -->
    <xsl:template match="t:state">
        <xsl:param name="Between-URI"/>
        <xsl:choose>
            <xsl:when test="@type = 'married'">
                <schema:MarryAction rdf:about="{concat($Between-URI, 'PMA')}">
                    <xsl:if test="@notBefore">
                        <schema:startTime>
                            <xsl:value-of select="@notBefore"/>
                        </schema:startTime>
                    </xsl:if>
                    <xsl:if test="@notAfter">
                        <schema:endTime>
                            <xsl:value-of select="@notAfter"/>
                        </schema:endTime>
                    </xsl:if>
                </schema:MarryAction>
            </xsl:when>
            <xsl:otherwise>
                <!-- todo -->
                <t:state>
                   <xsl:value-of select="@*"/>
                </t:state>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>
    
    <!-- faith -->
    <xsl:template match="t:faith">
        <t:faith>
            <xsl:apply-templates/>
        </t:faith>
    </xsl:template>
    
    <!-- residence -->
    <xsl:template match="t:residence">
        <schema:homeLocation>
            <xsl:apply-templates/>
        </schema:homeLocation>
    </xsl:template>
    
    <!-- residence -->
    <xsl:template match="t:education">
        <schema:knowsAbout>
            <xsl:apply-templates/>
        </schema:knowsAbout>
    </xsl:template>
    
    <!-- occupation -->
    <xsl:template match="t:occupation">
        <schema:hasOccupation>
            <xsl:apply-templates/>
        </schema:hasOccupation>
    </xsl:template>
    
    <!-- sex -->
    <xsl:template match="t:sex">
       <xsl:choose>
           <xsl:when test="@value">
               <foaf:gender><xsl:value-of select="@value"/></foaf:gender>
           </xsl:when>
           <xsl:otherwise>
               <foaf:gender><xsl:apply-templates/></foaf:gender>
           </xsl:otherwise>
       </xsl:choose>
    </xsl:template>
    
    <!-- birth -->
    <xsl:template match="t:birth">
        <schema:birthDate>
            <xsl:choose>
                <xsl:when test="@when">
                    <xsl:value-of select="@when"/>
                </xsl:when>
                <!-- todo -->
                <xsl:when test="@notBefore">
                    <xsl:value-of select="@notBefore"/>
                </xsl:when>
                <!-- todo -->
                <xsl:when test="@notAfter">
                    <xsl:value-of select="@notAfter"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </schema:birthDate>
    </xsl:template>
    <xsl:template match="t:birth/t:placeName">
        <schema:birthPlace>
            <xsl:if test="t:settlement">
                <xsl:value-of select="t:settlement"/>
            </xsl:if>
            <xsl:text> </xsl:text>
            <xsl:if test="t:settlement">
                <xsl:value-of select="t:region"/>
            </xsl:if>
        </schema:birthPlace>
    </xsl:template>
    <!-- death -->
    <xsl:template match="t:death">
        <schema:deathDate>
            <xsl:choose>
                <xsl:when test="@when">
                    <xsl:value-of select="@when"/>
                </xsl:when>
                <!-- todo -->
                <xsl:when test="@notBefore">
                    <xsl:value-of select="@notBefore"/>
                </xsl:when>
                <!-- todo -->
                <xsl:when test="@notAfter">
                    <xsl:value-of select="@notAfter"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </schema:deathDate>
    </xsl:template>
    
    <xsl:template match="t:deat/placeName">
        <schema:deathPlace>
            <xsl:if test="t:settlement">
                <xsl:value-of select="t:settlement"/>
            </xsl:if>
            <xsl:text> </xsl:text>
            <xsl:if test="t:settlement">
                <xsl:value-of select="t:region"/>
            </xsl:if>
        </schema:deathPlace>
    </xsl:template>
   
    

    <!-- ////////////////////////////////////////////////////////////////////// -->
    <!-- ////////////////////////////////////////////////////////////////////// -->
    <!-- CALLED TEMPLATES -->

   <!-- ////////////////////////// -->
   <!-- bk:Between -->
   <!-- <xsl:template name="Between">
        <xsl:param name="Between-ID"/>
        <xsl:param name="bk_to"/>
        <xsl:param name="bk_from"/>
        <xsl:for-each select="$bk_to">
            <bk:Between>
                <xsl:attribute name="rdf:about">
                    <xsl:value-of select="concat($Between-ID, $bk_from)"/>
                </xsl:attribute>
            </bk:Between>
            <bk:Between>
                <xsl:attribute name="rdf:about">
                    <xsl:value-of select="concat($Between-ID, $bk_to)"/>
                </xsl:attribute> 
            </bk:Between>
        </xsl:for-each>
    </xsl:template>
    -->
    <!-- this template gets "bk_from" or bk_to as parameter an gets through some cases in TEI files where this @ana from or to can exist  -->
    <xsl:template name="getFromTO">
        <xsl:param name="Direction"/>
        <xsl:choose>
            <!-- inside the current entry -->
            <xsl:when test=".//.[tokenize(@ana, ' ') = $Direction][not(local-name() ='measure')]">
                <xsl:value-of select=".//.[tokenize(@ana, ' ') = $Direction][not(local-name() ='measure')]"/>
            </xsl:when>
            <!-- if there is no bk_from in the current entry and in the header go to the first preceding-sibling and look for a bk_to -->
            <xsl:when test="preceding-sibling::*[not(tokenize(@ana, ' ') = 'bk:entry')][1]//*[@ana=$Direction]">
                <xsl:value-of select="preceding-sibling::*[not(tokenize(@ana, ' ') = 'bk:entry')][1]//*[@ana=$Direction]"/>
            </xsl:when>
            <xsl:when test="preceding::*[tokenize(@ana, ' ') = $Direction][1]">
                <xsl:call-template name="getRefwithHash">
                    <xsl:with-param name="Path" select="preceding::*[tokenize(@ana, ' ') = $Direction][1]"/>
                </xsl:call-template>
            </xsl:when>
            <!-- in the TEI header -->
            <xsl:when test="$TEIHeader//.[tokenize(@ana, ' ') = $Direction]">
                <xsl:value-of select="$TEIHeader//.[tokenize(@ana, ' ') = $Direction]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>Anonymous</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- same as above, just for @ref  -->
    <xsl:template name="getFromTO_ref">
        <xsl:param name="Direction"/>
        <xsl:choose>
            <!-- not t:measure elements -->
            <xsl:when test=".//.[tokenize(@ana, ' ') = $Direction][not(local-name() ='measure')]/@ref">
                <xsl:call-template name="getRefwithHash">
                    <xsl:with-param name="Path" select=".//.[tokenize(@ana, ' ') = $Direction][not(local-name() ='measure')]/@ref"/>
                </xsl:call-template>  
            </xsl:when>
            <xsl:when test="preceding-sibling::*[not(tokenize(@ana, ' ') = 'bk:entry')][1]//*[@ana=$Direction]/@ref">
                <xsl:call-template name="getRefwithHash">
                    <xsl:with-param name="Path" select="preceding-sibling::*[not(tokenize(@ana, ' ') = 'bk:entry')][1]//*[@ana=$Direction]/@ref"/>
                </xsl:call-template> 
            </xsl:when>
            <!-- a preceding b:to or bk:from exists; multiple entries belong to this -->
            <!-- this leads to errors if data is not filled out correctly -->
            <xsl:when test="preceding::*[tokenize(@ana, ' ') = $Direction][1]//@ref">
                <xsl:call-template name="getRefwithHash">
                    <xsl:with-param name="Path" select="preceding::*[tokenize(@ana, ' ') = $Direction][1]//@ref"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$TEIHeader//.[tokenize(@ana, ' ') = $Direction]/@ref">
                <xsl:call-template name="getRefwithHash">
                    <xsl:with-param name="Path" select="$TEIHeader//.[tokenize(@ana, ' ') = $Direction]/@ref"/>
                </xsl:call-template>
            </xsl:when>
        	<!-- @corresp in ancestor-div -->
        	<xsl:when test="ancestor::*[@ana = $Direction]/@corresp">
                <xsl:call-template name="getRefwithHash">
                    <xsl:with-param name="Path" select="ancestor::*[@ana = $Direction]/@corresp"/>
                </xsl:call-template> 
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>#anonymous</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- ////////////////////////// -->
    <!-- This template returns the value of a @ref and checks if its starts with a '#', and adds it if it does not exist.  -->
    <xsl:template name="get_XML_ID_after_Hash">
        <xsl:param name="Path"/>
        <xsl:choose>
            <xsl:when test="contains(current-grouping-key(), '#')">
                <xsl:value-of select="substring-after(current-grouping-key(), '#')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="current-grouping-key()"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- ////////////////////////// -->
    <!-- This template returns the value of a @ref and checks if its starts with a '#', and adds it if it does not exist.  -->
    <xsl:template name="getRefwithHash">
        <xsl:param name="Path"/>
        <xsl:choose>
            <xsl:when test="contains($Path[1], '#')">
                <xsl:value-of select="normalize-space($Path[1])"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="normalize-space(concat('#', $Path[1]))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- ////////////////////////// -->
    <!-- get @unit -->
    <xsl:template name="getUnit">
        <xsl:choose>
            <!-- if in @unit is a # its a reference -->
            <xsl:when test="substring(@unit,1,1) = '#'">
                <bk:unit rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID, @unit)}"/>
            </xsl:when>
            <!-- otherwise its a literal -->
            <xsl:when test="@unit">
                <bk:unit>
                    <xsl:value-of select="@unit"/>
                </bk:unit>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>no @unit</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- ////////////////////////// -->
    <!-- get @quantity -->
    <xsl:template name="getQuantity">
        <xsl:choose>
            <xsl:when test="@quantity">
                <bk:quantity>
                    <xsl:value-of select="@quantity"/>
                </bk:quantity>
            </xsl:when>
            <xsl:otherwise>
                <bk:quantity><xsl:value-of select="1"/></bk:quantity>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- ////////////////////////// -->
    <!-- get @quantity -->
    <xsl:template name="getCommodity">
        <xsl:choose>
            <xsl:when test="substring(@unit,1,1) = '#'">
                <bk:commodity rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID, @commodity)}"/>
            </xsl:when>
            <xsl:when test="@commodity">
                <bk:commodity>
                    <xsl:value-of select="@commodity"/>
                </bk:commodity>
            </xsl:when>
            <xsl:otherwise>
                <bk:quantity><xsl:value-of select="1"/></bk:quantity>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- this template ist just to try out something -->
    <xsl:template name="fakeCategory">
        <xsl:param name="Type"/>
        <xsl:choose>
            <xsl:when test="contains($Type, 'potatoes') or contains($Type, 'meat') or contains($Type, 'Meat') or $Type = 'corn' or $Type = 'milk' or $Type = 'rye' or
                $Type = 'flour' or $Type = 'apples' or $Type = 'pork' or contains($Type, 'meat') or contains($Type, 'butter')
                or $Type = 'cheese'  or $Type = 'grain' 
                or $Type = 'beans' or $Type = 'fish' or $Type = 'ham' or $Type = 'beef'  or $Type = 'bacon'  or $Type = 'grain'">
                <bk:category>food</bk:category>
            </xsl:when>
            <xsl:when test="$Type = 'glass' or $Type = 'iron' or $Type = 'wood' or $Type = 'lumber' or $Type = 'Plank'">
                <bk:category>resource</bk:category>
            </xsl:when>
            <xsl:when test="$Type = 'cow' or $Type = 'Alpaca' or $Type = 'turkey' or $Type = 'Horse'">
                <bk:category>animal</bk:category>
            </xsl:when>
            <xsl:when test="$Type = 'shoes' or $Type = 'Alpaca' or $Type = 'turkey'">
                <bk:category>clothing</bk:category>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
    
    <!-- ///////////////// -->
    <!-- get bk:when -->
    <xsl:template name="getWhen">
        <xsl:choose>
            <!-- bk:when in entry -->
            <xsl:when test=".//.[@ana = 'bk:when'][1]/@when">
                <bk:when>
                    <xsl:value-of select=".//.[@ana = 'bk:when'][1]/@when"/>
                </bk:when>
            </xsl:when>
            <!-- if a preceding element contains a bk:when as descendant -->
            <xsl:when test="preceding::t:*[1]//.[tokenize(@ana, ' ') = 'bk:when']/@when">
                <bk:when>
                    <xsl:value-of select="preceding::t:*[1]//.[tokenize(@ana, ' ') = 'bk:when']/@when"/>
                </bk:when>
            </xsl:when>
            <!-- a preceding t:date -->
            <xsl:when test="preceding::t:date[@ana='bk:when'][1]/@when">
                <bk:when>
                    <xsl:value-of select="preceding::t:date[@ana='bk:when'][1]/@when"/>
                </bk:when>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>Error in called tempalte getWhen</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- ///////////////// -->
    <!-- bk:Sum -->
    <xsl:template match="//t:text//*[tokenize(@ana, ' ') = 'bk:sum']">
        
        <!-- /////////// -->
        <!--  BK:FROM -->
        <xsl:variable name="bk_From">
            <xsl:call-template name="getFromTO">
                <xsl:with-param name="Direction" select="'bk:from'"/>
            </xsl:call-template>
        </xsl:variable>
        <!--  BK:TO @ref -->
        <xsl:variable name="bk_From_ref">
            <xsl:call-template name="getFromTO_ref">
                <xsl:with-param name="Direction" select="'bk:from'"/>
            </xsl:call-template>
        </xsl:variable>
        
        <!-- /////////// -->
        <!-- BK:TO -->
        <xsl:variable name="bk_To">
            <xsl:call-template name="getFromTO">
                <xsl:with-param name="Direction" select="'bk:to'"/>
            </xsl:call-template>
        </xsl:variable>
        <!--  BK:TO @ref -->
        <xsl:variable name="bk_To_ref">
            <xsl:call-template name="getFromTO_ref">
                <xsl:with-param name="Direction" select="'bk:to'"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="Position" select="count(preceding::node()[tokenize(@ana, ' ') = 'bk:sum'])"/>
        <xsl:variable name="Sum-ID" select="concat($BASE-URL, $Currrent_TEI_PID, '#S',  $Position)"/>
        
        <bk:Sum rdf:about="{$Sum-ID}">
            
            <xsl:variable name="Transfer-ID" select="concat($Sum-ID, 'S', position())"/>
             
            <xsl:for-each select=".//.[tokenize(@ana, ' ') = 'bk:money']">
                <bk:consistsOf>
                    <bk:Transfer rdf:about="{$Transfer-ID}">
                        <bk:from rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID, $bk_From_ref)}"/>
                        <bk:to rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID, $bk_To_ref)}"/>
                        <bk:transfers>
                            <bk:Money rdf:about="{concat($Sum-ID, 'M', position())}">
                                <xsl:call-template name="getQuantity"/>
                                <xsl:call-template name="getUnit"/>
                            </bk:Money>
                        </bk:transfers>
                    </bk:Transfer>
                </bk:consistsOf>
            </xsl:for-each>
            
            <xsl:call-template name="getBasicProperties"/>
        </bk:Sum>
    </xsl:template>
    
    <!-- ///////////////// -->
    <!-- bk:Total -->
    <xsl:template match="//t:text//*[tokenize(@ana, ' ') = 'bk:total']">
        
        
        <!-- /////////// -->
        <!--  BK:FROM -->
        <xsl:variable name="bk_From">
            <xsl:call-template name="getFromTO">
                <xsl:with-param name="Direction" select="'bk:from'"/>
            </xsl:call-template>
        </xsl:variable>
        <!--  BK:TO @ref -->
        <xsl:variable name="bk_From_ref">
            <xsl:call-template name="getFromTO_ref">
                <xsl:with-param name="Direction" select="'bk:from'"/>
            </xsl:call-template>
        </xsl:variable>
        
        <!-- /////////// -->
        <!-- BK:TO -->
        <xsl:variable name="bk_To">
            <xsl:call-template name="getFromTO">
                <xsl:with-param name="Direction" select="'bk:to'"/>
            </xsl:call-template>
        </xsl:variable>
        <!--  BK:TO @ref -->
        <xsl:variable name="bk_To_ref">
            <xsl:call-template name="getFromTO_ref">
                <xsl:with-param name="Direction" select="'bk:to'"/>
            </xsl:call-template>
        </xsl:variable>
        
        
        
        <xsl:variable name="Position" select="count(preceding::node()[tokenize(@ana, ' ') = 'bk:sum'])"/>
        <xsl:variable name="Sum-ID" select="concat($BASE-URL, $Currrent_TEI_PID, '#S',  $Position)"/>
        <bk:Total rdf:about="{$Sum-ID}">
            <xsl:call-template name="getWhen"/>
            <!--  <bk:from rdf:resource="{concat($Sum-ID, $Currrent_TEI_PID, .//*[@ana='bk:from']/@ref)}"/>
            <bk:to rdf:resource="{concat($Sum-ID, $Currrent_TEI_PID, .//*[@ana='bk:zo']/@ref)}"/>-->
            <bk:from rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID, substring-after($bk_From_ref, '#'))}"/>
            <bk:to rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID, substring-after($bk_To_ref, '#'))}"/>
            
            <xsl:for-each select=".//.[tokenize(@ana, ' ') = 'bk:money']">
                <bk:consistsOf>
                    <bk:Money rdf:about="{concat($Sum-ID, 'M', position())}">
                        <xsl:call-template name="getQuantity"/>
                        <xsl:call-template name="getUnit"/>
                    </bk:Money>
                </bk:consistsOf>
            </xsl:for-each>
            
            <xsl:call-template name="getBasicProperties"/>
        </bk:Total>
    </xsl:template>
    
    <xsl:template name="prepareMoney_Currency_Conversion">
        <xsl:param name="mainCurrency"/>
        <xsl:param name="bk_when"/>
        <xsl:param name="bk_Entry"/>
        <xsl:param name="currentYear"/>
            <xsl:if test="year-from-date($bk_when/bk:when) = $currentYear">
                <xsl:if test=".//*[tokenize(@ana, ' ') = 'bk:money'][@unit][1]/@quantity">
                    <!-- main currency; bk:Money 1 -->
                    <money>
                        <xsl:value-of select="sum(.//*[tokenize(@ana, ' ') = 'bk:money'][@unit = $mainCurrency/t:label][1]/@quantity)"/>
                    </money>
                    <xsl:if test="$mainCurrency/t:conversion[1]">
                        <!-- bk:Money 2 -->
                        <money>
                            <xsl:value-of select="sum(.//*[tokenize(@ana, ' ') = 'bk:money'][@unit = substring-after($mainCurrency/t:conversion[1]/@fromUnit, '#')][1]/@quantity) 
                                div number(substring-after($mainCurrency/t:conversion[1]/@formula, '$fromUnit div '))"/>
                        </money>
                    </xsl:if>
                    <xsl:if test="$mainCurrency/t:conversion[2]">
                        <!-- bk:Money 3 -->
                        <money>
                            <xsl:value-of select="sum(.//*[tokenize(@ana, ' ') = 'bk:money'][@unit = substring-after($mainCurrency/t:conversion[1]/@fromUnit, '#')][1]/@quantity) 
                                div number(substring-after($mainCurrency/t:conversion[2]/@formula, '$fromUnit div '))"/>
                        </money>
                    </xsl:if>
                </xsl:if>
                <!-- bk:to of bk:entry of a specific bk:when-->
                <xsl:if test=".//*[tokenize(@ana, ' ') = 'bk:to'][1]/@ref">
                    <to>
                        <!-- todo [1] ? -->
                        <xsl:value-of select=".//*[tokenize(@ana, ' ') = 'bk:to'][1]/@ref"/>
                    </to>
                </xsl:if>
                <!-- bk:from of bk:entry of a specific bk:when-->
                <xsl:if test=".//*[tokenize(@ana, ' ') = 'bk:from'][1]/@ref">
                    <from>
                        <!-- todo [1] ? -->
                        <xsl:value-of select=".//*[tokenize(@ana, ' ') = 'bk:from'][1]/@ref"/>
                    </from>
                </xsl:if>
            </xsl:if>
        
    </xsl:template>
    
    
    <!-- /////////////////// -->
    <xsl:template name="aggregatesBetween">
        <xsl:param name="DataSetURI"/>
        <xsl:param name="Between_Id"/>
        <xsl:param name="currentYear"/>
        <xsl:param name="mainCurrency"/>
        <xsl:param name="bk:Entry"/>

            <!-- /// -->
            <!-- help variable storing data of current year and current bk:Between -->
            <xsl:variable name="allMoneyofEntriesofCurrentYear_bkBetween">
                <!-- select all bk:Entry where current $Between_Id is the bk:to -->
                <xsl:for-each select="$bk:Entry">
                    <xsl:call-template name="prepareMoney_Currency_Conversion">
                        <xsl:with-param name="bk_when">
                            <xsl:call-template name="getWhen"/>
                        </xsl:with-param>
                        <xsl:with-param name="currentYear" select="$currentYear"/>
                        <xsl:with-param name="mainCurrency" select="$mainCurrency"/>
                    </xsl:call-template>
                </xsl:for-each>
            </xsl:variable>
            
            <!-- aggregation level 1 -->
            <bk:aggregates>
                <bk:Dataset rdf:about="{concat($DataSetURI, $Between_Id)}">
                    <bk:between rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID,'#', $Between_Id)}"/>
                    <bk:sum>
                        <xsl:value-of select="if ($allMoneyofEntriesofCurrentYear_bkBetween/money) then (round(sum($allMoneyofEntriesofCurrentYear_bkBetween/money))) else 0"/>
                    </bk:sum>
                    <bk:expense>0</bk:expense>
                    
                    <!-- /// -->
                    <xsl:if test="$bk:Entry//*[tokenize(@ana, ' ') = 'bk:service'] | $bk:Entry//*[tokenize(@ana, ' ') = 'bk:commodity']">
                                <xsl:for-each-group select="$bk:Entry//*[tokenize(@ana, ' ') = 'bk:service'] | $bk:Entry//*[tokenize(@ana, ' ') = 'bk:commodity']" group-by="@commodity">
                                    <bk:aggregates>
                                    <bk:EconomicGood rdf:about="{concat($DataSetURI, $Between_Id, 'EG', position())}">
                                        <bk:commodity><xsl:value-of select="current-grouping-key()"/></bk:commodity>
                                        <bk:unit><xsl:value-of select="@unit"/></bk:unit>
                                        <bk:sum><xsl:value-of select="count(current-group())"/></bk:sum>
                                        <!-- ToDo -->
                                        <bk:quantity>
                                            <xsl:value-of select="sum(current-group()/@quantity)"/>
                                        </bk:quantity> 
                                        <xsl:if test="//t:taxonomy[@ana ='bk:Taxonomy']//t:category[t:gloss = current-grouping-key()]">
                                            <xsl:choose>
                                                <xsl:when test="count(//t:taxonomy[@ana ='bk:Taxonomy']//t:category[t:gloss = current-grouping-key()]/@xml:id) &lt; 2">
                                                    <skos:ref rdf:resource="{concat($BASE-URL, //t:taxonomy[@ana ='bk:Taxonomy']//t:category[t:gloss = current-grouping-key()]/@xml:id)}"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:comment>Error: multiple commodities</xsl:comment>
                                                </xsl:otherwise>
                                            </xsl:choose> 
                                           
                                        </xsl:if>
                                    </bk:EconomicGood>
                                    </bk:aggregates>
                                </xsl:for-each-group>
                            
                        
                    </xsl:if>
                </bk:Dataset>
            </bk:aggregates>
        
    </xsl:template>
    
    <!-- //////////////////////////////////// -->
    <!-- this template creates a bk:Dataset. it creats a bk:Dataset for all distinct years in bk:when from all bk:entry. 
         it uses the information in <t:unitDef> to do the conversion of currencies and calucaltes the sum of bk:income and bk:expense -->
    <xsl:template name="createDataSet">
        <!-- all bk:when -->
        <xsl:variable name="bk_when" select="//.[tokenize(@ana, ' ') = 'bk:when']/year-from-date(@when)"/>
        <!-- all bk:Money -->
        <xsl:variable name="all_bk_money" select="//*[tokenize(@ana, ' ') = 'bk:money']"/>
        <!-- like $ in the teiHeader -->
        <xsl:variable name="mainCurrency" select="//t:unitDef[@ana ='bk:unit']"/>
        <!-- all bk:Entry -->
        <xsl:variable name="allEntries" select="//t:text//*[tokenize(@ana, ' ') = 'bk:entry']"/>
        <!--<xsl:variable name="sum_bk_money" select="sum(//*[tokenize(@ana, ' ') = 'bk:money'][@unit = $mainCurrency/t:label]/@quantity)"/>-->
        
        <!-- ////////// -->
        <xsl:choose>
            <xsl:when test="//.[tokenize(@ana, ' ') = 'bk:when']/@when">
                
                <!-- ////////// -->
                <!-- get all Entries of a specific year -->
                <xsl:for-each-group select="//.[tokenize(@ana, ' ') = 'bk:when']" group-by="year-from-date(@when)">
                    
                    <xsl:variable name="currentYear" select="current-grouping-key()"/>
                    
                    <!-- ////////// -->
                    <!-- help variable to store data of this year; like <money> elements containing @quantity from bk:money -->
                    <xsl:variable name="allMoneyofEntriesofCurrentYear">
                        <xsl:for-each select="$allEntries">
                            <xsl:variable name="bk_when">
                                <xsl:call-template name="getWhen"/>
                            </xsl:variable>
                            <!-- ////////// -->
                            <xsl:call-template name="prepareMoney_Currency_Conversion">
                                <xsl:with-param name="mainCurrency" select="$mainCurrency"/>
                                <xsl:with-param name="bk_when" select="$bk_when"/>
                                <xsl:with-param name="currentYear" select="$currentYear"/>
                            </xsl:call-template>
                        </xsl:for-each>
                    </xsl:variable>
                    
                    <!-- ////////// -->
                    <!-- bk:Dataset -->
                    <xsl:variable name="DataSetURI" select="concat('https://gams.uni-graz.at/', $Currrent_TEI_PID, '#', $currentYear)"/>
                    <bk:Dataset rdf:about="{$DataSetURI}">
                        <!-- ToDo rdf:datatype date ?-->
                        <bk:date>
                            <xsl:value-of select="$currentYear"/>
                        </bk:date>
                        <!-- /// -->
                        <xsl:call-template name="getBasicProperties"/>
                        <!--  -->
                        <bk:debit>
                            <bk:Income rdf:about="{concat($DataSetURI, 'I')}">
                                <bk:sum>
                                    <xsl:value-of select="if ($allMoneyofEntriesofCurrentYear/money) then round(sum($allMoneyofEntriesofCurrentYear/money)) else 0"/>
                                </bk:sum>
                                <bk:unit>
                                    <xsl:value-of select="$mainCurrency/t:label"/>
                                </bk:unit>
                               
                                <!-- //////////////////////////////////// -->
                                <!-- all bk:Between transfering bk:Money  -->
                                <xsl:for-each-group select="$allMoneyofEntriesofCurrentYear/to" group-by=".">
                                    <!-- bk:Between -->
                                    <xsl:variable name="Between_Id">
                                        <xsl:call-template name="get_XML_ID_after_Hash">
                                            <xsl:with-param name="Path" select="current-grouping-key()"/>
                                        </xsl:call-template>
                                    </xsl:variable>
                                     <xsl:call-template name="aggregatesBetween">
                                         <xsl:with-param name="bk:Entry" select="$allEntries[.//*[tokenize(@ana, ' ') = 'bk:to']/@ref = concat('#', $Between_Id)]"/>
                                         <xsl:with-param name="currentYear" select="$currentYear"/>
                                         <xsl:with-param name="mainCurrency" select="$mainCurrency"/>
                                         <xsl:with-param name="DataSetURI" select="$DataSetURI"/>
                                         <xsl:with-param name="Between_Id" select="$Between_Id"/>
                                     </xsl:call-template>
                                </xsl:for-each-group>
                               
                            </bk:Income>
                        </bk:debit>
                        <!--  -->
                        <bk:credit>
                            <bk:Expense rdf:about="{concat($DataSetURI, 'E')}">
                                <bk:sum>
                                    <!--<xsl:value-of select="if ($allMoneyofEntriesofCurrentYear/money) then round(sum($allMoneyofEntriesofCurrentYear/money)) else 0"/>-->
                                   <xsl:text>0</xsl:text>
                                </bk:sum>
                                <bk:unit>
                                    <xsl:value-of select="$mainCurrency/t:label"/>
                                </bk:unit>
                                <!-- //////////////////////////////////// -->
                                <!-- all bk:Between transfering bk:Money  -->
                                <xsl:for-each-group select="$allMoneyofEntriesofCurrentYear/from" group-by=".">
                                    <!-- bk:Between -->
                                    <xsl:variable name="Between_Id">
                                        <xsl:call-template name="get_XML_ID_after_Hash">
                                            <xsl:with-param name="Path" select="current-grouping-key()"/>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:call-template name="aggregatesBetween">
                                        <xsl:with-param name="bk:Entry" select="$allEntries[.//*[tokenize(@ana, ' ') = 'bk:from']/@ref = concat('#', $Between_Id)]"/>
                                        <xsl:with-param name="currentYear" select="$currentYear"/>
                                        <xsl:with-param name="mainCurrency" select="$mainCurrency"/>
                                        <xsl:with-param name="DataSetURI" select="$DataSetURI"/>
                                        <xsl:with-param name="Between_Id" select="$Between_Id"/>
                                    </xsl:call-template>
                                </xsl:for-each-group>
                            </bk:Expense>
                        </bk:credit>
                        <!--  -->
                       
                        
                        
                        
                        <!--  -->
                        <!--<xsl:for-each-group select="$allMoneyofEntriesofCurrentYear/from" group-by=".">
                            <xsl:variable name="Between_Id">
                                <xsl:call-template name="get_XML_ID_after_Hash">
                                    <xsl:with-param name="Path" select="current-grouping-key()"/>
                                </xsl:call-template>
                            </xsl:variable>
                            <bk:aggregates>
                                <bk:DataSubSet rdf:about="{concat($DataSetURI, 'f', $Between_Id)}">
                                    <bk:from rdf:resource="{'https://gams.uni-graz.at/', $Currrent_TEI_PID, '#', $Between_Id}"/>
                                </bk:DataSubSet>
                            </bk:aggregates>
                        </xsl:for-each-group>-->
                    </bk:Dataset>
                </xsl:for-each-group>
            </xsl:when>
            <xsl:otherwise>
                <xsl:comment>Error: no normalized date in bk:when (@when); bk:Dataset not created</xsl:comment>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <!-- /////////////////////////////// -->
    <!-- adds gams:memberOfColletion, gams:isPartofTEI, bk:entry and bk:when to bk:Transaction or bk:Sum  -->
    <xsl:template name="getBasicProperties">
        <gams:isMemberOfCollection rdf:resource="{concat($BASE-URL, $Currrent_Context)}"/>
        
        <!-- is part of Object weil TEI und Ontology objekte? -->
        <!--<gams:isPartofTEI rdf:resource="{concat($BASE-URL, $Currrent_TEI_PID)}"/>-->

        <!-- bk:entry -->
        <bk:entry>
            <xsl:for-each select=".//text()">
                <xsl:value-of select="normalize-space(.)"/>
                <xsl:if test="not(position() = last())">
                    <xsl:text> </xsl:text>
                </xsl:if>
            </xsl:for-each>
        </bk:entry>
        
        <!-- /////////// -->
        <!-- bk:when -->
        <xsl:call-template name="getWhen"/>
    </xsl:template>
    
    <!-- //////////////////////////////// -->
    <!-- create bk:commodity in bk:Measurable 
         * extern URI       https://www.wikidata.org/wiki/Q80151
         * intern URI       https://gams.uni-graz.at/o:depcha.wheaton.1#c_hat, 
         * reference to an xml:id   #c_hat
         * string                   hat
    -->   
    <xsl:template name="create_bk_commodity">
        <xsl:param name="commodity"/>
        <bk:commodity>
            <xsl:choose>
                <!-- is there a better way for chekc for a uri in xslt?  -->
                <xsl:when test="starts-with($commodity, 'https') or starts-with($commodity, 'http')">
                    <xsl:choose>
                        <!-- intern URI -->
                        <xsl:when test="contains($commodity, ':depcha')">
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="@commodity"/>
                            </xsl:attribute>
                        </xsl:when>
                        <!-- extern URI -->
                        <xsl:otherwise>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="@commodity"/>
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <!-- xml:id -->
                <xsl:when test="starts-with($commodity,'#')">
                    <xsl:attribute name="rdf:resource">
                        <xsl:value-of select="concat($BASE-URL, $Currrent_TEI_PID, @commodity)"/>
                    </xsl:attribute>
                </xsl:when>
                <!-- string -->
                <xsl:otherwise>
                    <xsl:value-of select="@commodity"/>
                </xsl:otherwise>
            </xsl:choose>
        </bk:commodity>
        
           
        
    </xsl:template>
    

</xsl:stylesheet>