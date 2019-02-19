<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="softmessageswp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
<!--ELEMENT message (title?, messageline+, help.info?, aftermessage?)-->
	<xsl:template match="softmessageswp/message[position()>1]"/>
		
	<xsl:template match="softmessageswp/message[1]">
		<fo:block span="all">
			<fo:table  border="thin solid black" table-layout="fixed" inline-progression-dimension="100%" >
				<fo:table-column column-number="1" column-width="proportional-column-width(50)"/>
				<fo:table-column column-number="2" column-width="proportional-column-width(50)"/>
				<fo:table-header>
					<fo:table-row padding-bottom="5pt" padding-top="5pt">
						<fo:table-cell border-top="thin solid black" border-bottom="thin solid black" border-left="thin solid black" padding-bottom="5pt" padding-top="5pt">
							<fo:block height="6mm"/>
							<fo:block text-align="center" font-weight="bold">Error Message</fo:block>
						</fo:table-cell>
						<fo:table-cell border-top="thin solid black" border-bottom="thin solid black" border-left="thin solid black" padding-bottom="5pt" padding-top="5pt">
							<fo:block height="6mm"/>
							<fo:block text-align="center" font-weight="bold">Explanation</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<fo:table-row padding-bottom="5pt" padding-top="5pt">
						<fo:table-cell border="thin solid black" padding-bottom="5pt" padding-top="5pt"							
 padding-left="5pt" padding-right="5pt">
							<xsl:apply-templates select="title"/>
							<xsl:apply-templates select="messageline[1]"/>
						</fo:table-cell>
						<fo:table-cell border="thin solid black" padding-bottom="5pt" padding-top="5pt" padding-left="5pt" padding-right="5pt">
						<fo:block>
							<xsl:apply-templates select="help.info"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<xsl:if test="following-sibling::*[1]">
						<xsl:apply-templates mode="More-Message" select="following-sibling::*[1]"/>
					</xsl:if>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>

	<xsl:template match="message" mode="More-Message">
		<fo:table-row padding-bottom="5pt" padding-top="5pt">
			<fo:table-cell border="thin solid black" padding-bottom="5pt" padding-top="5pt"				
 padding-left="5pt" padding-right="5pt">
				<xsl:apply-templates select="title"/>
				<xsl:apply-templates select="messageline[1]"/>
			</fo:table-cell>
			<fo:table-cell border="thin solid black" padding-bottom="5pt" padding-top="5pt" padding-left="5pt" padding-right="5pt">
				<xsl:apply-templates select="help.info"/>
			</fo:table-cell>
		</fo:table-row>
		<xsl:if test="following-sibling::*[1]">
			<xsl:apply-templates mode="More-Message" select="following-sibling::*[1]"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="messageline">
		<fo:block space-after="2mm" space-before="2mm">
			<xsl:apply-templates select="node()"/>
		</fo:block>
		<xsl:if test="following-sibling::messageline[1]">
			<xsl:apply-templates select="following-sibling::messageline[1]"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="message/help.info">			
		<fo:block space-after="2mm" space-before="2mm">
			<xsl:apply-templates select="node()"/>
			<xsl:if test="following-sibling::*[1][local-name() = 'aftermessage']">
				<fo:inline>
					<xsl:apply-templates select="following-sibling::aftermessage"/>
				</fo:inline>
			</xsl:if>
		</fo:block>
	</xsl:template>

	<xsl:template match="aftermessage">
			<xsl:apply-templates  select="node()"/>
	</xsl:template>
	
</xsl:stylesheet>
