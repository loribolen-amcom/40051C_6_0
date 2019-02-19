<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="frntcover | frntcover_abbreviated">
			<fo:page-sequence xmlns:fo="http://www.w3.org/1999/XSL/Format" font-family="sans-serif" force-page-count="end-on-even" initial-page-number="1" language="en" master-reference="tmcoverpg" text-align="center">
					<!--
						******************************************************************
						Front cover page footer
						******************************************************************
					-->
					<fo:static-content flow-name="tmcoverpg-first-after">
						<xsl:call-template name="FRONT_COVER-FOOTER"/>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-after">
						<fo:block/>
					</fo:static-content>
					<fo:flow flow-name="xsl-region-body">
						<fo:block font-size="20pt" font-weight="bold" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all" text-align="center">
							<xsl:value-of select="$docsecr"/>
						</fo:block>
						<fo:block space-after="12pt" space-after.conditionality="discard" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all">
							<xsl:apply-templates select="tmtitle | graphic| lube-refs | note | reporting"/>
						</fo:block>
					</fo:flow>
				</fo:page-sequence>
	</xsl:template>
	<xsl:template name="FRONT_COVER-FOOTER">
		<fo:block font-family="sans-serif" font-size="7pt">
			<xsl:apply-templates select="notices"/>
		</fo:block>
		<fo:block span="all" text-align="start">
			<fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
		</fo:block>
		<fo:block font-size="16pt" font-weight="bold" space-after="12pt" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all" text-align="center" text-transform="uppercase">
			<xsl:apply-templates select="servnomen"/>
		</fo:block>
		<!--
******************************************************************
Publication date
******************************************************************
-->
		
		<!--
******************************************************************
Publication pcn
******************************************************************
-->	
		<xsl:choose>
<xsl:when test="tmtitle/tminfono/servbranch[@service = 'marines'] and tmtitle/tminfono/servbranch[@service = 'army']">
	<!--xsl:if test="../tminfono/servbranch/@service=marines"-->
	<fo:block-container>
		<fo:block font-size="16pt" font-weight="bold" span="all" text-align="center" text-transform="uppercase">
			<xsl:value-of select="date"/>
			</fo:block>
		<fo:block font-size="12pt" font-weight="bold" span="all" text-align="right" text-transform="uppercase">
			<xsl:value-of select="pcn"/>
		</fo:block>
		</fo:block-container>
		</xsl:when>
<xsl:when test="tmtitle/tminfono/servbranch[@service = 'marines']">
	<!--xsl:if test="../tminfono/servbranch/@service=marines"-->
	<fo:block-container>
		<fo:block font-size="12pt" font-weight="bold" space-after="6pt" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all" text-align="right" text-transform="uppercase">
			<xsl:value-of select="date"/>
					</fo:block>
		<fo:block font-size="12pt" font-weight="bold" space-after="12pt" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all" text-align="right" text-transform="uppercase">
			<xsl:value-of select="pcn"/>
		</fo:block>
		</fo:block-container>
		</xsl:when>
		
<xsl:otherwise>
<!--xsl:if test="not(../tminfono/servbranch/@service=marines)"-->
		<fo:block font-size="16pt" font-weight="bold" space-after="12pt" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all" text-align="center" text-transform="uppercase">
			<xsl:value-of select="date"/>
			</fo:block>
		</xsl:otherwise>
		</xsl:choose>
		<!--
******************************************************************
Document security level (other than unclassified)
******************************************************************
-->
		<fo:block font-size="20pt" font-weight="bold" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all" text-align="center">
			<xsl:value-of select="$docsecr"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="tminfono">
		<fo:block font-size="20pt" font-weight="bold" space-after.maximum="0pt" space-after.minimum="0pt" space-after.optimum="0pt" space-before.maximum="12pt" space-before.minimum="10pt" space-before.optimum="10pt" span="all" text-align="center" text-transform="uppercase">
			<xsl:if test="servbranch/@service='army'">
				<xsl:text>Army</xsl:text>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="tmno[1]"/>
			</xsl:if>
			<xsl:if test="servbranch/@service='marines'">
				<xsl:text>Marine Corps</xsl:text>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="tmno[1]"/>
			</xsl:if>
			<xsl:if test="servbranch/@service='af'">
				<xsl:text>Air Force</xsl:text>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="tmno[1]"/>
			</xsl:if>
			<xsl:if test="servbranch/@service='navy_air'">
				<xsl:text>Navy (NAVAIR)</xsl:text>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="tmno[1]"/>
			</xsl:if>
			<xsl:if test="servbranch/@service='navy_sea'">
				<xsl:text>Navy (NAVSEA)</xsl:text>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="tmno[1]"/>
			</xsl:if>
		</fo:block>
	</xsl:template>
	<xsl:template match="//pmc//tmno">
			<fo:inline>TM </fo:inline>
			<xsl:apply-templates/>
			<fo:inline>PMC</fo:inline>
	</xsl:template>
	<xsl:template match="//dmwr_ammo//tmno">
		<fo:block font-size="20pt" font-weight="bold" space-after.maximum="0pt" space-after.minimum="0pt" space-after.optimum="0pt" space-before.maximum="12pt" space-before.minimum="10pt" space-before.optimum="10pt" span="all" text-align="center" text-transform="uppercase">
			<fo:inline>DMWR </fo:inline>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<!--
******************************************************************
Common description for TMTITLE and children elements
******************************************************************
-->
	<xsl:template match="tmtitle">
		<xsl:apply-templates select="tminfono | prtitle | stitle | weapons-system | tmno"/>
	</xsl:template>
	<xsl:template match="tmno">
		<fo:inline font-size="20pt" font-weight="bold" text-align="center" text-transform="uppercase">
		<xsl:apply-templates/>
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
				</xsl:if>
				
	<!--	<xsl:variable name="volCounter1">
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
									<xsl:variable name="volCounter2">
										<xsl:number count="volume" from="production" level="any"/>
									</xsl:variable>
									<xsl:variable name="numVolTags">
										<xsl:choose>
											<xsl:when test="$volCounter2 = ''">1</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="number($volCounter2 + 1)"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:if test="$volCounter2 > '1'">
										<xsl:choose>
										<xsl:when test="//paper.manual/@rpstl='yes'">
											<xsl:text>&amp;P</xsl:text>
										</xsl:when>
										<xsl:when test="//paper.manual/@rpstl='only'">
											<xsl:text>P</xsl:text>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
										<xsl:text>-</xsl:text>
										<xsl:value-of select="$numVolTags"/>
									</xsl:if>
									--><!-- This adds the volume number after the TM number --><!--
									<xsl:if test="$thisVolume = '1'">
									<xsl:choose>
										<xsl:when test="//paper.manual/@rpstl='yes'">
											<xsl:text>&amp;P</xsl:text>
										</xsl:when>
										<xsl:when test="//paper.manual/@rpstl='only'">
											<xsl:text>P</xsl:text>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
									<xsl:text>-1</xsl:text>
									</xsl:if>
									--><!-- This is for the start of the book before the volume tags --><!--
									<xsl:if test="$thisVolume = '2'">-->
									<!--<xsl:choose>
										<xsl:when test="//paper.manual/@rpstl='yes'">
											<xsl:text>&amp;P</xsl:text>
										</xsl:when>
										<xsl:when test="//paper.manual/@rpstl='only'">
											<xsl:text>P</xsl:text>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
										<xsl:text>-</xsl:text>
										<xsl:value-of select="$thisVolume"/>
									</xsl:if>-->
</fo:inline>
	</xsl:template>
	<xsl:template match="tmtitle/prtitle">
		<fo:wrapper font-family="sans-serif" font-size="14pt" font-weight="bold" text-transform="uppercase">
			<xsl:if test="ancestor::frntcover">
				<fo:block span="all">
					<fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
				</fo:block>
			</xsl:if>
		 	<xsl:choose>			<!-- dmwr and lo and TMs are the 3 pubs types to consider -->
				<xsl:when test="//dmwr_ammo"> <!-- type and maintlvl same, do nothing -->
				</xsl:when>
				<xsl:when test="//paper.manual[@maintlvls='dmwr'] or //paper.manual[@maintlvls='nmwr'] or //paper.manual[@maintlvls='dmwr-nmwr']"> <!-- type and maintlvl same, do nothing -->
				</xsl:when>				
				<xsl:when test="//lubeorder"> <!-- type and maintlvl same, do nothing -->
				</xsl:when>
				<xsl:otherwise> <!-- all other cases get TECHNICAL MANUAL -->
					<fo:block space-after.maximum="6pt" space-after.minimum="2pt" space-after.optimum="2pt" space-before.maximum="26pt" space-before.minimum="20pt" space-before.optimum="24pt" span="all" text-align="center">TECHNICAL MANUAL</fo:block>
		 		</xsl:otherwise>			
		 	</xsl:choose>			
			<!-- output name for typelvltitle attribute found in para-variable.xsl -->
		 	<fo:block space-after.maximum="6pt" space-after.minimum="4pt" space-after.optimum="4pt" space-before.conditionality="discard" space-before.maximum="18pt" space-before.minimum="14pt" space-before.optimum="17pt" span="all" text-align="center">
				<xsl:value-of select="$typelvltitle"/>
			</fo:block>
			<xsl:if test="//paper.manual[@maintlvls='dmwr-nmwr']"> <!-- output containing National Overhaul Standards -->
			  <fo:block space-after.maximum="6pt" space-after.minimum="2pt" space-after.optimum="2pt" space-before.maximum="2pt" space-before.minimum="2pt" space-before.optimum="2pt" span="all" text-align="center">CONTAINING</fo:block>
				<fo:block font-weight="bold" space-after.maximum="6pt" space-after.minimum="2pt" space-after.optimum="2pt" space-before.maximum="2pt" space-before.minimum="2pt" space-before.optimum="2pt" span="all" text-align="center">NATIONAL OVERHAUL STANDARDS</fo:block>
			</xsl:if>
			<fo:block space-after.maximum="6pt" space-after.minimum="4pt" space-after.optimum="4pt" space-before.conditionality="discard" space-before.maximum="4pt" space-before.minimum="0pt" space-before.optimum="4pt" span="all" text-align="center">
				<xsl:value-of select="$rpstl"/> <!-- output rpstl statement-->
			</fo:block>
			<fo:block space-after.maximum="12pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="4pt" space-before.minimum="0pt" space-before.optimum="4pt" span="all" text-align="center">
				<xsl:text>FOR</xsl:text> <!-- output FOR -->
			</fo:block>
		</fo:wrapper>
		
		<xsl:variable name="TMNameLen">
			<!-- canzualda, PTC, 01/21/2010, changed sysnomen/name[1] to sysnomen[1]/name[1] 
				(A sequence of more than one item is not allowed as the first argument of 
				normalize-space()) -->
			<xsl:value-of select="string-length(sysnomen[1]/name[1])"/>
		</xsl:variable>
		<fo:wrapper font-family="sans-serif" font-weight="bold">
						<xsl:choose>
							<xsl:when test="//pms or //pmi or //pmc"> <!-- for LOG BOOKS -->
							</xsl:when>
							<xsl:otherwise>
			<xsl:attribute name="font-size">
			<xsl:choose>
			<xsl:when test="number($TMNameLen)&lt;45">20pt</xsl:when>
			<xsl:when test="number($TMNameLen)&lt;40">22pt</xsl:when>
			<xsl:when test="number($TMNameLen)&lt;35">24pt</xsl:when>
			<xsl:otherwise>14pt</xsl:otherwise>
			</xsl:choose>
			</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>	  			
			<xsl:apply-templates/>
		</fo:wrapper>
	</xsl:template>
	<xsl:template match="tmtitle/prtitle/sysnomen | titleblk/prtitle/sysnomen | chgsheet/prtitle/sysnomen">
		<xsl:apply-templates mode="FRONT-COVER" select="name | node()[2]"/> <!-- exclude comments -->
	</xsl:template>
	<xsl:template match="brk" mode="FRONT-COVER">
		<fo:block></fo:block>
	</xsl:template>
	<xsl:template match="name" mode="FRONT-COVER">
		<fo:block span="all" text-align="center">
			<xsl:if test="sysnomen/@pretext">
				<xsl:value-of select="@pretext"/>
			</xsl:if>
			<xsl:apply-templates mode="FRONT-COVER"/>
		</fo:block>
	</xsl:template>

	<!--**********************************************
Common elements for SYSNOMEN (excluding NAME)
**********************************************
-->
	<xsl:template match="modelno">
		<fo:block text-align="center">
			<fo:inline text-transform="uppercase">
				<xsl:apply-templates/>
			</fo:inline>
		</fo:block>
	</xsl:template>
	<xsl:template match="eic">
		<fo:block text-align="center">
			<fo:inline text-transform="uppercase">
				<xsl:text>(EIC: </xsl:text>
				<xsl:apply-templates/>
				<xsl:text>)</xsl:text>
			</fo:inline>
		</fo:block>
	</xsl:template>
	<xsl:template match="partno">
		<fo:inline text-transform="uppercase">
			<xsl:text>P/N </xsl:text>
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
<!--		<xsl:template match="cageno">
		<fo:inline text-transform="uppercase">
			<xsl:text>CAGEC </xsl:text>
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>-->
	<!--<xsl:template match="nsn">
		<fo:block>
			<xsl:text>NSN: </xsl:text>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>-->
	
	<xsl:template match="modelno" mode="FRONT-COVER">
		<!-- entering here -->
		<fo:block text-align="center">
			<xsl:apply-templates/>
		<fo:inline>
			<xsl:text>&#x2002;</xsl:text>
			<xsl:if test="local-name(following-sibling::node()[1])!='modelno' ">
				<xsl:apply-templates mode="FRONT-COVER" select="following-sibling::node()[1]"/>
			</xsl:if>
		<!--</fo:block>-->
		<xsl:choose>
			<xsl:when test="local-name(following-sibling::node()[1])='modelno' ">
				<xsl:apply-templates mode="FRONT-COVER" select="following-sibling::node()[1]"/>
			</xsl:when>
	<xsl:when test="local-name(following-sibling::node()[1])='partno' and contains('modelno|partno',local-name(following-sibling::node()[2]))">
				<xsl:apply-templates mode="FRONT-COVER" select="following-sibling::node()[2]"/>
			</xsl:when>
	<xsl:when test="local-name(following-sibling::node()[1])='nsn' and contains('nsn|modelno|partno',local-name(following-sibling::node()[2]))">
				<xsl:apply-templates mode="FRONT-COVER" select="following-sibling::node()[2]"/>
			</xsl:when>
	<xsl:when test="local-name(following-sibling::node()[1])='partno' and local-name(following-sibling::node()[2])='nsn' and contains('nsn|modelno|partno',local-name(following-sibling::node()[3]))">
				<xsl:apply-templates mode="FRONT-COVER" select="following-sibling::node()[3]"> </xsl:apply-templates>
			</xsl:when>
		</xsl:choose>
		</fo:inline> </fo:block>
	</xsl:template>
	<xsl:template match="partno" mode="FRONT-COVER">
		<xsl:choose>
			<xsl:when test="local-name(preceding-sibling::node()[1])='modelno' or local-name(preceding-sibling::node()[1])='' ">
				<fo:inline>
				<xsl:text>&#x2002;</xsl:text>
					P/N&#x2002;<xsl:apply-templates select="node()"/>
				</fo:inline>
				<!--Only NSN or EIC can follow part #, if exist-->
				<xsl:if test="contains('nsn|eic',local-name(following-sibling::node()[1]))">
					<xsl:apply-templates mode="FRONT-COVER" select="following-sibling::node()[1]"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<fo:block>
					<fo:inline keep-with-previous.within-line="always">
					<xsl:text>&#x2002;</xsl:text>
					P/N&#x2002;<xsl:apply-templates select="node()"/>
					</fo:inline>
					<!--Only NSN or EIC can follow part #, if exist-->
					<xsl:if test="contains('nsn|eic',local-name(following-sibling::node()[1]))">
						<xsl:apply-templates mode="FRONT-COVER" select="following-sibling::node()[1]"/>
					</xsl:if>
				</fo:block>
				<xsl:choose>
					<xsl:when test="contains('modelno|partno',local-name(following-sibling::node()[1]))">
						<xsl:apply-templates mode="FRONT-COVER" select="following-sibling::node()[1]"/>
						<xsl:apply-templates mode="FRONT-COVER" select="following-sibling::cageno"/>
					</xsl:when>
					<xsl:when test="local-name(following-sibling::node()[1])='nsn' and contains('nsn|modelno|partno',local-name(following-sibling::node()[2]))">
						<xsl:apply-templates mode="FRONT-COVER" select="following-sibling::node()[2]"/>
						<xsl:apply-templates mode="FRONT-COVER" select="following-sibling::cageno"/>
					</xsl:when>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="nsn" mode="FRONT-COVER">
		<xsl:for-each select="nsn">
			<xsl:apply-templates select="."/>
			<!--<xsl:apply-templates select="following-sibling::node()[1]"/>-->
		</xsl:for-each>
		<!--Part # is end of group of NSN and/or model #-->
		<xsl:choose>
			<xsl:when test="local-name(following-sibling::node()[1])='nsn' ">
				<!--<fo:block>-->
					<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
					<fo:inline keep-with-previous.within-line="always">(NSN&#x2002;<xsl:call-template name="NSN-VALUE">
							<xsl:with-param name="Fsc">
								<xsl:value-of select="fsc"/>
							</xsl:with-param>
							<xsl:with-param name="Niin">
								<xsl:value-of select="niin"/>
							</xsl:with-param>
						</xsl:call-template>
						<xsl:text>)</xsl:text>
					<xsl:apply-templates mode="FRONT-COVER" select="following-sibling::node()[2]"/></fo:inline>
				<!--</fo:block>-->
			</xsl:when>
			<xsl:when test="contains('modelno|partno',local-name(preceding-sibling::node()[1]))">
			<!--	<fo:block>-->
					<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
					<fo:inline keep-with-previous.within-line="always">(NSN&#x2002;<xsl:call-template name="NSN-VALUE">
							<xsl:with-param name="Fsc">
								<xsl:value-of select="fsc"/>
							</xsl:with-param>
							<xsl:with-param name="Niin">
								<xsl:value-of select="niin"/>
							</xsl:with-param>
						</xsl:call-template>
						<xsl:text>)</xsl:text>
					</fo:inline>
					<!--Only EIC can follow NSN, if exist-->
					<xsl:if test="contains('nsn|eic',local-name(following-sibling::node()[1]))">
						<xsl:apply-templates mode="FRONT-COVER" select="following-sibling::node()[1]"/>
					</xsl:if>
<!--					<xsl:if test="local-name(following-sibling::node()[1])='nsn'">
						<xsl:apply-templates mode="FRONT-COVER" select="nsn"/>
					</xsl:if>-->
			<!--	</fo:block>-->
			</xsl:when>
			<!--Only NSN is sysnomen group keep-with-previous.within-line="always"-->
			<xsl:otherwise>
				<fo:block keep-with-previous="always" span="all" text-align="center">
					<fo:inline>(NSN&#x2002;<xsl:call-template name="NSN-VALUE">
							<xsl:with-param name="Fsc">
								<xsl:value-of select="fsc"/>
							</xsl:with-param>
							<xsl:with-param name="Niin">
								<xsl:value-of select="niin"/>
							</xsl:with-param>
						</xsl:call-template>
						<xsl:text>)</xsl:text>
					</fo:inline>
					<!--Only EIC can follow NSN, if exist-->
					<xsl:apply-templates mode="FRONT-COVER" select="following-sibling::eic"/>
					<!--Start the next set of model #, part #, and/or NSN group -->
					<xsl:if test="local-name(following-sibling::node()[1])!='eic' and local-name(following-sibling::node()[1])!=''">
						<xsl:apply-templates mode="FRONT-COVER" select="following-sibling::node()[1]"/>
					</xsl:if>
					<xsl:apply-templates mode="FRONT-COVER" select="following-sibling::cageno"/>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="eic" mode="FRONT-COVER">
		<xsl:text disable-output-escaping="no">&#x2002;(EIC&#x2002;</xsl:text>
		<xsl:apply-templates select="node()[1]"/>
		<xsl:text>)</xsl:text>
	</xsl:template>
	
		<xsl:template match="cageno" mode="FRONT-COVER">
		<xsl:text disable-output-escaping="no">&#x2002;CAGEC&#x2002;</xsl:text>
		<xsl:apply-templates select="node()[1]"/>
	</xsl:template>
	
	<xsl:template match="//frntcover_abbreviated//lube-refs">
		<fo:block space-after="14pt" space-after.precedence="5" space-before.maximum="12pt" space-before.minimum="10pt" space-before.optimum="12pt" span="all" text-align="left" text-transform="uppercase">REFERENCES: 
			<xsl:number count="extref" from="lube-refs/extref"/>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="notices">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="stitle">
		<fo:block space-after="14pt" space-after.precedence="5" space-before.maximum="12pt" space-before.minimum="10pt" space-before.optimum="12pt" span="all" text-align="center" text-transform="uppercase">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="weapons_system">
		<fo:block space-after="14pt" space-after.precedence="5" space-before.maximum="12pt" space-before.minimum="10pt" space-before.optimum="12pt" span="all" text-align="center" text-transform="uppercase">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="prtitle/subject">
		<fo:block space-after="14pt" space-after.precedence="5" space-before.maximum="12pt" space-before.minimum="10pt" space-before.optimum="12pt" span="all" text-align="center" text-transform="uppercase">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<!--xsl:template match="promulgation">
		<fo:block page-break-before="always">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template-->
		<xsl:template match="promulgation"><!-- pageset - tmcoverpg -->
			<fo:page-sequence xmlns:fo="http://www.w3.org/1999/XSL/Format" font-family="sans-serif" force-page-count="end-on-even" initial-page-number="1" language="en" master-reference="imtitlepg" text-align="center">
					<fo:static-content flow-name="tmcoverpg-first-after">
						<fo:block/>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-after">
						<fo:block/>
					</fo:static-content>
					<fo:flow flow-name="xsl-region-body">
						<fo:block space-after="12pt" space-after.conditionality="discard" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all">
							<xsl:apply-templates select="graphic"/>
						</fo:block>
					</fo:flow>
				</fo:page-sequence>
	</xsl:template>

</xsl:stylesheet>
