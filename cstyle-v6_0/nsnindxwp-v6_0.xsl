<?xml version="1.0" encoding="utf-8"?>
<!-- Fragment document type declaration subset:
	Arbortext, Inc., 1988-2005, v.4002
	<!DOCTYPE xsl:stylesheet>
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="nsnindx">
			<fo:table border-left-style="solid" border-left-width="1pt" border-right-style="solid" border-right-width="1pt" border-bottom="solid" border-bottom-width="1pt" border-top="solid" border-top-width="1pt" font-family="sans-serif" font-size="10pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after="12pt" space-before="14pt" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve">
				<fo:table-column column-number="1" column-width="60%"/>
				<fo:table-column column-number="2" column-width="20%"/>
				<fo:table-column column-number="3" column-width="20%"/>
				<xsl:call-template name="NSNINDX-HEADER"/>
				<fo:table-body>
					<xsl:apply-templates select="nsnindxrow"/>
				</fo:table-body>
			</fo:table>
	</xsl:template>
	<xsl:template name="NSNINDX-HEADER">
		<fo:table-header>
			<fo:table-row display-align="after" font-weight="bold" keep-together.within-page="always">
				<fo:table-cell border-bottom="solid" border-bottom-width="1pt" column-number="1" padding-bottom="8pt" padding-top="8pt" text-align="left">
					<fo:block span="none">STOCK NUMBER</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width="1pt" column-number="2" padding-bottom="8pt" padding-top="8pt" text-align="right">
					<fo:block span="none">FIG.</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width="1pt" column-number="3" padding-bottom="8pt" padding-top="8pt" text-align="right">
					<fo:block span="none">ITEM</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<xsl:template match="nsnindxrow">
		<fo:table-row>
			<xsl:apply-templates select="nsn"/>
			<xsl:apply-templates select="callout[1]"/>
		</fo:table-row>
		<xsl:apply-templates select="callout[position()>1]"> </xsl:apply-templates>
	</xsl:template>
	<xsl:template match="nsnindxrow/nsn">
		<fo:table-cell padding-top="6pt" border-right-style="solid" border-right-width=".5pt" padding-after="3pt">
			<fo:block>
				<xsl:call-template name="NSN-VALUE">
					<xsl:with-param name="Fsc" select="fsc"/>
					<xsl:with-param name="Niin" select="niin"/>
				</xsl:call-template>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="nsnindxrow/callout[1]">
		<xsl:call-template name="FIG-ITEM"> </xsl:call-template>
	</xsl:template>
	<xsl:template match="nsnindxrow/callout[position()>1]">
		<fo:table-row>
			<fo:table-cell padding-top="6pt" border-right-style="solid" border-right-width=".5pt">&#x2002;</fo:table-cell>
			<xsl:call-template name="FIG-ITEM"> </xsl:call-template>
		</fo:table-row>
	</xsl:template>
	<xsl:template name="FIG-ITEM">
			<fo:table-cell column-number="2" padding-top="6pt" text-align="right" border-right-style="solid" border-right-width=".5pt">
			<fo:block>
				<fo:basic-link internal-destination="{@assocfig}">
					<xsl:for-each select="id(@assocfig)">
						<xsl:choose>
							<xsl:when test="ancestor::bulk_itemswp">
				<xsl:text>BULK</xsl:text>
							</xsl:when>
								<xsl:otherwise>
						<xsl:number count="figure" format="1 " from="//pim" level="any"/>
						    </xsl:otherwise>
						    </xsl:choose>
					</xsl:for-each>
				</fo:basic-link>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-top="6pt" text-align="right" border-right-style="solid" border-right-width=".5pt">
			<fo:block>
				<xsl:choose>
					<xsl:when test="@label">
				<xsl:value-of disable-output-escaping="no" select="@label"/>
					</xsl:when>
					<xsl:when test="@numref"></xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="id(@assocfig)">
								<xsl:if test="ancestor::bulk_itemswp">
				<xsl:number count="pi.item" format="1" from="//bulk_itemswp" level="any"/>
								</xsl:if>
						</xsl:for-each>
				  </xsl:otherwise>
				 </xsl:choose>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
</xsl:stylesheet>
