<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!--
ELEMENTtoolidwp
-->
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="toolidwp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="TOOLID-INTRO">
		<xsl:apply-templates mode="TOOLID-INTRO" select="../wpidinfo/title"/>
	</xsl:template>
	<!--
ELEMENTtoolidlist
-->
	<xsl:template match="toolidlist">
		<xsl:param name="tblctr">
			<xsl:number count="toolidlist" format="1." from="toolidwp" level="any"/>
		</xsl:param>
	<fo:block span="all">	
			<fo:table-and-caption hyphenate="true" hyphenation-character="-" hyphenation-keep="column" inline-progression-dimension="100%">
				<fo:table-caption>
					<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" keep-with-previous.within-column="always" keep-with-previous.within-page="always" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center" id="{generate-id(.)}">
						<xsl:text disable-output-escaping="no">Table&#x2002;</xsl:text>
						<xsl:value-of disable-output-escaping="no" select="$tblctr"/>
						<xsl:text >&#x2002;&#x2002;</xsl:text>
								<xsl:choose>
									<xsl:when test="string-length(title[1])=0">
										<xsl:text disable-output-escaping="no">Tool Identification List.</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="title"/>
									</xsl:otherwise>
								</xsl:choose>
					</fo:block>
				</fo:table-caption>
				
				<fo:table border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt" font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after.maximum="12pt" space-after.minimum="12pt" space-after.optimum="12pt" space-before.maximum="14pt" space-before.minimum="12pt" space-before.optimum="12pt" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve" width="7in" inline-progression-dimension="100%">
					<xsl:choose>
						<xsl:when test="tool-entry/extref | tool-category/tool-entry/extref">
							<fo:table-column column-number="1" column-width="7%"/>
							<fo:table-column column-number="2" column-width="37%"/>
							<fo:table-column column-number="3" column-width="18%"/>
							<fo:table-column column-number="4" column-width="18%"/>
							<fo:table-column column-number="5" column-width="20%"/>
						</xsl:when>
						<xsl:otherwise>
							<fo:table-column column-number="1" column-width="7%"/>
							<fo:table-column column-number="2" column-width="53%"/>
							<fo:table-column column-number="3" column-width="20%"/>
							<fo:table-column column-number="4" column-width="20%"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:call-template name="TOOLID-HEADER"/>
					<fo:table-body>
						<xsl:choose>
							<xsl:when test="tool-category">
								<xsl:apply-templates select="tool-category"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="tool-entry"/>
							</xsl:otherwise>
						</xsl:choose>
					</fo:table-body>
				</fo:table>
			
			</fo:table-and-caption>
		</fo:block>
	</xsl:template>
	<!--
PROCEDURE TOOLID-HEADER
-->
	<xsl:template name="TOOLID-HEADER">
		<fo:table-header>
			<fo:table-row font-weight="bold" text-transform="uppercase">
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(1)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Item</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">No.</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(2)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Item Name</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(3)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">National Stock</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Number (NSN) </fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(4)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Part Number/</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">(CAGEC)</fo:block>
				</fo:table-cell>
				<xsl:if test="tool-entry/extref | tool-category/tool-entry/extref">
					<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">(5)</fo:block>
						<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
						<fo:block margin-bottom="3pt" span="all" text-align="center">Reference</fo:block>
					</fo:table-cell>
				</xsl:if>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<!--
ELEMENT tool-category
-->

<xsl:template match="tool-category">
<xsl:call-template name="CHANGEBAR"/>
<xsl:choose>
						<xsl:when test="tool-entry/extref">
		<fo:table-row vertical-align="middle">
			<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-top-style="solid" border-top-width="0.75pt" number-columns-spanned="5" padding="4pt" vertical-align="middle">
				<fo:block font-weight="bold" margin-bottom="3pt" margin-top="3pt" text-align="center" vertical-align="middle">
					<xsl:value-of disable-output-escaping="no" select="title"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		</xsl:when>
		<xsl:otherwise>
		<fo:table-row vertical-align="middle">
			<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-top-style="solid" border-top-width="0.75pt" number-columns-spanned="4" padding="4pt" vertical-align="middle">
				<fo:block font-weight="bold" margin-bottom="3pt" margin-top="3pt" text-align="center" vertical-align="middle">
					<xsl:value-of disable-output-escaping="no" select="title"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="tool-entry"/>
	</xsl:template>
	
	<!--
ELEMENTtool-entry
-->

<xsl:template match="tool-entry">
<xsl:call-template name="CHANGEBAR"/>
		<fo:table-row padding-after="4pt" padding-before="4pt">
			<xsl:apply-templates select="itemno | nsn | name | partno | partcage[1] | extref"/>
		</fo:table-row>
		<xsl:apply-templates mode="TOOL-MOREROWS" select="partcage[position()>1]"/>
	</xsl:template>
	<!--
ELEMENTtool-entry/itemno
-->
	<xsl:template match="tool-entry/itemno">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center">
		<fo:block>
			<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENTtool-entry/name
-->
	<xsl:template match="tool-entry/name">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="tool-entry/nsn">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left">
			<fo:block>
				<xsl:call-template name="NSN-VALUE">
					<xsl:with-param name="Fsc" select="fsc"/>
					<xsl:with-param name="Niin" select="niin"/>
				</xsl:call-template>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="tool-entry/partcage[1]">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left">
	<!--	<xsl:for-each select="uoc">
				<fo:block>
			<xsl:apply-templates select="node()"/>
			</fo:block>
			</xsl:for-each>-->
			<fo:block>
				<xsl:value-of disable-output-escaping="no" select="partno"/>
				<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
			</fo:block>
			<xsl:if test="not(string-length(cageno)=0)">
				<fo:block>
					<xsl:text> (</xsl:text>
					<xsl:value-of disable-output-escaping="no" select="cageno"/>
					<xsl:text>) </xsl:text>
				</fo:block>
			</xsl:if>
		</fo:table-cell>
	<!--	<xsl:apply-templates select="partcage[position()>1]" mode="TOOL-MOREROWS"/>-->
	</xsl:template>
	<!--
ELEMENTtool-entry/partno
-->
	<xsl:template match="tool-entry/partno">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left">
			<fo:block>
				<xsl:value-of disable-output-escaping="no" select="../partno[1]"/>
				<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
			</fo:block>
			<xsl:if test="not(string-length(../cageno)=0)">
				<fo:block>
					<xsl:text> (</xsl:text>
					<xsl:value-of disable-output-escaping="no" select="../cageno[1]"/>
					<xsl:text>) </xsl:text>
				</fo:block>
			</xsl:if>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="partcage" mode="TOOL-MOREROWS">
		<fo:table-row>
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center">
			<fo:block></fo:block>
		</fo:table-cell>
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center"><fo:block></fo:block>
		</fo:table-cell>
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center"><fo:block></fo:block>
		</fo:table-cell>
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left">
				<fo:block>
					<xsl:value-of disable-output-escaping="no" select="partno"/>
					<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
				</fo:block>
				<fo:block>
					<xsl:text disable-output-escaping="no"> (</xsl:text>
					<xsl:value-of disable-output-escaping="no" select="cageno"/>
					<xsl:text disable-output-escaping="no">) </xsl:text>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<!--
ELEMENTtool-entry/nsn
-->
	<!--
ELEMENTtool-entry/extref
-->
	<xsl:template match="tool-entry/extref">
		<fo:table-cell border-left-style="solid" column-number="5" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left">
			<fo:block>
				<xsl:if test="@pretext">
					<xsl:value-of disable-output-escaping="no" select="@pretext"/>
				</xsl:if>
				<xsl:if test="@docno">
					<fo:inline keep-together.within-line="always">
						<xsl:value-of disable-output-escaping="no" select="@docno"/>
					</fo:inline>
				</xsl:if>
				<xsl:if test="@posttext">
					<xsl:value-of disable-output-escaping="no" select="@posttext"/>
				</xsl:if>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
</xsl:stylesheet>
