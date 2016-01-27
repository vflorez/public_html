<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mods="http://www.loc.gov/mods/v3">
	
	<xsl:template match="/">		
		<html>
		
		   	<head>
				<title><xsl:value-of select="mods:mods/mods:titleInfo/mods:title"/></title>
				<meta name="keywords">
					<xsl:attribute name="value">
						<xsl:for-each select="mods:mods/mods:subject/*">
							<xsl:choose>
								<xsl:when test="position()=last()"><xsl:value-of select="."/></xsl:when>
								<xsl:otherwise><xsl:value-of select="."/>, </xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:attribute>
				</meta>
				<meta name="author">
					<xsl:attribute name="value">Valerie Florez</xsl:attribute>
				</meta>
		   		<meta content="yes" name="apple-mobile-web-app-capable" />
		   		<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
		   		<meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
		   		<link href="../css/style.css" rel="stylesheet" media="screen" type="text/css" />
		   		<link rel="apple-touch-icon" href="images/webclip.png"/>
		   		<script src="javascript/functions.js" type="text/javascript"></script>
		   		<meta content="resource guide,mobile,app,INFO657,Drexel University,Breastfeeding,Centrum voor Jeugd en Gezin,Childbirth,Child development,Child health services,Child psychology,Child rearing,Children's paraphernalia,Classroom environment,Development,Educational games,Exercise,Exercise for pregnant women,Goverment,Infant psychology,Infants,Infants--Care,Instructional films,Internet games,Maternity clothes,Mothers,Natural childbirth,Nutrition,Nutritional aspects,Parent and infant,Parenting,Playgroups,Pregnancy,Pregnancy--Exercise,Pregnancy--Nutritional aspects,Pregnant Women,Prenatal Care,Prenatal--Equipment and supplies,Prenatal Nutritional Physiological Phenomena,Retirement" name="keywords" />
		   		<meta content="This website is a mobile companion to a prototype collection of MODS records using Greenstone Digital Library software.
		   			The topic of the digital collection is resources for first-time expectant mothers." name="description" />
		   	</head>

			<xsl:for-each select="mods:mods">
				<body>
					<div id="topbar">
						<div id="title">Resource</div>
					</div>
					
					<div id="tributton">
						<div class="links">
							<a id="pressed" href="../index.html">Home</a><a href="../about.html">About</a><a class="noeffect" href="http://dlib.ischool.drexel.edu/gsdl/cgi-bin/library.cgi?site=localhost&amp;a=p&amp;p=about&amp;c=expectin&amp;l=en&amp;w=utf-8">Full site</a></div>
					</div>
					<div class="searchbox"><form action="" method="get"><fieldset><input
						id="search" placeholder="search" type="text" /><input id="submit"
							type="hidden" /></fieldset></form></div>
					
					<div id="content">
						<span class="graytitle"><xsl:value-of select="mods:titleInfo/mods:title"/></span>
						<ul class="pageitem">
							<li class="textbox">
								<span class="header">Full Title</span>
								<p>								
									<xsl:for-each select="mods:titleInfo/*">
										<xsl:value-of select="."/>
										<br/>
									</xsl:for-each>
								</p>
							</li>
							<li class="textbox">
								<span class="header">Access</span>
								<p>								
									<xsl:for-each select="mods:location/mods:url">
										<a class="noeffect">
											<xsl:attribute name="href"><xsl:value-of select="."/>
											</xsl:attribute>
											<xsl:value-of select="./@displayLabel"/>
										</a>
										<br/>
									</xsl:for-each>
								</p>
							</li>
							<xsl:if test="count(mods:name/*) &gt; 0">
								<li class="textbox">
									<span class="header">Author/Creator</span>
									<p>								
										<xsl:for-each select="mods:name/*">
											<xsl:value-of select="."/>
											<br/>
										</xsl:for-each>
									</p>
								</li>
							</xsl:if>
							<xsl:if test="count(mods:abstract) &gt; 0">
								<li class="textbox">
									<span class="header">Description</span>
									<p>								
										<xsl:for-each select="mods:abstract">
											<xsl:value-of select="."/>
										</xsl:for-each>
									</p>
								</li>
							</xsl:if>
							<xsl:if test="count(mods:subject/*) &gt; 0">
								<li class="textbox">
									<span class="header">Subject</span>
									<p>								
										<xsl:for-each select="mods:subject/*">
											<xsl:value-of select="."/>
											<br/>
										</xsl:for-each>
									</p>
								</li>
							</xsl:if>
							<xsl:if test="count(mods:language/*) &gt; 0">
								<li class="textbox">
									<span class="header">Language</span>
									<p>								
										<xsl:for-each select="mods:language/*">
											<xsl:value-of select="."/>
											<br/>
										</xsl:for-each>
									</p>
								</li>
							</xsl:if>
						</ul>
					</div>
					
					<div id="footer">
						<!-- Support iWebKit by sending us traffic; please keep this footer on your page, consider it a thank you for my work :-) -->
						<a class="noeffect" href="http://snippetspace.com">iPhone site powered by iWebKit</a>
						<br/>
					</div>
				</body>
			</xsl:for-each>
		</html>
	</xsl:template>
</xsl:stylesheet>