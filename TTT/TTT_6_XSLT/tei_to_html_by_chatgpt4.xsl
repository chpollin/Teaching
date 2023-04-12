<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0">
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Transaktionen</title>
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"/>
				<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css"/>
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
				<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
				<script src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>
				<script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>
				<link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.dataTables.min.css"/>
				
				<style>
					body {
					color: #333;
					background-color: #f8f9fa;
					}
					h1, h2 {
					color: #0056b3;
					}
				</style>
			</head>
			<body>
				<div class="container">
					<h1 class="my-4">Transaktionen</h1>
					<p>Metadata placeholder: Additional information about the dataset will be displayed here.</p>
					
					<h2 class="my-4">Tabellarische Ansicht</h2>
					<table id="transactionTable" class="table table-striped">
						<thead>
							<tr>
								<th scope="col">Datum</th>
								<th scope="col">Name</th>
								<th scope="col">Artikel</th>
								<th scope="col">Preis</th>
							</tr>
						</thead>
						<tbody>
							<xsl:apply-templates select="//tei:row"/>
						</tbody>
					</table>
					
					<h2 class="my-4">Volltext-Ansicht</h2>
					<xsl:apply-templates select="//tei:head"/>
				</div>
				<script>
					$(document).ready(function() {
					$('#transactionTable').DataTable({
					dom: 'Bfrtip',
					buttons: [
					{
					extend: 'csvHtml5',
					text: 'CSV Export',
					className: 'btn btn-primary',
					exportOptions: {
					columns: ':visible'
					}
					}
					]
					});
					});
				</script>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="tei:row">
		<tr>
			<td><xsl:value-of select="descendant::tei:date/@when"/></td>
			<td><xsl:value-of select="descendant::tei:persName"/></td>
			<td><xsl:value-of select="descendant::tei:title"/></td>
			<td><xsl:value-of select="descendant::tei:measure"/></td>
		</tr>
	</xsl:template>
	
	<xsl:template match="tei:head">
		<h3><xsl:value-of select="."/></h3>
		<p>
			<xsl:apply-templates select="following-sibling::tei:p"/>
		</p>
	</xsl:template>
	
	<xsl:template match="tei:p">
		<xsl:value-of select="."/>
		<br/>
	</xsl:template>
	
	
</xsl:stylesheet>
