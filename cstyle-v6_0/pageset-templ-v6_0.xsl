<?xml version="1.0" encoding="utf-8"?>
<!-- Fragment document type declaration subset:
	Arbortext, Inc., 1988-2005, v.4002
	<!DOCTYPE xsl:stylesheet>
--> 
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!-- PAGESET TEMPLATES (WP-PAGESET, CHAP-PAGESET, FRNTREAR-RL delete-pageset -->
	<!-- WP-PAGESET  -->
	<xsl:variable name="x" select="generate-id(/volume/paper.frnt/frntcover/tmtitle/tminfono[1]/servbranch[.='/@army'])"/>
	<xsl:template name="applic-pageset">
		<fo:page-sequence color="#000000" font-family="sans-serif" font-size="10pt"  format="1" hyphenate="false" initial-page-number="1" language="en" line-height="1.15em" master-reference="applicpg" text-align="left" visibility="hidden">
			<fo:flow flow-name="xsl-region-body" visibility="hidden">
				<fo:block visibility="hidden"></fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	
	<xsl:template name="delete-pageset">
	<xsl:param name="wpseqno">
										<xsl:choose>
								<xsl:when test="../@wpseq"><!--xsl:when test="@wpseq"-->
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
		</xsl:param>

		<fo:page-sequence color="#000000" font-family="sans-serif" font-size="10pt" format="1" hyphenate="false" initial-page-number="1" language="en" line-height="1.15em" master-reference="impg" text-align="left">
					<fo:static-content flow-name="impg-before">
						<xsl:call-template name="WP-HEADER">
							<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
							<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
						</xsl:call-template>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-after-odd">
						<xsl:call-template name="WP-FOOTER">
							<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
							<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
						</xsl:call-template>
					</fo:static-content>
	<fo:flow flow-name="xsl-region-body">
	<xsl:apply-templates select="wpidinfo"/>
	<fo:block> <xsl:text disable-output-escaping="no">&#x2002;</xsl:text> </fo:block>
				<fo:block font-family="sans-serif" font-size="10pt">
				<fo:inline>
				<xsl:text> Work Package was deleted</xsl:text>
		<fo:change-bar-begin change-bar-class="{generate-id(.)}" change-bar-placement="end" change-bar-width="2pt" change-bar-style="solid" change-bar-color="black" />
		<fo:change-bar-end change-bar-class="{generate-id(.)}"/>
		</fo:inline>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	
	<xsl:template name="wp-pageset">
	<xsl:param name="Volume" select="volume"/>
		<xsl:param name="RearVol" select="vol-rear"/>
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
						<!-- Original 
				<xsl:otherwise>
					<xsl:apply-templates mode="count" select="wpidinfo" />
				</xsl:otherwise>  -->
			</xsl:choose>
		</xsl:param>

		<xsl:param name="titletsk">
			<xsl:choose>
				<xsl:when test="local-name(.)='glossary'">Glossary</xsl:when>
				<xsl:when test="local-name(.)='howtouse'">HOW TO USE THIS MANUAL</xsl:when>
				<xsl:when test="local-name(.)='warnsum'">WARNING SUMMARY</xsl:when>
				<xsl:when test="local-name(.)='aindx'">Index</xsl:when>
				<xsl:when test="local-name(.)='contents'">TABLE OF CONTENTS</xsl:when>
				<xsl:when test="local-name(.)='ammo-markingwp'">Ammunition Marking Information </xsl:when>
				<xsl:when test="local-name(.)='coeibiiwp'">Components of End Item (COEI) and Basic Issue Items (BII) Lists </xsl:when>
				<xsl:when test="local-name(.)='compchklistwp'">Component Checklist </xsl:when>
				<xsl:when test="local-name(.)='csi.wp'">Critical Safety Items (CSI) and Flight Safety Critical Aircraft Parts (FSCAP) </xsl:when>
				<xsl:when test="local-name(.)='aalwp'">Additional Authorization List (AAL) </xsl:when>
				<xsl:when test="local-name(.)='auxeqpwp'">Auxiliary Equipment Maintenance </xsl:when>
				<xsl:when test="local-name(.)='descwp'">Description and Data </xsl:when>
				<xsl:when test="local-name(.)='eqploadwp'">On-Vehicle Equipment Loading Plan </xsl:when>
				<xsl:when test="local-name(.)='explistwp'">Expendable and Durable Items List </xsl:when>
				<xsl:when test="local-name(.)='facilwp'">Facilities </xsl:when>
				<xsl:when test="local-name(.)='ginfowp'">General Information </xsl:when>
				<xsl:when test="local-name(.)='introwp'">Introduction </xsl:when>
				<xsl:when test="local-name(.)='lubewp'">Lubrication Instructions </xsl:when>
				<xsl:when test="local-name(.)='macintrowp'">Maintenance Allocation Chart (MAC) Introduction </xsl:when>
				<xsl:when test="local-name(.)='macwp'">Maintenance Allocation Chart (MAC) </xsl:when>
				<xsl:when test="local-name(.)='manuwp'">Illustrated List of Manufactured Items </xsl:when>
				<xsl:when test="ancestor::mobilwp">Depot Mobilization Requirements </xsl:when>
				<xsl:when test="ancestor::mrplwp">Mandatory Replacement Parts List </xsl:when>
				<xsl:when test="ancestor::natowp">Foreign Ammunition (NATO) </xsl:when>
				<xsl:when test="ancestor::nsnindxwp">National Stock Number Index </xsl:when>
				<xsl:when test="ancestor::oipwp">Overhaul Inspection Procedures </xsl:when>
				<xsl:when test="ancestor::opcheck-tswp">Operational Checkout and Troubleshooting </xsl:when>
				<xsl:when test="ancestor::opcheckwp">Operational Checkout </xsl:when>
				<xsl:when test="local-name(.)='ctrlindwp'">Controls and Indicators </xsl:when>
				<xsl:when test="ancestor::opunuwp">Operation Under Unusual Conditions </xsl:when>
				<xsl:when test="ancestor::opusualwp">Operation Under Usual Conditions </xsl:when>
				<xsl:when test="ancestor::perseqpwp">Equipment Fitting Instructions </xsl:when>
				<xsl:when test="local-name(.)='bulk_itemswp'">Bulk Items List</xsl:when>
				<xsl:when test="ancestor::pmcsintrowp">PMCS Introduction </xsl:when>
				<xsl:when test="local-name(.)='pmcswp'">Preventive Maintenance Checks and Services </xsl:when>
				<xsl:when test="ancestor::pmi-cklistwp">Phased Maintenance Inspection </xsl:when>
				<xsl:when test="local-name(.)='pm-ginfowp'">General Information </xsl:when>
				<xsl:when test="ancestor::pmiwp">Preventive Maintenance Inspections </xsl:when>
				<xsl:when test="local-name(.)='pms-ginfowp'">General Information </xsl:when>
				<xsl:when test="ancestor::pms-inspecwp">Preventive Maintenance Services Inspection </xsl:when>
				<xsl:when test="ancestor::pnindxwp">Part Number Index </xsl:when>
				<xsl:when test="ancestor::pshopanalwp">Preshop Analysis Procedures </xsl:when>
				<xsl:when test="ancestor::qawp">Quality Assurance Requirements </xsl:when>
				<xsl:when test="ancestor::refwp">References </xsl:when>
				<xsl:when test="ancestor::refdesindxwp">Reference Designator Index </xsl:when>
				<xsl:when test="ancestor::stlwp">Special Tools List </xsl:when>
				<xsl:when test="ancestor::storagewp">Storage of Aircraft </xsl:when>
				<xsl:when test="ancestor::stowagewp">Stowage and Decal/Data Plate Guide </xsl:when>
				<xsl:when test="ancestor::surwp">Service Upon Receipt </xsl:when>
				<xsl:when test="local-name(.)='thrywp'">Theory of Operation </xsl:when>
				<xsl:when test="ancestor::toolidwp">Tool Identification List </xsl:when>
				<xsl:when test="local-name(.)='tsindxwp'">Troubleshooting Index </xsl:when>
				<xsl:when test="ancestor::tswp">Troubleshooting Procedure </xsl:when>
				<xsl:when test="ancestor::wiringwp">Wiring Diagrams </xsl:when>
				<xsl:when test="ancestor::wtloadwp">Weighing and Loading </xsl:when>
				<xsl:when test="local-name(.)='test-inspect'">Inspection Procedures </xsl:when>
				<xsl:when test="ancestor::bdar-geninfowp">BDAR General Repair Information </xsl:when>
				<xsl:when test="ancestor::damage-assesswp">Battle Damage Assessment </xsl:when>
				<xsl:when test="ancestor::genrepairwp">BDAR General Repair Procedures </xsl:when>
				<xsl:when test="ancestor::bdartoolswp">Special or Fabricated Tools	Information</xsl:when>
				<xsl:when test="ancestor::substitute-matwp">Substitute Materials/Parts Information
				</xsl:when>
			</xsl:choose>
		</xsl:param>

		<xsl:param name="tblctr">
			<xsl:number count="table" format="1." from="//ginfowp | descwp | thrywp | abbrevwp | symbolwp | ctrlindwp | opusualwp | opunuwp | stowagewp | eqploadwp | tsindxwp | pshopanalwp | compchklistwp | opcheck-tswp | tswp | opcheckwp | tsintrowp | techdescwp | surwp | perseqpwp | pmcsintrowp | pmcswp | pmcstable | gen.maintwp | maintwp | pmiwp | lubewp | facilwp | oipwp | mobilwp | qawp | manuwp | torquewp | inventorywp | storagewp | wtloadwp | wiringwp | ammowp | ammo.markingwp | natowp | auxeqpwp | wiringwp | pms-inspecwp | pmi-cklistwp | refwp | macintrowp | macwp | rpstlwp | coeibiiwp | plwp | aalwp | explistwp | toolidwp | mrplwp | csi.wp | supitemwp | genwp | introwp | destruct-materialwp | bdar-geninfowp | damage-assesswp | genrepairwp | bdartoolswp | substitute-matwp | ppmgeninfowp | orschwp | softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp" level="any"/>
		</xsl:param>
		<xsl:param name="changeno">
			<xsl:if test="string-length(@chngno)>0">  
				<xsl:text>CHANGE&#x2002;</xsl:text>
				<xsl:value-of select="@chngno"/>
			</xsl:if>
		</xsl:param>
		<!-- Change 18 OCT 2011 - TOG
Added new change paramater for page numbers when there is a change to that WP
-->
		<xsl:variable name="chngno">
			<xsl:if test="@chnglevel">
				<xsl:text>CHANGE&#x2002;</xsl:text>
				<xsl:value-of select="@chnglevel"/>
			</xsl:if>
		</xsl:variable>

<xsl:variable name="numFollowingVolume" select="count(following-sibling::volume)"/>
		<xsl:variable name="lastVolume" select="$numFollowingVolume - count(paper.manual/following-sibling::volume)"/>

<fo:page-sequence color="#000000" font-family="sans-serif" font-size="10pt" format="1" hyphenate="false" initial-page-number="1" language="en" line-height="1.15em" master-reference="impg" text-align="left">
					<fo:static-content flow-name="impg-before">
						<xsl:call-template name="WP-HEADER">
							<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
							<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
						</xsl:call-template>
						   <!-- Add ID to Page so internal work package links work. -->
    <fo:block keep-with-next="always">
     <xsl:if test="@wpno">
      <xsl:attribute name="id"><xsl:value-of select="@wpno"/></xsl:attribute>
     </xsl:if>
    </fo:block>
						
					</fo:static-content>
					<!-- Page information for ODD numbered pages -->
					<fo:static-content flow-name="xsl-region-before-odd">
						<xsl:call-template name="WP-HEADER">
							<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
							<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
						</xsl:call-template>
					</fo:static-content>
					<!-- Page information for EVEN numbered pages -->
					<fo:static-content flow-name="xsl-region-before-even">
						<xsl:call-template name="WP-HEADER">
							<xsl:with-param name="Odd-Or-Even">Even</xsl:with-param>
							<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
						</xsl:call-template>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-after-odd">
						<xsl:call-template name="WP-FOOTER">
							<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
							<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
						</xsl:call-template>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-after-even">
						<xsl:call-template name="WP-FOOTER">
							<xsl:with-param name="Odd-Or-Even">Even</xsl:with-param>
							<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
						</xsl:call-template>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-before">
						<fo:block/>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-end">
						<fo:block/>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-body-blank">
						<fo:block text-align="center"> Intentionally left blank.</fo:block>
					</fo:static-content>
					<fo:static-content flow-name="xsl-region-after-blank">
						<fo:block/>
					</fo:static-content>

					<fo:static-content flow-name="xsl-footnote-separator">
  <fo:block>
   <fo:leader leader-pattern="rule" leader-length="25%" rule-thickness="0.5pt" rule-style="solid" color="black"/>
   <fo:footnote>
				<fo:inline> <xsl:value-of select="ftnote/@label"/></fo:inline>
				<fo:footnote-body>
					<fo:block><xsl:value-of select="/ftnote/ftnpara"/></fo:block>
				</fo:footnote-body>
			</fo:footnote>
  </fo:block>
  </fo:static-content>
  		<fo:flow flow-name="xsl-region-body">
			<fo:marker marker-class-name="blank-page"/>
		<!--<fo:block>
		<fo:marker marker-class-name="blank-page"></fo:marker>
				</fo:block>-->
<fo:wrapper >
<!--	<fo:block space-after.conditionality="discard" space-after.maximum="160pt" space-after.minimum="150pt" space-after.optimum="155pt" space-before.conditionality="discard" space-before.maximum="160pt" space-before.minimum="150pt" space-before.optimum="155pt"></fo:block>-->
							
							<xsl:apply-templates select="node()"/>
						
			
		<xsl:choose>
	<xsl:when test="ancestor-or-self::plwp or ancestor-or-self::stlwp or ancestor-or-self::bulk_itemswp or ancestor-or-self::kitswp or ancestor-or-self::stl_partswp"/>
					<xsl:otherwise>
			<fo:block keep-with-previous.within-page="always" space-before.optimum="12pt" span="all" xsl:use-attribute-sets="titlesub" >
					<xsl:attribute name="start-indent"><xsl:value-of select="0"/>pt</xsl:attribute>
					<xsl:text>END OF WORK PACKAGE</xsl:text>
				</fo:block>
					</xsl:otherwise>
				</xsl:choose>
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
	

	<xsl:template name="WP-HEADER">
		<xsl:param name="Odd-Or-Even"/>
		<xsl:param name="WpSeqNo"/>
			<fo:block xsl:use-attribute-sets="secur-header-attrs">
			<xsl:value-of select="$docsecr"/>
		</fo:block>
		<fo:block>
			<xsl:choose>
				<xsl:when test="ancestor::csi.wp">Critical Safety Items List </xsl:when>
				<xsl:when test="ancestor::descwp">Description and Data </xsl:when>
				<xsl:when test="ancestor::eqploadwp">On-Vehicle Equipment Loading Plan </xsl:when>
				<xsl:when test="ancestor::explistwp">Expendable and Durable Items List </xsl:when>
				<xsl:when test="ancestor::facilwp">Facilities </xsl:when>
				<xsl:when test="ancestor::ginfowp">General Information </xsl:when>
				<xsl:when test="ancestor::introwp">Introduction </xsl:when>
				<xsl:when test="ancestor::lubewp">Lubrication Instructions </xsl:when>
				<xsl:when test="ancestor::macintrowp">Maintenance Allocation Chart (MAC) Introduction </xsl:when>
				<xsl:when test="ancestor::macwp">Maintenance Allocation Chart (MAC) </xsl:when>
				<xsl:when test="manuwp">Illustrated List of Manufactured Items </xsl:when>
				<xsl:when test="ancestor::mobilwp">Depot Mobilization Requirements </xsl:when>
				<xsl:when test="ancestor::mrplwp">Mandatory Replacement Parts List </xsl:when>
				<xsl:when test="ancestor::natowp">Foreign Ammunition (NATO) </xsl:when>
				<xsl:when test="ancestor::nsnindxwp">National Stock Number Index </xsl:when>
				<xsl:when test="ancestor::oipwp">Overhaul Inspection Procedures </xsl:when>
				<xsl:when test="ancestor::opcheck-tswp">Operational Checkout and Troubleshooting </xsl:when>
				<xsl:when test="ancestor::opcheckwp">Operational Checkout </xsl:when>
				<xsl:when test="ancestor::opunuwp">Operation Under Unusual Conditions </xsl:when>
				<xsl:when test="ancestor::opusualwp">Operation Under Usual Conditions </xsl:when>
				<xsl:when test="ancestor::perseqpwp">Equipment Fitting Instructions </xsl:when>
				<xsl:when test="ancestor::plwp">Repair Parts List </xsl:when>
				<xsl:when test="ancestor::pmcsintrowp">PMCS Introduction </xsl:when>
				<xsl:when test="ancestor::pmcswp">Preventive Maintenance Checks and Services </xsl:when>
				<xsl:when test="ancestor::pmi-cklistwp">Phased Maintenance Inspection </xsl:when>
				<xsl:when test="ancestor::pm-ginfowp">General Information </xsl:when>
				<xsl:when test="ancestor::pmiwp">Preventive Maintenance Inspections </xsl:when>
				<xsl:when test="ancestor::pms-ginfowp">General Information </xsl:when>
				<xsl:when test="ancestor::pms-inspecwp">Preventive Maintenance Services Inspection </xsl:when>
				<xsl:when test="ancestor::pnindxwp">Part Number Index </xsl:when>
				<xsl:when test="ancestor::pshopanalwp">Preshop Analysis Procedures </xsl:when>
				<xsl:when test="ancestor::qawp">Quality Assurance Requirements </xsl:when>
				<xsl:when test="ancestor::refwp">References </xsl:when>
				<xsl:when test="ancestor::refdesindxwp">Reference Designator Index </xsl:when>
				<xsl:when test="ancestor::stlwp">Special Tools List </xsl:when>
				<xsl:when test="ancestor::storagewp">Storage of Aircraft </xsl:when>
				<xsl:when test="ancestor::stowagewp">Stowage and Decal/Data Plate Guide </xsl:when>
				<xsl:when test="ancestor::surwp">Service Upon Receipt </xsl:when>
				<xsl:when test="ancestor::thrywp">Theory of Operation </xsl:when>
				<xsl:when test="ancestor::toolidwp">Tool Identification List </xsl:when>
				<xsl:when test="ancestor::tsindxwp">Troubleshooting Index </xsl:when>
				<xsl:when test="ancestor::tswp">Troubleshooting Procedure </xsl:when>
				<xsl:when test="ancestor::wiringwp">Wiring Diagrams </xsl:when>
				<xsl:when test="ancestor::wtloadwp">Weighing and Loading </xsl:when>
				<xsl:when test="ancestor::stl_partswp">Repair Parts for Special Tools List </xsl:when>
				<xsl:when test="ancestor::kitswp">Kit Parts List </xsl:when>
				<xsl:when test="ancestor::bulk-itemswp">Bulk Items List</xsl:when>
				<xsl:when test="ancestor::bdar-geninfowp">BDAR General Repair Information </xsl:when>
				<xsl:when test="ancestor::damage-assesswp">Battle Damage Assessment </xsl:when>
				<xsl:when test="ancestor::genrepairwp">BDAR General Repair Procedures </xsl:when>
				<xsl:when test="ancestor::bdartoolswp">Special or Fabricated Tools Information</xsl:when>
				<xsl:when test="ancestor::substitute-matwp">Substitute Materials/Parts Information</xsl:when>
				<xsl:when test="ancestor::orschwp">OVERHAUL AND RETIREMENT SCHEDULE </xsl:when>
				<xsl:when test="ancestor::softginfowp">Software General Information</xsl:when>
				<xsl:when test="ancestor::softeffectwp">SOFTWARE EFFECTIVITY</xsl:when>
				<xsl:when test="ancestor::softsumwp">SOFTWARE SUMMARY</xsl:when>
				<xsl:when test="ancestor::softdiffversionwp">DIFFERENCES BETWEEN SOFTWARE VERSIONS</xsl:when>
				<xsl:when test="ancestor::softfeaturescapwp">FEATURES AND CAPABILITIES</xsl:when>
				<xsl:when test="ancestor::softscreendisplaywp">SCREEN DISPLAYS</xsl:when>
				<xsl:when test="ancestor::softmenuwp">MENUS/DIRECTORY STRUCTURE</xsl:when>
				<xsl:when test="ancestor::softtoolswp">TOOLS AND BUTTONS</xsl:when>
				<xsl:when test="ancestor::softsecprivwp">SECURITY AND PRIVACY PROCEDURE</xsl:when>
				<xsl:when test="ancestor::softsuperctrlswp">SUPERVISORY CONTROLS</xsl:when>
				<xsl:when test="ancestor::softpowerupwp">POWERUP/STARTUP PROCEDURES</xsl:when>
				<xsl:when test="ancestor::softpowerdownwp">POWERDOWN/SHUTDOWN PROCEDURES</xsl:when>
				<xsl:when test="ancestor::softaccesswp">ACCESSING/EXITING SOFTWARE</xsl:when>
				<xsl:when test="ancestor::softkeycmdswp">KEY COMMANDS</xsl:when>
				<xsl:when test="ancestor::softproccmdwp">PROCESSES AND COMMANDS</xsl:when>
				<xsl:when test="ancestor::softguiwp">USER INTERFACE</xsl:when>
				<xsl:when test="ancestor::softopconventionswp">SOFTWARE OPERATING CONVETIONS</xsl:when>
				<xsl:when test="ancestor::softgenwp">ADDITIONAL SOFTWARE OPERATION</xsl:when>
				<xsl:when test="ancestor::softmessageswp">MESSAGES</xsl:when>
				<xsl:when test="ancestor::softerrorswp">RECOVERY FROM ERRORS, MALFUNCTIONS, AND EMERGENCIES</xsl:when>
				<xsl:when test="ancestor::softbiiwp">BASIC ISSUE ITEMS</xsl:when>
				</xsl:choose>
		</fo:block>

		<fo:wrapper font-family="sans-serif" font-size="10pt" font-weight="bold">
				<fo:table>
					<fo:table-column>
					<xsl:attribute name="column-width">
						<xsl:choose>
						<xsl:when test="$Odd-Or-Even='Even'">31%</xsl:when>
						<xsl:otherwise>31%</xsl:otherwise></xsl:choose>
						</xsl:attribute>
					</fo:table-column>
					<fo:table-column column-width="38%"/>
					<fo:table-column>
						<xsl:attribute name="column-width">
						<xsl:choose>
						<xsl:when test="$Odd-Or-Even='Even'">31%</xsl:when>
						<xsl:otherwise>31%</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>
					</fo:table-column>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell column-number="2" text-align="center">
							<fo:block xsl:use-attribute-sets="tmno-header-attrs">
							<xsl:if test="ancestor-or-self::*[generate-id(.)=$x]">
<xsl:copy>
<xsl:copy-of select="@*"/>
<xsl:apply-templates/>
</xsl:copy>
</xsl:if>
				<xsl:value-of select="(preceding::tmno)[1]"/>
				<xsl:choose>
				<xsl:when test="//sum">
						<xsl:text>&#x02010;SUM</xsl:text><!-- Endash(&#x02013;) changed to hyphen (&#x02010;)-->
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
				</fo:table-cell>
						<!--	<xsl:if test="$Odd-Or-Even='Odd'">-->
								<fo:table-cell text-align="right">
								<fo:block >
									<xsl:value-of select="$WpSeqNo"/>
									</fo:block>
								</fo:table-cell>
							<!--</xsl:if>-->
						</fo:table-row>
					</fo:table-body>
				</fo:table>
</fo:wrapper>
<!--<xsl:choose>

--><!--"(parent::plwp/@marines='yes' or parent::plwp/@airforce='yes'--><!--


	 <xsl:when test="string-length(/paper.manual/@secuirty) != 0">
	 <fo:block span="all" margin-top="3em">
			<fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
		</fo:block>
		</xsl:when>
		<xsl:when test="string-length(/pmcswp/@secuirty) != 0">
		 <fo:block span="all" margin-top="3em">
			<fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
		</fo:block>
		</xsl:when>
		
		<xsl:otherwise>
				</xsl:otherwise>
		</xsl:choose>-->
	<fo:block span="all">
			<fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
		</fo:block>

	</xsl:template>
	<xsl:template mode="CONTENTS" match="tmno">
		<fo:block font-size="12pt" font-weight="bold" space-after.maximum="0pt" space-after.minimum="0pt" space-after.optimum="0pt" space-before.maximum="12pt" space-before.minimum="10pt" space-before.optimum="10pt" span="all" text-align="center" text-transform="uppercase">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
		<xsl:template name="WP-FOOTER">
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
					<fo:table-column column-width="31%"/>
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
								<xsl:if test="ancestor-or-self::ginfowp[@chngno>'0'] | ancestor-or-self::descwp[@chngno>'0'] | ancestor-or-self::thrywp[@chngno>'0'] | ancestor-or-self::abbrevwp[@chngno>'0'] | ancestor-or-self::symbolwp[@chngno>'0'] | ancestor-or-self::opusualwp[@chngno>'0'] | ancestor-or-self::ctrlindwp[@chngno>'0'] | ancestor-or-self::opunuwp[@chngno>'0'] | ancestor-or-self::stowagewp[@chngno>'0'] | ancestor-or-self::eqploadwp[@chngno>'0'] | ancestor-or-self::tsindxwp[@chngno>'0'] | ancestor-or-self::pshopanalwp[@chngno>'0'] | ancestor-or-self::compchklistwp[@chngno>'0'] | ancestor-or-self::opcheck-tswp[@chngno>'0'] | ancestor-or-self::tswp[@chngno>'0'] | ancestor-or-self::opcheckwp[@chngno>'0'] | ancestor-or-self::tsintrowp[@chngno>'0'] | ancestor-or-self::techdescwp[@chngno>'0'] | ancestor-or-self::surwp[@chngno>'0'] | ancestor-or-self::perseqpwp[@chngno>'0'] | ancestor-or-self::pmcsintrowp[@chngno>'0'] | ancestor-or-self::pmcswp[@chngno>'0'] | ancestor-or-self::gen.maintwp[@chngno>'0'] | ancestor-or-self::maintwp[@chngno>'0'] | ancestor-or-self::pmiwp[@chngno>'0'] | ancestor-or-self::lubewp[@chngno>'0'] | ancestor-or-self::facilwp[@chngno>'0'] | ancestor-or-self::oipwp[@chngno>'0'] | ancestor-or-self::mobilwp[@chngno>'0'] | ancestor-or-self::qawp[@chngno>'0'] | ancestor-or-self::manuwp[@chngno>'0'] | ancestor-or-self::torquewp[@chngno>'0'] | ancestor-or-self::inventorywp[@chngno>'0'] | ancestor-or-self::storagewp[@chngno>'0'] | ancestor-or-self::wtloadwp[@chngno>'0'] | ancestor-or-self::wiringwp[@chngno>'0'] | ancestor-or-self::ammowp[@chngno>'0'] | ancestor-or-self::ammo.markingwp[@chngno>'0'] | ancestor-or-self::natowp[@chngno>'0'] | ancestor-or-self::auxeqpwp[@chngno>'0'] | ancestor-or-self::wiringwp[@chngno>'0'] | ancestor-or-self::pms-inspecwp[@chngno>'0'] | ancestor-or-self::pmi-cklistwp[@chngno>'0'] | ancestor-or-self::refwp[@chngno>'0'] | ancestor-or-self::macintrowp[@chngno>'0'] | ancestor-or-self::macwp[@chngno>'0'] | ancestor-or-self::rpstlwp[@chngno>'0'] | ancestor-or-self::coeibiiwp[@chngno>'0'] | ancestor-or-self::plwp[@chngno>'0'] | ancestor-or-self::aalwp[@chngno>'0'] | ancestor-or-self::explistwp[@chngno>'0'] | ancestor-or-self::toolidwp[@chngno>'0'] | ancestor-or-self::mrplwp[@chngno>'0'] | ancestor-or-self::csi.wp[@chngno>'0'] | ancestor-or-self::surwp[@chngno>'0'] | ancestor-or-self::supitemwp[@chngno>'0'] | ancestor-or-self::genwp[@chngno>'0'] | ancestor-or-self::introwp[@chngno>'0'] | ancestor-or-self::destruct-materialwp[@chngno>'0'] | ancestor-or-self::bdar-geninfowp[@chngno>'0'] | ancestor-or-self::damage-assesswp[@chngno>'0'] | ancestor-or-self::genrepairwp[@chngno>'0'] | ancestor-or-self::bdartoolswp[@chngno>'0'] | ancestor-or-self::substitute-matwp[@chngno>'0']">
		<xsl:text>CHANGE </xsl:text>
									<xsl:value-of select="./@chngno"/>
										</xsl:if>
											<!-- Check for each work package attribute for a service only as per 40051-2 -->
	<xsl:if test="ancestor-or-self::ginfowp[@army='yes'] | ancestor-or-self::descwp[@army='yes'] | ancestor-or-self::thrywp[@army='yes'] | ancestor-or-self::abbrevwp[@army='yes'] | ancestor-or-self::symbolwp[@army='yes'] | ancestor-or-self::opusualwp[@army='yes'] | ancestor-or-self::ctrlindwp[@army='yes'] | ancestor-or-self::opunuwp[@army='yes'] | ancestor-or-self::stowagewp[@army='yes'] | ancestor-or-self::eqploadwp[@army='yes'] | ancestor-or-self::tsindxwp[@army='yes'] | ancestor-or-self::pshopanalwp[@army='yes'] | ancestor-or-self::compchklistwp[@army='yes'] | ancestor-or-self::opcheck-tswp[@army='yes'] | ancestor-or-self::tswp[@army='yes'] | ancestor-or-self::opcheckwp[@army='yes'] | ancestor-or-self::tsintrowp[@army='yes'] | ancestor-or-self::techdescwp[@army='yes'] | ancestor-or-self::surwp[@army='yes'] | ancestor-or-self::perseqpwp[@army='yes'] | ancestor-or-self::pmcsintrowp[@army='yes'] | ancestor-or-self::pmcswp[@army='yes'] | ancestor-or-self::gen.maintwp[@army='yes'] | ancestor-or-self::maintwp[@army='yes'] | ancestor-or-self::pmiwp[@army='yes'] | ancestor-or-self::lubewp[@army='yes'] | ancestor-or-self::facilwp[@army='yes'] | ancestor-or-self::oipwp[@army='yes'] | ancestor-or-self::mobilwp[@army='yes'] | ancestor-or-self::qawp[@army='yes'] | ancestor-or-self::manuwp[@army='yes'] | ancestor-or-self::torquewp[@army='yes'] | ancestor-or-self::inventorywp[@army='yes'] | ancestor-or-self::storagewp[@army='yes'] | ancestor-or-self::wtloadwp[@army='yes'] | ancestor-or-self::wiringwp[@army='yes'] | ancestor-or-self::ammowp[@army='yes'] | ancestor-or-self::ammo.markingwp[@army='yes'] | ancestor-or-self::natowp[@army='yes'] | ancestor-or-self::auxeqpwp[@army='yes'] | ancestor-or-self::wiringwp[@army='yes'] | ancestor-or-self::pms-inspecwp[@army='yes'] | ancestor-or-self::pmi-cklistwp[@army='yes'] | ancestor-or-self::refwp[@army='yes'] | ancestor-or-self::macintrowp[@army='yes'] | ancestor-or-self::macwp[@army='yes'] | ancestor-or-self::rpstlwp[@army='yes'] | ancestor-or-self::coeibiiwp[@army='yes'] | ancestor-or-self::plwp[@army='yes'] | ancestor-or-self::aalwp[@army='yes'] | ancestor-or-self::explistwp[@army='yes'] | ancestor-or-self::toolidwp[@army='yes'] | ancestor-or-self::mrplwp[@army='yes'] | ancestor-or-self::csi.fscap.wp[@army='yes'] | ancestor-or-self::surwp[@army='yes'] | ancestor-or-self::supitemwp[@army='yes'] | ancestor-or-self::genwp[@army='yes'] | ancestor-or-self::introwp[@army='yes'] | ancestor-or-self::destruct-materialwp[@army='yes'] | ancestor-or-self::bdar-geninfowp[@army='yes'] | ancestor-or-self::damage-assesswp[@army='yes'] | ancestor-or-self::genrepairwp[@army='yes'] | ancestor-or-self::bdartoolswp[@army='yes'] | ancestor-or-self::substitute-matwp[@army='yes']">
										<xsl:text>&#x2003;</xsl:text>
										<xsl:text>USA</xsl:text>
									</xsl:if>
									
										<xsl:if test="ancestor-or-self::ginfowp[@marines='yes'] | ancestor-or-self::descwp[@marines='yes'] | ancestor-or-self::thrywp[@marines='yes'] | ancestor-or-self::abbrevwp[@marines='yes'] | ancestor-or-self::symbolwp[@marines='yes'] | ancestor-or-self::opusualwp[@marines='yes'] | ancestor-or-self::ctrlindwp[@marines='yes'] | ancestor-or-self::opunuwp[@marines='yes'] | ancestor-or-self::stowagewp[@marines='yes'] | ancestor-or-self::eqploadwp[@marines='yes'] | ancestor-or-self::tsindxwp[@marines='yes'] | ancestor-or-self::pshopanalwp[@marines='yes'] | ancestor-or-self::compchklistwp[@marines='yes'] | ancestor-or-self::opcheck-tswp[@marines='yes'] | ancestor-or-self::tswp[@marines='yes'] | ancestor-or-self::opcheckwp[@marines='yes'] | ancestor-or-self::tsintrowp[@marines='yes'] | ancestor-or-self::techdescwp[@marines='yes'] | ancestor-or-self::surwp[@marines='yes'] | ancestor-or-self::perseqpwp[@marines='yes'] | ancestor-or-self::pmcsintrowp[@marines='yes'] | ancestor-or-self::pmcswp[@marines='yes'] | ancestor-or-self::gen.maintwp[@marines='yes'] | ancestor-or-self::maintwp[@marines='yes'] | ancestor-or-self::pmiwp[@marines='yes'] | ancestor-or-self::lubewp[@marines='yes'] | ancestor-or-self::facilwp[@marines='yes'] | ancestor-or-self::oipwp[@marines='yes'] | ancestor-or-self::mobilwp[@marines='yes'] | ancestor-or-self::qawp[@marines='yes'] | ancestor-or-self::manuwp[@marines='yes'] | ancestor-or-self::torquewp[@marines='yes'] | ancestor-or-self::inventorywp[@marines='yes'] | ancestor-or-self::storagewp[@marines='yes'] | ancestor-or-self::wtloadwp[@marines='yes'] | ancestor-or-self::wiringwp[@marines='yes'] | ancestor-or-self::ammowp[@marines='yes'] | ancestor-or-self::ammo.markingwp[@marines='yes'] | ancestor-or-self::natowp[@marines='yes'] | ancestor-or-self::auxeqpwp[@marines='yes'] | ancestor-or-self::wiringwp[@marines='yes'] | ancestor-or-self::pms-inspecwp[@marines='yes'] | ancestor-or-self::pmi-cklistwp[@marines='yes'] | ancestor-or-self::refwp[@marines='yes'] | ancestor-or-self::macintrowp[@marines='yes'] | ancestor-or-self::macwp[@marines='yes'] | ancestor-or-self::rpstlwp[@marines='yes'] | ancestor-or-self::coeibiiwp[@marines='yes'] | ancestor-or-self::plwp[@marines='yes'] | ancestor-or-self::aalwp[@marines='yes'] | ancestor-or-self::explistwp[@marines='yes'] | ancestor-or-self::toolidwp[@marines='yes'] | ancestor-or-self::mrplwp[@marines='yes'] | ancestor-or-self::csi.fscap.wp[@marines='yes'] | ancestor-or-self::surwp[@marines='yes'] | ancestor-or-self::supitemwp[@marines='yes'] | ancestor-or-self::genwp[@marines='yes'] | ancestor-or-self::introwp[@marines='yes'] | ancestor-or-self::destruct-materialwp[@marines='yes'] | ancestor-or-self::bdar-geninfowp[@marines='yes'] | ancestor-or-self::damage-assesswp[@marines='yes'] | ancestor-or-self::genrepairwp[@marines='yes'] | ancestor-or-self::bdartoolswp[@marines='yes'] | ancestor-or-self::substitute-matwp[@marines='yes']">
										<xsl:text>&#x2003;</xsl:text>
										<xsl:text>USMC</xsl:text>
										</xsl:if>
	<xsl:if test="ancestor-or-self::ginfowp[@airforce='yes'] | ancestor-or-self::descwp[@airforce='yes'] | ancestor-or-self::thrywp[@airforce='yes'] | ancestor-or-self::abbrevwp[@airforce='yes'] | ancestor-or-self::symbolwp[@airforce='yes'] | ancestor-or-self::opusualwp[@airforce='yes'] | ancestor-or-self::ctrlindwp[@airforce='yes'] | ancestor-or-self::opunuwp[@airforce='yes'] | ancestor-or-self::stowagewp[@airforce='yes'] | ancestor-or-self::eqploadwp[@airforce='yes'] | ancestor-or-self::tsindxwp[@airforce='yes'] | ancestor-or-self::pshopanalwp[@airforce='yes'] | ancestor-or-self::compchklistwp[@airforce='yes'] | ancestor-or-self::opcheck-tswp[@airforce='yes'] | ancestor-or-self::tswp[@airforce='yes'] | ancestor-or-self::opcheckwp[@airforce='yes'] | ancestor-or-self::tsintrowp[@airforce='yes'] | ancestor-or-self::techdescwp[@airforce='yes'] | ancestor-or-self::surwp[@airforce='yes'] | ancestor-or-self::perseqpwp[@airforce='yes'] | ancestor-or-self::pmcsintrowp[@airforce='yes'] | ancestor-or-self::pmcswp[@airforce='yes'] | ancestor-or-self::gen.maintwp[@airforce='yes'] | ancestor-or-self::maintwp[@airforce='yes'] | ancestor-or-self::pmiwp[@airforce='yes'] | ancestor-or-self::lubewp[@airforce='yes'] | ancestor-or-self::facilwp[@airforce='yes'] | ancestor-or-self::oipwp[@airforce='yes'] | ancestor-or-self::mobilwp[@airforce='yes'] | ancestor-or-self::qawp[@airforce='yes'] | ancestor-or-self::manuwp[@airforce='yes'] | ancestor-or-self::torquewp[@airforce='yes'] | ancestor-or-self::inventorywp[@airforce='yes'] | ancestor-or-self::storagewp[@airforce='yes'] | ancestor-or-self::wtloadwp[@airforce='yes'] | ancestor-or-self::wiringwp[@airforce='yes'] | ancestor-or-self::ammowp[@airforce='yes'] | ancestor-or-self::ammo.markingwp[@airforce='yes'] | ancestor-or-self::natowp[@airforce='yes'] | ancestor-or-self::auxeqpwp[@airforce='yes'] | ancestor-or-self::wiringwp[@airforce='yes'] | ancestor-or-self::pms-inspecwp[@airforce='yes'] | ancestor-or-self::pmi-cklistwp[@airforce='yes'] | ancestor-or-self::refwp[@airforce='yes'] | ancestor-or-self::macintrowp[@airforce='yes'] | ancestor-or-self::macwp[@airforce='yes'] | ancestor-or-self::rpstlwp[@airforce='yes'] | ancestor-or-self::coeibiiwp[@airforce='yes'] | ancestor-or-self::plwp[@airforce='yes'] | ancestor-or-self::aalwp[@airforce='yes'] | ancestor-or-self::explistwp[@airforce='yes'] | ancestor-or-self::toolidwp[@airforce='yes'] | ancestor-or-self::mrplwp[@airforce='yes'] | ancestor-or-self::csi.fscap.wp[@airforce='yes'] | ancestor-or-self::surwp[@airforce='yes'] | ancestor-or-self::supitemwp[@airforce='yes'] | ancestor-or-self::genwp[@airforce='yes'] | ancestor-or-self::introwp[@airforce='yes'] | ancestor-or-self::destruct-materialwp[@airforce='yes'] | ancestor-or-self::bdar-geninfowp[@airforce='yes'] | ancestor-or-self::damage-assesswp[@airforce='yes'] | ancestor-or-self::genrepairwp[@airforce='yes'] | ancestor-or-self::bdartoolswp[@airforce='yes'] | ancestor-or-self::substitute-matwp[@airforce='yes']">	
	<xsl:text>&#x2003;</xsl:text>								
<xsl:text>USAF</xsl:text>
										</xsl:if>
	<xsl:if test="ancestor-or-self::ginfowp[@navy='yes'] | ancestor-or-self::descwp[@navy='yes'] | ancestor-or-self::thrywp[@navy='yes'] | ancestor-or-self::abbrevwp[@navy='yes'] | ancestor-or-self::symbolwp[@navy='yes'] | ancestor-or-self::opusualwp[@navy='yes'] | ancestor-or-self::ctrlindwp[@navy='yes'] | ancestor-or-self::opunuwp[@navy='yes'] | ancestor-or-self::stowagewp[@navy='yes'] | ancestor-or-self::eqploadwp[@navy='yes'] | ancestor-or-self::tsindxwp[@navy='yes'] | ancestor-or-self::pshopanalwp[@navy='yes'] | ancestor-or-self::compchklistwp[@navy='yes'] | ancestor-or-self::opcheck-tswp[@navy='yes'] | ancestor-or-self::tswp[@navy='yes'] | ancestor-or-self::opcheckwp[@navy='yes'] | ancestor-or-self::tsintrowp[@navy='yes'] | ancestor-or-self::techdescwp[@navy='yes'] | ancestor-or-self::surwp[@navy='yes'] | ancestor-or-self::perseqpwp[@navy='yes'] | ancestor-or-self::pmcsintrowp[@navy='yes'] | ancestor-or-self::pmcswp[@navy='yes'] | ancestor-or-self::gen.maintwp[@navy='yes'] | ancestor-or-self::maintwp[@navy='yes'] | ancestor-or-self::pmiwp[@navy='yes'] | ancestor-or-self::lubewp[@navy='yes'] | ancestor-or-self::facilwp[@navy='yes'] | ancestor-or-self::oipwp[@navy='yes'] | ancestor-or-self::mobilwp[@navy='yes'] | ancestor-or-self::qawp[@navy='yes'] | ancestor-or-self::manuwp[@navy='yes'] | ancestor-or-self::torquewp[@navy='yes'] | ancestor-or-self::inventorywp[@navy='yes'] | ancestor-or-self::storagewp[@navy='yes'] | ancestor-or-self::wtloadwp[@navy='yes'] | ancestor-or-self::wiringwp[@navy='yes'] | ancestor-or-self::ammowp[@navy='yes'] | ancestor-or-self::ammo.markingwp[@navy='yes'] | ancestor-or-self::natowp[@navy='yes'] | ancestor-or-self::auxeqpwp[@navy='yes'] | ancestor-or-self::wiringwp[@navy='yes'] | ancestor-or-self::pms-inspecwp[@navy='yes'] | ancestor-or-self::pmi-cklistwp[@navy='yes'] | ancestor-or-self::refwp[@navy='yes'] | ancestor-or-self::macintrowp[@navy='yes'] | ancestor-or-self::macwp[@navy='yes'] | ancestor-or-self::rpstlwp[@navy='yes'] | ancestor-or-self::coeibiiwp[@navy='yes'] | ancestor-or-self::plwp[@navy='yes'] | ancestor-or-self::aalwp[@navy='yes'] | ancestor-or-self::explistwp[@navy='yes'] | ancestor-or-self::toolidwp[@navy='yes'] | ancestor-or-self::mrplwp[@navy='yes'] | ancestor-or-self::csi.fscap.wp[@navy='yes'] | ancestor-or-self::surwp[@navy='yes'] | ancestor-or-self::supitemwp[@navy='yes'] | ancestor-or-self::genwp[@navy='yes'] | ancestor-or-self::introwp[@navy='yes'] | ancestor-or-self::destruct-materialwp[@navy='yes'] | ancestor-or-self::bdar-geninfowp[@navy='yes'] | ancestor-or-self::damage-assesswp[@navy='yes'] | ancestor-or-self::genrepairwp[@navy='yes'] | ancestor-or-self::bdartoolswp[@navy='yes'] | ancestor-or-self::substitute-matwp[@navy='yes']">	
	<xsl:text>&#x2003;</xsl:text>
										<xsl:text>USN</xsl:text>
										</xsl:if>
										</fo:block>
								</fo:table-cell>
							</xsl:if>
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
								<xsl:if test="ancestor-or-self::ginfowp[@chngno>'0'] | ancestor-or-self::descwp[@chngno>'0'] | ancestor-or-self::thrywp[@chngno>'0'] | ancestor-or-self::abbrevwp[@chngno>'0'] | ancestor-or-self::symbolwp[@chngno>'0'] | ancestor-or-self::opusualwp[@chngno>'0'] | ancestor-or-self::ctrlindwp[@chngno>'0'] | ancestor-or-self::opunuwp[@chngno>'0'] | ancestor-or-self::stowagewp[@chngno>'0'] | ancestor-or-self::eqploadwp[@chngno>'0'] | ancestor-or-self::tsindxwp[@chngno>'0'] | ancestor-or-self::pshopanalwp[@chngno>'0'] | ancestor-or-self::compchklistwp[@chngno>'0'] | ancestor-or-self::opcheck-tswp[@chngno>'0'] | ancestor-or-self::tswp[@chngno>'0'] | ancestor-or-self::opcheckwp[@chngno>'0'] | ancestor-or-self::tsintrowp[@chngno>'0'] | ancestor-or-self::techdescwp[@chngno>'0'] | ancestor-or-self::surwp[@chngno>'0'] | ancestor-or-self::perseqpwp[@chngno>'0'] | ancestor-or-self::pmcsintrowp[@chngno>'0'] | ancestor-or-self::pmcswp[@chngno>'0'] | ancestor-or-self::gen.maintwp[@chngno>'0'] | ancestor-or-self::maintwp[@chngno>'0'] | ancestor-or-self::pmiwp[@chngno>'0'] | ancestor-or-self::lubewp[@chngno>'0'] | ancestor-or-self::facilwp[@chngno>'0'] | ancestor-or-self::oipwp[@chngno>'0'] | ancestor-or-self::mobilwp[@chngno>'0'] | ancestor-or-self::qawp[@chngno>'0'] | ancestor-or-self::manuwp[@chngno>'0'] | ancestor-or-self::torquewp[@chngno>'0'] | ancestor-or-self::inventorywp[@chngno>'0'] | ancestor-or-self::storagewp[@chngno>'0'] | ancestor-or-self::wtloadwp[@chngno>'0'] | ancestor-or-self::wiringwp[@chngno>'0'] | ancestor-or-self::ammowp[@chngno>'0'] | ancestor-or-self::ammo.markingwp[@chngno>'0'] | ancestor-or-self::natowp[@chngno>'0'] | ancestor-or-self::auxeqpwp[@chngno>'0'] | ancestor-or-self::wiringwp[@chngno>'0'] | ancestor-or-self::pms-inspecwp[@chngno>'0'] | ancestor-or-self::pmi-cklistwp[@chngno>'0'] | ancestor-or-self::refwp[@chngno>'0'] | ancestor-or-self::macintrowp[@chngno>'0'] | ancestor-or-self::macwp[@chngno>'0'] | ancestor-or-self::rpstlwp[@chngno>'0'] | ancestor-or-self::coeibiiwp[@chngno>'0'] | ancestor-or-self::plwp[@chngno>'0'] | ancestor-or-self::aalwp[@chngno>'0'] | ancestor-or-self::explistwp[@chngno>'0'] | ancestor-or-self::toolidwp[@chngno>'0'] | ancestor-or-self::mrplwp[@chngno>'0'] | ancestor-or-self::csi.fscap.wp[@chngno>'0'] | ancestor-or-self::surwp[@chngno>'0'] | ancestor-or-self::supitemwp[@chngno>'0'] | ancestor-or-self::genwp[@chngno>'0'] | ancestor-or-self::introwp[@chngno>'0'] | ancestor-or-self::destruct-materialwp[@chngno>'0'] | ancestor-or-self::bdar-geninfowp[@chngno>'0'] | ancestor-or-self::damage-assesswp[@chngno>'0'] | ancestor-or-self::genrepairwp[@chngno>'0'] | ancestor-or-self::bdartoolswp[@chngno>'0'] | ancestor-or-self::substitute-matwp[@chngno>'0'] | ancestor-or-self::titleblk[@chngno>'0']">
		<xsl:text>CHANGE </xsl:text>
									<xsl:value-of select="./@chngno"/>
										</xsl:if>
										<!-- Check for each work package attribute for a service only as per 40051-2 -->
	<xsl:if test="ancestor-or-self::ginfowp[@army='yes'] | ancestor-or-self::descwp[@army='yes'] | ancestor-or-self::thrywp[@army='yes'] | ancestor-or-self::abbrevwp[@army='yes'] | ancestor-or-self::symbolwp[@army='yes'] | ancestor-or-self::opusualwp[@army='yes'] | ancestor-or-self::ctrlindwp[@army='yes'] | ancestor-or-self::opunuwp[@army='yes'] | ancestor-or-self::stowagewp[@army='yes'] | ancestor-or-self::eqploadwp[@army='yes'] | ancestor-or-self::tsindxwp[@army='yes'] | ancestor-or-self::pshopanalwp[@army='yes'] | ancestor-or-self::compchklistwp[@army='yes'] | ancestor-or-self::opcheck-tswp[@army='yes'] | ancestor-or-self::tswp[@army='yes'] | ancestor-or-self::opcheckwp[@army='yes'] | ancestor-or-self::tsintrowp[@army='yes'] | ancestor-or-self::techdescwp[@army='yes'] | ancestor-or-self::surwp[@army='yes'] | ancestor-or-self::perseqpwp[@army='yes'] | ancestor-or-self::pmcsintrowp[@army='yes'] | ancestor-or-self::pmcswp[@army='yes'] | ancestor-or-self::gen.maintwp[@army='yes'] | ancestor-or-self::maintwp[@army='yes'] | ancestor-or-self::pmiwp[@army='yes'] | ancestor-or-self::lubewp[@army='yes'] | ancestor-or-self::facilwp[@army='yes'] | ancestor-or-self::oipwp[@army='yes'] | ancestor-or-self::mobilwp[@army='yes'] | ancestor-or-self::qawp[@army='yes'] | ancestor-or-self::manuwp[@army='yes'] | ancestor-or-self::torquewp[@army='yes'] | ancestor-or-self::inventorywp[@army='yes'] | ancestor-or-self::storagewp[@army='yes'] | ancestor-or-self::wtloadwp[@army='yes'] | ancestor-or-self::wiringwp[@army='yes'] | ancestor-or-self::ammowp[@army='yes'] | ancestor-or-self::ammo.markingwp[@army='yes'] | ancestor-or-self::natowp[@army='yes'] | ancestor-or-self::auxeqpwp[@army='yes'] | ancestor-or-self::wiringwp[@army='yes'] | ancestor-or-self::pms-inspecwp[@army='yes'] | ancestor-or-self::pmi-cklistwp[@army='yes'] | ancestor-or-self::refwp[@army='yes'] | ancestor-or-self::macintrowp[@army='yes'] | ancestor-or-self::macwp[@army='yes'] | ancestor-or-self::rpstlwp[@army='yes'] | ancestor-or-self::coeibiiwp[@army='yes'] | ancestor-or-self::plwp[@army='yes'] | ancestor-or-self::aalwp[@army='yes'] | ancestor-or-self::explistwp[@army='yes'] | ancestor-or-self::toolidwp[@army='yes'] | ancestor-or-self::mrplwp[@army='yes'] | ancestor-or-self::csi.fscap.wp[@army='yes'] | ancestor-or-self::surwp[@army='yes'] | ancestor-or-self::supitemwp[@army='yes'] | ancestor-or-self::genwp[@army='yes'] | ancestor-or-self::introwp[@army='yes'] | ancestor-or-self::destruct-materialwp[@army='yes'] | ancestor-or-self::bdar-geninfowp[@army='yes'] | ancestor-or-self::damage-assesswp[@army='yes'] | ancestor-or-self::genrepairwp[@army='yes'] | ancestor-or-self::bdartoolswp[@army='yes'] | ancestor-or-self::substitute-matwp[@army='yes']">
										<xsl:text>&#x2003;</xsl:text>
										<xsl:text>USA</xsl:text>
									</xsl:if>
									
										<xsl:if test="ancestor-or-self::ginfowp[@marines='yes'] | ancestor-or-self::descwp[@marines='yes'] | ancestor-or-self::thrywp[@marines='yes'] | ancestor-or-self::abbrevwp[@marines='yes'] | ancestor-or-self::symbolwp[@marines='yes'] | ancestor-or-self::opusualwp[@marines='yes'] | ancestor-or-self::ctrlindwp[@marines='yes'] | ancestor-or-self::opunuwp[@marines='yes'] | ancestor-or-self::stowagewp[@marines='yes'] | ancestor-or-self::eqploadwp[@marines='yes'] | ancestor-or-self::tsindxwp[@marines='yes'] | ancestor-or-self::pshopanalwp[@marines='yes'] | ancestor-or-self::compchklistwp[@marines='yes'] | ancestor-or-self::opcheck-tswp[@marines='yes'] | ancestor-or-self::tswp[@marines='yes'] | ancestor-or-self::opcheckwp[@marines='yes'] | ancestor-or-self::tsintrowp[@marines='yes'] | ancestor-or-self::techdescwp[@marines='yes'] | ancestor-or-self::surwp[@marines='yes'] | ancestor-or-self::perseqpwp[@marines='yes'] | ancestor-or-self::pmcsintrowp[@marines='yes'] | ancestor-or-self::pmcswp[@marines='yes'] | ancestor-or-self::gen.maintwp[@marines='yes'] | ancestor-or-self::maintwp[@marines='yes'] | ancestor-or-self::pmiwp[@marines='yes'] | ancestor-or-self::lubewp[@marines='yes'] | ancestor-or-self::facilwp[@marines='yes'] | ancestor-or-self::oipwp[@marines='yes'] | ancestor-or-self::mobilwp[@marines='yes'] | ancestor-or-self::qawp[@marines='yes'] | ancestor-or-self::manuwp[@marines='yes'] | ancestor-or-self::torquewp[@marines='yes'] | ancestor-or-self::inventorywp[@marines='yes'] | ancestor-or-self::storagewp[@marines='yes'] | ancestor-or-self::wtloadwp[@marines='yes'] | ancestor-or-self::wiringwp[@marines='yes'] | ancestor-or-self::ammowp[@marines='yes'] | ancestor-or-self::ammo.markingwp[@marines='yes'] | ancestor-or-self::natowp[@marines='yes'] | ancestor-or-self::auxeqpwp[@marines='yes'] | ancestor-or-self::wiringwp[@marines='yes'] | ancestor-or-self::pms-inspecwp[@marines='yes'] | ancestor-or-self::pmi-cklistwp[@marines='yes'] | ancestor-or-self::refwp[@marines='yes'] | ancestor-or-self::macintrowp[@marines='yes'] | ancestor-or-self::macwp[@marines='yes'] | ancestor-or-self::rpstlwp[@marines='yes'] | ancestor-or-self::coeibiiwp[@marines='yes'] | ancestor-or-self::plwp[@marines='yes'] | ancestor-or-self::aalwp[@marines='yes'] | ancestor-or-self::explistwp[@marines='yes'] | ancestor-or-self::toolidwp[@marines='yes'] | ancestor-or-self::mrplwp[@marines='yes'] | ancestor-or-self::csi.fscap.wp[@marines='yes'] | ancestor-or-self::surwp[@marines='yes'] | ancestor-or-self::supitemwp[@marines='yes'] | ancestor-or-self::genwp[@marines='yes'] | ancestor-or-self::introwp[@marines='yes'] | ancestor-or-self::destruct-materialwp[@marines='yes'] | ancestor-or-self::bdar-geninfowp[@marines='yes'] | ancestor-or-self::damage-assesswp[@marines='yes'] | ancestor-or-self::genrepairwp[@marines='yes'] | ancestor-or-self::bdartoolswp[@marines='yes'] | ancestor-or-self::substitute-matwp[@marines='yes']">
										<xsl:text>&#x2003;</xsl:text>
										<xsl:text>USMC</xsl:text>
										</xsl:if>
	<xsl:if test="ancestor-or-self::ginfowp[@airforce='yes'] | ancestor-or-self::descwp[@airforce='yes'] | ancestor-or-self::thrywp[@airforce='yes'] | ancestor-or-self::abbrevwp[@airforce='yes'] | ancestor-or-self::symbolwp[@airforce='yes'] | ancestor-or-self::opusualwp[@airforce='yes'] | ancestor-or-self::ctrlindwp[@airforce='yes'] | ancestor-or-self::opunuwp[@airforce='yes'] | ancestor-or-self::stowagewp[@airforce='yes'] | ancestor-or-self::eqploadwp[@airforce='yes'] | ancestor-or-self::tsindxwp[@airforce='yes'] | ancestor-or-self::pshopanalwp[@airforce='yes'] | ancestor-or-self::compchklistwp[@airforce='yes'] | ancestor-or-self::opcheck-tswp[@airforce='yes'] | ancestor-or-self::tswp[@airforce='yes'] | ancestor-or-self::opcheckwp[@airforce='yes'] | ancestor-or-self::tsintrowp[@airforce='yes'] | ancestor-or-self::techdescwp[@airforce='yes'] | ancestor-or-self::surwp[@airforce='yes'] | ancestor-or-self::perseqpwp[@airforce='yes'] | ancestor-or-self::pmcsintrowp[@airforce='yes'] | ancestor-or-self::pmcswp[@airforce='yes'] | ancestor-or-self::gen.maintwp[@airforce='yes'] | ancestor-or-self::maintwp[@airforce='yes'] | ancestor-or-self::pmiwp[@airforce='yes'] | ancestor-or-self::lubewp[@airforce='yes'] | ancestor-or-self::facilwp[@airforce='yes'] | ancestor-or-self::oipwp[@airforce='yes'] | ancestor-or-self::mobilwp[@airforce='yes'] | ancestor-or-self::qawp[@airforce='yes'] | ancestor-or-self::manuwp[@airforce='yes'] | ancestor-or-self::torquewp[@airforce='yes'] | ancestor-or-self::inventorywp[@airforce='yes'] | ancestor-or-self::storagewp[@airforce='yes'] | ancestor-or-self::wtloadwp[@airforce='yes'] | ancestor-or-self::wiringwp[@airforce='yes'] | ancestor-or-self::ammowp[@airforce='yes'] | ancestor-or-self::ammo.markingwp[@airforce='yes'] | ancestor-or-self::natowp[@airforce='yes'] | ancestor-or-self::auxeqpwp[@airforce='yes'] | ancestor-or-self::wiringwp[@airforce='yes'] | ancestor-or-self::pms-inspecwp[@airforce='yes'] | ancestor-or-self::pmi-cklistwp[@airforce='yes'] | ancestor-or-self::refwp[@airforce='yes'] | ancestor-or-self::macintrowp[@airforce='yes'] | ancestor-or-self::macwp[@airforce='yes'] | ancestor-or-self::rpstlwp[@airforce='yes'] | ancestor-or-self::coeibiiwp[@airforce='yes'] | ancestor-or-self::plwp[@airforce='yes'] | ancestor-or-self::aalwp[@airforce='yes'] | ancestor-or-self::explistwp[@airforce='yes'] | ancestor-or-self::toolidwp[@airforce='yes'] | ancestor-or-self::mrplwp[@airforce='yes'] | ancestor-or-self::csi.fscap.wp[@airforce='yes'] | ancestor-or-self::surwp[@airforce='yes'] | ancestor-or-self::supitemwp[@airforce='yes'] | ancestor-or-self::genwp[@airforce='yes'] | ancestor-or-self::introwp[@airforce='yes'] | ancestor-or-self::destruct-materialwp[@airforce='yes'] | ancestor-or-self::bdar-geninfowp[@airforce='yes'] | ancestor-or-self::damage-assesswp[@airforce='yes'] | ancestor-or-self::genrepairwp[@airforce='yes'] | ancestor-or-self::bdartoolswp[@airforce='yes'] | ancestor-or-self::substitute-matwp[@airforce='yes']">	
	<xsl:text>&#x2003;</xsl:text>								
<xsl:text>USAF</xsl:text>
										</xsl:if>
	<xsl:if test="ancestor-or-self::ginfowp[@navy='yes'] | ancestor-or-self::descwp[@navy='yes'] | ancestor-or-self::thrywp[@navy='yes'] | ancestor-or-self::abbrevwp[@navy='yes'] | ancestor-or-self::symbolwp[@navy='yes'] | ancestor-or-self::opusualwp[@navy='yes'] | ancestor-or-self::ctrlindwp[@navy='yes'] | ancestor-or-self::opunuwp[@navy='yes'] | ancestor-or-self::stowagewp[@navy='yes'] | ancestor-or-self::eqploadwp[@navy='yes'] | ancestor-or-self::tsindxwp[@navy='yes'] | ancestor-or-self::pshopanalwp[@navy='yes'] | ancestor-or-self::compchklistwp[@navy='yes'] | ancestor-or-self::opcheck-tswp[@navy='yes'] | ancestor-or-self::tswp[@navy='yes'] | ancestor-or-self::opcheckwp[@navy='yes'] | ancestor-or-self::tsintrowp[@navy='yes'] | ancestor-or-self::techdescwp[@navy='yes'] | ancestor-or-self::surwp[@navy='yes'] | ancestor-or-self::perseqpwp[@navy='yes'] | ancestor-or-self::pmcsintrowp[@navy='yes'] | ancestor-or-self::pmcswp[@navy='yes'] | ancestor-or-self::gen.maintwp[@navy='yes'] | ancestor-or-self::maintwp[@navy='yes'] | ancestor-or-self::pmiwp[@navy='yes'] | ancestor-or-self::lubewp[@navy='yes'] | ancestor-or-self::facilwp[@navy='yes'] | ancestor-or-self::oipwp[@navy='yes'] | ancestor-or-self::mobilwp[@navy='yes'] | ancestor-or-self::qawp[@navy='yes'] | ancestor-or-self::manuwp[@navy='yes'] | ancestor-or-self::torquewp[@navy='yes'] | ancestor-or-self::inventorywp[@navy='yes'] | ancestor-or-self::storagewp[@navy='yes'] | ancestor-or-self::wtloadwp[@navy='yes'] | ancestor-or-self::wiringwp[@navy='yes'] | ancestor-or-self::ammowp[@navy='yes'] | ancestor-or-self::ammo.markingwp[@navy='yes'] | ancestor-or-self::natowp[@navy='yes'] | ancestor-or-self::auxeqpwp[@navy='yes'] | ancestor-or-self::wiringwp[@navy='yes'] | ancestor-or-self::pms-inspecwp[@navy='yes'] | ancestor-or-self::pmi-cklistwp[@navy='yes'] | ancestor-or-self::refwp[@navy='yes'] | ancestor-or-self::macintrowp[@navy='yes'] | ancestor-or-self::macwp[@navy='yes'] | ancestor-or-self::rpstlwp[@navy='yes'] | ancestor-or-self::coeibiiwp[@navy='yes'] | ancestor-or-self::plwp[@navy='yes'] | ancestor-or-self::aalwp[@navy='yes'] | ancestor-or-self::explistwp[@navy='yes'] | ancestor-or-self::toolidwp[@navy='yes'] | ancestor-or-self::mrplwp[@navy='yes'] | ancestor-or-self::csi.fscap.wp[@navy='yes'] | ancestor-or-self::surwp[@navy='yes'] | ancestor-or-self::supitemwp[@navy='yes'] | ancestor-or-self::genwp[@navy='yes'] | ancestor-or-self::introwp[@navy='yes'] | ancestor-or-self::destruct-materialwp[@navy='yes'] | ancestor-or-self::bdar-geninfowp[@navy='yes'] | ancestor-or-self::damage-assesswp[@navy='yes'] | ancestor-or-self::genrepairwp[@navy='yes'] | ancestor-or-self::bdartoolswp[@navy='yes'] | ancestor-or-self::substitute-matwp[@navy='yes']">	
	<xsl:text>&#x2003;</xsl:text>
										<xsl:text>USN</xsl:text>
										</xsl:if>
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
<xsl:template name="DELETETHEWP">
</xsl:template>
<xsl:template name="frntrear-rl">
	<xsl:param name="Odd-First"/>
	<xsl:param name="Odd-Or-First"/>
	<xsl:param name="Odd-Or-Even"/>
		<xsl:variable name="title">
			<xsl:choose>
				<xsl:when test="local-name(.)='glossary'">GLOSSARY</xsl:when>
				<xsl:when test="local-name(.)='howtouse'">HOW TO USE THIS MANUAL</xsl:when>
				<xsl:when test="local-name(.)='warnsum'">WARNING SUMMARY</xsl:when>
				<xsl:when test="local-name(.)='aindx'">INDEX</xsl:when>
				<xsl:when test="local-name(.)='contents'">TABLE OF CONTENTS</xsl:when>
				<xsl:when test="local-name(.)='safety'">EXPLANATION OF SAFETY WARNING ICONS</xsl:when>
				<xsl:when test="local-name(.)='warninfo'">General Warning Information</xsl:when>
				<xsl:when test="local-name(.)='hazmat'">HAZARDOUS MATERIALS DESCRIPTION</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<fo:page-sequence color="#000000" font-family="sans-serif" font-size="10pt" force-page-count="end-on-even" hyphenate="true" initial-page-number="1" language="en" line-height="1.15em" master-reference="frntrear-rl" text-align="left">
			<xsl:attribute name="format">
			<xsl:choose>
			<xsl:when test="contains('glossary|aindx',local-name(.))">1</xsl:when>
			<xsl:when test="local-name(.)='warnsum'">a</xsl:when>
			<xsl:when test="contains('contents|titleblk|howtouse',local-name(.))">i</xsl:when>
			</xsl:choose>
			</xsl:attribute>
			<xsl:if test="contains('contents|titleblk|howtouse',local-name(.))">
					<xsl:attribute name="initial-page-number">auto</xsl:attribute>
			</xsl:if>
			<fo:static-content flow-name="frntrear-rl-first-before">
					<fo:block xsl:use-attribute-sets="secur-header-attrs">
					<xsl:value-of select="$docsecr"/>
				</fo:block>
				<fo:block xsl:use-attribute-sets="tmno-header-attrs">
				
				<xsl:value-of select="(preceding::tmno)[1]"/>
				<xsl:choose>
				<xsl:when test="//sum">
						<xsl:text>&#x02010;SUM</xsl:text><!-- changed from En dash(&#x02013;) to hyphen -->
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
	  			
		<fo:block font-family="sans-serif" font-size="14pt" font-weight="bold" space-after.maximum="24pt" space-after.minimum="16pt" space-after.optimum="18pt" space-before="12pt" span="all" text-align="center" text-transform="uppercase"  id="{generate-id(.)}">
					<xsl:value-of select="$title"/>
				</fo:block>
			</fo:static-content>
			
			<fo:static-content  flow-name="xsl-region-before">
							<fo:block xsl:use-attribute-sets="secur-header-attrs">
					<xsl:value-of select="$docsecr"/>
				</fo:block>
				<fo:block xsl:use-attribute-sets="tmno-header-attrs">
				<xsl:value-of select="(preceding::tmno)[1]"/>
				<xsl:choose>
				<xsl:when test="//sum">
						<xsl:text>&#x2013;SUM</xsl:text>
					</xsl:when>
					<xsl:when test="//sam">
						<xsl:text>&#x2013;SAM</xsl:text>
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
	  			
				<fo:block font-family="sans-serif" font-size="12pt" font-weight="bold" space-after.maximum="24pt" space-after.minimum="24pt" space-after.optimum="24pt" space-before="12pt" span="all" text-align="center">
				<xsl:for-each select="$title">
					<xsl:value-of select="$title"/>
					<xsl:text> &#x2013; (Continued)</xsl:text></xsl:for-each>
				</fo:block>

			</fo:static-content>

			<fo:static-content flow-name="frntrear-rl-first-after">
			<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" space-before.maximum="16pt" space-before.minimum="14pt" space-before.optimum="14pt" span="all" text-align="center">
					<xsl:call-template name="FRNTREAR-FOOTER">
					<xsl:with-param name="Odd-First">First</xsl:with-param>
					<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
				</xsl:call-template>
				</fo:block>
			</fo:static-content>

			<fo:static-content flow-name="xsl-region-after">
		<fo:block font-family="sans-serif" font-size="10pt" space-before.maximum="16pt" space-before.minimum="14pt" space-before.optimum="14pt" span="all" text-align="center">
					<xsl:call-template name="FRNTREAR-FOOTER">
					<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
				</xsl:call-template>
	</fo:block>
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-after-even">
		<fo:block font-family="sans-serif" font-size="10pt" space-before.maximum="16pt" space-before.minimum="14pt" space-before.optimum="14pt" span="all" text-align="center">
					<xsl:call-template name="FRNTREAR-FOOTER">
					<xsl:with-param name="Odd-Or-Even">Even</xsl:with-param>
				</xsl:call-template>
	</fo:block>
			</fo:static-content>

			<fo:flow flow-name="xsl-region-body">
			<fo:marker marker-class-name="blank-page"/>
			<fo:wrapper>
			<xsl:choose>
					<xsl:when test="local-name(.)='contents'">
						<xsl:call-template name="autogen-contents"></xsl:call-template>
					</xsl:when>
				<xsl:when test="local-name(.)='aindx'">
						<xsl:call-template name="autogen-aindx"></xsl:call-template> 
					</xsl:when> 
					<xsl:otherwise>
						<fo:block font-family="sans-serif" font-size="10pt" space-before="12pt" span="all" text-align="left" text-align-last="left" >
							<xsl:apply-templates select="node()"/>
						</fo:block>
					</xsl:otherwise>
				</xsl:choose>
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

<xsl:template name="FRNTREAR-FOOTER">
	<xsl:param name="Odd-First"/>
		<xsl:param name="Odd-Or-Even"/>
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
					<fo:table-column column-width="31%"/>
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
								<fo:table-cell text-align="left">
								<fo:block font-size="8pt">
						<xsl:if test="$Odd-Or-Even='Even'">

								<xsl:if test="contains('warnsum|contents|titleblk|howtouse',local-name(.))">
										<xsl:if test="./@chngno>'0'">
												<xsl:text>CHANGE </xsl:text>
												<xsl:value-of select="./@chngno"/>
										</xsl:if>
								</xsl:if>

										</xsl:if>
							</fo:block>
							
								</fo:table-cell>
							<fo:table-cell column-number="2" text-align="center">
							<fo:block>
							<xsl:choose>
						<xsl:when test="local-name(.)='aindx'">Index&#x2013;</xsl:when>
						<xsl:when test="local-name(.)='glossary'">Glossary&#x2013;</xsl:when>
					</xsl:choose>
								<fo:page-number/>
								<xsl:if test="$Odd-Or-Even='Odd'">
								<fo:retrieve-marker retrieve-boundary="page-sequence" retrieve-class-name="blank-page" retrieve-position="last-starting-within-page"/><!--last-ending-within-page" /-->
   	</xsl:if>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell text-align="right">
								<fo:block font-size="8pt">
							<xsl:if test="$Odd-Or-Even='Odd'">
								<xsl:if test="contains('warnsum|contents|titleblk|howtouse',local-name(.))">
										<xsl:if test="./@chngno>'0'">
												<xsl:text>CHANGE </xsl:text>
												<xsl:value-of select="./@chngno"/>
										</xsl:if>
								</xsl:if>
								</xsl:if>
									</fo:block>
								</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
		</fo:block>
		<fo:block xsl:use-attribute-sets="secur-footer-attrs">
			<xsl:value-of select="$docsecr"/>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>


