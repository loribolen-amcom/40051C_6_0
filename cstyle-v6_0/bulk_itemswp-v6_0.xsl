<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="bulk_itemswp">
	<xsl:call-template name="bulk-pageset"/>
	</xsl:template>
	<xsl:template name="bulk-pageset">
	<xsl:param name="Odd-Or-Even"/>
		<xsl:param name="docsecr2">
			<xsl:value-of select="$docsecr"/>
		</xsl:param>
		<xsl:param name="docsecr">
			<xsl:choose>
				<xsl:when test="@security">
					<xsl:if test="@security='ts'">
						<xsl:text>TOP SECRET</xsl:text>
					</xsl:if>
					<xsl:if test="@security='s'">
						<xsl:choose>
							<xsl:when test="descendant::*[@security='ts']">
								<xsl:text>TOP SECRET</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>SECRET</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="@security='c'">
						<xsl:choose>
							<xsl:when test="descendant::*[@security='ts']">
								<xsl:text>TOP SECRET</xsl:text>
							</xsl:when>
							<xsl:when test="descendant::*[@security='s']">
								<xsl:text>SECRET</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>CONFIDENTIAL</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="@security='fouo'">
						<xsl:choose>
							<xsl:when test="descendant::*[@security='ts']">
								<xsl:text>TOP SECRET</xsl:text>
							</xsl:when>
							<xsl:when test="descendant::*[@security='s']">
								<xsl:text>SECRET</xsl:text>
							</xsl:when>
							<xsl:when test="descendant::*[@security='c']">
								<xsl:text>CONFIDENTIAL</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>FOR OFFICIAL USE ONLY</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$docsecr2"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:param name="wpseqno">
			<xsl:choose>
				<xsl:when test="@wpseq">
					<xsl:value-of select="@wpseq"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates mode="count" select="wpidinfo"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<fo:page-sequence color="#000000" font-family="sans-serif" font-size="10pt" force-page-count="end-on-even" format="1" hyphenate="false" initial-page-number="1" language="en" line-height="1.15em" master-reference="bulkpage" text-align="left">
			<fo:static-content flow-name="xsl-region-before">
				<fo:block xsl:use-attribute-sets="secur-header-attrs">
					<xsl:value-of select="$docsecr"/>
					<!-- This works from the TM Number -->
				</fo:block>
				<!--<xsl:call-template name="BULK-WP-HEADER">
							<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
							<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
						</xsl:call-template>-->
				<fo:wrapper font-family="sans-serif" font-size="10pt" font-weight="bold">
					<fo:table border="all">
						<fo:table-column>
							<xsl:attribute name="column-width"><xsl:choose><xsl:when test="$Odd-Or-Even='Even'">13pc</xsl:when><xsl:otherwise>13pc</xsl:otherwise></xsl:choose></xsl:attribute>
						</fo:table-column>
						<fo:table-column column-width="16pc"/>
						<fo:table-column>
							<xsl:attribute name="column-width"><xsl:choose><xsl:when test="$Odd-Or-Even='Even'">13pc</xsl:when><xsl:otherwise>13pc</xsl:otherwise></xsl:choose></xsl:attribute>
						</fo:table-column>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell column-number="2" text-align="center">
								<fo:block>
									<xsl:value-of select="$tmnotxt"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="right">
								<fo:block>
									<xsl:choose>
										<xsl:when test="@wpseq">
											<xsl:value-of select="@wpseq"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates mode="count" select="wpidinfo"/>
										</xsl:otherwise>
									</xsl:choose>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" space-before="12pt" span="all" text-align="center" text-transform="uppercase">
						<xsl:apply-templates select="wpidinfo/maintlvl"/>
						<xsl:text>Bulk Items List</xsl:text>
					</fo:block>
					<fo:block span="all">
						<fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
					</fo:block>
				</fo:wrapper>
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-before-odd">

				<fo:block xsl:use-attribute-sets="secur-header-attrs">
					<xsl:value-of select="$docsecr"/>
					<!-- This works from the TM Number -->
				</fo:block>
				<fo:wrapper font-family="sans-serif" font-size="10pt" font-weight="bold">
						<fo:table border="all">
							<fo:table-column>
								<xsl:attribute name="column-width"><xsl:choose><xsl:when test="$Odd-Or-Even='Even'">13pc</xsl:when><xsl:otherwise>13pc</xsl:otherwise></xsl:choose></xsl:attribute>
							</fo:table-column>
							<fo:table-column column-width="16pc"/>
							<fo:table-column>
								<xsl:attribute name="column-width"><xsl:choose><xsl:when test="$Odd-Or-Even='Even'">13pc</xsl:when><xsl:otherwise>13pc</xsl:otherwise></xsl:choose></xsl:attribute>
							</fo:table-column>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell column-number="2" text-align="center">
									<fo:block>
										<xsl:value-of select="$tmnotxt"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell text-align="right">
									<fo:block>
										<xsl:choose>
											<xsl:when test="@wpseq">
												<xsl:value-of select="@wpseq"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates mode="count" select="wpidinfo"/>
											</xsl:otherwise>
										</xsl:choose>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					<fo:block span="all">
						<fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
					</fo:block>
					<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" space-before="12pt" span="all" text-align="center" text-transform="uppercase">
						<xsl:apply-templates select="wpidinfo/maintlvl"/>
						<xsl:text>Bulk Items List</xsl:text>
					</fo:block>
					<fo:block span="all">
						<fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
					</fo:block>
				</fo:wrapper>
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-before-even">
				<fo:block xsl:use-attribute-sets="secur-header-attrs">
					<xsl:value-of select="$docsecr"/>
					<!-- This works from the TM Number -->
				</fo:block>

				<fo:wrapper font-family="sans-serif" font-size="10pt" font-weight="bold">
						<fo:table border="all">
							<fo:table-column>
								<xsl:attribute name="column-width">
								<xsl:choose>
								<xsl:when test="$Odd-Or-Even='Even'">13pc</xsl:when>
								<xsl:otherwise>13pc</xsl:otherwise>
								</xsl:choose>
								</xsl:attribute>
							</fo:table-column>
							<fo:table-column column-width="16pc"/>
							<fo:table-column>
								<xsl:attribute name="column-width">
								<xsl:choose>
								<xsl:when test="$Odd-Or-Even='Even'">13pc</xsl:when>
								<xsl:otherwise>13pc</xsl:otherwise>
								</xsl:choose>
								</xsl:attribute>
							</fo:table-column>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell column-number="2" text-align="center">
									<fo:block>
										<xsl:value-of select="$tmnotxt"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell text-align="right">
									<fo:block>
										<xsl:choose>
											<xsl:when test="@wpseq">
												<xsl:value-of select="@wpseq"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates mode="count" select="wpidinfo"/>
											</xsl:otherwise>
										</xsl:choose>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					<fo:block span="all">
						<fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
					</fo:block>
					<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" space-before="12pt" span="all" text-align="center" text-transform="uppercase">
						<xsl:apply-templates select="wpidinfo/maintlvl"/>
						<xsl:text>Bulk Items List</xsl:text>
				</fo:block>
					<fo:block span="all">
						<fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
					</fo:block>
				</fo:wrapper>
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-after-odd">
				<xsl:call-template name="WP-FOOTER-BULK">
					<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
					<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
				</xsl:call-template>
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-after-even">
				<xsl:call-template name="WP-FOOTER-BULK">
					<xsl:with-param name="Odd-Or-Even">Even</xsl:with-param>
					<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
				</xsl:call-template>
			</fo:static-content>
			<fo:flow flow-name="xsl-region-body">
			<!--	<fo:block>
					<fo:marker marker-class-name="blank-page"></fo:marker>
				</fo:block>-->
				<fo:wrapper>
					<fo:block span="all">
						<fo:table-and-caption font-family="sans-serif" font-size="11pt" space-before="8pt"  text-align="left">
							<fo:table-caption>
								<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" keep-with-previous.within-column="always" keep-with-previous.within-page="always" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center"/>
							</fo:table-caption>
							<fo:table width="7in" border-bottom="solid" border-bottom-width=".5pt" border-top="solid" border-top-width=".5pt" font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after.maximum="12pt" space-after.minimum="12pt" space-after.optimum="12pt" space-before.maximum="14pt" space-before.minimum="12pt" space-before.optimum="12pt" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve" id="{generate-id(.)}">
								<fo:table-column column-number="1" column-width="6%"/>
								<fo:table-column column-number="2" column-width="10%"/>
								<fo:table-column column-number="3" column-width="17%"/>
								<fo:table-column column-number="4" column-width="10%"/>
								<fo:table-column column-number="5" column-width="18%"/>
								<fo:table-column column-number="6" column-width="33%"/>
								<fo:table-column column-number="7" column-width="6%"/>
								<fo:table-header>
									<fo:table-row>
										<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="left">
											<fo:block span="all">(1)</fo:block>
											<fo:block span="all">ITEM</fo:block>
											<fo:block span="all">NO.</fo:block>
										</fo:table-cell>
										<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="left">
											<fo:block span="all">(2)</fo:block>
											<fo:block span="all">SMR</fo:block>
											<fo:block span="all">CODE</fo:block>
										</fo:table-cell>
										<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="center">
											<fo:block span="all">(3)</fo:block>
											<fo:block span="all">&#x2002;</fo:block>
											<fo:block span="all">NSN</fo:block>
										</fo:table-cell>
										<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="left">
											<fo:block span="all">(4)</fo:block>
											<fo:block span="all">&#x2002;</fo:block>
											<fo:block span="all">CAGEC</fo:block>
										</fo:table-cell>
										<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="left">
											<fo:block span="all">(5)</fo:block>
											<fo:block span="all">PART</fo:block>
											<fo:block span="all">NUMBER</fo:block>
										</fo:table-cell>
										<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="left">
											<fo:block span="all">(6)</fo:block>
											<fo:block span="all">DESCRIPTION AND USABLE
												ON</fo:block>
											<fo:block span="all">CODE (UOC)</fo:block>
										</fo:table-cell>
										<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" display-align="after" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="4pt" padding-top="4pt" text-align="left">
											<fo:block span="all">(7)</fo:block>
											<fo:block span="all">&#x2002;</fo:block>
											<fo:block span="all">QTY</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-header>
								<fo:table-body>
							<xsl:apply-templates select="fncgrp" mode="bulk"/>
						<xsl:apply-templates select="pi.item" mode="bulk"/>
								</fo:table-body>
							</fo:table>
						</fo:table-and-caption>
					</fo:block>
					<fo:block>
						<fo:marker marker-class-name="blank-page">
							<xsl:text>/</xsl:text>
							<xsl:text>blank</xsl:text>
						</fo:marker>
					</fo:block>
				</fo:wrapper>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	<xsl:template match="pi.item" mode="bulk">
		<fo:table-row padding-after="4pt" padding-before="4pt" >
			<xsl:apply-templates select="nha_item" mode="bulk"/>
			<xsl:choose>
				<xsl:when test="callout">
					<xsl:apply-templates select="callout" mode="bulk"/>
				</xsl:when>
				<xsl:otherwise>
				<fo:table-cell column-number="1" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="left" text-transform="uppercase">
						<fo:block>
							<xsl:number count="pi.item" format="1" from="bulk_itemswp"/>
						</fo:block>
					</fo:table-cell>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="smr" mode="bulk"/>
			<xsl:apply-templates select="nsn" mode="bulk"/>
			<xsl:apply-templates select="cageno" mode="bulk"/>
			<xsl:apply-templates select="partno" mode="bulk"/>
			<xsl:apply-templates select="desc" mode="bulk"/>
			<xsl:apply-templates select="uoc" mode="bulk"/>	
			<xsl:apply-templates select="qty" mode="bulk"/>
			<!--<xsl:apply-templates select="name" mode="bulk"/>-->
		</fo:table-row>
	</xsl:template>
	<xsl:template match="pi.item/callout" mode="bulk">
		<fo:table-cell column-number="1" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="left" text-transform="uppercase">
			<fo:block>
				<xsl:value-of select="@label"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/nha_item" mode="bulk">
		<fo:table-cell column-number="1" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="left" text-transform="uppercase">
			<fo:block>
				<xsl:value-of select="id(@nha.ref)"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="pi.item/smr" mode="bulk">
		<fo:table-cell column-number="2" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="center" text-transform="uppercase">
			<fo:block>
				<xsl:value-of select="@sourcecode"/>
				<xsl:value-of select="@maintcode"/>
				<xsl:value-of select="@recovercode"/>
			</fo:block>
			<xsl:apply-templates mode="SMR-MOREROWS" select="../smr[position()>1]"/>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/nsn" mode="bulk">
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
	<xsl:template match="pi.item/cageno" mode="bulk">
		<fo:table-cell column-number="4" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="center">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/partno" mode="bulk">
		<fo:table-cell column-number="5" padding-bottom="3pt" padding-left="2pt" padding-right="2pt" padding-top="3pt" text-align="left">
			<fo:block text-align="left" space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm" hyphenate="true" hyphenation-character="-" hyphenation-keep="column">
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/desc" mode="bulk">
		<fo:table-cell column-number="6" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="left">
			<fo:block text-align="left" space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm">
				<xsl:choose>
					<xsl:when test="local-name(preceding-sibling::node()[1])='name' and local-name(preceding-sibling::name[1])!=' ' ">
						<xsl:value-of select="preceding-sibling::name"/>
						<xsl:text>; </xsl:text>
						<xsl:apply-templates select="node()"/>
						<fo:leader leader-pattern="use-content">.</fo:leader>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="node()"/>
						<fo:leader leader-pattern="use-content">.</fo:leader>
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>
			<fo:block text-align="left" space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm">
				<xsl:if test="preceding-sibling::uoc[1]">
					<xsl:text> UOC: </xsl:text>
					<xsl:value-of select="preceding-sibling::uoc[1]"/>
					<fo:leader leader-pattern="use-content">.</fo:leader>
				</xsl:if>
			</fo:block>
			<fo:block start-indent="3pc" text-align="left" text-align-last="right" text-indent="1pc">
				<xsl:if test="preceding-sibling::usbefserno[1]">
					<xsl:text> USBL EFF SER NOS:  </xsl:text>
					<xsl:value-of select="preceding-sibling::usbefserno/@beginserno"/>
					<xsl:text>&#x2014;</xsl:text>
					<xsl:value-of select="preceding-sibling::usbefserno/@endserno"/>
					<fo:leader leader-pattern="use-content">.</fo:leader>
				</xsl:if>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="pi.item/qty" mode="bulk">
		<fo:table-cell column-number="7" padding-bottom="3pt" padding-left="2pt" padding-right="2pt" padding-top="3pt" text-align="left">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="fncgrp" mode="bulk">
		<fo:table-row>
			<fo:table-cell column-number="6" padding-after="3pt" padding-before="1pt">
				<xsl:apply-templates select="fnccode" mode="bulk"/>
			</fo:table-cell>
		</fo:table-row>
					<fo:table-row>
			<fo:table-cell column-number="6" padding-after="3pt" padding-before="1pt">

			<fo:list-block provisional-distance-between-starts="4pc" provisional-label-separation="5pt" space-after="8pt">
			<fo:list-item>
			<fo:list-item-label>
					<fo:block>
						<xsl:text>FIG BULK</xsl:text>
				</fo:block>
				</fo:list-item-label>
				<fo:list-item-body>
					<fo:block></fo:block>
				</fo:list-item-body>
				</fo:list-item>
		</fo:list-block>

			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<fo:table-cell column-number="6" padding-after="2pt" padding-before="1pt">
				<xsl:apply-templates select="partno" mode="bulk"/>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
<xsl:template match="fnccode" mode="bulk">
		<fo:list-block provisional-distance-between-starts="4pc" provisional-label-separation="5pt" space-after="8pt">
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
						<xsl:if test="name(following-sibling::node()[1])='fnctitle'">
							<xsl:apply-templates select="following-sibling::node()[1]"/>
						</xsl:if>
					</fo:block>
				</fo:list-item-body>
			</fo:list-item>
		</fo:list-block>
	</xsl:template>
	
	<xsl:template match="fnctitle" mode="bulk">
		<xsl:apply-templates/>
	</xsl:template>

		<xsl:template match="fncgrp/partno" mode="bulk">
		<fo:list-block provisional-distance-between-starts="4pc" provisional-label-separation="5pt" space-after="8pt">
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
	<xsl:template name="BULK-WP-HEADER">
		<xsl:param name="Odd-Or-Even"/>
		<xsl:param name="WpSeqNo"/>
		<xsl:choose>
			<xsl:when test="ancestor::bulk-itemswp">Bulk Items List</xsl:when>
		</xsl:choose>
		<fo:block xsl:use-attribute-sets="secur-header-attrs">
			<xsl:value-of select="$docsecr"/>
		</fo:block>
		<fo:wrapper font-family="sans-serif" font-size="10pt" font-weight="bold">
			<fo:table>
				<fo:table-column>
					<xsl:attribute name="column-width"><xsl:choose><xsl:when test="$Odd-Or-Even='Even'">13pc</xsl:when><xsl:otherwise>13pc</xsl:otherwise></xsl:choose></xsl:attribute>
				</fo:table-column>
				<fo:table-column column-width="16pc"/>
				<fo:table-column>
					<xsl:attribute name="column-width"><xsl:choose><xsl:when test="$Odd-Or-Even='Even'">13pc</xsl:when><xsl:otherwise>13pc</xsl:otherwise></xsl:choose></xsl:attribute>
				</fo:table-column>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell column-number="2" text-align="center">
						<fo:block>
							<xsl:value-of select="$tmnotxt"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="right">
						<fo:block>
							<xsl:value-of select="$WpSeqNo"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:wrapper>
		<fo:block span="all">
			<fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
		</fo:block>
	</xsl:template>
	<xsl:template name="WP-FOOTER-BULK">
	<xsl:param name="Odd-First"/>
		<xsl:param name="Odd-Or-Even"/>
		<xsl:param name="WpSeqNo"/>
		<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" space-before.maximum="14pt" space-before.minimum="12pt" space-before.optimum="12pt" span="all" text-align="center">
				<fo:table>
					<fo:table-column>
						<xsl:attribute name="column-width">
						<xsl:choose>
						<xsl:when test="$Odd-Or-Even='Even'">38%</xsl:when>
						<xsl:otherwise>31%</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>
					</fo:table-column>
					<fo:table-column column-width="33%"/>
					<fo:table-column>
						<xsl:attribute name="column-width">
						<xsl:choose>
						<xsl:when test="$Odd-Or-Even='Even'">31%</xsl:when>
						<xsl:otherwise>38%</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>
					</fo:table-column>
					<fo:table-body>
						<fo:table-row>
							<xsl:if test="$Odd-Or-Even='Even'">
								<fo:table-cell text-align="left">
								<fo:block font-size="8pt">
								<xsl:if test="ancestor-or-self::bulk_itemswp[@chngno>'0']">
		<xsl:text>CHANGE </xsl:text>
									<xsl:value-of select="./@chngno"/>
										</xsl:if>
	
										</fo:block>
								</fo:table-cell>
							</xsl:if>
					<!--<fo:table-cell column-number="2" text-align="center">
						<fo:block>
								<xsl:value-of select="$WpSeqNo"/>
								<xsl:text>&#x2013;</xsl:text>
								<fo:page-number id="{generate-id(.)}"/>
							<xsl:choose>
								<xsl:when test="$Odd-Or-Even='Odd' and Even=''">
										<fo:retrieve-marker retrieve-boundary="page" retrieve-class-name="blank-page"/>
								</xsl:when>    						
    						<xsl:otherwise>
								</xsl:otherwise>
							</xsl:choose>
							--><!-- This works for a single page wp. --><!--
						</fo:block>
					</fo:table-cell>-->
					
					<fo:table-cell column-number="2" text-align="center">
							<fo:block>
								<xsl:value-of select="$WpSeqNo"/>
								<xsl:text>&#x2013;</xsl:text>
								<fo:page-number/>
								<!-- This works for a single page wp. -->
								<xsl:if test="$Odd-Or-Even='Odd'">
						<fo:retrieve-marker retrieve-boundary="page-sequence" retrieve-class-name="blank-page" retrieve-position="last-starting-within-page" />
								</xsl:if>

								</fo:block>
							</fo:table-cell>
							
							<xsl:if test="$Odd-Or-Even='Odd'">
								<fo:table-cell text-align="right">
								<fo:block font-size="8pt">
									</fo:block>
								</fo:table-cell>
							</xsl:if>
						</fo:table-row>
					</fo:table-body>
			
				
				</fo:table>
		</fo:block>
		<fo:block xsl:use-attribute-sets="secur-footer-attrs">
			<xsl:value-of select="$docsecr"/>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
