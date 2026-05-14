<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
	exclude-result-prefixes="xs" version="2.0">
	<!-- 
	* 
	-->
	<!-- GLOBAL VARIABLE -->
	<xsl:variable name="COLLECTION" select="collection('multiple_files')"/>
	<xsl:template match="/">
		<!-- /////////// -->
		<!-- person.html -->
		<xsl:result-document href="person.html" method="html">
			<html lang="en">
				<!-- call getHead -->
				<xsl:call-template name="get_head">
					<xsl:with-param name="title" select="'Personenindex'"/>
				</xsl:call-template>
				<body>
					<!-- call getNav -->
					<xsl:call-template name="get_nav_and_header"/>
					<!-- content -->
					<div class="container mt-5">
						<xsl:apply-templates select="//t:teiHeader//t:listPerson"/>
					</div>
				</body>
			</html>
		</xsl:result-document>
		<!-- /////////// -->
		<!-- transaction_by_person.html -->
		<xsl:result-document href="transaction_by_person.html" method="html">
			<html lang="en">
				<!-- call getHead -->
				<xsl:call-template name="get_head">
					<xsl:with-param name="title" select="'Übersicht der Transaktionen nach Person'"
					/>
				</xsl:call-template>
				<body>
					<!-- call getNav -->
					<xsl:call-template name="get_nav_and_header"/>
					<!-- content -->
					<div class="container mt-5">
						<!-- here we also use $COLLECTION -->
						<xsl:for-each-group
							select="$COLLECTION//t:row[@ana = 'bk:entry'][.//t:name[@ana = 'bk:to']]"
							group-by=".//t:name[@ana = 'bk:to']/@ref">
							<h3>
								<!-- pers_WCDH260 -->
								<xsl:variable name="PERSON_ID"
									select="substring-after(current-grouping-key(), '#')"/>
								<!-- pers_WCDH260 -->
								<xsl:variable name="PERSON"
									select="//t:listPerson/t:person[@xml:id = $PERSON_ID]"/>
								<xsl:value-of select="$PERSON/t:persName/t:surname"/>
								<xsl:if test="$PERSON/t:persName/t:forename">
									<xsl:text>, </xsl:text>
									<xsl:value-of select="$PERSON/t:persName/t:forename"/>
								</xsl:if>
								<xsl:value-of select="concat(' [@xml:id=', $PERSON_ID, ']')"/>
								<xsl:text> - Number of Transactions: </xsl:text>
								<xsl:value-of select="count(current-group())"/>
							</h3>
							<ul>
								<xsl:for-each select="current-group()">
									<li>
										<xsl:value-of select="."/>
									</li>
								</xsl:for-each>
							</ul>
						</xsl:for-each-group>
					</div>
				</body>
			</html>
		</xsl:result-document>
		<!-- /////////// -->
		<!-- taxonomy.html -->
		<xsl:result-document href="taxonomy.html" method="html">
			<html lang="en">
				<!-- call getHead -->
				<xsl:call-template name="get_head">
					<xsl:with-param name="title" select="'Taxonomie'"/>
				</xsl:call-template>
				<body>
					<!-- call getNav -->
					<xsl:call-template name="get_nav_and_header"/>
					<!-- content -->
					<div class="container mt-5">
						<xsl:if test="not(position() = 1)">
							<xsl:attribute name="class" select="'container mt-5 row'"/>
						</xsl:if>
						<xsl:for-each select="//t:taxonomy/t:category">
							<xsl:sort select="t:catDesc/t:term" data-type="text"/>
							<div id="{@xml:id}" class="mt-5">
								<h1>
									<xsl:value-of select="t:catDesc/t:term"/>
								</h1>
								<div>
									<xsl:apply-templates select="t:category">
										<xsl:sort select="t:catDesc/t:term" data-type="text"/>
									</xsl:apply-templates>
								</div>
							</div>
						</xsl:for-each>
					</div>
				</body>
			</html>
		</xsl:result-document>
		<!-- /////////// -->
		<!-- infovis.html -->
		<xsl:result-document href="infovis.html" method="html">
			<html lang="en">
				<!-- call getHead -->
				<xsl:call-template name="get_head">
					<xsl:with-param name="title" select="'Informationsvisualisierung'"/>
				</xsl:call-template>
				<body>
					<!-- call getNav -->
					<xsl:call-template name="get_nav_and_header"/>
					<!-- content -->
					<div class="container mt-5">
						<xsl:call-template name="createBarChart"/>
					</div>
				</body>
			</html>
		</xsl:result-document>
		<!-- output.html aka edition -->
		<xsl:call-template name="createOutputHTML"/>
		<!-- create output_2 - output_n.html; after output.html (=home) -->
		<xsl:for-each select="$COLLECTION">
			<xsl:result-document href="{concat('output_', position(), '.html')}" method="html">
				<xsl:call-template name="createOutputHTML"/>
			</xsl:result-document>
		</xsl:for-each>
	</xsl:template>
	<!--  -->
	<xsl:template match="t:head">
		<h2>
			<xsl:apply-templates/>
		</h2>
	</xsl:template>
	<!--  -->
	<xsl:template match="t:date">
		<xsl:apply-templates/>
	</xsl:template>
	<!--  -->
	<xsl:template match="t:table">
		<table class="my-5">
			<xsl:attribute name="class" select="'table'"/>
			<xsl:apply-templates/>
		</table>
	</xsl:template>
	<!--  -->
	<xsl:template match="t:row[count(t:cell) > 1]">
		<tr>
			<xsl:apply-templates/>
		</tr>
	</xsl:template>
	<!--  -->
	<xsl:template match="t:cell">
		<td>
			<xsl:apply-templates/>
		</td>
	</xsl:template>
	<!--  -->
	<xsl:template match="t:row[count(t:cell) = 1]">
		<th class="text-center">
			<xsl:value-of select="t:cell"/>
		</th>
	</xsl:template>
	<!--  -->
	<xsl:template match="t:choice">
		<span title="{t:expan}" class="text-decoration-underline">
			<xsl:value-of select="t:abbr"/>
		</span>
	</xsl:template>
	<!--  -->
	<xsl:template match="t:listPerson">
		<ul class="list-group">
			<xsl:apply-templates select="t:person">
				<!-- sort -->
				<xsl:sort select="t:persName/t:surname[1]"/>
			</xsl:apply-templates>
		</ul>
	</xsl:template>
	<!--  -->
	<xsl:template match="t:name">
		<span class="bg-info">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<!--  -->
	<xsl:template match="t:person">
		<li class="list-group-item">
			<xsl:value-of select="t:persName"/>
			<!-- xsl:if; Boolean Operators  -->
			<xsl:if test="t:birth/@when or t:death/@when">
				<xsl:text> (</xsl:text>
				<!-- birth -->
				<xsl:if test="t:birth/@when">
					<xsl:call-template name="formate_date">
						<xsl:with-param name="when" select="t:birth/@when"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:text>-</xsl:text>
				<!-- death -->
				<xsl:if test="t:death/@when">
					<xsl:call-template name="formate_date">
						<xsl:with-param name="when" select="t:death/@when"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:text>)</xsl:text>
			</xsl:if>
		</li>
	</xsl:template>
	<!--  -->
	<xsl:template name="formate_date">
		<xsl:param name="when"/>
		<xsl:choose>
			<!-- check if just year; like 1796 -->
			<xsl:when test="$when castable as xs:gYear">
				<xsl:value-of select="$when"/>
			</xsl:when>
			<!-- check if a valid year + month; like 1796-09  -->
			<xsl:when test="$when castable as xs:gYearMonth">
				<xsl:variable name="month" select="substring-after($when, '-')"/>
				<xsl:variable name="year" select="substring-before($when, '-')"/>
				<xsl:value-of select="concat($month, '.', $year)"/>
			</xsl:when>
			<!-- check if a valid date; 1796-09-12 -->
			<xsl:when test="$when castable as xs:date">
				<xsl:value-of select="format-date($when, '[D].[M].[Y]')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat('no date:', $when)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- get_head -->
	<xsl:template name="get_head">
		<xsl:param name="title"/>
		<head>
			<title>
				<xsl:value-of select="$title"/>
			</title>
			<meta charset="utf-8"/>
			<meta name="viewport" content="width=device-width, initial-scale=1"/>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
				rel="stylesheet"/>
			<link href="/css/pollin.css"
				rel="stylesheet"/>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"/>
		</head>
	</xsl:template>
	<!-- get_nav_and_header -->
	<xsl:template name="get_nav_and_header">
		<xsl:param name="title"/>
		<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top ">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Navbar</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
					data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"/>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<div class="dropdown">
							<button class="btn dropdown-toggle" type="button"
								id="dropdownMenuButton1" data-bs-toggle="dropdown"
								aria-expanded="false"> Edition </button>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
								<xsl:for-each select="$COLLECTION">
									<li>
										<!-- just to keep output.html; -->
										<a class="dropdown-item"
											href="{if (position()>1) then ( concat('output_', position(), '.html') ) else ('output.html')}">
											<xsl:value-of
												select="t:TEI/t:teiHeader/t:fileDesc/t:titleStmt/t:title"
											/>
										</a>
									</li>
								</xsl:for-each>
							</ul>
						</div>
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="person.html"
								>Person</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="taxonomy.html"
								>Taxonomie</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active" aria-current="page"
								href="transaction_by_person.html">Übersicht der Transaktionen
								nach Person</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active" aria-current="page"
								href="infovis.html">Informationsvisualisierung</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="container-fluid p-5 bg-primary">
			<h1 class="text-center text-white">
				<xsl:value-of select="/t:TEI/t:teiHeader/t:fileDesc/t:titleStmt/t:title"/>
			</h1>
		</div>
	</xsl:template>
	<!--  -->
	<xsl:template match="t:lb">
		<br/>
	</xsl:template>
	<!--  -->
	<xsl:template match="t:pb">
		<div class="row">
			<!-- this is the left part for the text; process now only the first following-sibling table -->
			<div class="col-md-8">
				<!-- adding an id for the navigation -->
				<xsl:attribute name="id" select="concat('page.', @n)"/>
				<hr class="border-3 border-top border-danger my-5"/>
				<xsl:apply-templates select="following-sibling::t:table[1]"/>
			</div>
			<!-- this is the right part fwith the image -->
			<div class="col-md-4">
				<xsl:variable name="IMG"
					select="concat('http://gams.uni-graz.at/archive/objects/o:depcha.wheaton.1/datastreams/', substring-after(@xml:id, 'WH_'), '/content')"/>
				<figure class="figure row py-4">
					<img src="{$IMG}" class="figure-img img-fluid" alt="Facsimile number {@n}"/>
					<figcaption class="figure-caption">
						<xsl:value-of select="concat('Facsimile of page ', @n)"/>
					</figcaption>
				</figure>
			</div>
		</div>
	</xsl:template>
	<!--  -->
	<xsl:template match="t:category">
		<div id="{@xml:id}">
			<xsl:variable name="DEPTH" select="count(ancestor::t:category)"/>
			<!-- builds <h2>, <h3>, <h4>, -->
			<xsl:element name="{concat('h', $DEPTH+1)}">
				<xsl:attribute name="class" select="concat('px-', $DEPTH)"/>
				<xsl:value-of select="t:catDesc/t:term"/>
			</xsl:element>
			<!-- checks if there is a child -->
			<xsl:if test="t:category">
				<div>
					<!-- recursive call -->
					<xsl:apply-templates select="t:category">
						<xsl:sort select="t:catDesc/t:term" data-type="text"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
		<xsl:apply-templates/>
	</xsl:template>
	<!-- ignore elements -->
	<xsl:template match="t:category/t:catDesc/t:term"/>
	<!-- creates body of edition view -->
	<xsl:template name="createOutputHTML">
		<html lang="en">
			<!-- call getHead -->
			<xsl:call-template name="get_head">
				<xsl:with-param name="title" select="'Edition'"/>
			</xsl:call-template>
			<body>
				<!-- call getNav -->
				<xsl:call-template name="get_nav_and_header"/>
				<!-- content -->
				<div class="container mt-5">
					<!-- navigation based on pages; on the bottom -->
					<div class="btn-group fixed-bottom container small" role="group"
						aria-label="Page-Navigation">
						<xsl:for-each select="//t:pb">
							<a href="{concat('#page.', @n)}" class="btn btn-sm btn-primary"
								role="button">
								<xsl:value-of select="'p.', @n"/>
							</a>
							<xsl:if test="not(position() = last())">
								<xsl:text> </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</div>
					<p>
						<a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample"
							role="button" aria-expanded="false" aria-controls="collapseExample"> msDesc <svg
								xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
								class="bi bi-arrow-down-short" viewBox="0 0 16 16"> <path fill-rule="evenodd"
									d="M8 4a.5.5 0 0 1 .5.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5A.5.5 0 0 1 8 4z"
								/> </svg> </a>
					</p>
					<div class="collapse" id="collapseExample">
						<div class="row small card card-body">
							<dl class="col-md-6">
								<h4>
									<xsl:text>msIdentifier</xsl:text>
								</h4>
								<xsl:for-each
									select="/t:TEI/t:teiHeader/t:fileDesc/t:sourceDesc/t:msDesc/t:msIdentifier/*">
									<dt>
										<xsl:value-of select="local-name()"/>
									</dt>
									<dd>
										<xsl:value-of select="."/>
									</dd>
								</xsl:for-each>
							</dl>
							<dl class="col-md-6">
								<h4>
									<xsl:text>msContents</xsl:text>
								</h4>
								<xsl:for-each
									select="/t:TEI/t:teiHeader/t:fileDesc/t:sourceDesc/t:msDesc/t:msContents/*">
									<xsl:for-each select="*">
										<dt>
											<xsl:value-of select="local-name()"/>
										</dt>
										<dd>
											<xsl:value-of select="."/>
										</dd>
									</xsl:for-each>
								</xsl:for-each>
							</dl>
						</div>
					</div>
					<!-- use the t:pb to structure the page -->
					<xsl:apply-templates select="//t:pb"/>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<!-- http://dh.obdurodon.org/svg-stooges-xslt.xhtml -->
	<xsl:template name="createBarChart">
		<div class="border" style="overflow: scroll;">
			<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" >
				<xsl:variable name="maxHeight" select="500"/>
				<xsl:variable name="colors" select="('red','blue','green')"/>
				<g transform="translate(0,{$maxHeight + 20})">
					<line x1="0" y1="0" x2="150" y2="0" stroke="purple" stroke-width="2"/>
					<line x1="0" y1="-150" x2="0" y2="0" stroke="purple" stroke-width="2"/>
					<xsl:for-each-group select="$COLLECTION//t:measure[@ana='bk:commodity']" group-by="@commodity">
						<xsl:sort select="current-grouping-key()" order="descending"/>
						<xsl:variable name="xPosition" select="(position() - 1) * 100"/>
						<xsl:variable name="position" select="position()"/>
						<rect x="{$xPosition}" y="-{sum(current-group()/@quantity)}" height="{sum(current-group()/@quantity)}" width="35" 
							fill="{$colors[$position]}"/>
						<text x="{$xPosition}" y="15">
							<xsl:value-of select="current-grouping-key()"/>
						</text>
						<text x="{$xPosition}" y="-{sum(current-group()/@quantity) + 5}">
							<xsl:value-of select="sum(current-group()/@quantity)"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="./@unit"/>
						</text>
					</xsl:for-each-group>
				</g>
			</svg>
		</div>
		
	
		
		<!--<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
			<xsl:variable name="maxHeight" select="100"/>
			<xsl:variable name="colors" select="('red','blue','green')"/>
			<g transform="translate(0,{$maxHeight + 20})">
				<line x1="0" y1="0" x2="150" y2="0" stroke="purple" stroke-width="2"/>
				<line x1="0" y1="-150" x2="0" y2="0" stroke="purple" stroke-width="2"/>
				<xsl:for-each select="//t:measure/@quantity">
					<xsl:sort select="@name" order="descending"/>
					<xsl:variable name="xPosition" select="(position() - 1) * 40"/>
					<xsl:variable name="position" select="position()"/>
					<rect x="{$xPosition}" y="-{.}" height="{.}" width="35" 
						fill="{$colors[$position]}"/>
					<text x="{$xPosition}" y="15">
						<xsl:value-of select="@name"/>
					</text>
					<text x="{$xPosition}" y="-{. + 5}">
						<xsl:value-of select="."/>
					</text>
				</xsl:for-each>
			</g>
		</svg>-->
	</xsl:template>
</xsl:stylesheet>
