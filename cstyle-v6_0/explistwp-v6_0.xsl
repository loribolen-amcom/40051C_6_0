<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!--
ELEMENT explistwp
-->
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="explistwp">
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
ELEMENT explist
-->
	<xsl:template match="explist">
<fo:block span="all">
			<fo:table-and-caption hyphenate="true" hyphenation-character="-" hyphenation-keep="column">
				<fo:table-caption>
					<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" keep-with-previous.within-column="always" keep-with-previous.within-page="always" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center" id="{generate-id(.)}">
						<xsl:text disable-output-escaping="no">Table&#x2002;</xsl:text>
						<xsl:number count="explist" format="1." from="explistwp" level="any"/>
						<xsl:text >&#x2002;&#x2002;</xsl:text>
								<xsl:choose>
									<xsl:when test="string-length(title[1])=0">
										<xsl:text disable-output-escaping="no">Expendable and Durable Items List.</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="title"/>
									</xsl:otherwise>
								</xsl:choose>
					</fo:block>
				</fo:table-caption>
				
				<fo:table border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt" font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after="12pt" space-after.conditionality="discard" space-before="12pt" space-before.conditionality="discard" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve" inline-progression-dimension="100%">
					<fo:table-column column-number="1" column-width="10%"/>
					<fo:table-column column-number="2" column-width="9%"/>
					<fo:table-column column-number="3" column-width="17%"/>
					<fo:table-column column-number="4" column-width="48%"/>
					<fo:table-column column-number="5" column-width="16%"/>
					<xsl:call-template name="EXPLIST-HEADER"/>
					<fo:table-body>
						<xsl:choose>
							<xsl:when test="expdur-category">
								<xsl:apply-templates select="expdur-category"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="expdur-entry"/>
							</xsl:otherwise>
						</xsl:choose>
					</fo:table-body>
				</fo:table>
				
			</fo:table-and-caption>
</fo:block>
	</xsl:template>
	<!--
PROCEDURE EXPLIST-HEADER
-->
	<xsl:template name="EXPLIST-HEADER">
		<fo:table-header font-weight="bold">
			<fo:table-row>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="1" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(1)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">ITEM</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">NUMBER</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="2" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(2)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">LEVEL</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="3" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(3)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">NATIONAL</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">STOCK</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">NUMBER (NSN)</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="4" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(4)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">ITEM NAME, DESCRIPTION, </fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">PART NUMBER AND (CAGEC)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="5" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(5)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">U/I</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<!--
ELEMENT expdur-category
-->
	<xsl:template match="expdur-category">
		<!--<xsl:call-template name="CHANGEBAR"/>-->
		<fo:table-row vertical-align="middle" keep-together.within-page="always">
		<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-top-style="solid" border-top-width="0.75pt" number-columns-spanned="5" padding="4pt" vertical-align="middle">
				<fo:block font-weight="bold" margin-bottom="3pt" margin-top="3pt" text-align="center" vertical-align="middle">
				<xsl:call-template name="CHANGEBAR"/>
					<xsl:value-of disable-output-escaping="no" select="title"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:apply-templates select="expdur-entry"/>
	</xsl:template>
	<!--
ELEMENT expdur-entry
-->
	<xsl:template match="expdur-entry">
		<!--<xsl:call-template name="CHANGEBAR"/>-->
		<fo:table-row padding-after="4pt" padding-before="4pt" keep-together.within-page="always">
			<xsl:apply-templates select="itemno | nsn | name | maintenance | ui"> </xsl:apply-templates>
		</fo:table-row>
	</xsl:template>
	<!--
ELEMENT expdur-entry
itemno
-->
	<xsl:template match="expdur-entry/itemno">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center">
			<fo:block><xsl:call-template name="CHANGEBAR"/>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENT expdur-entry
maintenance
-->
	<xsl:template match="expdur-entry/maintenance">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center" text-transform="uppercase">
			<fo:block><xsl:call-template name="CHANGEBAR"/>
				<xsl:value-of disable-output-escaping="no" select="@lvl"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENT expdur-entry
nsn
-->
	<xsl:template match="expdur-entry/nsn">
	<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left">
			<fo:block><xsl:call-template name="CHANGEBAR"/>
				<xsl:call-template name="NSN-VALUE">
					<xsl:with-param name="Fsc" select="fsc"/>
					<xsl:with-param name="Niin" select="niin"/>
				</xsl:call-template>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENT expdur-entry
name
-->
	<xsl:template match="expdur-entry/name">
	<!--<xsl:call-template name="CHANGEBAR"/>-->
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left">
			<fo:block><xsl:call-template name="CHANGEBAR"/>
				<xsl:apply-templates select="node()"/>
				<xsl:text disable-output-escaping="no">: </xsl:text>
				<xsl:apply-templates select="../desc"/>
			</fo:block>
			<fo:block>
				<xsl:text disable-output-escaping="no"> </xsl:text>
				<xsl:value-of disable-output-escaping="no" select="../partno"/>
				<xsl:text disable-output-escaping="no"> &#x2002; </xsl:text>
				<xsl:if test="not(string-length(../cageno)=0)">
					<xsl:text> (</xsl:text><xsl:value-of disable-output-escaping="no" select="../cageno[1]"/><xsl:text>) </xsl:text>
				</xsl:if>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENT expdur-entry
desc
-->
	<xsl:template match="expdur-entry/desc">
	<!--<xsl:call-template name="CHANGEBAR"/>-->
		
			<xsl:apply-templates select="node()"/>
<!--	<fo:block>	</fo:block>-->
	</xsl:template>
	<!--
ELEMENT expdur-entry
ui
-->
	<xsl:template match="expdur-entry/ui">
		<fo:table-cell column-number="5" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center">
			<fo:block>
			<xsl:call-template name="CHANGEBAR"/>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
</xsl:stylesheet>
