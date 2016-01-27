<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
		   <xsl:for-each select="DL_System">
			<head>
				<title><xsl:value-of select="metadata/title"/></title>
			</head>
			<body>
				<xsl:for-each select="header">
					<xsl:for-each select="identifier">
						<xsl:apply-templates/>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="metadata">
					<h2 align="left"><xsl:value-of select="title"/></h2>
							<br/>
					<span style="color:red; "><xsl:text>URL: </xsl:text></span>
					<xsl:for-each select="identifier">
								<xsl:apply-templates/>
					</xsl:for-each>
							<br/>
							<br/>
					<span style="color:red; ">
								<xsl:text>Description: </xsl:text>
					</span>
					<xsl:for-each select="description">
								<xsl:apply-templates/>
					</xsl:for-each>
							<br/>
							<br/>
					<span style="color:red; ">
						<xsl:text>Subject: </xsl:text>
					</span>
					<xsl:for-each select="subject">
						<xsl:apply-templates/>;
					</xsl:for-each>
							<br/>
							<br/>
					<span style="color:red; "><xsl:text>Rights: </xsl:text></span>
					<xsl:for-each select="rights">
								<xsl:apply-templates/>
					</xsl:for-each>
							<br/>
				</xsl:for-each>
			</body>
			</xsl:for-each>
		</html>
	</xsl:template>
</xsl:stylesheet>
