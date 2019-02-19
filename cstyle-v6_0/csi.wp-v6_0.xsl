<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="csi.wp">
	<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="csi">
		<xsl:apply-templates select="node()"/>
	</xsl:template>

	<xsl:template match="csi.tab">
	
	<fo:block span="all"><xsl:call-template name="CHANGEBAR"/>
			<fo:table-and-caption hyphenate="true" hyphenation-character="-" hyphenation-keep="column">
				<fo:table-caption>
					<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" keep-with-previous.within-column="always" keep-with-previous.within-page="always" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center">
						<xsl:text disable-output-escaping="no">Table&#x2002;</xsl:text>
						<xsl:number count="csi.tab" format="1." from="csi" level="any"/>
						<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
						<xsl:value-of disable-output-escaping="no" select="title"/>
					</fo:block>
				</fo:table-caption>
				
				<fo:table border-bottom="solid" border-left="solid" border-right="solid" border-top="solid" border-width="0.5" font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" space-after.maximum="12pt" space-after.minimum="12pt" space-after.optimum="12pt" space-before.maximum="14pt" space-before.minimum="12pt" space-before.optimum="12pt" table-layout="fixed" text-align="left" white-space-treatment="preserve" id="{generate-id(.)}" width="7in" inline-progression-dimension="100%">
					<fo:table-column column-number="1" column-width="20%"> </fo:table-column>
					<fo:table-column column-number="2" column-width="35%"> </fo:table-column>
					<fo:table-column column-number="3" column-width="45%"> </fo:table-column>
					<xsl:call-template name="csi-HEADER"/>
					<fo:table-body>
						<xsl:apply-templates select="csi-entry"/>
					</fo:table-body>
				</fo:table>
				
			</fo:table-and-caption>
</fo:block>
	</xsl:template>
	<xsl:template name="csi-HEADER">
		<fo:table-header>
			<fo:table-row>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
				<fo:block font-family="sans-serif" font-size="8pt" font-weight="bold" span="all" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">NOMEN</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
						</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
				<fo:block font-family="sans-serif" font-size="8pt" font-weight="bold" span="all" text-align="center">
						<fo:block margin-bottom="3pt" span="all" text-align="center">PART NUMBER/</fo:block>
						<fo:block margin-bottom="3pt" span="all" text-align="center">CAGEC</fo:block>
							</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
				<fo:block font-family="sans-serif" font-size="8pt" font-weight="bold" span="all" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">CRITICAL CHARACTERISTICS</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
						</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<xsl:template match="csi-entry">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-row>
			<xsl:apply-templates select="node()">
</xsl:apply-templates>
		</fo:table-row>
	</xsl:template>
	<!--
ELEMENT name&ensp;
-->
	<xsl:template match="csi-entry/name">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENT desc
-->
	<xsl:template match="csi-entry/desc">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENT partno
-->
	<xsl:template match="csi-entry/partno">
	<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left">
			<fo:block>
				<xsl:value-of disable-output-escaping="no" select="."/>
				<xsl:text disable-output-escaping="no"> &#x2002;</xsl:text>
			</fo:block>
			<fo:block>
				<xsl:text disable-output-escaping="no">  (</xsl:text>
				<xsl:value-of disable-output-escaping="no" select="../cageno"/>
				<xsl:text disable-output-escaping="no">)  </xsl:text>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="csi-entry/cageno">
	</xsl:template>
	</xsl:stylesheet>