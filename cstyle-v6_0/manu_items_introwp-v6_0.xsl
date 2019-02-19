<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="manu_items_introwp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="manuindx"><!--span="all"-->
			<fo:table-and-caption span="all" > <!-- need span all for table to display correctly -->
				<fo:table-caption>
					<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" keep-with-next.within-column="always" keep-with-next.within-page="always" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center">
						<xsl:value-of disable-output-escaping="no" select="title"/>
					</fo:block>
				</fo:table-caption>
				<fo:table border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt" font-family="sans-serif" font-size="10pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" space-after.maximum="12pt" space-after.minimum="12pt" space-after.optimum="12pt" space-before.maximum="14pt" space-before.minimum="12pt" space-before.optimum="12pt" width="7in" table-layout="fixed"  text-align="left" hyphenate="true" hyphenation-character="-" hyphenation-keep="column" table-omit-header-at-break="false">
					<xsl:choose>
						<xsl:when test="descendant::partdesc">
							<fo:table-column column-number="1" column-width="20%"/>
							<fo:table-column column-number="2" column-width="25%"/>
							<fo:table-column column-number="3" column-width="30%"/>
							<fo:table-column column-number="4" column-width="25%"/>
						</xsl:when>
						<xsl:otherwise>
							<fo:table-column column-number="1" column-width="20%"/>
							<fo:table-column column-number="2" column-width="15%"/>
							<fo:table-column column-number="3" column-width="20%"/>
							<fo:table-column column-number="4" column-width="45%"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:call-template name="MANUINDX-HEADER"/>
					<fo:table-body>
							<xsl:apply-templates select="partdesc"/>
					</fo:table-body>
				</fo:table>
				</fo:table-and-caption>
	</xsl:template>
	<xsl:template name="MANUINDX-HEADER">
		<fo:table-header display-align="after" font-weight="bold" text-align="center">
			<fo:table-row border-bottom="solid" border-top="solid" border-top-width=".5pt" border-bottom-width=".5pt" keep-together.within-page="always">
				<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-right-style="solid" border-right-width=".5pt" column-number="1" padding-bottom="4pt" padding-top="4pt">
					<fo:block span="all" text-align="center">PART</fo:block>
					<fo:block text-align="center">NUMBER/</fo:block>
					<fo:block text-align="center">CAGEC</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-right-style="solid" border-right-width=".5pt" column-number="2" padding-bottom="4pt" padding-top="4pt">
					<fo:block span="all">
						<xsl:text disable-output-escaping="no">DRAWING NUMBER</xsl:text>
					</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-right-style="solid" border-right-width=".5pt" column-number="3" padding-bottom="4pt" padding-top="4pt">
					<fo:block span="all">
						<xsl:text disable-output-escaping="no">NAME</xsl:text>
					</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width=".5pt" border-right-style="solid" border-right-width=".5pt" column-number="4" padding-bottom="4pt" padding-top="4pt">
					<fo:block span="all">
						<xsl:text disable-output-escaping="no">WORK PACKAGE </xsl:text>
					</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>

	<xsl:template match="partdesc">
		<fo:table-row>
		<xsl:apply-templates select="node()"/>
			<!--<xsl:apply-templates select="partdesc/partno"/>
			<xsl:apply-templates select="partdesc/dwgno"/>
			<xsl:apply-templates select="partdesc/name"/>-->
		<xsl:if test="local-name(following-sibling::node()[position()=1])='wpref'">
			<xsl:apply-templates select="following-sibling::wpref[1]"/>
		</xsl:if>
		</fo:table-row>
		
	</xsl:template>
	
	<xsl:template match="partdesc/partno">
		<fo:table-cell border-right-style="solid" border-right-width=".5pt" column-number="1" padding-bottom="5pt" padding-top="5pt" text-align="center">
			<fo:block span="all">
				<xsl:apply-templates select="node()"/>
			</fo:block>
			<fo:block>
				<xsl:text disable-output-escaping="no">(</xsl:text>
				<xsl:value-of disable-output-escaping="no" select="following-sibling::cageno"/>
				<xsl:text disable-output-escaping="no">)</xsl:text>
			</fo:block>
			<!--<fo:block>
				<xsl:text>(</xsl:text>
				<xsl:value-of disable-output-escaping="no" select="following-sibling::cageno[1]"/>
				<xsl:text>)</xsl:text>
			</fo:block>-->
		</fo:table-cell>
	</xsl:template>

	<!--<xsl:template match="partdesc/cageno" mode="manu">

				<xsl:apply-templates select="node()"/>
	
	</xsl:template>-->
	
	
	<xsl:template match="partdesc/dwgno">
		<fo:table-cell border-right-style="solid" border-right-width=".5pt" column-number="2" padding-bottom="5pt" padding-top="5pt" text-align="center">
			<fo:block span="all">
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="partdesc/name">
		<fo:table-cell border-right-style="solid" border-right-width=".5pt" column-number="3" padding-bottom="5pt" padding-top="5pt" text-align="center">
			<fo:block span="all">
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="wpref">
		<fo:table-cell border-right-style="solid" border-right-width=".5pt" column-number="4" padding-bottom="5pt" padding-top="5pt" text-align="center">
			<fo:block span="all">
				<xsl:for-each select="id(@idref)">
					<xsl:text>WP&#x2002;</xsl:text>
					<xsl:choose>
						<xsl:when test="@wpseq">
							<xsl:value-of select="@wpseq"/>
						</xsl:when>
						<xsl:otherwise>
    					<xsl:variable name="majorNo" select="count(preceding::*[wpidinfo and not(@insertwp)])"/>
							<xsl:choose>
    						<xsl:when test="@insertwp">
    <xsl:variable name="minorNo" select="count(preceding::*[wpidinfo and @insertwp and count(preceding::*[wpidinfo and not(@insertwp)]) = $majorNo]) + 1"/>
									<xsl:number format="0000" value="number($majorNo)"/>
    							<xsl:text>.</xsl:text>
    							<xsl:value-of select="$minorNo"/>
    						</xsl:when>
    						<xsl:otherwise>
									<xsl:number format="0000" value="number($majorNo + 1)"/>
      					</xsl:otherwise>
    					</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	
	<xsl:template match="partdesc" mode="partdesc-MOREROWS">
		<fo:table-row>
			<xsl:apply-templates select="partdesc"/>
		</fo:table-row>
	</xsl:template>
</xsl:stylesheet>
