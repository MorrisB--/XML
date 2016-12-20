<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />

	<xsl:template match="/">

		<html>

			<head>
				<title>TV Shows</title>
			</head>

			<body>
				Version:
				<xsl:value-of select="system-property('xsl:version')" />
				<br />
				Vendor:
				<xsl:value-of select="system-property('xsl:vendor')" />
				<br />
				Vendor URL:
				<xsl:value-of select="system-property('xsl:vendor-url')" />
				<br />

				<xsl:for-each select="tvshows/show">
					<a href="#{generate-id(name)}">
						<xsl:value-of select="name" />
					</a>
					<br />
				</xsl:for-each>

				<xsl:for-each select="tvshows/show">
					<xsl:sort select="name" order="ascending" data-text="text" />
					<h3>
						<a name="{generate-id(name)}">
							<xsl:value-of select="name" />
						</a>
					</h3>
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="poster/@href" />
						</xsl:attribute>
					</img>
					<br />

					<!-- Prints out every value in element -->
					<xsl:value-of select="current()" />
					<br />
					<p>
						The show
						<xsl:value-of select="name" />
						was released in
						<xsl:value-of select="release" />
						by
						<xsl:value-of select="network" />
						.
						It had an average of
						<xsl:value-of select="viewers" />
						million people. It was cancelled in
						<xsl:value-of select="end_date" />
					</p>
					<br />
				</xsl:for-each>

			</body>

		</html>

	</xsl:template>
</xsl:stylesheet>