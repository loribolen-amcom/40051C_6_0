<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="br">
		<fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<xsl:text>&#x2003;</xsl:text>
		</fo:block>
	</xsl:template>
	<xsl:template match="pi.category">
		<fo:block-container hyphenate="true" hyphenation-character="-" hyphenation-keep="column">
			<xsl:choose>
				<xsl:when test="figure[1]">
					<fo:block span="all" page-break-after="always" page-break-before="always">
						<xsl:apply-templates select="figure"/>
					</fo:block>
				</xsl:when>
				<xsl:when test="not(figure[1])">
					<fo:block span="all" page-break-after="always">
						<xsl:apply-templates select="figure"/>
					</fo:block>
				</xsl:when>
				<xsl:when test="(not(figure[1]) and (following-sibling::pi.item)) ">
					<fo:block span="all" page-break-after="always" page-break-before="right">
						<xsl:apply-templates select="figure"/>
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>&#x2002;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<fo:block span="all" page-break-before="always" page-break-after="always">
				<fo:table border-bottom="solid" border-bottom-width=".5pt" border-top="solid" border-top-width=".5pt" font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="0pt" margin-right="0pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after.maximum="12pt" space-after.minimum="12pt" space-after.optimum="12pt" space-before.maximum="14pt" space-before.minimum="12pt" space-before.optimum="12pt" table-layout="fixed" table-omit-header-at-break="true" table-omit-footer-at-break="true" text-align="left" white-space-treatment="preserve" hyphenate="true" hyphenation-character="-" hyphenation-keep="column" border="1pt" width="7in">
					<xsl:choose>
						<xsl:when test="(parent::plwp/@marines='yes' or parent::plwp/@airforce='yes' or parent::plwp/@navy='yes' or parent::stlwp/@airforce='yes' or parent::stl_partswp/@airforce='yes' or parent::kitswp/@airforce='yes' or parent::plwp/@marines='yes' or parent::stlwp/@marines='yes' or parent::stl_partswp/@marines='yes' or parent::kitswp/@marines='yes' or parent::plwp/@navy='yes' or parent::stlwp/@navy='yes' or parent::stl_partswp/@navy='yes' or parent::kitswp/@navy='yes')">
							<fo:table-column column-number="1" column-width="7%"/>
							<fo:table-column column-number="2" column-width="7%"/>
							<!--  Multi Service SMR Codes -->
							<fo:table-column column-number="3" column-width="7%"/>
							<fo:table-column column-number="4" column-width="7%"/>
							<fo:table-column column-number="5" column-width="7%"/>
							<fo:table-column column-number="6" column-width="16%"/>
							<fo:table-column column-number="7" column-width="8%"/>
							<fo:table-column column-number="8" column-width="11%"/>
							<fo:table-column column-number="9" column-width="18%"/>
							<fo:table-column column-number="10" column-width="5%"/>
							<fo:table-column column-number="11" column-width="7%"/>
							<xsl:call-template name="PI-HEADER-MULTI"/>
						</xsl:when>
						<xsl:otherwise>
							<fo:table-column column-number="1" column-width="9%"/>
							<fo:table-column column-number="2" column-width="9%"/>
							<fo:table-column column-number="3" column-width="19%"/>
							<fo:table-column column-number="4" column-width="9%"/>
							<fo:table-column column-number="5" column-width="17%"/>
							<fo:table-column column-number="6" column-width="30%"/>
							<fo:table-column column-number="7" column-width="7%"/>
							<xsl:call-template name="PI-HEADER"/>
						</xsl:otherwise>
					</xsl:choose>
					<fo:table-body>
						<xsl:choose>
							<!--<xsl:when test="parent::kitswp/@army='yes'">
						<xsl:apply-templates select="fncgrp" />
						<xsl:apply-templates select="pi.item" />
						</xsl:when>-->
							<xsl:when test="(parent::plwp/@airforce='yes' or parent::stlwp/@airforce='yes' or parent::stl_partswp/@airforce='yes' or parent::kitswp/@airforce='yes')">
								<xsl:apply-templates select="fncgrp" mode="MULTISERVICE"/>
								<xsl:apply-templates select="pi.item" mode="MULTISERVICE"/>
							</xsl:when>
							<xsl:when test="(parent::plwp/@marines='yes' or parent::stlwp/@marines='yes' or parent::stl_partswp/@marines='yes' or parent::kitswp/@marines='yes')">
								<xsl:apply-templates select="fncgrp" mode="MULTISERVICE"/>
								<xsl:apply-templates select="pi.item" mode="MULTISERVICE"/>
							</xsl:when>
							<xsl:when test="(parent::plwp/@navy='yes' or parent::stlwp/@navy='yes' or parent::stl_partswp/@navy='yes' or parent::kitswp/@navy='yes')">
								<xsl:apply-templates select="fncgrp" mode="MULTISERVICE"/>
								<xsl:apply-templates select="pi.item" mode="MULTISERVICE"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="fncgrp"/>
								<xsl:apply-templates select="pi.item"/>
							</xsl:otherwise>
						</xsl:choose>
					</fo:table-body>
					<fo:table-body>
					<xsl:choose>
							<xsl:when test="(parent::plwp/@airforce='yes' or parent::stlwp/@airforce='yes' or parent::stl_partswp/@airforce='yes' or parent::kitswp/@airforce='yes')">
							<fo:table-row>
							<fo:table-cell number-columns-spanned="9">
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
							<fo:table-row>
							<fo:table-cell column-number="9">
							<fo:block space-after="12pt" text-align="left" >END OF FIGURE</fo:block>
							</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
							<fo:table-cell number-columns-spanned="9">
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
							</xsl:when>
							<xsl:when test="(parent::plwp/@marines='yes' or parent::stlwp/@marines='yes' or parent::stl_partswp/@marines='yes' or parent::kitswp/@marines='yes')">
							<fo:table-row>
							<fo:table-cell number-columns-spanned="9">
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
							<fo:table-row>
							<fo:table-cell column-number="9">
							<fo:block space-after="12pt" text-align="left" >END OF FIGURE</fo:block>
							</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
							<fo:table-cell number-columns-spanned="9">
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
							</xsl:when>
							<xsl:when test="(parent::plwp/@navy='yes' or parent::stlwp/@navy='yes' or parent::stl_partswp/@navy='yes' or parent::kitswp/@navy='yes')">
							<fo:table-row>
							<fo:table-cell number-columns-spanned="9">
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
							<fo:table-row>
							<fo:table-cell column-number="9">
							<fo:block space-after="12pt" text-align="left" >END OF FIGURE</fo:block>
							</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
							<fo:table-cell number-columns-spanned="9">
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
							</xsl:when>
						
						
							<xsl:otherwise>
							<fo:table-row>
							<fo:table-cell number-columns-spanned="6">
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
							<fo:table-row>
							<fo:table-cell column-number="6">
							<fo:block space-after="12pt" text-align="left">END OF FIGURE</fo:block>
							</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
							<fo:table-cell number-columns-spanned="6">
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
							</xsl:otherwise>
							
							</xsl:choose>
					</fo:table-body>
					
				</fo:table>
				<!--<xsl:text>&#x2003;</xsl:text>
				<xsl:text>&#x2003;</xsl:text>-->
			</fo:block>
		</fo:block-container>
	</xsl:template>
	<xsl:template name="PI-HEADER">
		<fo:table-header>
			<fo:table-row>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="left" column-number="1">
					<fo:block span="all">(1)</fo:block>
					<fo:block span="all">ITEM</fo:block>
					<fo:block span="all">NO.</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="left" column-number="2">
					<fo:block span="all">(2)</fo:block>
					<fo:block span="all">SMR</fo:block>
					<fo:block span="all">CODE</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="center" column-number="3">
					<fo:block span="all">(3)</fo:block>
					<fo:block span="all">&#x2002;</fo:block>
					<fo:block span="all">NSN</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="left" column-number="4">
					<fo:block span="all">(4)</fo:block>
					<fo:block span="all">&#x2002;</fo:block>
					<fo:block span="all">CAGEC</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="left" column-number="5">
					<fo:block span="all">(5)</fo:block>
					<fo:block span="all">PART</fo:block>
					<fo:block span="all">NUMBER</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="left" column-number="6">
					<fo:block span="all">(6)</fo:block>
					<fo:block span="all">DESCRIPTION AND USABLE ON</fo:block>
					<fo:block span="all">CODE (UOC)</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="left" column-number="7">
					<fo:block span="all" text-align="right">(7)</fo:block>
					<fo:block span="all" text-align="right">&#x2002;</fo:block>
					<fo:block span="all" text-align="right">QTY</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<xsl:template name="PI-HEADER-MULTI">
		<fo:table-header>
			<fo:table-row>
				<fo:table-cell border-left="solid" border-left-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="center" column-number="1">
					<fo:block span="all">(1)</fo:block>
					<fo:block span="all">ITEM</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="center" column-number="2" number-columns-spanned="4" border-bottom="solid" border-bottom-width=".5pt">
					<fo:block span="all">(2)</fo:block>
					<fo:block span="all">SMR CODE</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="center" column-number="6">
					<fo:block span="all">(3)</fo:block>
					<fo:block span="all">NSN</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="center" column-number="7">
					<fo:block span="all">(4)</fo:block>
					<fo:block span="all">CAGEC</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="center" column-number="8">
					<fo:block span="all">(5)</fo:block>
					<fo:block span="all">PART</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="center" column-number="9">
					<fo:block span="all">(6)</fo:block>
					<fo:block span="all">DESCRIPTION AND </fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="center" column-number="10">
					<fo:block span="all" text-align="right">(7)</fo:block>
					<fo:block span="all" text-align="right">QTY</fo:block>
				</fo:table-cell>
				<fo:table-cell display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="center" column-number="11" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt">
					<fo:block>(8)</fo:block>
					<fo:block>USMC</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<!-- ROW for SMR CODES -->
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" text-align="center">
					<fo:block span="all">NO.</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell text-align="center" border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" column-number="2">
					<fo:block>a.</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>ARMY</fo:block>
				</fo:table-cell>
				<fo:table-cell text-align="center" border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" column-number="3">
					<fo:block>b.</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>AF</fo:block>
				</fo:table-cell>
				<fo:table-cell text-align="center" border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" padding-bottom="4pt" padding-top="4pt">
					<fo:block>c.</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>NAVY</fo:block>
				</fo:table-cell>
				<fo:table-cell text-align="center" border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="5" padding-bottom="4pt" padding-top="4pt">
					<fo:block>d.</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>USMC</fo:block>
				</fo:table-cell>
				<!--	NSN	-->
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="6" padding-bottom="4pt" padding-top="4pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<!--	CAGEC	-->
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="7" padding-bottom="4pt" padding-top="4pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="8" padding-bottom="4pt" padding-top="4pt" text-align="center">
					<fo:block span="all">NUMBER</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="9" padding-bottom="4pt" padding-top="4pt" text-align="center">
					<fo:block span="all">USABLE ON CODE (UOC)</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="10" padding-bottom="4pt" padding-top="4pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="11" padding-bottom="4pt" padding-top="4pt" text-align="center">
					<fo:block>QTY</fo:block>
					<fo:block>PER</fo:block>
					<fo:block>EQUIP</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<xsl:template match="kititem">
	<fo:block>
		<xsl:apply-templates mode="KITS"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="name" mode="KITS">
		<xsl:value-of select="name"/>
	</xsl:template>
	<xsl:template match="qty" mode="KITS">
		<xsl:text>(</xsl:text>
		<xsl:value-of select="qty"/>
		<xsl:text>)&#x2003;</xsl:text>
	</xsl:template>
	<xsl:template match="callout" mode="KITS">
		<xsl:apply-templates mode="KITS" select="id(@assocfig)"> </xsl:apply-templates>
		<xsl:text>&#x2013;</xsl:text>
		<xsl:value-of select="callout/@label"/>
	</xsl:template>
	<xsl:template match="figure" mode="KITS">
		<xsl:choose>
			<xsl:when test="kititem/@label">
				<xsl:value-of select="kititem/@label"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:number count="figure" from="//pim" level="any"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="fncgrp" mode="MULTISERVICE">
		<fo:table-row>
			<fo:table-cell column-number="9" padding-after="3pt" padding-before="1pt" padding-top="3pt">
				<xsl:apply-templates select="fnccode"/>
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<fo:table-cell column-number="9" padding-after="3pt" padding-before="1pt">
				<fo:list-block provisional-distance-between-starts="4pc" provisional-label-separation="3pt" space-after="8pt">
					<fo:list-item>
						<fo:list-item-label end-indent="label-end()">
							<fo:block>
								<xsl:text>FIGURE </xsl:text>
								<xsl:number count="figure" from="//pim" level="any"/>
							</fo:block>
						</fo:list-item-label>
						<fo:list-item-body start-indent="body-start()">
							<fo:block>
								<xsl:apply-templates select="../figure/title"/>
							</fo:block>
						</fo:list-item-body>
					</fo:list-item>
				</fo:list-block>
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<fo:table-cell column-number="9" padding-after="2pt" padding-before="1pt">
				<xsl:apply-templates select="partno"/>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="fncgrp">
		<fo:table-row>
			<fo:table-cell column-number="6" padding-after="3pt" padding-before="1pt" padding-top="3pt">
				<xsl:apply-templates select="fnccode"/>
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<fo:table-cell column-number="6" padding-after="3pt" padding-before="1pt">
			<fo:block>
				<fo:list-block provisional-distance-between-starts="4pc" provisional-label-separation="3pt" space-after="8pt">
					<fo:list-item >
						<fo:list-item-label end-indent="label-end()">
							<fo:block>
								<xsl:text>FIGURE </xsl:text>
								<xsl:number count="figure" from="//pim" level="any"/>
							</fo:block>
						</fo:list-item-label>
						<fo:list-item-body start-indent=" body-start()">
							<fo:block>
								<xsl:apply-templates select="../figure/title"/>
							</fo:block>
						</fo:list-item-body>
					</fo:list-item>
				</fo:list-block>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<fo:table-cell column-number="6" padding-after="2pt" padding-before="1pt">
			<fo:block>
				<xsl:apply-templates select="partno"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="fnccode">
		<fo:list-block provisional-distance-between-starts="4pc" provisional-label-separation="3pt" space-after="8pt">
			<fo:list-item>
				<fo:list-item-label end-indent="label-end()">
					<fo:block>
						<xsl:text>GROUP </xsl:text>
					</fo:block>
				</fo:list-item-label>
				<fo:list-item-body start-indent="body-start()">
					<fo:block>
						<xsl:value-of select="node()"/>
						<xsl:text> </xsl:text>
							<xsl:apply-templates select="following-sibling::fnctitle"/>
					</fo:block>
				</fo:list-item-body>
			</fo:list-item>
		</fo:list-block>
	</xsl:template>
	<xsl:template match="fnctitle">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="fncgrp/partno">
		<fo:list-block provisional-distance-between-starts="4pc" provisional-label-separation="3pt" space-after="8pt">
			<fo:list-item>
				<fo:list-item-label end-indent="label-end()">
					<fo:block>
						<xsl:text>PART NO </xsl:text>
					</fo:block>
				</fo:list-item-label>
			<fo:list-item-body start-indent="body-start()">
					<fo:block>
						<xsl:apply-templates/>
					</fo:block>
				</fo:list-item-body>
			</fo:list-item>
		</fo:list-block>
	</xsl:template>
	<xsl:template match="pi.category//figref">
		<fo:block>
			<xsl:apply-templates mode="PartList" select="id(@idref)"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="title" mode="PartList">
	<fo:block>
		<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="pi.item">
		<xsl:choose>
		<xsl:when test="child::common_part_ref">
		<fo:table-row padding-after="4pt" padding-before="4pt" relative-position="relative">
				<xsl:apply-templates select="common_part_ref"/>
			</fo:table-row>
		</xsl:when>
	<xsl:otherwise>
		<fo:table-row padding-after="4pt" padding-before="4pt" relative-position="relative">
			<xsl:apply-templates select="nha_item"/>
			<xsl:apply-templates select="callout[1]"/> <!-- allowed multiple, used in IETMs, so must have [1] for pdf to compose -->
			<xsl:apply-templates select="smr[@service='army'][1] | smr[@service=''][1]"/>
			<xsl:apply-templates select="nsn"/>
			<xsl:apply-templates select="cageno"/>
			<xsl:apply-templates select="partno"/>
			<xsl:apply-templates select="desc"/>
			<xsl:apply-templates select="uoc"/>
			<xsl:apply-templates select="qty"/>
			<!--		<xsl:apply-templates select="refdes"/>
			<xsl:apply-templates select="boi"/>
			<xsl:apply-templates select="usbefserno"/>-->
			<xsl:apply-templates select="maintenance" mode="pi.item"/>
		</fo:table-row>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
	
	<xsl:template match="part.breakdown.ref">
<!--			<xsl:if test="id(@idref)">
				<xsl:text>See &#x2023; </xsl:text>
				<xsl:value-of select="id(@idref) /callout/@label"/>
			</xsl:if>-->
			<xsl:text>See &#x2023; </xsl:text>
			<fo:basic-link internal-destination="{@idref}">
					<xsl:choose>
					<xsl:when test="@figtype = 'fo-rear'">
					  <xsl:text>FO&#x2013;</xsl:text>
					  <xsl:number count="figure[@figtype='fo-rear']" format="1." from="production" level="any"/>
					</xsl:when>
					<xsl:otherwise>
					<xsl:text disable-output-escaping="no">Figure&#x2002;</xsl:text>
					<xsl:number count="figure[@figtype='normal-page'][not(parent::figure-alt)]|figure-alt" format="1" from="//pim" level="any"/>
					</xsl:otherwise>
					</xsl:choose>	
			</fo:basic-link>
			
	</xsl:template>

	<xsl:template match="pi.item" mode="MULTISERVICE">
	<xsl:choose>
		<xsl:when test="child::common_part_ref">
		<fo:table-row padding-after="4pt" padding-before="4pt">
				<xsl:apply-templates select="common_part_ref" mode="MULTISERVICE"/>
			</fo:table-row>
		</xsl:when>
	<xsl:otherwise>
		<fo:table-row padding-after="4pt" padding-before="4pt">
			<xsl:apply-templates select="callout[1]"/> <!-- allowed multiple, used in IETMs, so must have [1] for pdf to compose -->
			<xsl:apply-templates select="smr[@service='army'][1] | smr[@service=''][1]"/>
			<xsl:apply-templates select="smr[@service='navy'][1]"/>
			<xsl:apply-templates select="smr[@service='AF'][1]"/>
			<xsl:apply-templates select="smr[@service='marine'][1]"/>
			<!--		<xsl:apply-templates select="smr/@service=CG"/>-->
			<xsl:apply-templates select="nsn" mode="MULTISERVICE"/>
			<xsl:apply-templates select="cageno" mode="MULTISERVICE"/>
			<xsl:apply-templates select="partno" mode="MULTISERVICE"/>
			<xsl:apply-templates select="desc" mode="MULTISERVICE"/>
			<xsl:apply-templates select="uoc" mode="MULTISERVICE"/>
			<xsl:apply-templates select="qty" mode="MULTISERVICE"/>
			<xsl:apply-templates select="refdes"/>
		<!--	<xsl:apply-templates select="refdes"/>
			<xsl:apply-templates select="boi"/>
			<xsl:apply-templates select="usbefserno"/>-->
			<xsl:apply-templates select="part.breakdown.ref"/>
			<xsl:apply-templates select="maintenance" mode="pi.item"/>
			<xsl:apply-templates select="qty_per_end_item" mode="MULTISERVICE"/>
		</fo:table-row>
</xsl:otherwise>
				</xsl:choose>
	</xsl:template>
	<xsl:template match="smr[position()>1]" mode="SMR-MOREROWS">
		<fo:block>
			<xsl:value-of disable-output-escaping="no" select="@sourcecode"/>
			<xsl:value-of disable-output-escaping="no" select="@maintcode"/>
			<xsl:value-of disable-output-escaping="no" select="@recovercode"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="smr[position()>1]" mode="SMR-MOREROWS-AF">
		<fo:block>
			<xsl:value-of disable-output-escaping="no" select="@sourcecode"/>
			<xsl:value-of disable-output-escaping="no" select="@maintcode"/>
			<xsl:value-of disable-output-escaping="no" select="@recovercode"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="smr[position()>1]" mode="SMR-MOREROWS-NAVY">
		<fo:block>
			<xsl:value-of disable-output-escaping="no" select="@sourcecode"/>
			<xsl:value-of disable-output-escaping="no" select="@maintcode"/>
			<xsl:value-of disable-output-escaping="no" select="@recovercode"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="smr[position()>1]" mode="SMR-MOREROWS-MARINE">
		<fo:block>
			<xsl:value-of disable-output-escaping="no" select="@sourcecode"/>
			<xsl:value-of disable-output-escaping="no" select="@maintcode"/>
			<xsl:value-of disable-output-escaping="no" select="@recovercode"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="pi.item/callout">
		<fo:table-cell column-number="1" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="left" text-transform="uppercase">
			<fo:block text-align="left">
				<xsl:text>&#x2003;</xsl:text>
				<xsl:value-of disable-output-escaping="no" select="@label"/>
				<xsl:text>&#x2003;</xsl:text>
			</fo:block>
			<!--<xsl:if test="@assocfig">
				<fo:block text-align="left">
				<fo:basic-link internal-destination="{@assocfig}">
				<xsl:text>&#x2003;</xsl:text>
						<xsl:value-of disable-output-escaping="no" select="id(@assocfig)"/>
				</fo:basic-link>
				</fo:block>
				</xsl:if>-->
			<xsl:if test="@partref">
				<fo:block text-align="left">
					<fo:basic-link internal-destination="{@partref}">
						<xsl:text>&#x2003;</xsl:text>
						<xsl:value-of disable-output-escaping="no" select="id(@partref)"/>
					</fo:basic-link>
				</fo:block>
			</xsl:if>
			<!--<xsl:for-each select="kititem">
					<fo:block text-align="left">
						<fo:inline>
							<xsl:text>&#x2003;</xsl:text>
							<xsl:value-of disable-output-escaping="no" select="callout/@label"/>
							<xsl:text>&#x2003;</xsl:text>
						</fo:inline>
					</fo:block>
				</xsl:for-each>-->
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/nha_item">
		<fo:table-cell column-number="1" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="left" text-transform="uppercase">
			<fo:block>
				<fo:basic-link internal-destination="{@nha.ref}">
					<xsl:value-of disable-output-escaping="no" select="id(@nha.ref)"/>
				</fo:basic-link>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/smr[@service='army'] | smr[@service='']">
		<fo:table-cell padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="center" text-transform="uppercase" column-number="2">
			<fo:block>
				<xsl:value-of disable-output-escaping="no" select="@sourcecode[1]"/>
				<xsl:value-of disable-output-escaping="no" select="@maintcode[1]"/>
				<xsl:value-of disable-output-escaping="no" select="@recovercode[1]"/>
			</fo:block>
			<xsl:apply-templates mode="SMR-MOREROWS" select="../smr[position()>1]"/>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/smr[@service='AF']">
		<fo:table-cell padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="center" text-transform="uppercase" column-number="3">
			<fo:block>
				<xsl:value-of disable-output-escaping="no" select="@sourcecode[1]"/>
				<xsl:value-of disable-output-escaping="no" select="@maintcode[1]"/>
				<xsl:value-of disable-output-escaping="no" select="@recovercode[1]"/>
			</fo:block>
			<xsl:apply-templates mode="SMR-MOREROWS-AF" select="../smr[position()>1]"/>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/smr[@service='navy']">
		<fo:table-cell padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="center" text-transform="uppercase" column-number="4">
			<fo:block>
				<xsl:value-of disable-output-escaping="no" select="@sourcecode[1]"/>
				<xsl:value-of disable-output-escaping="no" select="@maintcode[1]"/>
				<xsl:value-of disable-output-escaping="no" select="@recovercode[1]"/>
			</fo:block>
			<xsl:apply-templates mode="SMR-MOREROWS-NAVY" select="../smr[position()>1]"/>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/smr[@service='marine']">
		<fo:table-cell padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="center" text-transform="uppercase" column-number="5">
			<fo:block>
				<xsl:value-of disable-output-escaping="no" select="@sourcecode[1]"/>
				<xsl:value-of disable-output-escaping="no" select="@maintcode[1]"/>
				<xsl:value-of disable-output-escaping="no" select="@recovercode[1]"/>
			</fo:block>
			<xsl:apply-templates mode="SMR-MOREROWS-MARINE" select="../smr[position()>1]"/>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/nsn">
		<fo:table-cell column-number="3" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="center">
			<fo:block>
				<xsl:call-template name="NSN-VALUE">
					<xsl:with-param name="Fsc">
						<xsl:value-of select="fsc"/>
					</xsl:with-param>
					<xsl:with-param name="Niin">
						<xsl:value-of select="niin"/>
					</xsl:with-param>
				</xsl:call-template>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/cageno">
		<fo:table-cell column-number="4" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="center">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/partno">
		<fo:table-cell column-number="5" padding-bottom="3pt" padding-left="2pt" padding-right="2pt" padding-top="3pt" text-align="left">
			<fo:block text-align="left" space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm" hyphenate="true" hyphenation-character="-" hyphenation-keep="column">
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/nsn" mode="MULTISERVICE">
		<fo:table-cell column-number="6" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="center">
			<fo:block>
				<xsl:call-template name="NSN-VALUE">
					<xsl:with-param name="Fsc">
						<xsl:value-of select="fsc"/>
					</xsl:with-param>
					<xsl:with-param name="Niin">
						<xsl:value-of select="niin"/>
					</xsl:with-param>
				</xsl:call-template>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/cageno" mode="MULTISERVICE">
		<fo:table-cell column-number="7" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="center">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/partno" mode="MULTISERVICE">
		<fo:table-cell column-number="8" padding-bottom="3pt" padding-left="2pt" padding-right="2pt" padding-top="3pt" text-align="left">
			<fo:block text-align="left" space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm" hyphenate="true" hyphenation-character="-" hyphenation-keep="column">
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template name="PI.ITEM_INDENT">
		<xsl:if test="parent::pi.item/@indent='0'">
			<xsl:text/>
		</xsl:if>
		<xsl:if test="parent::pi.item/@indent='1'">
			<xsl:text>.</xsl:text>
		</xsl:if>
		<xsl:if test="parent::pi.item/@indent='2'">
			<xsl:text>. .</xsl:text>
		</xsl:if>
		<xsl:if test="parent::pi.item/@indent='3'">
			<xsl:text>. . .</xsl:text>
		</xsl:if>
		<xsl:if test="parent::pi.item/@indent='4'">
			<xsl:text>. . . .</xsl:text>
		</xsl:if>
		<xsl:if test="parent::pi.item/@indent='5'">
			<xsl:text>. . . . .</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="pi.item/uoc">
		<xsl:choose>
			<xsl:when test="position()>1">
				<xsl:text>; </xsl:text>
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="pi.item/refdes">
			<xsl:apply-templates select="node()"/>
			<xsl:if test="@nsn">
					<xsl:text> &#x2023; </xsl:text>
					<xsl:value-of select="@nsn"/>
					<xsl:text>&#x2002;</xsl:text>
				</xsl:if>
					<xsl:if test="@eic">
					<xsl:text>(EIC&#x2023;</xsl:text>
					<xsl:value-of select="@eic"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
	</xsl:template>
	<xsl:template match="pi.item/common_part_ref">
		<!-- Need to pull SMR NSN CAGE Part Number and Description of ID'd part -->
		
	<!--	<xsl:when test="@idref">
							<xsl:variable name="idref" select="@idref"/>
								<xsl:with-param name="id" select="@idref"/>
						</xsl:when>
						
		<xsl:if test="id(@idref)">
			<xsl:copy-of select="id(@idref)"/>-->
			<fo:table-cell column-number="1">
			<fo:block>
			<xsl:if test="id(@idref)">
				<xsl:text>See Item &#x2003;</xsl:text>
			</xsl:if>
		</fo:block>
		</fo:table-cell>
<fo:table-cell column-number="2">
	<fo:block>
	<!--<xsl:value-of select="id(@idref)='callout[1]/@label'"/>-->
	<xsl:value-of select="@idref='callout[1]/@label'"/>
	</fo:block>
</fo:table-cell>

		<fo:table-cell column-number="7" relative-align="baseline">
			<fo:block>
			<xsl:value-of select="following-sibling::qty"/>
			</fo:block>
		</fo:table-cell>
	<!--		<xsl:apply-templates select="idref(pi.item)"/>
<xsl:apply-templates select="callout"/>
			<fo:table-cell column-number="1" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="left" text-transform="uppercase">
				<fo:block text-align="left">
					<xsl:if test="local-name(.)='pi.item'">
						<xsl:choose>
							<xsl:when test="callout[@label]">
								<xsl:text disable-output-escaping="no">Item </xsl:text>
								<xsl:value-of disable-output-escaping="no" select="callout/@label"/>
							</xsl:when>
							<xsl:when test="callout[@numref]"/>
							<xsl:otherwise>			</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:value-of select="name(id(@itemid))='callout[1]/@label'"/>
				</fo:block>
			</fo:table-cell>-->
			<!--<xsl:apply-templates select="smr"/>	-->
		<!--	<fo:table-cell padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="center" text-transform="uppercase" column-number="2">
				<fo:block>
					<xsl:value-of select="name(id(@itemid))=smr"/>
				</fo:block>
			</fo:table-cell>

		</xsl:if>-->
		<xsl:if test="id(@idref)">
		<xsl:apply-templates select="preceding-sibling::callout"/>

			<fo:table-cell padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="center" text-transform="uppercase" column-number="2">	
			<fo:block>
				<xsl:value-of select="id(@idref) /smr/@sourcecode[1]"/>
				<xsl:value-of  select="id(@idref) /smr/@maintcode[1]"/>
				<xsl:value-of select="id(@idref) /smr/@recovercode[1]"/>
			</fo:block>
		</fo:table-cell>
		<xsl:apply-templates select="id(@idref) /nsn"/>
		<fo:table-cell column-number="4" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="center">
			<fo:block>
				<xsl:value-of select="id(@idref) /cageno"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell column-number="5" padding-bottom="3pt" padding-left="2pt" padding-right="2pt" padding-top="3pt" text-align="left">
			<fo:block text-align="left" space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm" hyphenate="true" hyphenation-character="-" hyphenation-keep="column">
				<xsl:value-of select="id(@idref) /partno"/>
			</fo:block>
		</fo:table-cell>

			<xsl:apply-templates select="id(@idref) /desc"/>
<xsl:apply-templates select="preceding-sibling::qty"/>
</xsl:if>
	</xsl:template>
		<xsl:template match="pi.item/common_part_ref" mode="MULTISERVICE">
		<!-- Need to pull item label  of ID'd part -->
		<xsl:if test="id(@idref)">
		<xsl:apply-templates select="preceding-sibling::callout" />
	<xsl:apply-templates select="id(@idref) /smr[@service='army'] | id(@idref) /smr[@service='']"/>
	<xsl:apply-templates select="id(@idref) /smr[@service='AF']"/>
	<xsl:apply-templates select="id(@idref) /smr[@service='navy']"/>
	<xsl:apply-templates select="id(@idref) /smr[@service='marine']"/>
	
			<!--<fo:table-cell padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="center" text-transform="uppercase" column-number="2">	
			<fo:block>
				<xsl:value-of select="id(@idref) /smr/@sourcecode[1]"/>
				<xsl:value-of  select="id(@idref) /smr/@maintcode[1]"/>
				<xsl:value-of select="id(@idref) /smr/@recovercode[1]"/>
			</fo:block>
		</fo:table-cell>-->
		<xsl:apply-templates select="id(@idref) /nsn" mode="MULTISERVICE"/>

		<fo:table-cell column-number="7" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="center">
			<fo:block>
				<xsl:value-of select="id(@idref) /cageno"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell column-number="8" padding-bottom="3pt" padding-left="2pt" padding-right="2pt" padding-top="3pt" text-align="left">
			<fo:block text-align="left" space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm" hyphenate="true" hyphenation-character="-" hyphenation-keep="column">
				<xsl:value-of select="id(@idref) /partno"/>
			</fo:block>
		</fo:table-cell>

		<xsl:apply-templates select="id(@idref) /desc" mode="MULTISERVICE"/>
		<xsl:apply-templates select="preceding-sibling::qty" mode="MULTISERVICE"/>
</xsl:if>
	</xsl:template>

	<xsl:template match="pi.item/desc" mode="MULTISERVICE">
		<fo:table-cell column-number="9" padding-bottom="3pt" padding-right="3pt" padding-top="3pt" text-align="left">
			<xsl:text>See &#x2023; </xsl:text>
			<fo:basic-link internal-destination="{@figid}">
				<xsl:for-each select="id(@figid)">
				
					<xsl:choose>
					<xsl:when test="@figtype = 'fo-rear'">
					  <xsl:text>FO&#x2013;</xsl:text>
					  <xsl:number count="figure[@figtype='fo-rear']" format="1." from="production" level="any"/>
					</xsl:when>
					<xsl:otherwise>
					<xsl:text disable-output-escaping="no">Figure&#x2002;</xsl:text>
					<xsl:number count="figure[@figtype='normal-page'][not(parent::figure-alt)]|figure-alt" format="1" from="//pim" level="any"/>
					</xsl:otherwise>
					</xsl:choose>	
				</xsl:for-each>
			</fo:basic-link>
			<fo:block text-align="left" start-indent="1mm">
				<xsl:choose>
					<xsl:when test="preceding-sibling::name">
						<fo:inline>
							<xsl:call-template name="PI.ITEM_INDENT"/>
							<xsl:apply-templates select="preceding-sibling::name"/>
							<fo:leader leader-pattern="use-content">.</fo:leader>
						</fo:inline>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
			</fo:block>
			<fo:block text-align="left" start-indent="2mm" end-indent="2mm">
				<xsl:apply-templates select="node()"/>
			</fo:block>
			<fo:block text-align="left" start-indent="2mm" end-indent="2mm">
				<xsl:choose>
					<xsl:when test="preceding-sibling::uoc">
						<fo:block>
							<xsl:text>UOC: </xsl:text>
							<xsl:apply-templates select="preceding-sibling::uoc"/>
						</fo:block>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
			</fo:block>
			<xsl:if test="refdes">
				<fo:block text-align="left">
					<xsl:text>&#x2003;</xsl:text>
					<xsl:apply-templates select="refdes"/>
				</fo:block>
			</xsl:if>
			<xsl:if test="usbefserno">
				<fo:block text-align="left" text-indent="1pc">
					<xsl:text> USBL EFF SER NOS:  </xsl:text>
					<xsl:value-of select="usbefserno/@beginserno"/>
					<xsl:text disable-output-escaping="no">&#x2013;</xsl:text>
					<xsl:value-of select="usbefserno/@endserno"/>
				</fo:block>
			</xsl:if>
			<xsl:if test="preceding-sibling::boi">
				<fo:block text-align="left">
					<xsl:text>BOI:  </xsl:text>
					<!--	<xsl:value-of select="boi"/>-->
					<xsl:text> (</xsl:text>
					<xsl:value-of select="qty[1]"/>
					<xsl:text>)</xsl:text>
				</fo:block>
			</xsl:if>
			<xsl:if test="following-sibling::part.breakdown.ref">
			<fo:block text-align="left">
				<xsl:apply-templates select="following-sibling::part.breakdown.ref"/>
				</fo:block>
			</xsl:if>
			<xsl:if test="following-sibling::maintenance">
				<xsl:apply-templates select="following-sibling::maintenance" mode="pi.item"/>
			</xsl:if>
			<xsl:if test="following-sibling::boi">
				<fo:block text-align="left" text-align-last="right">
					<xsl:text>BOI:  </xsl:text>
					<xsl:value-of select="boi"/>
					<xsl:text> (</xsl:text>
					<!--<xsl:value-of select="qty[1]"/>-->
					<xsl:text>)</xsl:text>
				</fo:block>
			</xsl:if>
			<xsl:if test="following-sibling::kititem">
				<fo:table space-before="3 pt" padding-top="3pt" margin-top="3pt" border-left-style="solid" border-left-width=".5pt" >
					<fo:table-column column-number="1" column-width="60%"/>
					<fo:table-column column-number="2" column-width="20%"/>
					<fo:table-column column-number="3" column-width="20%"/>
					<fo:table-body>
						<xsl:for-each select="following-sibling::kititem">
							<fo:table-row>
								<fo:table-cell border-left-style="solid" border-left-width=".5pt">
									<fo:block text-align="left">
										<xsl:value-of select="name[1]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="right" border-left-style="solid" border-left-width=".5pt">
									<fo:block text-align="right">
										<xsl:text>  (</xsl:text>
										<xsl:value-of select="qty[1]"/>
										<xsl:text>)</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border-left-style="solid" border-left-width=".5pt">
									<fo:block>
										<fo:basic-link internal-destination="{@assocfig}">
											<xsl:number count="figure" format="1" from="//pim" level="any"/>
											<xsl:value-of disable-output-escaping="no" select="id(@assocfig)"/>
										</fo:basic-link>
										<xsl:text disable-output-escaping="no">-</xsl:text>
										<xsl:value-of disable-output-escaping="no" select="callout/@label"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
			</xsl:if>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/desc">
		<fo:table-cell column-number="6" padding-bottom="3pt" padding-right="3pt" padding-top="3pt" text-align="left">
			<fo:block text-align="left" start-indent="1mm">
				<xsl:choose>
					<xsl:when test="preceding-sibling::name">

							<xsl:call-template name="PI.ITEM_INDENT"/>
							<xsl:value-of select="preceding-sibling::name"/>
							<xsl:if test="not(following-sibling::desc)">
							<fo:leader leader-pattern="use-content">.</fo:leader>
							</xsl:if>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
			</fo:block>
			
			<fo:block text-align="left" start-indent="2mm" end-indent="2mm">
				<xsl:apply-templates select="node()"/>
				<xsl:if test="not(string-length(desc)=0)">
								<fo:leader leader-pattern="use-content">.</fo:leader>
								</xsl:if>
			</fo:block>
			<fo:block text-align="left" start-indent="2mm" end-indent="2mm">
				<xsl:choose>
					<xsl:when test="preceding-sibling::uoc">
						<fo:block>
							<xsl:text>UOC: </xsl:text>
							<xsl:apply-templates select="preceding-sibling::uoc"/>
						</fo:block>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
			</fo:block>
		<xsl:if test="following-sibling::part.breakdown.ref">
			<fo:block text-align="left">
			<xsl:text>See &#x2023; </xsl:text>
			<fo:basic-link internal-destination="{@idref}">
					<xsl:choose>
					<xsl:when test="@figtype = 'fo-rear'">
					  <xsl:text>FO&#x2013;</xsl:text>
					  <xsl:number count="figure[@figtype='fo-rear']" format="1." from="production" level="any"/>
					</xsl:when>
					<xsl:otherwise>
					<xsl:text disable-output-escaping="no">Figure&#x2002;</xsl:text>
					<xsl:number count="figure[@figtype='normal-page'][not(parent::figure-alt)]|figure-alt" format="1" from="//pim" level="any"/>
					</xsl:otherwise>
					</xsl:choose>	
			</fo:basic-link>
			
	<!--			<xsl:apply-templates select="following-sibling::part.breakdown.ref"/>-->
				</fo:block>
			</xsl:if>
			<xsl:if test="following-sibling::refdes[1]">
				<fo:block text-align="left">
					<xsl:text>&#x2003;</xsl:text>
					<xsl:apply-templates select="following-sibling::refdes[1]"/>
				</fo:block>
			</xsl:if>
			<xsl:if test="usbefserno">
				<fo:block text-align="left" text-indent="1pc">
					<xsl:text> USBL EFF SER NOS:  </xsl:text>
					<xsl:value-of select="usbefserno/@beginserno"/>
					<xsl:text disable-output-escaping="no">&#x2013;</xsl:text>
					<xsl:value-of select="usbefserno/@endserno"/>
				</fo:block>
			</xsl:if>
			<xsl:if test="boi">
				<fo:block text-align="left" text-align-last="right">
					<xsl:text>BOI:  </xsl:text>
					<!--<xsl:value-of select="boi"/>-->
					<xsl:text> (</xsl:text>
					<xsl:value-of select="qty"/>
					<xsl:text>)</xsl:text>
				</fo:block>
			</xsl:if>

			<xsl:if test="following-sibling::maintenance">
				<xsl:apply-templates select="following-sibling::maintenance" mode="pi.item"/>
			</xsl:if>
			<xsl:if test="following-sibling::kititem">
			<fo:block space-before="6pt">
				<fo:table>
					<fo:table-column column-number="1" column-width="70%"/>
					<fo:table-column column-number="2" column-width="10%"/>
					<fo:table-column column-number="3" column-width="20%"/>
					<fo:table-body>
						<xsl:for-each select="following-sibling::kititem">
							<fo:table-row>
								<fo:table-cell>
									<fo:block text-align="left">
										<xsl:value-of select="name[1]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="right">
									<fo:block text-align="right">
										<xsl:text>  (</xsl:text>
										<xsl:value-of select="qty[1]"/>
										<xsl:text>)</xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<fo:basic-link internal-destination="{@assocfig}">
											<xsl:number count="figure" format="1" from="//pim" level="any"/>
											<xsl:value-of disable-output-escaping="no" select="id(@assocfig)"/>
										</fo:basic-link>
										<xsl:text disable-output-escaping="no">-</xsl:text>
										<xsl:value-of disable-output-escaping="no" select="callout/@label"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
			<xsl:if test="preceding-sibling::boi">
				<fo:block text-align="left" text-align-last="right">
					<xsl:text>BOI:  </xsl:text>
					<xsl:value-of select="preceding-sibling::boi"/>
					<xsl:text> (</xsl:text>
					<xsl:value-of select="qty[1]"/>
					<xsl:text>)</xsl:text>
				</fo:block>
			</xsl:if>
			<!--<xsl:if test="boi">
				<fo:block text-align="left" text-align-last="right">
						<xsl:text>BOI:  </xsl:text>
						<xsl:value-of select="boi"/>
					<xsl:text> (</xsl:text>
							<xsl:value-of select="qty"/>
							<xsl:text>)</xsl:text>
					</fo:block>
				</xsl:if>-->
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/qty[1]">
		<fo:table-cell column-number="7" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="right" >
			<fo:block text-align="right">
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
		<xsl:template match="pi.item/name">
					<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="pi.item/name" mode="MULTISERVICE">
					<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="pi.item/qty" mode="MULTISERVICE">
		<fo:table-cell column-number="10" padding-bottom="3pt" padding-left="3pt" 
		padding-right="3pt" padding-top="3pt" relative-align="baseline" text-align="right">
			<fo:block text-align="right">
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/qty_per_end_item" mode="MULTISERVICE">
		<fo:table-cell padding-top="3pt" padding-bottom="3pt" column-number="11" >
			<fo:block text-align="right">
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
</xsl:stylesheet>
