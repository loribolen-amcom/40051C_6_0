<?xml version="1.0" encoding="utf-8"?>
<!-- Fragment document type declaration subset:
	Arbortext, Inc., 1988-2005, v.4002
	<!DOCTYPE xsl:stylesheet>
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="titleblk">
		<xsl:param name="Odd-First"/>
	<xsl:param name="Odd-Or-First"/>
	<xsl:param name="Odd-Or-Even"/>
		<fo:page-sequence font-family="sans-serif" font-size="10pt" force-page-count="end-on-even" hyphenate="true" initial-page-number="1" format="i" language="en" master-reference="titleblkpg" text-align="center">
			<fo:static-content flow-name="titleblkpg-first-after">
		<fo:block text-align="center">
				<xsl:call-template name="FRNTREAR-FOOTER">
					<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
					</xsl:call-template>
					</fo:block>
			</fo:static-content>

<fo:static-content flow-name="xsl-region-after">
<fo:block space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" text-align="center">
		<xsl:call-template name="FRNTREAR-FOOTER">
					<xsl:with-param name="Odd-Or-Even">Even</xsl:with-param>
					</xsl:call-template>
		</fo:block>
</fo:static-content>
			<fo:static-content flow-name="xsl-region-before">
			<fo:block>
				<fo:block xsl:use-attribute-sets="tmno-header-attrs">

				<xsl:value-of select="(preceding::tmno)[1]"/>

				
				<xsl:choose>
				<xsl:when test="//sum">
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
				<fo:block text-align="justify"><fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
	  			</fo:block>
	  			</fo:block>
</fo:static-content>

	<fo:flow flow-name="xsl-region-body">
			<fo:block space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all">
						<xsl:choose>
							<xsl:when test="//pms or //pmi or //pmc"> <!-- for LOG BOOKS -->
								  <xsl:attribute name="font-size">10pt</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								  <xsl:attribute name="font-size">12pt</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>	  			
					<fo:block xsl:use-attribute-sets="secur-header-attrs">
						<xsl:value-of select="$docsecr"/>
					</fo:block>
					<fo:block font-family="sans-serif" font-size="12pt" font-weight="bold" span="all" text-align="center">
				<xsl:value-of select="(preceding::tmno)[1]"/>
				<xsl:choose>
				<xsl:when test="//sum">
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
			 <fo:block text-align="justify"><fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
	  			</fo:block>
					<fo:block font-weight="bold" space-after="2pt" span="all" text-align="right" text-transform="uppercase">
						<xsl:choose>
							<xsl:when test="//pms or //pmi or //pmc"> <!-- for LOG BOOKS -->
								  <xsl:attribute name="space-before">2pt</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								  <xsl:attribute name="space-before">12pt</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>	  			
						<xsl:apply-templates select="servnomen"/><xsl:text disable-output-escaping="no">&#x2002;</xsl:text></fo:block>
					<fo:block font-weight="bold" space-before="2pt" span="all" text-align="right" text-transform="uppercase">
						<xsl:choose>
							<xsl:when test="//pms or //pmi or //pmc"> <!-- for LOG BOOKS -->
								  <xsl:attribute name="space-after">0pt</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								  <xsl:attribute name="space-after">36pt</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>	  			
	<xsl:choose> 
								<xsl:when test="string-length(city) != 0">
								<xsl:value-of disable-output-escaping="no" select="city"/>
								<xsl:text disable-output-escaping="no">, </xsl:text>
							</xsl:when>
							<xsl:otherwise>WASHINGTON, </xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
							<xsl:when test="string-length(state) != 0">
								<xsl:value-of disable-output-escaping="no" select="state"/>
								<xsl:text disable-output-escaping="no">, </xsl:text>
							</xsl:when>
							<xsl:otherwise>D.C.
							<xsl:text disable-output-escaping="no">, </xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						<!-- Get date from front cover page date -->
						<xsl:value-of disable-output-escaping="no" select="date"/>
					</fo:block>
<!--					<fo:block text-align="justify">
						<fo:leader leader-pattern="rule" leader-length="100%"/>
					</fo:block>-->
					<fo:block space-after.maximum="6pt" space-after.minimum="4pt" space-after.optimum="4pt" space-before.conditionality="discard" space-before.maximum="6pt" space-before.minimum="4pt" space-before.optimum="4pt">
						<xsl:apply-templates select="prtitle | stitle | weapon-system | reporting | pm.warning.data"/>
					</fo:block>
						<xsl:choose>
							<xsl:when test="//pms or //pmi or //pmc"> <!-- for LOG BOOKS -->
							</xsl:when>
							<xsl:otherwise>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
							</xsl:otherwise>
						</xsl:choose>	  			
					<!--xsl:if test="//paper.manual/@rpstl!='no'">
						<fo:block font-weight="bold" space-after="12pt" space-before="4pt" text-align="left" text-transform="uppercase">
							<xsl:text disable-output-escaping="no">CURRENT AS OF&#x2002;</xsl:text>
							<xsl:value-of disable-output-escaping="no" select="//production/@date"/>
						</fo:block>
					</xsl:if-->
				</fo:block>
				<fo:block font-family="sans-serif" font-size="7pt">
					<xsl:apply-templates select="notices"/>
				</fo:block>
				<!--<fo:block>
					<fo:marker marker-class-name="blank-page">
						<xsl:text>/blank </xsl:text>
					</fo:marker>
				</fo:block>-->
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	<xsl:template match="titleblk/prtitle">
		<fo:wrapper font-family="sans-serif" font-size="12pt" font-weight="bold" text-transform="uppercase">
			<!--xsl:if test="ancestor::frntcover">
				<fo:block span="all">
					<fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
				</fo:block>
			</xsl:if-->
		 	<xsl:choose>			<!-- dmwr and lo and TMs are the 3 pubs types to consider -->
				<xsl:when test="//dmwr_ammo"> <!-- type and maintlvl same, do nothing -->
				</xsl:when>
				<xsl:when test="//paper.manual[@maintlvls='dmwr'] or //paper.manual[@maintlvls='nmwr'] or //paper.manual[@maintlvls='dmwr-nmwr']"> <!-- type and maintlvl same, do nothing -->
				</xsl:when>				
				<xsl:when test="//lubeorder"> <!-- type and maintlvl same, do nothing -->
				</xsl:when>
				<xsl:otherwise> <!-- all other cases get TECHNICAL MANUAL -->
					<fo:block span="all" text-align="center">
							<xsl:choose>
							<xsl:when test="//pms or //pmi"> <!-- for LOG LAND BOOKS, need real estate -->
								<xsl:attribute name="space-before.maximum">0pt</xsl:attribute>
								<xsl:attribute name="space-before.minimum">0pt</xsl:attribute>
								<xsl:attribute name="space-before.optimum">0pt</xsl:attribute>
  							<xsl:attribute name="space-after.maximum">0pt</xsl:attribute>
								<xsl:attribute name="space-after.minimum">0pt</xsl:attribute>
								<xsl:attribute name="space-after.optimum">0pt</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="space-before.maximum">26pt</xsl:attribute>
								<xsl:attribute name="space-before.minimum">20pt</xsl:attribute>
								<xsl:attribute name="space-before.optimum">24pt</xsl:attribute>
  							<xsl:attribute name="space-after.maximum">6pt</xsl:attribute>
								<xsl:attribute name="space-after.minimum">2pt</xsl:attribute>
								<xsl:attribute name="space-after.optimum">2pt</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>	  			
          	<xsl:text>TECHNICAL MANUAL</xsl:text>
          </fo:block>
		 		</xsl:otherwise>			
		 	</xsl:choose>			
			<!-- output name for typelvltitle attribute found in para-variable.xsl -->
		 	<fo:block space-before.conditionality="discard" span="all" text-align="center">
							<xsl:choose>
							<xsl:when test="//pms or //pmi"> <!-- for LOG LAND BOOKS, need real estate -->
								<xsl:attribute name="space-before.maximum">0pt</xsl:attribute>
								<xsl:attribute name="space-before.minimum">0pt</xsl:attribute>
								<xsl:attribute name="space-before.optimum">0pt</xsl:attribute>
  							<xsl:attribute name="space-after.maximum">0pt</xsl:attribute>
								<xsl:attribute name="space-after.minimum">0pt</xsl:attribute>
								<xsl:attribute name="space-after.optimum">0pt</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="space-before.maximum">16pt</xsl:attribute>
								<xsl:attribute name="space-before.minimum">10pt</xsl:attribute>
								<xsl:attribute name="space-before.optimum">14pt</xsl:attribute>
  							<xsl:attribute name="space-after.maximum">6pt</xsl:attribute>
								<xsl:attribute name="space-after.minimum">4pt</xsl:attribute>
								<xsl:attribute name="space-after.optimum">4pt</xsl:attribute>
 								</xsl:otherwise>
						</xsl:choose>	  			
				<xsl:value-of select="$typelvltitle"/>
			</fo:block>
			<xsl:if test="//paper.manual[@maintlvls='dmwr-nmwr']"> <!-- output containing National Overhaul Standards -->
			  <fo:block space-after.maximum="6pt" space-after.minimum="2pt" space-after.optimum="2pt" space-before.maximum="2pt" space-before.minimum="2pt" space-before.optimum="2pt" span="all" text-align="center">CONTAINING</fo:block>
				<fo:block font-weight="bold" space-after.maximum="6pt" space-after.minimum="2pt" space-after.optimum="2pt" space-before.maximum="2pt" space-before.minimum="2pt" space-before.optimum="2pt" span="all" text-align="center">NATIONAL OVERHAUL STANDARDS</fo:block>
			</xsl:if>
			<xsl:if test="not(//pms) or not(//pmi)"> <!-- don't output block for logbooks due to lack of space -->
				<fo:block space-after.maximum="6pt" space-after.minimum="4pt" space-after.optimum="4pt" space-before.conditionality="discard" space-before.maximum="4pt" space-before.minimum="0pt" space-before.optimum="4pt" span="all" text-align="center">
				<xsl:value-of select="$rpstl"/> <!-- output rpstl statement-->
			</fo:block>
			</xsl:if>
			<fo:block space-before.maximum="4pt" space-before.minimum="0pt" space-before.optimum="4pt" span="all" text-align="center">
							<xsl:choose>
							<xsl:when test="//pms or //pmi"> <!-- for LOG LAND BOOKS, need real estate -->
								<xsl:attribute name="space-after.maximum">6pt</xsl:attribute>
								<xsl:attribute name="space-after.minimum">5pt</xsl:attribute>
								<xsl:attribute name="space-after.optimum">5pt</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="space-after.maximum">12pt</xsl:attribute>
								<xsl:attribute name="space-after.minimum">10pt</xsl:attribute>
								<xsl:attribute name="space-after.optimum">10pt</xsl:attribute>
 							</xsl:otherwise>
						</xsl:choose>
						<xsl:text>FOR</xsl:text> <!-- output FOR -->
			</fo:block>
				<fo:block space-after.maximum="6pt" space-after.minimum="4pt" space-after.optimum="4pt" space-before.maximum="4pt" space-before.minimum="0pt" space-before.optimum="4pt" span="all" text-align="center">
				<xsl:apply-templates/>
			</fo:block>
 	</fo:wrapper>
	</xsl:template>
	<xsl:template match="titleblk/reporting">
		<fo:block border-after-style="solid" border-after-width="2pt" border-before-style="solid" border-before-width="2pt" border-left-style="solid" border-left-width="2pt" border-right-style="solid" border-right-width="2pt" font-family="sans-serif" font-weight="bold">
							<xsl:choose>
							<xsl:when test="//pms or //pmi"> <!-- for LOG LAND BOOKS, need real estate -->
								<xsl:attribute name="end-indent">2pc</xsl:attribute>
								<xsl:attribute name="start-indent">2pc</xsl:attribute>
								<xsl:attribute name="font-size">8pt</xsl:attribute>
								<xsl:attribute name="padding-bottom">4pt</xsl:attribute>
								<xsl:attribute name="padding-left">4pt</xsl:attribute>
								<xsl:attribute name="padding-right">4pt</xsl:attribute>
								<xsl:attribute name="padding-top">4pt</xsl:attribute>
								<xsl:attribute name="space-before">10pt</xsl:attribute>
								<xsl:attribute name="space-after">4pt</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="end-indent">4pc</xsl:attribute>
								<xsl:attribute name="start-indent">4pc</xsl:attribute>
								<xsl:attribute name="font-size">10pt</xsl:attribute>
								<xsl:attribute name="padding-bottom">8pt</xsl:attribute>
								<xsl:attribute name="padding-left">8pt</xsl:attribute>
								<xsl:attribute name="padding-right">8pt</xsl:attribute>
								<xsl:attribute name="padding-top">8pt</xsl:attribute>
								<xsl:attribute name="space-before">48pt</xsl:attribute>
								<xsl:attribute name="space-after">28pt</xsl:attribute>
 							</xsl:otherwise>
						</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length(titleblk/reporting/title)=0">
					<fo:block font-weight="bold" span="all" text-align="center" display-align="center">
						<xsl:choose>
							<xsl:when test="//pms or //pmi"> <!-- for LOG LAND BOOKS, need real estate -->
								<xsl:attribute name="font-size">9pt</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="font-size">12pt</xsl:attribute>
 							</xsl:otherwise>
						</xsl:choose>
						<xsl:text>REPORTING ERRORS AND RECOMMENDING IMPROVEMENTS</xsl:text>
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="titleblk/reporting/title"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>

	<xsl:template match="titleblk/reporting/title">
		<fo:block font-weight="bold" span="all" text-align="center" display-align="center">
						<xsl:choose>
							<xsl:when test="//pms or //pmi"> <!-- for LOG LAND BOOKS, need real estate -->
								<xsl:attribute name="font-size">9pt</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="font-size">12pt</xsl:attribute>
 							</xsl:otherwise>
						</xsl:choose>
			<xsl:apply-templates select="title"/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="titleblk/reporting/para|titleblk/reporting/reporting.para">
		<fo:block font-family="sans-serif" span="all" text-align="left">
							<xsl:choose>
							<xsl:when test="//pms or //pmi"> <!-- for LOG LAND BOOKS, need real estate -->
								<xsl:attribute name="font-size">8pt</xsl:attribute>
								<xsl:attribute name="space-before">4pt</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="font-size">9pt</xsl:attribute>
								<xsl:attribute name="space-before">10pt</xsl:attribute>
 							</xsl:otherwise>
						</xsl:choose>
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	
<!--	<xsl:template match="titleblk/reporting/para">
		<fo:block font-family="sans-serif" font-size="9pt" space-before="10pt" span="all" text-align="left">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>-->
	<xsl:template match="titleblk/pm.warning.data">
		<fo:block font-family="sans-serif" font-size="9pt" space-before="10pt" span="all" text-align="center">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
