<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="mrplwp">
		<xsl:call-template name="wp-pageset"></xsl:call-template>
	</xsl:template>
	<xsl:template match="mrpl">
	<fo:block span="all">
			<fo:table-and-caption hyphenate="true" hyphenation-character="-" hyphenation-keep="column">
				<fo:table-caption>
					<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" keep-with-previous.within-column="always" keep-with-previous.within-page="always" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" text-align="center">
						<xsl:text disable-output-escaping="no">Table&#x2002;</xsl:text>
						<xsl:number count="pmcstable | table | mrpl" format="1." from="mrplwp | pmcswp" level="any"/>
						<xsl:choose>
									<xsl:when test="string-length(title[1])=0">
									<xsl:text disable-output-escaping="no">&#x2002;Mandatory Replacement Parts</xsl:text>
									</xsl:when>
									<xsl:otherwise>
									<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
										<xsl:value-of select="title"/>
									</xsl:otherwise>
								</xsl:choose>
						
					</fo:block>
				</fo:table-caption>
				
				<fo:table width="7in" border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt" font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after="12pt" space-after.conditionality="discard" space-before="12pt" space-before.conditionality="discard" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve" id="{generate-id(.)}" inline-progression-dimension="100%">
					<fo:table-column column-number="1" column-width="7%"/>
					<fo:table-column column-number="2" column-width="20%"/>
					<fo:table-column column-number="3" column-width="21%"/>
					<fo:table-column column-number="4" column-width="45%"/>
					<fo:table-column column-number="5" column-width="7%"/>
					<xsl:call-template name="MRPL-HEADER"/>
					<fo:table-body>
						<xsl:choose>					
					<xsl:when test="mrpl-category">
						<xsl:apply-templates select="mrpl-category"/>
							</xsl:when>
							<xsl:otherwise>
						<xsl:apply-templates select="mrpl-entry"/>
						</xsl:otherwise>
						</xsl:choose>
					</fo:table-body>
				</fo:table>
				
			</fo:table-and-caption>
	</fo:block>
	</xsl:template>
	<!--
PROCEDURE MPRL-HEADER 
-->
	
	<xsl:template name="MRPL-HEADER">

		<fo:table-header>
			<fo:table-row border-after-style="solid" border-after-width="1pt" font-weight="bold">
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="1" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block span="all" text-align="center">ITEM</fo:block>
					<fo:block text-align="center">NO.</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="2" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block span="all" text-align="center">PART NUMBER/</fo:block>
					<fo:block text-align="center">(CAGEC)</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="3" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block span="all" text-align="center">NATIONAL STOCK</fo:block>
					<fo:block>NUMBER (NSN)</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="4" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block span="all" text-align="center">NOMENCLATURE</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="5" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block>QTY</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<!--
ELEMENTmrpl-category 
-->
	<xsl:template match="mrpl-category">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-row vertical-align="middle" keep-together.within-page="always">
			<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-top-style="solid" border-top-width="0.75pt" number-columns-spanned="5" padding="4pt" vertical-align="middle">
				<fo:block font-weight="bold" margin-bottom="3pt" margin-top="3pt" text-align="center" vertical-align="middle">
					<xsl:value-of disable-output-escaping="no" select="title"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:apply-templates select="mrpl-entry"/>
	</xsl:template>
	
	<!--
ELEMENTmrpl-entry 
-->
	<xsl:template match="mrpl-entry">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-row padding-after="4pt" padding-before="4pt" keep-together.within-page="always">
			<xsl:apply-templates select="node()"/>
		</fo:table-row>
	</xsl:template>
	<!--
ELEMENTpartno 
-->
	<xsl:template match="mrpl-entry/partno">
				<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt">
			<fo:block>
				<xsl:apply-templates select="node()">
</xsl:apply-templates>
			</fo:block>
			<fo:block>
				<xsl:text disable-output-escaping="no"> </xsl:text>
				<xsl:value-of disable-output-escaping="no" select="../cageno"/>
				<xsl:text disable-output-escaping="no"> </xsl:text>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENTnsn 
-->
	<xsl:template match="mrpl-entry/cageno"/>
	<!--
ELEMENTnsn 
-->
	<xsl:template match="mrpl-entry/nsn">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt">
			<fo:block>
				<xsl:call-template name="NSN-VALUE">
										<xsl:with-param name="Fsc" select="fsc"/>
					<xsl:with-param name="Niin" select="niin"/>
				</xsl:call-template>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENTname
-->
	<xsl:template match="mrpl-entry/name ">
	<xsl:call-template name="CHANGEBAR"/>
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-right="4pt" text-align="left">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENTitemno |qty
-->
	<xsl:template match="mrpl-entry/itemno | mrpl-entry/qty">
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-right="4pt" text-align="center">
			<fo:block>
			<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	</xsl:stylesheet>