<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
		   <xsl:for-each select="DL_System">
				<head>
					<title><xsl:value-of select="metadata/title"/></title>
				</head>
				<body style="padding:50px;color:#333333;font-family:Verdana, Geneva, sans-serif">
						<xsl:apply-templates/>
				</body>
			</xsl:for-each>
		</html>
	</xsl:template>

	<xsl:template match="header">
	  <p>
		<xsl:apply-templates select="setSpec"/>
		<xsl:apply-templates select="identifier"/>		
	  </p>
	</xsl:template>

	<xsl:template match="setSpec">
		<h1><xsl:value-of select="."/></h1>
	</xsl:template>

	<xsl:template match="header/identifier">
		<h1 style="font-weight:lighter;color:#006699"><xsl:value-of select="."/></h1>
	</xsl:template>

	<xsl:template match="metadata">
	  <p style="text-align:center;width:75%;padding:10px;margin-bottom:10px;border-style:ridge;border-width:5px">
		<xsl:apply-templates select="title"/>  
		<xsl:apply-templates select="type"/>	
		<xsl:apply-templates select="identifier"/>    
		<xsl:apply-templates select="creator"/>
		
		<h3 style="text-decoration:underline;text-align:left;font-size:90%;margin-left:25px;margin-bottom:2px">Subjects</h3>
		<xsl:apply-templates select="subject"/>

		<br/>
		<xsl:apply-templates select="date"/>    

		<h3 style="text-decoration:underline;text-align:left;font-size:90%;margin-left:25px;margin-bottom:2px">Description</h3>
		<xsl:apply-templates select="description"/>
		<xsl:apply-templates select="rights"/>
	  </p>
	</xsl:template>
	
	<xsl:template match="title">
	  <p style="font-size:125%;font-weight:bold;margin-bottom:inherit"><xsl:value-of select="."/></p>
	</xsl:template>
	
	<xsl:template match="type">
	  <p style="color:#006699"><xsl:value-of select="."/></p>
	</xsl:template>
	
	<xsl:template match="metadata/identifier">
		<span>Available for download at </span>
		<a>
			<xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
			<strong><xsl:value-of select="."/></strong>
		</a>
		<br/>
	</xsl:template>
	
	<xsl:template match="creator">
		<p style="margin-bottom:inherit;margin-top:10px">
			<span>Creator(s): </span>
			<span style="color:#990000"><xsl:value-of select="."/></span>
		</p>
	</xsl:template>
	
	<xsl:template match="subject">
		<li style="text-align:left;color:#006699;font-size:90%;margin-left:40px;margin-bottom:2px">
			<xsl:value-of select="."/>
		</li>
	</xsl:template>
	
	<xsl:template match="date">
		<p style="text-align:left;color:#660000; font-size:90%;margin-left:25px"><xsl:value-of select="."/> Year registered with SourceForge</p>
	</xsl:template>
	
	<xsl:template match="description">
	  <p style="text-align:left;text-indent:25px;font-style:italic;font-size:90%;margin-bottom:inherit;margin-top:10px;margin-left:25px"><xsl:value-of select="."/></p>
	</xsl:template>
	
	<xsl:template match="rights">
		<p style="font-size:80%;margin-top:10px;margin-bottom:inherit"><xsl:value-of select="."/></p>
	</xsl:template>

	<xsl:template match="about">
		<h5 style="text-align:left;font-size:80%;margin-left:5px;margin-bottom:2px">About this record</h5>	  
		<p style="text-align:left;font-size:80%;margin-left:10px;width:75%">
		Created by: 
		<xsl:apply-templates select="Record-creator"/>
		<br/>  
		Created on: 
		<xsl:apply-templates select="record-creation-date"/>	
		<br/>		
		Record link: 
		<xsl:apply-templates select="record-url"/>
	  </p>
	</xsl:template>

	<xsl:template match="Record-creator">
		<span style="color:#660000"><xsl:value-of select="."/></span>
	</xsl:template>

	<xsl:template match="record-creation-date">
		<span style="color:#660000"><xsl:value-of select="."/></span>
	</xsl:template>
	
	<xsl:template match="record-url">
		<a>
			<xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
			<strong><xsl:value-of select="."/></strong>
		</a>
	</xsl:template>
	
</xsl:stylesheet>
