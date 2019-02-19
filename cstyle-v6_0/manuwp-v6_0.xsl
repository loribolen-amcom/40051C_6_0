<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="manuwp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
<!--
ELEMENTmrpl-category 
-->
<!--	<xsl:template match="material-list/title">
				<fo:block font-weight="bold" margin-bottom="3pt" margin-top="3pt" text-align="center" vertical-align="middle">
					<xsl:value-of disable-output-escaping="no" select="title"/>
				</fo:block>
	</xsl:template>-->
	
	<xsl:template match="manuitem">
	
		<xsl:apply-templates select="proc | material-list-category | title | warning | note | caution | csi.alert"/>
			
		<!--<fo:block span="all"  id="{generate-id(.)}">
		<xsl:apply-templates select="material-list"/>
		
		</fo:block>-->
		
	</xsl:template>
	<!--
PROCEDURE MANU-HEADER
-->
	
<xsl:template name="MANU-HEADER">

		<fo:table-header>
			<fo:table-row border-after-style="solid" border-after-width="1pt">
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="1" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block span="all" text-align="center">NOMENCLATURE</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>

				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="2" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block span="all" text-align="center">PART</fo:block>
					<fo:block text-align="center">NUMBER/</fo:block>
					<fo:block text-align="center">CAGEC</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="3" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block span="all" text-align="center">NSN</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="4" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block>QTY</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="5" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block span="all" text-align="center">ITEM</fo:block>
					<fo:block text-align="center">NO.</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
<xsl:template match="manuitem/title">
<xsl:apply-templates select="node()"/>
</xsl:template>


	<xsl:template match="material-list-category">
		<fo:table-and-caption>
				<fo:table-caption>
					<fo:block font-family="sanserif" font-size="10pt" font-weight="bold" keep-with-previous.within-column="always" keep-with-previous.within-page="always" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center">
						<xsl:text disable-output-escaping="no">Table&#x2002;</xsl:text>
						<xsl:number count="table | manuitem" format="1." from="manuwp" level="any"/>
						<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
<xsl:choose>
			<xsl:when test="string-length(parent::manuitem/title[1])=0">
			<xsl:text disable-output-escaping="no">MANUFACTURED ITEM MATERIAL LIST</xsl:text>
			</xsl:when>
			<xsl:otherwise><xsl:apply-templates select="parent::manuitem/title"/> </xsl:otherwise>
		</xsl:choose>
		</fo:block>
		</fo:table-caption>
				<fo:table width="7in" border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt" hyphenate="true" hyphenation-character="-" hyphenation-keep="column" text-align="left">
					<fo:table-column column-number="1" column-width="40%"/>
					<fo:table-column column-number="2" column-width="20%"/>
					<fo:table-column column-number="3" column-width="20%"/>
					<fo:table-column column-number="4" column-width="6%"/>
					<fo:table-column column-number="5" column-width="14%"/>
					<xsl:call-template name="MANU-HEADER"/>
					<fo:table-body>
						<xsl:if test="child::title">
						<fo:table-row >
							<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-top-style="solid" border-top-width="0.75pt" number-columns-spanned="5" padding="4pt" vertical-align="middle" column-number="1" >
				<fo:block font-weight="bold" margin-bottom="3pt" margin-top="3pt" text-align="center" vertical-align="middle">
				<!--<xsl:apply-templates select="node()"/>-->
					<xsl:value-of disable-output-escaping="no" select="title"/>
				</fo:block>
			</fo:table-cell>
							</fo:table-row>
							</xsl:if>
							
							<xsl:apply-templates select="material-list"/>
					<!--<xsl:apply-templates select="material-list/name | material-list/partno | material-list/nsn | material-list/qty | material-list/itemref"/>-->
							
					</fo:table-body>
				</fo:table>
			</fo:table-and-caption>
	</xsl:template>
	
	<xsl:template match="material-list">
		<!--<xsl:call-template name="CHANGEBAR"/>-->
		<fo:table-row padding-after="4pt" padding-before="4pt" >
		<xsl:apply-templates select="itemref | nsn | name | maintenance | qty | link | extref"> </xsl:apply-templates>
		<!--<xsl:apply-templates select="node()"/>
			<xsl:apply-templates select="material-list/name"/>
			<xsl:apply-templates select="material-list/partno"/>
			<xsl:apply-templates select="material-list/nsn"/>
			<xsl:apply-templates select="material-list/qty"/>
			<xsl:apply-templates select="material-list/itemref"/>-->
		</fo:table-row>
	</xsl:template>
	<!--	<xsl:template match="material-list/title">

		<fo:table-row>
		<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-top-style="solid" border-top-width="0.75pt" number-columns-spanned="5" padding="4pt" vertical-align="middle" column-number="1" >
				<fo:block font-weight="bold" margin-bottom="3pt" margin-top="3pt" text-align="center" vertical-align="middle">
				<xsl:apply-templates select="node()"/>
					--><!--<xsl:value-of disable-output-escaping="no" select="title"/>--><!--
				</fo:block>
			</fo:table-cell>
</fo:table-row>
	</xsl:template>-->
	
	<xsl:template match="material-list/name">
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-right="4pt" text-align="left" padding-left="4pt" >
			<xsl:call-template name="CHANGEBAR"/>
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="material-list/partno">
	
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-left="4pt"><xsl:call-template name="CHANGEBAR"/>
			<fo:block>
			<xsl:apply-templates select="node()"/>
				<!--<xsl:value-of disable-output-escaping="no" select="material-list/partno"/>-->
			</fo:block>
			<fo:block>
				<xsl:text disable-output-escaping="no">(</xsl:text>
				<xsl:value-of disable-output-escaping="no" select="following-sibling::cageno"/>
				<xsl:text disable-output-escaping="no">)</xsl:text>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="material-list/nsn">
	
	<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-left="4pt"><xsl:call-template name="CHANGEBAR"/>
		<fo:block>
				<xsl:call-template name="NSN-VALUE">
										<xsl:with-param name="Fsc" select="fsc"/>
					<xsl:with-param name="Niin" select="niin"/>
				</xsl:call-template>
			</fo:block>				

		</fo:table-cell>
	</xsl:template>
	<xsl:template match="material-list/qty">
	<xsl:call-template name="CHANGEBAR"/>
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-right="4pt" text-align="center">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
		<xsl:template match="material-list/itemref">
		<xsl:call-template name="CHANGEBAR"/>
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-right="4pt" text-align="center" >
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	</xsl:stylesheet>