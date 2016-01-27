<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
		   <xsl:for-each select="info657">
				<head>
					<title><xsl:value-of select="courseTitle"/></title>
				</head>
				<body style="padding:50px;color:#333333;font-family:Verdana, Geneva, sans-serif">
						<xsl:apply-templates/>
				</body>
			</xsl:for-each>
		</html>
	</xsl:template>

	<xsl:template match="courseTitle">
		<h2>Course: <xsl:value-of select="."/></h2>
		<h3>Quarter: <xsl:value-of select="../@term"/>, <xsl:value-of select="../@year"/></h3>
	</xsl:template>

	<xsl:template match="student">
		<p>
			Student: <xsl:apply-templates select="name"/>
			<br/>		
			<br/>		
			Residence: <xsl:apply-templates select="location"/>		
			<br/>
			<br/>		
			Personal Interests:	<xsl:apply-templates select="personalInterest"/>
			<br/>
			Introduction: <xsl:apply-templates select="self-introduction"/>
		</p>
	</xsl:template>

	<xsl:template match="name">
	  <span style="color:#006699">
		<xsl:apply-templates select="lastName"/>, <xsl:apply-templates select="firstName"/> 
	  </span>
	</xsl:template>

	<xsl:template match="firstName">
		<span><xsl:value-of select="."/></span>
	</xsl:template>

	<xsl:template match="lastName">
		<span style="font-weight:bold"><xsl:value-of select="."/></span>
	</xsl:template>

	<xsl:template match="location">
	  <span style="color:#006699">
		<xsl:apply-templates select="city"/>
		<xsl:apply-templates select="state"/>
		<xsl:apply-templates select="country"/>
	  </span>
	</xsl:template>

	<xsl:template match="city">
		<xsl:if test="string(.)">
			<span><xsl:value-of select="."/>, </span>
		</xsl:if>
	</xsl:template>

	<xsl:template match="state">
		<xsl:if test="string(.)">
			<span><xsl:value-of select="."/>, </span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="country">
		<xsl:if test="string(.)">
			<span><xsl:value-of select="."/></span>
		</xsl:if>
	</xsl:template>

	<xsl:template match="personalInterest">
		<li style="text-align:left;color:#006699;font-size:90%;margin-left:15px;margin-bottom:2px">
			<xsl:value-of select="."/>
		</li>
	</xsl:template>

	<xsl:template match="self-introduction">
	  <p style="text-align:left;text-indent:25px;color:#006699;font-style:italic;font-size:90%;margin-top:10px"><xsl:value-of select="."/></p>
	</xsl:template>
	
</xsl:stylesheet>
