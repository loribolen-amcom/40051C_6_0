<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="titlepg">
		<xsl:call-template name="chap-pageset"/>
	</xsl:template>
	<xsl:template name="chap-pageset">
		<xsl:param name="docsecr">
			<xsl:variable name="docsecr2">
				<xsl:value-of select="$docsecr"/>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="parent::*[@security]">
					<xsl:if test="parent::*[@security='ts']">
						<xsl:text>TOP SECRET</xsl:text>
					</xsl:if>
					<xsl:if test="parent::*[@security='s']">
						<xsl:choose>
							<xsl:when test="parent::*/descendant::*[@security='ts']">
								<xsl:text>TOP SECRET</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>SECRET</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="parent::*[@security='c']">
						<xsl:choose>
							<xsl:when test="parent::*/descendant::*[@security='ts']">
								<xsl:text>TOP SECRET</xsl:text>
							</xsl:when>
							<xsl:when test="parent::*/descendant::*[@security='s']">
								<xsl:text>SECRET</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>CONFIDENTIAL</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="parent::*[@security='fouo']">
						<xsl:choose>
							<xsl:when test="parent::*/descendant::*[@security='ts']">
								<xsl:text>TOP SECRET</xsl:text>
							</xsl:when>
							<xsl:when test="parent::*/descendant::*[@security='s']">
								<xsl:text>SECRET</xsl:text>
							</xsl:when>
							<xsl:when test="parent::*/descendant::*[@security='c']">
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
		<xsl:param name="modulectr">
				<xsl:number count="titlepg" format="1" from="paper.manual" level="any"/>
		</xsl:param>
		<xsl:param name="modulectrpms">
			<xsl:number count="titlepg" format="1" from="pms|pmi" level="any"/>
		</xsl:param>
		<xsl:param name="modulectrsum">
			<xsl:number count="titlepg" format="1" from="sum" level="any"/>
		</xsl:param>
		<xsl:param name="modulectrsam">
			<xsl:number count="titlepg" format="1" from="sam" level="any"/>
		</xsl:param>
		
		<xsl:param name="modulectrbdar">
			<xsl:number count="titlepg" format="1" from="bdar" level="any"/>
		</xsl:param>
		<xsl:param name="titlelevel">
			<xsl:if test="ancestor::gim | ancestor::opim | ancestor::mim | ancestor::pim | ancestor::sim | ancestor::tim | ancestor::brim  | ancestor::baim | ancestor::dim | ancestor::sopim | ancestor::softdescdata">
				<xsl:choose>
					<xsl:when test="contains(ancestor::*/@maintlvl, 'depot')">
						<xsl:text>DEPOT&#x2003;</xsl:text>
					</xsl:when>
					<xsl:when test="contains(ancestor::*/@maintlvl, 'asb')">
						<xsl:text>AVIATION SUPPORT BATTALION&#x2003;</xsl:text>
					</xsl:when>
					<xsl:when test="contains(ancestor::*/@maintlvl, 'amc')">
						<xsl:text>AVIATION MAINTENANCE COMPANY&#x2003;</xsl:text>
					</xsl:when>
					<xsl:when test="contains(ancestor::*/@maintlvl, 'tasmg')">
						<xsl:text>THEATER AVIATION SUSTAINMENT MAINTENANCE GROUP&#x2003;</xsl:text>
					</xsl:when>
					<xsl:when test="contains(ancestor::*/@maintlvl, 'crew')">
						<xsl:text>CREW&#x2003;</xsl:text>
					</xsl:when>
					<xsl:when test="contains(ancestor::*/@maintlvl, 'operator')">
						<!--<xsl:text>OPERATOR&#x2003;</xsl:text>-->
					</xsl:when>
					<xsl:when test="contains(ancestor::*/@maintlvl, 'maintainer')">
						<xsl:text>MAINTAINER&#x2003;</xsl:text>
					</xsl:when>
					<xsl:when test="contains(ancestor::*/@maintlvl, 'below_depot')">
						<xsl:text>BELOW DEPOT&#x2003;</xsl:text>
					</xsl:when>
					<xsl:when test="contains(ancestor::*/@maintlvl, 'user')">
						<xsl:text>USER&#x2003;</xsl:text>
					</xsl:when>
					<xsl:when test="contains(ancestor::*/@maintlvl, 'administrator')">
						<xsl:text>ADMINSTRATOR&#x2003;</xsl:text>
					</xsl:when>
				</xsl:choose>
			</xsl:if>
		</xsl:param>
		<xsl:param name="imtype">

		<!--<xsl:if test="ancestor::sum/gim">
				<xsl:text>GENERAL INFORMATION, SOFTWARE SUMMARY&#x2003;</xsl:text>
			</xsl:if>-->
			
			<xsl:if test="ancestor::gim">
<xsl:choose>
	<xsl:when test="ancestor::sum">GENERAL INFORMATION, SOFTWARE SUMMARY&#x2003;</xsl:when>
		<xsl:when test="ancestor::dmwr_ammo">GENERAL INFORMATION AND DMWR INTRODUCTION&#x2003;</xsl:when>

	<xsl:otherwise>GENERAL INFORMATION, EQUIPMENT DESCRIPTION AND THEORY OF OPERATION&#x2003;</xsl:otherwise>
</xsl:choose>			
			</xsl:if>
			<xsl:if test="ancestor::opim">
				<xsl:text>OPERATOR INSTRUCTIONS</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor::tim">
				<xsl:text>TROUBLESHOOTING PROCEDURES</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor::mim">
				<xsl:text>MAINTENANCE INSTRUCTIONS</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor::brim">		
				<xsl:text>BATTLE DAMAGE REPAIR</xsl:text>
			</xsl:if>			
			<xsl:if test="ancestor::baim">
				<xsl:text>BATTLE DAMAGE ASSESSMENT</xsl:text>
			</xsl:if>				
			<xsl:if test="ancestor::pim">
				<xsl:text>PARTS INFORMATION&#x2003;</xsl:text>
			</xsl:if>
			
		<!--	<xsl:if test="ancestor::sum/sim">
				<xsl:text>SUPPORTING INFORMATION</xsl:text>
			</xsl:if>-->
			<!--<xsl:choose>
			
				<xsl:when test="ancestor::dmwr_ammo">DEPOT</xsl:when>-->
			
			<xsl:if test="ancestor::sim">
				<xsl:text>SUPPORTING INFORMATION</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor::dim">
				<xsl:text>DESTRUCTION OF EQUIPMENT TO PREVENT ENEMY USE</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor::sopim">
				<xsl:text>SOFTWARE OPERATOR INSTRUCTIONS</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor::softdescdata">
				<xsl:text>SOFTWARE DESCRIPTION AND DATA</xsl:text>
			</xsl:if>
		</xsl:param>
		<fo:page-sequence color="#000000" font-family="sans-serif" font-size="10pt" force-page-count="end-on-even" format="1" hyphenate="true" initial-page-number="1" language="en" line-height="1.15em" master-reference="impg" text-align="justify">
		
		<fo:static-content flow-name="impg-before"> 
				<fo:block xsl:use-attribute-sets="secur-header-attrs">
					<xsl:value-of select="$docsecr"/>
				</fo:block>
				<fo:block xsl:use-attribute-sets="tmno-header-attrs">
				<xsl:value-of select="(preceding::tmno)[1]"/>
				<xsl:choose><xsl:when test="//sum">
						<xsl:text>&#x02010;SUM</xsl:text>
					</xsl:when>
					<xsl:when test="//sam">
						<xsl:text>&#x02010;SAM</xsl:text>
					</xsl:when>
					<xsl:when test="//paper.manual/@rpstl='yes'">
						<xsl:text>&amp;P</xsl:text>
					</xsl:when>
					<xsl:when test="//paper.manual/@rpstl='only'">
						<xsl:text>P</xsl:text>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
				<xsl:if test="/production/paper.manual/@multivolume='yes'">
					<xsl:variable name="volCounter1">
						<xsl:number count="volume" from="production" level="any"/>
					</xsl:variable>
					<xsl:variable name="thisVolume">
						<xsl:choose>
							<xsl:when test="$volCounter1 = ''">1</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="number($volCounter1 + 1)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:text>-</xsl:text>
					<xsl:value-of select="$thisVolume"/>
				</xsl:if> <!-- This adds the volume number after the TM number -->
				</fo:block>
				<fo:block span="all">
					<fo:leader xsl:use-attribute-sets="header-leader-attrs"></fo:leader>
				</fo:block>
			</fo:static-content>
<!--space-before.maximum="60pt" space-before.minimum="50pt" space-before.optimum="55pt"space-before.conditionality="retain" -->

			<!--<fo:static-content flow-name="xsl-region-after">
				<fo:block xsl:use-attribute-sets="secur-footer-attrs">
					<xsl:value-of select="$docsecr"/>
				</fo:block>
			</fo:static-content>-->
			
			<fo:static-content flow-name="xsl-region-after">
		<fo:block font-family="sans-serif" font-size="10pt" space-before.maximum="16pt" space-before.minimum="14pt" space-before.optimum="14pt" span="all" text-align="center">
					<!--xsl:call-template name="FRNTREAR-FOOTER"> Do not output page numbers
					<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
				</xsl:call-template-->
	</fo:block>
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-after-even">
		<fo:block font-family="sans-serif" font-size="10pt" space-before.maximum="16pt" space-before.minimum="14pt" space-before.optimum="14pt" span="all" text-align="center">
					<!--xsl:call-template name="FRNTREAR-FOOTER"> Do not output page numbers
					<xsl:with-param name="Odd-Or-Even">Even</xsl:with-param>
				</xsl:call-template-->
	</fo:block>
			</fo:static-content>
			
			<fo:flow flow-name="xsl-region-body">
				<fo:wrapper>
					<fo:block font-family="sans-serif" font-size="14pt" font-weight="bold" space-before.conditionality="retain" space-before.maximum="60pt" space-before.minimum="50pt" space-before.optimum="55pt" text-align="center">
					<xsl:choose>
						<xsl:when test="/production/paper.manual"> <!-- Updated space after and space before keeping it simple -->
							<fo:block space-after="14pt" space-before="14pt" span="all">
								<xsl:text>CHAPTER&#x2002;</xsl:text>
								<xsl:value-of select="$modulectr"/>
							</fo:block>
						</xsl:when>
						<xsl:when test="/production/pms | /production/pmi">
							<fo:block space-after="14pt" space-before="14pt" span="all">
								<xsl:text>CHAPTER&#x2002;</xsl:text>
								<xsl:value-of select="$modulectrpms"/>
							</fo:block>
						</xsl:when>
						<xsl:when test="/production/sum">
							<fo:block space-after.maximum="16pt" space-after.minimum="12pt" space-after.optimum="14pt" space-before.conditionality="retain" space-before.maximum="15pc" space-before.minimum="12pc" space-before.optimum="12pc" span="all">
								<xsl:text>CHAPTER&#x2003;</xsl:text>
								<xsl:value-of select="$modulectrsum"/>
							</fo:block>
						</xsl:when>
						<xsl:when test="/production/sam">
							<fo:block space-after.maximum="16pt" space-after.minimum="12pt" space-after.optimum="14pt" space-before.conditionality="retain" space-before.maximum="15pc" space-before.minimum="12pc" space-before.optimum="12pc" span="all">
								<xsl:text>CHAPTER&#x2003;</xsl:text>
								<xsl:value-of select="$modulectrsam"/>
							</fo:block>
						</xsl:when>
						<xsl:otherwise>
							<fo:block space-after.maximum="16pt" space-after.minimum="12pt" space-after.optimum="14pt" space-before.conditionality="retain" space-before.maximum="15pc" space-before.minimum="12pc" space-before.optimum="12pc" span="all">
								<xsl:text>CHAPTER&#x2003;</xsl:text>
								<xsl:value-of select="$modulectrbdar"/>
							</fo:block>
						</xsl:otherwise>
</xsl:choose>
					<fo:block space-after.maximum="16pt" space-after.minimum="12pt" space-after.optimum="14pt" span="all">
						<xsl:value-of select="$imtype"/>
					</fo:block>
					<fo:block space-after.maximum="16pt" space-after.minimum="12pt" space-after.optimum="14pt" span="all">FOR</fo:block>
					<xsl:for-each select="name">
						<fo:block span="all">
							<xsl:apply-templates/>
						</fo:block>
					</xsl:for-each>
					</fo:block>
				</fo:wrapper>
				<!-- space-after.maximum="14pt" space-after.minimum="12pt" space-after.optimum="12pt" 
space-after.maximum="16pt" space-after.minimum="12pt" space-after.optimum="14pt" space-before.conditionality="retain" space-before.maximum="15pc" space-before.minimum="12pc" space-before.optimum="12pc"-->
				<xsl:if test="parent::mim[@chap-toc='yes'] | parent::gim[@chap-toc='yes'] | parent::opim[@chap-toc='yes'] |  parent::sopim[@chap-toc='yes'] | parent::softdescdata[@chap-toc='yes'] | parent::tim[@chap-toc='yes'] | parent::sim[@chap-toc='yes'] | parent::pim[@chap-toc='yes'] | parent::dim[@chap-toc='yes'] | parent::brim[@chap-toc='yes'] | parent::baim[@chap-toc='yes']">
					<fo:wrapper font-family="sans-serif" font-size="12pt" font-weight="bold" page-break-before="left" text-align="center">
					<fo:block page-break-before="left" space-before="12pt" space-after="12pt" span="all">
							<xsl:choose>
						<xsl:when test="/production/paper.manual">
							<fo:block space-before="12pc" span="all">
								<xsl:text>CHAPTER&#x2003;</xsl:text>
								<xsl:value-of select="$modulectr"/>
							</fo:block>
						</xsl:when>
						<xsl:when test="/production/pms">
							<fo:block space-before="12pc" span="all">
								<xsl:text>CHAPTER&#x2003;</xsl:text>
								<xsl:value-of select="$modulectrpms"/>
							</fo:block>
						</xsl:when>
						<xsl:when test="/production/sum">
							<fo:block space-before="12pc" span="all">
								<xsl:text>CHAPTER&#x2003;</xsl:text>
								<xsl:value-of select="$modulectrsum"/>
							</fo:block>
						</xsl:when>
						<xsl:when test="/production/sam">
							<fo:block span="all">
								<xsl:text>CHAPTER&#x2003;</xsl:text>
								<xsl:value-of select="$modulectrsam"/>
							</fo:block>
						</xsl:when>
						</xsl:choose>

						</fo:block>
						<fo:block span="all">
							<xsl:value-of select="$titlelevel"/>
						</fo:block>
						<fo:block space-after="14pt" span="all">
							<xsl:value-of select="$imtype"/>
						</fo:block>
						<fo:block border-bottom-style="solid" border-bottom-width="1pt" border-left-style="hidden" border-right-style="hidden" border-top-style="solid" border-top-width="1pt" padding-bottom="3pt" padding-top="3pt" space-after="14pt" span="all" text-align="left">
							<xsl:text>WORK PACKAGE INDEX</xsl:text>
						</fo:block>
					</fo:wrapper>
					<xsl:call-template name="ChapTOC"/>
				</xsl:if>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	<xsl:template match="titlepg/name" xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template name="ChapTOC">
		<fo:block font-family="sans-serif" font-size="10pt" span="all">
				<fo:table>
					<fo:table-column column-number="1" column-width="90%"/>
					<fo:table-column column-number="2" column-width="10%"/>
					<fo:table-header>
						<fo:table-row>
							<fo:table-cell border-after-style="solid" border-after-width="1pt" number-columns-spanned="2" padding-bottom="3pt" padding-top="6pt" text-align="right">
								<fo:block>
									<fo:inline font-weight="bold">Title</fo:inline>
									<fo:leader leader-pattern="space"/>
									<fo:inline font-weight="bold">WP Sequence No.</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>
					
					<fo:table-body>
						<xsl:for-each select="parent::node()/descendant::wpidinfo">
							<fo:table-row>
								<fo:table-cell column-number="1" padding-top="6pt">
									<fo:block span="all" start-indent="2pc" text-align="left" text-indent="0pc" text-transform="uppercase">
													<xsl:apply-templates mode="TOC" select="child::title"/>
									<xsl:choose>
													<xsl:when test="ancestor-or-self::*/@deletewp='yes'"> (DELETED)</xsl:when> 
												<xsl:otherwise>
													</xsl:otherwise>
													</xsl:choose>
								<xsl:if test="$AutoGenTitle='FALSE'" >
								
									<xsl:choose>
										<xsl:when test="string(wpidinfo/title)" />
										</xsl:choose>
										</xsl:if>
										<fo:leader leader-pattern="dots" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="6pt">
									<fo:block span="all" text-align="right">
										<fo:leader leader-pattern="dots" />
							<xsl:choose>
								<xsl:when test="../@wpseq">
									<xsl:value-of select="../@wpseq"/>
								</xsl:when>
								<xsl:otherwise>
     								<xsl:variable name="majorNo" select="count(preceding::*[wpidinfo and not(@insertwp)])"/>
										<xsl:choose>
      								<xsl:when test="../@insertwp">
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
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
