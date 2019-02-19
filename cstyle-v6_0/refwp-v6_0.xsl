<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format">

	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="refwp">
		<xsl:call-template name="wp-pageset"> </xsl:call-template>
	</xsl:template>

	<xsl:template match="publist">
		<fo:block span="all">
			<xsl:if test="@id">
				<xsl:attribute name="id">
					<xsl:value-of disable-output-escaping="no" select="@id"/>
				</xsl:attribute>
			</xsl:if>
			<fo:list-block provisional-distance-between-starts="15pc" provisional-label-separation="24pt">
				<xsl:apply-templates select="node()"/>
			</fo:list-block>
		</fo:block>
	</xsl:template>	

	<!-- 20170726 GMR: Needs to be checked for proper formatting. -->
	<xsl:template match="publist/title">
	<fo:list-item space-after="12pt" space-before="12pt" >
			<fo:list-item-label>
				<fo:block font-weight="bold"><xsl:apply-templates select="node()"/></fo:block>
			</fo:list-item-label>
			<fo:list-item-body><fo:block></fo:block></fo:list-item-body>
		</fo:list-item>
	</xsl:template>

	<xsl:template match="pubident">
		<xsl:call-template name="CHANGEBAR"/>
		<xsl:apply-templates select="name|extref"/>
	</xsl:template>
	
	<xsl:template match="pubident/name">
	<fo:list-item>
		<fo:list-item-label end-indent="label-end()">
		<fo:block>
		<xsl:apply-templates select="node()"/>
		</fo:block>
			</fo:list-item-label>
		<fo:list-item-body start-indent="body-start()">
		<fo:block>
			<xsl:value-of select="../title"/>
			</fo:block>
		</fo:list-item-body>
		</fo:list-item>
	</xsl:template>	

<!-- Too handle the extref in the pubident  -->
<xsl:template match="pubident/extref">
	<fo:list-item >
			<fo:list-item-label end-indent="label-end()">
			<fo:block>
				<xsl:if test="@pretext">
			<xsl:value-of disable-output-escaping="no" select="@pretext"/>
		</xsl:if>
		<xsl:if test="@docno">
				<xsl:value-of disable-output-escaping="no" select="@docno"/>
		</xsl:if>
		<xsl:if test="@posttext">
			<xsl:value-of disable-output-escaping="no" select="@posttext"/>
		</xsl:if>
		</fo:block>
			</fo:list-item-label>
		<fo:list-item-body>
		<fo:block>
			<xsl:value-of select="../title"/>
			</fo:block>
		</fo:list-item-body>	
		</fo:list-item>
	</xsl:template>	

</xsl:stylesheet>
