<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="pmc">
	<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="PMC-HEADER">
		<fo:table-header font-weight="bold" text-align="center" vertical-align="bottom">
			<fo:table-row>
				<fo:table-cell font-family="sans-serif" font-size="10pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>ITEM</fo:block>
					<fo:block>NO.</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-top="3pt" padding-bottom="3pt"/>
				<fo:table-cell font-family="sans-serif" font-size="10pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>PROCEDURE</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
<!-- END [pmctable table...mil-std-40051-2C]-->
	<!--#######################################################################################################-->

	<xsl:template name="pmc-TABLE_ROW">
		<xsl:if test="specpara">
			<fo:table-row>
				<fo:table-cell column-number="1"/>
				<fo:table-cell column-number="2" padding-top="12pt" padding-bottom="6pt">
					<xsl:apply-templates select="child::eqpnotavail/trim.para"/>
				</fo:table-cell>
				<fo:table-cell column-number="3" padding-top="12pt" padding-bottom="6pt" padding-right="4pt" padding-left="4pt">
					<xsl:apply-templates select="child::specpara/warning | child::specpara/caution | child::specpara/note"/>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
		<xsl:for-each select=".">
			<fo:table-row>
				<fo:table-cell column-number="1"/>
				<fo:table-cell column-number="2" padding-top="2mm" padding-bottom="2mm">
					<xsl:apply-templates select="child::eqpnotavail/trim.para"/>
				</fo:table-cell>
				<fo:table-cell column-number="3" padding="2mm">
					<xsl:apply-templates select="child::para[1] | child::specpara/para[1]"/>
				</fo:table-cell>
			</fo:table-row>
		</xsl:for-each>
		<xsl:if test="child::para/descendant::figure | child::specpara/child::para/child::figure">
			<fo:table-row>
				<fo:table-cell column-number="1"/>
				<fo:table-cell column-number="2" padding-top="2mm" padding-bottom="2mm">
				</fo:table-cell>
				<fo:table-cell column-number="3" padding="2mm">
					<xsl:apply-templates select="descendant::pmcsstep1[1]/specpara/para | descendant::pmcsstep1[1]/para" mode="pmcs1"/>
					<fo:block text-align="left" space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm">
						<xsl:apply-templates select="child::pmcsproc/pmcsstep1[1]/para/figure | child::pmcsproc/pmcsstep1[1]/specpara/para/figure | child::pmcsproc/pmcspara//figure"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
		<xsl:if test="following-sibling::pmcsproc">
			<fo:table-row>
				<fo:table-cell column-number="1"/>
				<fo:table-cell column-number="2" padding-top="2mm" padding-bottom="2mm">
					<xsl:apply-templates select="child::eqpnotavail/trim.para"/>
				</fo:table-cell>
				<fo:table-cell column-number="3" padding="2mm">
					<xsl:apply-templates select="descendant::pmcsstep1[1]/specpara/para | descendant::pmcsstep1[1]/para" mode="pmcs1"/>
					<fo:block text-align="left" space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm">
						<xsl:apply-templates select="child::pmcsproc/pmcsstep1[1]/para/figure | child::pmcsproc/pmcsstep1[1]/specpara/para/figure | child::pmcsproc/pmcspara//figure"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
