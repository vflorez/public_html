<?xml version="1.0" encoding="UTF-8"?>

<!-- display only author, title, publisher, edition, and publication date from your MODS record -->

<xsl:stylesheet version="1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mods="http://www.loc.gov/mods/v3">
	
	<xsl:template match="/">		
		<html>
		
		   	<head>
				<title><xsl:value-of select="mods:modsCollection/mods:mods/mods:titleInfo/mods:title"/></title>
				<meta name="keywords">
					<xsl:attribute name="value">
						<xsl:for-each select="mods:modsCollection/mods:mods/mods:subject">
							<xsl:choose>
								<xsl:when test="position()=last()"><xsl:value-of select="."/></xsl:when>
								<xsl:otherwise><xsl:value-of select="."/>, </xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:attribute>
				</meta>
				<meta name="author">
					<xsl:attribute name="value">
						<xsl:for-each select="mods:modsCollection/mods:mods/mods:recordInfo/mods:recordContentSource">
							<xsl:choose>
								<xsl:when test="position()=last()"><xsl:value-of select="."/></xsl:when>
								<xsl:otherwise><xsl:value-of select="."/>, </xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:attribute>
				</meta>
			</head>

			<xsl:for-each select="mods:modsCollection/mods:mods">
				<body style="padding:50px;color:#333333;font-family:Verdana, Geneva, sans-serif">
					<div style="line-height:25px;width:500px;padding:10px;border-style:solid;border-color:#4682B4;border-width:3px">
	
						<img align="right" alt="Front Cover" width="100" height="131">
							<xsl:attribute name="src">
								<xsl:value-of select="mods:relatedItem[@displayLabel='Front Cover']/@xlink:href"/>
							</xsl:attribute>
						</img>
						
						<xsl:apply-templates select="mods:titleInfo/mods:title"/>
						
						<span>
							Author(s):
							<span style="color:#990000">
								<!-- logic to select only primary authors if present, or only personal authors if no primary authors and a mix of personal and corporate authors, or all authors if no primary and no personal authors -->								
								<xsl:choose>	
									<xsl:when test="count(mods:name[@usage='primary'])&gt;0">					
										<xsl:for-each select="mods:name[@usage='primary']">
											<xsl:if test="position()!=1">
												<span style="margin-left:90px"> </span>
											</xsl:if>
											<xsl:value-of select="./mods:displayForm"/><br/>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>					
											<xsl:when test="count(mods:name[@type='personal'])&gt;0">
												<xsl:for-each select="mods:name[@type='personal']">
													<xsl:if test="position()!=1">
														<span style="margin-left:90px"> </span>
													</xsl:if>
													<xsl:value-of select="./mods:displayForm"/><br/>
												</xsl:for-each>
											</xsl:when>
											<xsl:otherwise>
												<xsl:for-each select="mods:name">
													<xsl:if test="position()!=1">
														<span style="margin-left:90px"> </span>
													</xsl:if>									
													<xsl:value-of select="./mods:displayForm"/><br/>
												</xsl:for-each>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</span>									
						</span>
						
						<xsl:apply-templates select="mods:originInfo"/>
						
					</div>	
				</body>
			</xsl:for-each>
		</html>
	</xsl:template>

	<xsl:template match="mods:titleInfo/mods:title">
	  <p style="text-align:center;font-size:125%;font-weight:bold"><xsl:value-of select="."/></p>
	</xsl:template>

	<xsl:template match="mods:originInfo">
		<span>
			Publisher:
			<span style="color:#990000">
			<xsl:value-of select="./mods:publisher"/><br/>
			</span>
			Edition:
			<span style="color:#990000">
			<xsl:value-of select="./mods:edition"/><br/>
			</span>
			Publication Date:
			<span style="color:#990000">
			<xsl:value-of select="./mods:copyrightDate"/><br/>
			</span>
		</span>
	</xsl:template>

</xsl:stylesheet>