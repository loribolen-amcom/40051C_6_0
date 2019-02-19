<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="lubetypeswp">
	<xsl:choose>
		<xsl:when test="ancestor::lubeorder">
		<xsl:call-template name="lube-pageset"/>
		</xsl:when>
		<xsl:otherwise>
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
		</xsl:otherwise>
	</xsl:choose>
	</xsl:template>

	<!--
ELEMENT lubetab
-->
	<xsl:template match="lubetab">
					<fo:table-and-caption caption-side="before">
				<fo:table-caption>
					<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" keep-with-previous.within-column="always" keep-with-previous.within-page="always" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center" id="{generate-id(.)}">
						<xsl:text disable-output-escaping="no">Table&#x2002;</xsl:text>
						<xsl:number count="table | lubetab" format="1." from="lubetypeswp" level="any"/>
						<xsl:choose>
						<xsl:when test="string-length(title[1])=0">
							<fo:block span="all" xsl:use-attribute-sets="titlesub">
							<xsl:text>&#x2002;Lubricant Table</xsl:text></fo:block>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>&#x2002;</xsl:text>
							<xsl:value-of select="child::title"/>
						</xsl:otherwise>
				</xsl:choose>
			</fo:block>
		</fo:table-caption>
				<fo:table border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt" font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after="12pt" space-after.conditionality="discard" space-before="12pt" space-before.conditionality="discard" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve">
					<fo:table-column column-number="1" column-width="24%"> </fo:table-column>
					<fo:table-column column-number="2" column-width="38%"> </fo:table-column>
					<fo:table-column column-number="3" column-width="20%"> </fo:table-column>
					<fo:table-column column-number="4" column-width="10%"> </fo:table-column>
					<fo:table-column column-number="5" column-width="8%"> </fo:table-column>
					<xsl:call-template name="LUBETAB-HEADER"/>
					<fo:table-body>
								<xsl:apply-templates select="lubeitem"/>
					</fo:table-body>
				</fo:table>
			</fo:table-and-caption>
	</xsl:template>
	<!--
PROCEDURE 
-->
	<xsl:template name="LUBETAB-HEADER">
		<fo:table-header font-weight="bold">
			<fo:table-row border-after-style="solid" border-after-width="1pt">
				<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="1" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" space-after="4pt" span="all" text-align="center">TEMPERATURE</fo:block>
					<fo:block margin-bottom="3pt" space-after="4pt" text-align="center">RANGE </fo:block>
					<fo:block margin-bottom="3pt" space-after="4pt" text-align="center">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt">&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="2" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block space-after="4pt" span="all" text-align="center">LUBRICANT</fo:block>
					<fo:block margin-bottom="3pt" space-after="4pt" text-align="center">MIL SYMBOL</fo:block>
					<fo:block margin-bottom="3pt">(NATO Code)</fo:block>
					<fo:block margin-bottom="3pt">SPECIFICATION</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="3" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block space-after="4pt" span="all" text-align="center">CAPACITY</fo:block>
					<fo:block space-after="4pt" text-align="center">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt" space-after="4pt" text-align="center">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt">&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="4" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block space-after="4pt" span="all" text-align="center">INTERVAL</fo:block>
					<fo:block margin-bottom="3pt">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt">&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="5" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block space-after="4pt" span="all" text-align="center">MAN-</fo:block>
					<fo:block margin-bottom="3pt" space-after="4pt" text-align="center">HOUR</fo:block>
					<fo:block margin-bottom="3pt">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt">&#x2002;</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	
	
	<xsl:template match="lubeitem">
		<xsl:call-template name="CHANGEBAR"/>
		<fo:table-row padding-after="4pt" padding-before="4pt" >
			<xsl:apply-templates select="node()"/>
		</fo:table-row>
	</xsl:template>
	<!--
ELEMENT lubeitem
-->
	<xsl:template match="lubeitem/temprange[1]">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="lubeitem/lubricant">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt">
			<fo:block>
					<xsl:apply-templates select="node()"></xsl:apply-templates>
				</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<!--
ELEMENT 	lubeitem/capacity
-->
	<xsl:template match="lubeitem/capacity">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center">
			<xsl:apply-templates select="node()"/>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENT lubeitem/interval
-->
	<xsl:template match="lubeitem/interval">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-right="4pt" text-align="center">
			<xsl:apply-templates select="node()"/>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENT lubeitem/manhours
-->
	<xsl:template match="lubeitem/manhours">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-right="4pt" text-align="center">
			<xsl:apply-templates select="node()"/>
		</fo:table-cell>
	</xsl:template>
</xsl:stylesheet>
