<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="contents">
		<xsl:call-template name="frntrear-rl"/>
	</xsl:template>
	<xsl:template name="autogen-contents">
		<xsl:param name="Volume" select="volume"/>
		<xsl:param name="RearVol" select="vol-rear"/>
		<xsl:variable name="numFollowingVolume" select="count(following-sibling::volume)"/>
		<xsl:variable name="lastVolume" select="$numFollowingVolume - count(paper.manual/following-sibling::volume)"/>
		<fo:wrapper font-family="sans-serif" font-size="10pt">
			<fo:block>
				<fo:table>
					<fo:table-column column-number="1" column-width="25%"/>
					<fo:table-column column-number="2" column-width="60%"/>
					<fo:table-column column-number="3" column-width="15%"/>
					<fo:table-header>
						<fo:table-row>
							<fo:table-cell number-columns-spanned="3" padding-bottom="3pt" padding-top="6pt" text-align="right" font-family="sans-serif">
								<fo:block font-weight="bold">Page No. </fo:block>
								<fo:block font-weight="bold" text-decoration="underline">WP Sequence No.</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>
					<xsl:choose>
						<xsl:when test="/production/paper.manual/@rpstl='only'">
							<fo:table-body>
								<xsl:for-each select="ancestor-or-self::paper.frnt/howtouse/title">
									<fo:table-row>
										<fo:table-cell number-columns-spanned="3" padding-top="20pt">
		<fo:block span="all" start-indent="0pc" text-align="left" text-indent="0pc" font-size="10pt" font-family="sans-serif" space-after="18pt" space-before="48pt">
												<xsl:text>HOW TO USE THIS MANUAL</xsl:text>
												<xsl:text>&#x2002;</xsl:text>
												<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
												<fo:page-number-citation ref-id="{generate-id(.)}"/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
								<xsl:for-each select="//titlepg">
									<xsl:for-each select="parent::node()/descendant::wpidinfo">
										<xsl:choose>
											<xsl:when test="parent::plwp | parent::stl_partswp | parent::stlwp | parent::kitswp">
										<fo:table-row>
											<fo:table-cell number-columns-spanned="1" padding-top="6pt">
												<!-- adding in fGroup Number from FNCCODE. Need to put them in order in the TOC -->
												<xsl:for-each select="parent::node()/descendant::fncgrp[fnccode!=' ']">
													<fo:block span="all" text-align="left" text-indent="0pc">
														<xsl:text>GROUP&#x2002;</xsl:text>
														<xsl:value-of select="child::fnccode"/>
													</fo:block>
												</xsl:for-each>
											</fo:table-cell>
											<fo:table-cell number-columns-spanned="2" padding-top="6pt" padding-left="3pt">
												<fo:block span="all" text-align="left" text-indent="0pc">
													<xsl:choose>
														<xsl:when test="ancestor-or-self::*/@deletewp='yes'">DELETED </xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="child::title"  mode="toc"/>
															<!--<xsl:apply-templates select="child::title" mode="toc"/>-->
														</xsl:otherwise>
													</xsl:choose>
													<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
													<xsl:text>WP&#x2002;</xsl:text>
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
													<xsl:text>&#x2013;1</xsl:text>
													<!--<fo:page-number-citation ref-id="{generate-id(.)}"/>-->
													<!--fo:inline>
														<xsl:value-of select="../@wpseq"/>
													</fo:inline-->
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
											</xsl:when>
											<xsl:otherwise>
												<fo:table-row>
											<fo:table-cell number-columns-spanned="3" padding-top="6pt">
												<fo:block span="all" start-indent="0pc" text-align="left" text-indent="0pc" id="{generate-id(.)}">
													<xsl:choose>
														<xsl:when test="ancestor-or-self::*/@deletewp='yes'">DELETED </xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="child::title" mode="toc"/>
														</xsl:otherwise>
													</xsl:choose>
													<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
													<xsl:text>WP&#x2002;</xsl:text>
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
													<xsl:text>&#x2013;</xsl:text>
													<fo:page-number-citation ref-id="{generate-id(.)}"/>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
											</xsl:otherwise>		
										</xsl:choose>	
									</xsl:for-each>
								</xsl:for-each>
								<xsl:if test="//glossary">
									<fo:table-row>
										<fo:table-cell number-columns-spanned="2" padding-top="20pt">
										<fo:block>
											<xsl:text>GLOSSARY</xsl:text>
											<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="20pt">
										<fo:block>
											<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
											<xsl:text>Glossary&#x2013;1</xsl:text>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:if>
								<xsl:if test="//aindx">
									<fo:table-row>
										<fo:table-cell number-columns-spanned="2" padding-top="20pt">
										<fo:block>
											<xsl:text>INDEX</xsl:text>
											<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="20pt">
										<fo:block>
											<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
											<xsl:text>Index&#x2013;1</xsl:text>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:if>
							</fo:table-body>
						</xsl:when>
						<!-- start MULTI-VOLUME -->
						<xsl:when test="/production/paper.manual/@multivolume='yes'">
							<fo:table-body>
								<!-- JTJ First Volume TOC only, Volume # at top left -->
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
								<xsl:if test="$thisVolume = '1'">
									<fo:table-row>
										<fo:table-cell number-columns-spanned="3" padding-top="20pt">
											<fo:block span="all" start-indent="0pc" text-align="left" text-indent="0pc" font-weight="bold" font-size="10pt" font-family="sans-serif" space-after="18pt" space-before="48pt">
												<xsl:text>VOLUME&#x2002;</xsl:text>
												<xsl:number count="contents" format="1" from="production" level="any"/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:if>
								<!-- end JTJ -->
								<xsl:for-each select="ancestor-or-self::paper.frnt/howtouse/title">
									<fo:table-row>
										<fo:table-cell number-columns-spanned="3" padding-top="20pt">
											<fo:block span="all" start-indent="0pc" text-align="left" text-indent="0pc" font-size="10pt" font-family="sans-serif" space-after="18pt" space-before="48pt">
												<xsl:text>HOW TO USE THIS MANUAL</xsl:text>
												<xsl:text>&#x2002;</xsl:text>
												<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
												<fo:page-number-citation ref-id="{generate-id(.)}"/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
								<!-- Begin titlepg -->
								<xsl:for-each select="following::titlepg">
									<!-- JTJ this is the place for a test to NOT PRINT chapters in later volumes in Volume TOCs after the first.			
										CONDITION: 
										1. when second <volume> encountered in <contents>, and
										2. when volume is NOT volume 1-->
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
									<xsl:variable name="TocKeepGoing">
										<xsl:choose>
											<xsl:when test="$thisVolume != '1'">
												<xsl:choose>
													<xsl:when test="$thisVolume != $numVolTags">no</xsl:when>
													<xsl:otherwise>yes</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:otherwise>yes</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:variable name="majorNo" select="count(preceding::*[wpidinfo and not(@insertwp)])"/>
									<xsl:if test="$TocKeepGoing = 'yes'">
										<!-- Vol # between CHAPTERS but at volume breaks only -->
										<!-- this test catches if the <titlepg> parent (e.g., <mim>) has <volume> as immediate preceding sibling -->
										<xsl:if test="../preceding-sibling::*[1][self::volume]">
											<fo:table-row>
												<fo:table-cell number-columns-spanned="3" padding-top="20pt">
													<fo:block span="all" start-indent="0pc" text-align="left" text-indent="0pc" font-weight="bold" font-size="10pt" font-family="sans-serif" space-after="18pt" space-before="48pt">
														<xsl:text>VOLUME&#x2002;</xsl:text>
														<xsl:number count="contents" format="1" from="production" level="any"/>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</xsl:if>
										<!-- end JTJ -->
										<fo:table-row>
											<fo:table-cell number-columns-spanned="3" padding-top="12pt">
												<fo:block>
												<xsl:text>CHAPTER </xsl:text>
												<xsl:number count="titlepg" format="1." from="//paper.manual | //destruction_manual | //ammo | //pmi | //pms | //sys-ts | //bdar | //dmwr_ammo | //lubeorder | //genmaintman | //pmc | //sum | //sam" level="any"/>
												<xsl:choose>
						<xsl:when test="name(parent::node())='gim'"> GENERAL INFORMATION, EQUIPMENT DESCRIPTION AND THEORY OF OPERATION</xsl:when>
													<xsl:when test="name(parent::node())='sim'"> SUPPORTING INFORMATION</xsl:when>
													<xsl:when test="name(parent::node())='opim'"> OPERATOR INSTRUCTIONS</xsl:when>
											<xsl:when test="name(parent::node())='sopim'"> SOFTWARE OPERATOR INSTRUCTIONS</xsl:when>
											<xsl:when test="name(parent::node())='softdescdata'"> SOFTWARE DESCRIPTION DATA</xsl:when>
													<xsl:when test="name(parent::node())='pim'"> PARTS	INFORMATION</xsl:when>
													<xsl:when test="name(parent::node())='tim'"> TROUBLESHOOTING PROCEDURES</xsl:when>
													<xsl:when test="name(parent::node())='bim'"> BATTLE DAMAGE INSTRUCTIONS</xsl:when>
													<xsl:when test="name(parent::node())='baim'"> BATTLE DAMAGE ASSESSMENT INSTRUCTIONS</xsl:when>
													<xsl:when test="name(parent::node())='brim'"> BATTLE DAMAGE REPAIR INSTRUCTIONS</xsl:when>
													<xsl:when test="name(parent::node())='dim'"> DESTRUCTION OF EQUIPMENT TO PREVENT ENEMY USE</xsl:when>
													<xsl:when test="name(parent::node())='mim'">
														<xsl:choose>
															<xsl:when test="name(following-sibling::*[1] )='ammunitioncategory'"> AMMUNITION MAINTENANCE</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='maintenancecategory'"> MAINTENANCE INSTRUCTIONS</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='pmcscategory'"> PREVENTIVE MAINTENANCE INSTRUCTIONS</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='ammomarkingcategory'"> AMMUNITION MARKING INSTRUCTIONS</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='aviationcategory'"> AVIATION MAINTENANCE INSTRUCTIONS</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='checklistcategory'"> PHASED MAINTENANCE INSTRUCTIONS	CHECKLIST</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='depotcategory'"> DEPOT MAINTENANCE INSTRUCTIONS</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='shipmentmovementstoragecategory'"> SHIPMENT, MOVEMENT AND STORAGE INSTRUCTIONS</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='testinspectioncategory'"> TESTING AND INSPECTION INSTRUCTIONS</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='pmscategory'"> PREVENTIVE MAINTENANCE SERVICE	INSPECTIONS</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='softmaintcategory'"> SOFTWARE MAINTENANCE INSTRUCTIONS</xsl:when>
															<xsl:otherwise> MAINTENANCE INSTRUCTIONS</xsl:otherwise>
														</xsl:choose>
													</xsl:when>
												</xsl:choose>
												<!-- JTJ VOL # after CHAPTER title -->
												<xsl:text>,&#x2002;VOL&#x2002;</xsl:text>
												<xsl:number count="contents" format="1" from="production" level="any"/>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
										<xsl:for-each select="parent::node()/descendant::wpidinfo">
											<!-- From Volume to RearVol -->
											<fo:table-row>
												<fo:table-cell number-columns-spanned="3" padding-top="6pt">
													<fo:block orphans="1" span="all" start-indent="2pc" text-align="left" text-indent="0pc">
														<!--<fo:inline>-->
														<xsl:choose>
															<xsl:when test="ancestor-or-self::*/@deletewp='yes'">DELETED </xsl:when>
															<!--<xsl:choose>-->
															<xsl:when test="@insertwp">
																<xsl:variable name="minorNo" select="count(preceding::*[wpidinfo and @insertwp and count(preceding::*[wpidinfo and not(@insertwp)]) = $majorNo]) + 1"/>
																<xsl:number format="0000" value="number($majorNo)"/>
																<xsl:text>.</xsl:text>
																<xsl:value-of select="$minorNo"/>
															</xsl:when>
															<!--<xsl:otherwise>
									<xsl:number format="0000" value="number($majorNo + 1)"/>
      					</xsl:otherwise>			
    						</xsl:choose>-->
															<xsl:otherwise>
																<xsl:apply-templates select="child::title" mode="toc"/>
																<xsl:text>,&#x2002;Vol&#x2002;</xsl:text>
																<xsl:number count="contents" format="1" from="production" level="any"/>
															</xsl:otherwise>
														</xsl:choose>
														<!-- JTJ VOL # after WP title -->
														<!--	<xsl:text>,&#x2002;Vol&#x2002;</xsl:text>
														<xsl:number count="contents" format="1" from="production" level="any"/>
														 end JTJ -->
												<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
														<xsl:text>WP&#x2002;</xsl:text>
														<xsl:choose>
															<xsl:when test="../@wpseq">
																<xsl:value-of select="../@wpseq"/>
															</xsl:when>
															<!--RBG 20 AUG 2018 Removed commenting from lines 322 thru 337 below. This was causing WP numbers in the toc to only correctly number the first WP in a chapter. Subsequent WPs had the same number applied.-->
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
																<fo:inline>
																	<xsl:number format="0000" value="number($majorNo + 1)"/>
																</fo:inline>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:otherwise>
													</xsl:choose>
														<xsl:text>&#x2013;</xsl:text>
															<fo:page-number-citation ref-id="{generate-id(.)}"/>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
											<!-- adding in figures and tables. Need to put them in order in the TOC -->
											<xsl:for-each select="parent::node()/descendant::figure[@figtype!='fo-rear']">
												<fo:table-row>
													<fo:table-cell number-columns-spanned="3" padding-top="3pt">
														<fo:block span="all" start-indent="4pc" text-align="left" text-indent="0pc">
															<xsl:text>Figure&#x2002;</xsl:text>
															<xsl:number count="figure[@figtype!='fo-rear']" format="1." from="ginfowp | descwp | thrywp | abbrevwp | symbolwp | ctrlindwp | opusualwp | opunuwp | stowagewp | eqploadwp | emergencywp | tsindxwp | pshopanalwp | compchklistwp | opcheck-tswp | tswp | opcheckwp | tsintrowp | techdescwp | surwp | perseqpwp | pmcsintrowp | pmcswp | gen.maintwp | maintwp | pmiwp | lubewp | facilwp | oipwp | mobilwp | qawp | manuwp | torquewp | inventorywp | storagewp | wtloadwp | wiringwp | ammowp | ammo.markingwp | natowp | auxeqpwp | wiringwp | pms-inspecwp | pmi-cklistwp | refwp | macintrowp | macwp | coeibiiwp | aalwp | explistwp | toolidwp | mrplwp | csi.wp | supitemwp | genwp | introwp | //pim | ginfowp | destruct-materialwp | destruct-introwp | bdar-geninfowp | damage-assesswp | genrepairwp | bdartoolswp | substitute-matwp | ppmgeninfowp | softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp | lospecnoteswp | lubetypeswp | lubewp | lubricantsymbolwp" level="any"/>
															<xsl:text>&#x2002; </xsl:text>
															<xsl:apply-templates select="child::title"/>
															<!-- JTJ VOL # after FIGURE title -->
															<xsl:text>,&#x2002;Vol&#x2002;</xsl:text>
															<xsl:number count="contents" format="1" from="production" level="any"/>
															<!-- end JTJ -->
														<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
															<xsl:choose>
																<xsl:when test="ancestor::*[@wpseq]">
																	<fo:inline>
																		<fo:basic-link internal-destination="{@wpno}">
																			<xsl:text>WP&#x2002;</xsl:text>
																			<xsl:value-of select="ancestor::*/@wpseq"/>
																		</fo:basic-link>
																	</fo:inline>
																</xsl:when>
																<xsl:otherwise>
																	<!--<xsl:variable name="majorNo" select="count(preceding::*[wpidinfo and not(@insertwp)])"/>-->
																	<xsl:choose>
																		<xsl:when test="@insertwp">
																			<xsl:variable name="minorNo" select="count(preceding::*[wpidinfo and @insertwp and count(preceding::*[wpidinfo and not(@insertwp)]) = $majorNo]) + 1"/>
																			<xsl:number format="0000" value="number($majorNo)"/>
																			<xsl:text>.</xsl:text>
																			<xsl:value-of select="$minorNo"/>
																		</xsl:when>
							<!--RBG 20 AUG 2018 Commented out the otherwise command below. It was causing an additional wp number to display before WP in the toc.-->
																		<!--<xsl:otherwise>
																			<xsl:number format="0000" value="number($majorNo + 1)"/>
																		</xsl:otherwise>-->
																	</xsl:choose>
																	<fo:inline>
																		<fo:basic-link internal-destination="{@wpno}">
																			<xsl:text>WP&#x2002;</xsl:text>
																			<xsl:number count="wpidinfo" format="0000" from="paper.manual" level="any"/>
																		</fo:basic-link>
																	</fo:inline>
																</xsl:otherwise>
															</xsl:choose>
															<xsl:text>&#x2013;</xsl:text>
															<fo:page-number-citation ref-id="{generate-id(.)}"/>
														</fo:block>
													</fo:table-cell>
												</fo:table-row>
											</xsl:for-each>
											<xsl:for-each select="parent::node()/descendant::table[not(parent::table-alt)][title]|table-alt | parent::node()/descendant::ctrlindtab | parent::node()/descendant::pmcstable | parent::node()/descendant::coeitab | parent::node()/descendant::biitab | parent::node()/descendant::explist |  parent::node()/descendant::mac | parent::node()/descendant::tereqtab | parent::node()/descendant::remarktab | parent::node()/descendant::aal | parent::node()/descendant::toolidlist | parent::node()/descendant::csi.tab | parent::node()/descendant::mrpl | parent::node()/descendant::defect.tab | parent::node()/descendant::orsch.tab | parent::node()/descendant::mobiltab | parent::node()/descendant::crit.insp.tab">
												<fo:table-row>
													<fo:table-cell number-columns-spanned="3" padding-top="3pt">
														<fo:block span="all" start-indent="4pc" text-align="left" text-indent="0pc">
															<xsl:text>Table&#x2002;</xsl:text>
															<xsl:number count="table[not(parent::table-alt)][title]|table-alt | ctrlindtab | pmcstable | coeitab | biitab | explist | toolidlist | aal | mac | remarktab | tereqtab | csi.tab | mobiltab | crit.insp.tab | mrpl | defect.tab | orsch.tab" format="1." from="ginfowp | descwp | thrywp | abbrevwp | symbolwp | ctrlindwp | opusualwp | opunuwp | stowagewp | eqploadwp | emergencywp | tsindxwp | pshopanalwp | compchklistwp | opcheck-tswp | tswp | opcheckwp | tsintrowp | techdescwp | surwp | perseqpwp | pmcsintrowp | pmcswp | gen.maintwp | maintwp | pmiwp | lubewp | facilwp | oipwp | mobilwp | qawp | manuwp | torquewp | inventorywp | storagewp | wtloadwp | wiringwp | ammowp | ammo.markingwp | natowp | auxeqpwp | wiringwp | pms-inspecwp | pmi-cklistwp | refwp | macintrowp | macwp |  coeibiiwp | aalwp | explistwp | toolidwp | mrplwp | csi.wp | supitemwp | genwp | introwp | //pim | ginfowp | destruct-materialwp | destruct-introwp | damage-assesswp | genrepairwp | bdar-geninfowp | bdartoolswp | ppmgeninfowp | orschwp | softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp | lospecnoteswp | lubetypeswp | lubewp | lubricantsymbolwp" level="any"/>
															<xsl:text>&#x2002; </xsl:text>
															<xsl:value-of select="child::title"/>
															<!-- JTJ VOL # after TABLE title -->
															<xsl:text>,&#x2002;Vol&#x2002;</xsl:text>
															<xsl:number count="contents" format="1" from="production" level="any"/>
															<!-- end JTJ -->
															<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
															<xsl:choose>
																<xsl:when test="ancestor::*[@wpseq]">
																	<fo:inline>
																		<fo:basic-link internal-destination="{@wpno}">
																			<xsl:text>WP&#x2002;</xsl:text>
																			<xsl:value-of select="ancestor::*/@wpseq"/>
																		</fo:basic-link>
																	</fo:inline>
																</xsl:when>
																<xsl:when test="@insertwp">
				<xsl:variable name="minorNo" select="count(preceding::*[wpidinfo and @insertwp and count(preceding::*[wpidinfo and not(@insertwp)]) = $majorNo]) + 1"/>
																	<xsl:number format="0000" value="number($majorNo)"/>
																	<xsl:text>.</xsl:text>
																	<xsl:value-of select="$minorNo"/>
																</xsl:when>
																<xsl:otherwise>
																	<fo:inline>
																		<fo:basic-link internal-destination="{@wpno}">
																			<xsl:text>WP&#x2002;</xsl:text>
																			<xsl:number count="wpidinfo" format="0000" from="paper.manual" level="any"/>
																		</fo:basic-link>
																	</fo:inline>
																</xsl:otherwise>
															</xsl:choose>
															<xsl:text>&#x2013;</xsl:text>
															<fo:page-number-citation ref-id="{generate-id(.)}"/>
														</fo:block>
													</fo:table-cell>
												</fo:table-row>
											</xsl:for-each>
										</xsl:for-each>
										<!-- JTJ If TocKeepGoing -->
									</xsl:if>
									<!-- end JTJ -->
								</xsl:for-each>
								<!-- End titlepg -->
								<xsl:if test="//glossary">
									<fo:table-row>
										<fo:table-cell number-columns-spanned="2" padding-top="20pt">
									<fo:block>
											<xsl:text>GLOSSARY</xsl:text>
											<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="20pt" text-align="right">
										<fo:block>
											<xsl:text>Glossary&#x2013;1</xsl:text>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:if>
								<xsl:if test="//aindx">
									<fo:table-row>
										<fo:table-cell number-columns-spanned="2" padding-top="20pt">
										<fo:block>
											<xsl:text>INDEX</xsl:text>
											<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="20pt" text-align="right">
										<fo:block>
											<xsl:text>Index&#x2013;1</xsl:text>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:if>
								<xsl:if test="//foldsect">
									<fo:table-row>
										<fo:table-cell number-columns-spanned="2" padding-top="10pt" padding-bottom="6pt">
										<fo:block>
											<xsl:text>FOLDOUT FIGURES</xsl:text>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<!--<xsl:for-each select="parent::node()/descendant::figure[@figtype='fo-rear']">-->
									<xsl:for-each select="//figure[@figtype = 'fo-rear'][not(subfig)] | //figure[@figtype = 'fo-rear']/subfig">
										<fo:table-row>
											<fo:table-cell padding-bottom="6pt" number-columns-spanned="3">
												<fo:block span="all" start-indent="4pc" text-align="left" text-indent="0pc" space-after="12pt">
													<xsl:text>FO&#x2013;</xsl:text>
													<xsl:number count="figure[@figtype='fo-rear']" format="1." from="production" level="any"/>
													<xsl:text>&#x2002; </xsl:text>
													<!--<xsl:choose>
													<xsl:when test="//figure">
														<xsl:apply-templates select="child::title"/>
														</xsl:when>
														<xsl:when test="//figure/subfig">
														<xsl:apply-templates select="preceding-sibling::title[1]"/> 
														</xsl:when>
													</xsl:choose>-->
													<xsl:if test="//figure">
														<xsl:apply-templates select="child::title"/>
														</xsl:if>
														<xsl:if test="//figure/subfig">
														<xsl:apply-templates select="preceding-sibling::title[1]"/> 
														</xsl:if>

													
													<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
													<xsl:text>FP</xsl:text>
													<xsl:text>&#x2013;</xsl:text>
													<fo:page-number-citation ref-id="{generate-id(.)}"/>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</xsl:for-each>
								</xsl:if>
							</fo:table-body>
						</xsl:when>
						<xsl:otherwise>
							<fo:table-body>
								<xsl:for-each select="ancestor-or-self::paper.frnt/howtouse/title">
									<fo:table-row>
										<fo:table-cell number-columns-spanned="3" padding-top="20pt">
											<fo:block span="all" start-indent="0pc" text-align="left" text-indent="0pc" font-size="10pt" font-family="sans-serif" space-after="18pt" space-before="48pt">
												<xsl:text>HOW TO USE THIS MANUAL</xsl:text>
												<xsl:text>&#x2002;</xsl:text>
												<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
												<fo:page-number-citation ref-id="{generate-id(.)}"/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
								<xsl:for-each select="//titlepg">
									<fo:table-row>
										<fo:table-cell number-columns-spanned="3" padding-top="12pt">
										<fo:block>
											<xsl:text>CHAPTER </xsl:text>
												<xsl:number count="titlepg" format="1." from="//paper.manual | //destruction_manual | //ammo | //pmi | //pms | //sys-ts | //bdar | //dmwr_ammo | //lubeorder | //genmaintman | //pmc | //sum | //sam" level="any"/>
												<xsl:choose>
													<xsl:when test="name(parent::node())='gim'"> GENERAL INFORMATION, EQUIPMENT DESCRIPTION AND THEORY OF OPERATION</xsl:when>
													<xsl:when test="name(parent::node())='sim'"> SUPPORTING INFORMATION</xsl:when>
													<xsl:when test="name(parent::node())='opim'"> OPERATOR INSTRUCTIONS</xsl:when>
											<xsl:when test="name(parent::node())='sopim'"> SOFTWARE OPERATOR INSTRUCTIONS</xsl:when>
											<xsl:when test="name(parent::node())='softdescdata'"> SOFTWARE DESCRIPTION DATA</xsl:when>
													<xsl:when test="name(parent::node())='pim'"> PARTS	INFORMATION</xsl:when>
													<xsl:when test="name(parent::node())='tim'"> TROUBLESHOOTING PROCEDURES</xsl:when>
													<xsl:when test="name(parent::node())='bim'"> BATTLE DAMAGE INSTRUCTIONS</xsl:when>
													<xsl:when test="name(parent::node())='baim'"> BATTLE DAMAGE ASSESSMENT INSTRUCTIONS</xsl:when>
													<xsl:when test="name(parent::node())='brim'"> BATTLE DAMAGE REPAIR INSTRUCTIONS</xsl:when>
													<xsl:when test="name(parent::node())='dim'"> DESTRUCTION OF EQUIPMENT TO PREVENT ENEMY USE</xsl:when>
													<xsl:when test="name(parent::node())='mim'">
														<xsl:choose>
															<xsl:when test="name(following-sibling::*[1] )='ammunitioncategory'"> AMMUNITION MAINTENANCE</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='maintenancecategory'"> MAINTENANCE INSTRUCTIONS</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='pmcscategory'"> PREVENTIVE MAINTENANCE INSTRUCTIONS</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='ammomarkingcategory'"> AMMUNITION MARKING INSTRUCTIONS</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='aviationcategory'"> AVIATION MAINTENANCE INSTRUCTIONS</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='checklistcategory'"> PHASED MAINTENANCE INSTRUCTIONS	CHECKLIST</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='depotcategory'"> DEPOT MAINTENANCE INSTRUCTIONS</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='shipmentmovementstoragecategory'"> SHIPMENT, MOVEMENT AND STORAGE INSTRUCTIONS</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='testinspectioncategory'"> TESTING AND INSPECTION INSTRUCTIONS</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='pmscategory'"> PREVENTIVE MAINTENANCE SERVICE	INSPECTIONS</xsl:when>
															<xsl:when test="name(following-sibling::*[1] )='softmaintcategory'"> SOFTWARE MAINTENANCE INSTRUCTIONS</xsl:when>
															<xsl:otherwise> MAINTENANCE INSTRUCTIONS</xsl:otherwise>
														</xsl:choose>
													</xsl:when>
												</xsl:choose>
												</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<xsl:for-each select="parent::node()/descendant::wpidinfo">
										<fo:table-row>
											<fo:table-cell number-columns-spanned="3" padding-top="6pt">
												<fo:block span="all" start-indent="2pc" text-align="left" text-indent="0pc" id="{generate-id(.)}">
													<xsl:choose>
														<xsl:when test="ancestor-or-self::*/@deletewp='yes'">DELETED </xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="child::title" mode="toc"/>
														</xsl:otherwise>
													</xsl:choose>
													<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
													<xsl:text>WP&#x2002;</xsl:text>
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
													<xsl:text>&#x2013;</xsl:text>
													<fo:page-number-citation ref-id="{generate-id(.)}"/>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
										<!-- adding in figures and tables. Need to put them in order in the TOC -->
										<xsl:choose>
											<xsl:when test="ancestor-or-self::*/@deletewp='yes'"> </xsl:when>
											<xsl:otherwise>
												<xsl:for-each select="parent::node()/descendant::figure[@figtype!='fo-rear']">
													<fo:table-row>
														<fo:table-cell number-columns-spanned="3" padding-top="3pt">
															<fo:block span="all" start-indent="4pc" text-align="left" text-indent="0pc">
																<xsl:text>Figure&#x2002;</xsl:text>
																<xsl:number count="figure[@figtype='normal-page']" format="1." from="ginfowp | descwp | thrywp | abbrevwp | symbolwp | ctrlindwp | opusualwp | opunuwp | stowagewp | eqploadwp | emergencywp | tsindxwp | pshopanalwp | compchklistwp | opcheck-tswp | tswp | opcheckwp | tsintrowp | techdescwp | surwp | perseqpwp | pmcsintrowp | pmcswp | gen.maintwp | maintwp | pmiwp | lubewp | facilwp | oipwp | mobilwp | qawp | manuwp | torquewp | inventorywp | storagewp | wtloadwp | wiringwp | ammowp | ammo.markingwp | natowp | auxeqpwp | wiringwp | pms-inspecwp | pmi-cklistwp | refwp | macintrowp | macwp | coeibiiwp | aalwp | explistwp | toolidwp | mrplwp | csi.wp | supitemwp | genwp | introwp | //pim | ginfowp | destruct-materialwp | destruct-introwp | bdar-geninfowp | damage-assesswp | genrepairwp | bdartoolswp | substitute-matwp | ppmgeninfowp | softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp | lospecnoteswp | lubetypeswp | lubewp | lubricantsymbolwp" level="any"/>
																<xsl:text>&#x2002; </xsl:text>
																<xsl:apply-templates select="child::title"/>
																<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
																<xsl:choose>
																	<xsl:when test="ancestor::*[@wpseq]">
																		<xsl:text>WP&#x2002;</xsl:text>
																		<xsl:value-of select="ancestor::*/@wpseq"/>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text>WP&#x2002;</xsl:text>
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
																<xsl:text>&#x2013;</xsl:text>
																<fo:page-number-citation ref-id="{generate-id(.)}"/>
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
												</xsl:for-each>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:for-each select="parent::node()/descendant::table[not(parent::table-alt)][title]|table-alt | parent::node()/descendant::ctrlindtab | parent::node()/descendant::pmcstable | parent::node()/descendant::coeitab | parent::node()/descendant::biitab | parent::node()/descendant::explist | parent::node()/descendant::mac | parent::node()/descendant::tereqtab | parent::node()/descendant::remarktab | parent::node()/descendant::aal | parent::node()/descendant::toolidlist | parent::node()/descendant::csi.tab | parent::node()/descendant::mrpl | parent::node()/descendant::defect.tab | parent::node()/descendant::orsch.tab | parent::node()/descendant::mobiltab | parent::node()/descendant::crit.insp.tab | parent::node()/descendant::lubetab">
											<!--<xsl:for-each select="parent::node()/descendant::table[not(parent::table-alt)][title]|table-alt | parent::node()/descendant::ctrlindtab | parent::node()/descendant::pmcstable | parent::node()/descendant::coeitab | parent::node()/descendant::biitab | parent::node()/descendant::explist | parent::node()/descendant::tereqtab | parent::node()/descendant::remarktab | parent::node()/descendant::aal | parent::node()/descendant::toolidlist">-->
											<fo:table-row>
												<fo:table-cell number-columns-spanned="3" padding-top="3pt">
													<fo:block span="all" start-indent="4pc" text-align="left" text-indent="0pc">
														<xsl:text>Table&#x2002;</xsl:text>
														<xsl:number count="table[not(parent::table-alt)][title]|table-alt | ctrlindtab | pmcstable | coeitab | biitab | explist | toolidlist | aal | remarktab | tereqtab | mac | csi.tab | mobiltab | crit.insp.tab | mrpl | defect.tab | orsch.tab" format="1." from="ginfowp | descwp | thrywp | abbrevwp | symbolwp | ctrlindwp | opusualwp | opunuwp | stowagewp | eqploadwp | emergencywp | tsindxwp | pshopanalwp | compchklistwp | opcheck-tswp | tswp | opcheckwp | tsintrowp | techdescwp | surwp | perseqpwp | pmcsintrowp | pmcswp | gen.maintwp | maintwp | pmiwp | lubewp | facilwp | oipwp | mobilwp | qawp | manuwp | torquewp | inventorywp | storagewp | wtloadwp | wiringwp | ammowp | ammo.markingwp | natowp | auxeqpwp | wiringwp | pms-inspecwp | pmi-cklistwp | refwp | macintrowp | macwp | coeibiiwp | aalwp | explistwp | toolidwp | mrplwp | csi.wp | supitemwp | genwp | introwp | //pim | ginfowp | destruct-materialwp | destruct-introwp | damage-assesswp | genrepairwp  | nsnindxwp | bdar-geninfowp | bdartoolswp | ppmgeninfowp | orschwp | softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp | lospecnoteswp | lubetypeswp | lubewp | lubricantsymbolwp" level="any"/>
														<xsl:text>&#x2002; </xsl:text>
														<xsl:value-of select="child::title"/>
														<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
														<xsl:choose>
															<xsl:when test="ancestor::*[@wpseq]">
																<xsl:text>WP&#x2002;</xsl:text>
																<xsl:value-of select="ancestor::*/@wpseq"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text>WP&#x2002;</xsl:text>
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
														<xsl:text>&#x2013;</xsl:text>
														<fo:page-number-citation ref-id="{generate-id(.)}"/>
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</xsl:for-each>
									</xsl:for-each>
									<xsl:if test="//destruction_manual/descendant::wpidinfo">
										<fo:table-row>
											<fo:table-cell number-columns-spanned="3" padding-top="6pt">
												<fo:block span="all" start-indent="2pc" text-align="left" text-indent="0pc">
													<xsl:apply-templates select="child::title"/>
													<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
													<xsl:choose>
														<xsl:when test="../@wpseq">
															<fo:inline>
																<fo:basic-link internal-destination="{@wpno}">
																	<xsl:text>WP&#x2002;</xsl:text>
																	<xsl:value-of select="../@wpseq"/>
																</fo:basic-link>
															</fo:inline>
														</xsl:when>
														<xsl:otherwise>
															<fo:inline>
																<fo:basic-link internal-destination="{@wpno}">
																	<xsl:text>WP&#x2002;</xsl:text>
																	<xsl:number count="wpidinfo" format="0000" from="paper.manual" level="any"/>
																</fo:basic-link>
															</fo:inline>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:text>&#x2013;</xsl:text>
													<fo:page-number-citation ref-id="{generate-id(.)}"/>
												</fo:block>
												<!-- adding in figures and tables. Need to put them in order in the TOC -->
												<xsl:for-each select="parent::node()/descendant::figure[@figtype!='fo-rear']">
													<fo:block span="all" start-indent="4pc" text-align="left" text-indent="0pc">
														<xsl:text>Figure&#x2002;</xsl:text>
														<xsl:number count="figure[@figtype!='fo-rear']" format="1." from="ginfowp | descwp | thrywp | abbrevwp | symbolwp | ctrlindwp | opusualwp | opunuwp | stowagewp | eqploadwp | emergencywp | tsindxwp | pshopanalwp | compchklistwp | opcheck-tswp | tswp | opcheckwp | tsintrowp | techdescwp | surwp | perseqpwp | pmcsintrowp | pmcswp | gen.maintwp | maintwp | pmiwp | lubewp | facilwp | oipwp | mobilwp | qawp | manuwp | torquewp | inventorywp | storagewp | wtloadwp | wiringwp | ammowp | ammo.markingwp | natowp | auxeqpwp | wiringwp | pms-inspecwp | pmi-cklistwp | refwp | macintrowp | macwp | coeibiiwp | aalwp | explistwp | toolidwp | mrplwp | csi.fscap.wp | supitemwp | genwp | introwp | //pim | destruct-ginfowp | destruct-introwp | destruct-materialwp | softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp | lospecnoteswp | lubetypeswp | lubewp | lubricantsymbolwp" level="any"/>
														<xsl:text>&#x2002; </xsl:text>
														<xsl:apply-templates select="child::title"/>
														<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
														<xsl:choose>
															<xsl:when test="ancestor::*[@wpseq]">
																<fo:inline>
																	<fo:basic-link internal-destination="{@wpno}">
																		<xsl:text>WP&#x2002;</xsl:text>
																		<xsl:value-of select="ancestor::*/@wpseq"/>
																	</fo:basic-link>
																</fo:inline>
															</xsl:when>
															<xsl:otherwise>
																<fo:inline>
																	<fo:basic-link internal-destination="{@wpno}">
																		<xsl:text>WP&#x2002;</xsl:text>
																		<xsl:number count="wpidinfo" format="0000" from="paper.manual" level="any"/>
																	</fo:basic-link>
																</fo:inline>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:text>&#x2013;</xsl:text>
														<fo:page-number-citation ref-id="{generate-id(.)}"/>
													</fo:block>
												</xsl:for-each>
												<xsl:for-each select="parent::node()/descendant::table[not(parent::table-alt)][title]|table-alt | parent::node()/descendant::ctrlindtab | parent::node()/descendant::pmcstable | parent::node()/descendant::coeitab | parent::node()/descendant::biitab | parent::node()/descendant::explist | parent::node()/descendant::mac | parent::node()/descendant::tereqtab | parent::node()/descendant::remarktab | parent::node()/descendant::aal | parent::node()/descendant::toolidlist | parent::node()/descendant::csi.tab | parent::node()/descendant::mrpl | parent::node()/descendant::defect.tab | parent::node()/descendant::orsch.tab | parent::node()/descendant::mobiltab | parent::node()/descendant::crit.insp.tab | parent::node()/descendant::lubetab">
													<!--	<xsl:for-each select="parent::node()/descendant::table[not(parent::table-alt)][title]|table-alt | parent::node()/descendant::ctrlindtab | parent::node()/descendant::pmcstable | parent::node()/descendant::coeitab | parent::node()/descendant::biitab | parent::node()/descendant::explist | parent::node()/descendant::tereqtab | parent::node()/descendant::remarktab | parent::node()/descendant::aal | parent::node()/descendant::toolidlist">-->
													<fo:block span="all" start-indent="4pc" text-align="left" text-indent="0pc">
														<xsl:text>Table&#x2002;</xsl:text>
														<xsl:number count="table[not(parent::table-alt)][title]|table-alt | ctrlindtab | pmcstable | coeitab | biitab | explist | toolidlist | aal | mac | remarktab | tereqtab | csi.tab | mobiltab | crit.insp.tab | mrpl | defect.tab | orsch.tab" format="1." from="ammowp | auxeqpwp | bdar_geninfowp | bdartoolswp | bulk-itemswp | coeibiiwp | compchklistwp | csi.fscap.wp | ctrlindwp | damage-assesswp | descwp | destruct_introwp | destruct_materialwp | emergencywp | eqploadwp | explistwp | facilwp | gen.maintwp | genrepairwp | genwp | ginfowp | introwp | inventorywp | lubewp | macintrowp | macwp | maintwp | manfcprocwp | manu_items_introwp | manuwp | mobilwp | mrplwp | natowp | nsnindxwp | oipwp | opcheck-tswp | opcheckwp | opunuwp | opusualwp | perseqpwp | plwp | pmcsintrowp | pmcswp | pm-ginfowp | pmi-cklistwp | pmiwp | pms-ginfowp | pms-inspecwp | pnindxwp | pshopanalwp | qawp | refdesindxwp | refwp | //pim | storagewp | stowagewp | substitute-matwp | supitemwp | surwp | techdescwp | thrywp | toolidwp | torquewp | tsindxwp | tsintrowp | tswp | wiringwp | wtloadwp | ppmgeninfowp | orschwp | csi.wp | softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp | lospecnoteswp | lubetypeswp | lubewp | lubricantsymbolwp" level="any"/>
														<xsl:text>&#x2002; </xsl:text>
														<xsl:value-of select="child::title"/>
														<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
														<xsl:choose>
															<xsl:when test="ancestor::*[@wpseq]">
																<fo:inline>
																	<fo:basic-link internal-destination="{@wpno}">
																		<xsl:text>WP&#x2002;</xsl:text>
																		<xsl:value-of select="ancestor::*/@wpseq"/>
																	</fo:basic-link>
																</fo:inline>
															</xsl:when>
															<xsl:otherwise>
																<fo:inline>
																	<fo:basic-link internal-destination="{@wpno}">
																		<xsl:text>WP&#x2002;</xsl:text>
																		<xsl:number count="wpidinfo" format="0000" from="paper.manual" level="any"/>
																	</fo:basic-link>
																</fo:inline>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:text>&#x2013;</xsl:text>
														<fo:page-number-citation ref-id="{generate-id(.)}"/>
													</fo:block>
												</xsl:for-each>
											</fo:table-cell>
										</fo:table-row>
									</xsl:if>
								</xsl:for-each>
								<xsl:if test="//glossary">
									<fo:table-row>
										<fo:table-cell number-columns-spanned="2" padding-top="20pt">
										<fo:block>
											<xsl:text>GLOSSARY</xsl:text>
											<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="20pt">
										<fo:block>
											<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
											<xsl:text>Glossary&#x2013;1</xsl:text>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:if>
								<xsl:if test="//aindx">
									<fo:table-row>
										<fo:table-cell number-columns-spanned="2" padding-top="20pt">
										<fo:block>
											<xsl:text>INDEX</xsl:text>
											<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="20pt">
										<fo:block>
										<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
											<xsl:text>Index&#x2013;1</xsl:text>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:if>
								<xsl:if test="//foldsect">
									<fo:table-row>
										<fo:table-cell number-columns-spanned="2" padding-top="10pt" padding-bottom="6pt">
										<fo:block>
											<xsl:text>FOLDOUT FIGURES</xsl:text>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<xsl:for-each select="//figure[@figtype = 'fo-rear'][not(subfig)] | //figure[@figtype = 'fo-rear']/subfig">
									<!--<xsl:for-each select="//figure[@figtype = 'fo-rear'][not(subfig)] | //figure[@figtype = 'fo-rear']">-->
										<fo:table-row>
											<fo:table-cell number-columns-spanned="3" padding-bottom="6pt">
												<fo:block span="all" start-indent="4pc" text-align="left" text-indent="0pc" space-after="12pt">
													<xsl:text>FO&#x2013;</xsl:text>
													<xsl:number count="figure[@figtype='fo-rear']" format="1." from="production" level="any"/>
													<xsl:text>&#x2002; </xsl:text>
<!--														<xsl:choose>
													<xsl:when test="//figure">
														<xsl:apply-templates select="child::title"/>
														</xsl:when>
														<xsl:when test="//figure/subfig">
														<xsl:apply-templates select="preceding-sibling::title[1]"/> 
														</xsl:when>
													</xsl:choose>-->
													<xsl:if test="//figure">
														<xsl:apply-templates select="child::title"/>
														</xsl:if>
														<xsl:if test="//figure/subfig">
														<xsl:apply-templates select="preceding-sibling::title[1]"/> 
														</xsl:if>

													<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
													<xsl:text>FP</xsl:text>
													<xsl:text>&#x2013;</xsl:text>
													<fo:page-number-citation ref-id="{generate-id(.)}"/>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</xsl:for-each>
								</xsl:if>
							</fo:table-body>
						</xsl:otherwise>
					</xsl:choose>
				</fo:table>
			</fo:block>
		</fo:wrapper>
	</xsl:template>
	<xsl:template match="title" mode="toc">
		<xsl:apply-templates select="node()"/>
		<!--<xsl:text>,&#x2002;Vol&#x2002;</xsl:text>
<xsl:number count="contents" format="1" from="production" level="any"/>-->
			<xsl:if test="../../@army='yes' or ../../@airforce='yes' or ../../@navy='yes' or ../../@marines='yes'">
				<xsl:text disable-output-escaping="no">&#x2002;(</xsl:text>
				<xsl:if test="../../@army='yes'">
									<xsl:text disable-output-escaping="no">ARMY</xsl:text>
					<xsl:if test="../../@airforce='yes' or ../../@navy='yes' or ../../@marines='yes'">
						<xsl:text disable-output-escaping="no">, </xsl:text>
					</xsl:if>
				</xsl:if>
				<xsl:if test="../../@airforce='yes'">
									<xsl:text disable-output-escaping="no">AIR FORCE</xsl:text>
					<xsl:if test="../../@navy='yes' or ../../@marines='yes'">
						<xsl:text disable-output-escaping="no">, </xsl:text>
					</xsl:if>
				</xsl:if>
				<xsl:if test="../../@navy='yes'">
									<xsl:text disable-output-escaping="no">NAVY</xsl:text>
					<xsl:if test="../../@marines='yes'">
						<xsl:text disable-output-escaping="no">, </xsl:text>
					</xsl:if>
				</xsl:if>
				<xsl:if test="../../@marines='yes'">
								<xsl:text disable-output-escaping="no">USMC</xsl:text>
				</xsl:if>
				<xsl:text disable-output-escaping="no"> ONLY)</xsl:text>
			</xsl:if>
	</xsl:template>
</xsl:stylesheet>
