<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!--FIGURE, TITLE, GRAPHIC, FOLDSECT ELEMENTS-->
	<xsl:template match="br">
		<fo:block>
			<xsl:text>&#x2003;</xsl:text>
		</fo:block>
	</xsl:template>
	<xsl:template match="/figure-alt">
		<xsl:apply-templates select="figure"/>
	</xsl:template>
	<!--Figure Element -->	
	<xsl:template match="figure">
	
		<xsl:if test="contains(child::processing-instruction()[1],'_newpage')">
			<fo:block/>
		</xsl:if>
	<xsl:choose>
		<xsl:when test="@figtype = 'fo-rear'">
<xsl:if test="following-sibling::subfig">
<fo:block-container font-size="10pt" margin-top="12pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.minimum="9pt" text-align="right" page-break-after="always" break-before="odd-page">
				<xsl:if test="descendant::graphic">
					<xsl:attribute name="text-align">
					<xsl:choose>
					<xsl:when test="descendant::graphic/@hplace='right'">right</xsl:when>
					<xsl:when test="descendant::graphic/@hplace='left'">left</xsl:when>
					<xsl:when test="descendant::graphic/@hplace='center'">center</xsl:when>
					<xsl:otherwise>right</xsl:otherwise></xsl:choose>
					</xsl:attribute>
					<xsl:attribute name="margin-top">12pc</xsl:attribute>
					<xsl:attribute name="space-before.optimum">6pc</xsl:attribute>
					<xsl:attribute name="space-before.precedence">10</xsl:attribute>
				</xsl:if>
				<xsl:if test="(@orient = 'land') or (descendant::graphic/@rotation)">
					<xsl:attribute name="reference-orientation">90</xsl:attribute>
					<xsl:attribute name="writing-mode">rl-tb</xsl:attribute>
					<xsl:attribute name="margin-top">12pc</xsl:attribute>
					<xsl:attribute name="space-before.optimum">6pc</xsl:attribute>
					<xsl:attribute name="space-before.precedence">10</xsl:attribute>
				</xsl:if>
				<xsl:call-template name="CHANGEBAR"/>
				<fo:block font-family="sans-serif" font-weight="bold" space-before.conditionality="discard" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="right" display-align="center"  id="{generate-id(.)}">
					<xsl:text>FO&#x2013;</xsl:text>
					<xsl:number count="figure[@figtype='fo-rear']" format="1." from="paper.manual " level="any"/>
					<xsl:text>&#x2002;&#x2002;</xsl:text>
					<xsl:apply-templates select="preceding-sibling::title"/>
				<xsl:text>&#x2002;&#x2013;&#x2002;</xsl:text>
					<xsl:apply-templates select="subtitle"/>
					<xsl:text> (Sheet </xsl:text>
					<xsl:value-of select="@sheet"/>
					<xsl:text> of </xsl:text>
					<xsl:value-of select="@totalsheets"/>
					<xsl:text>).</xsl:text>
				</fo:block>
			</fo:block-container>
			</xsl:if>
		</xsl:when>
		<xsl:when test="not(../@figtype='fo-rear')">
			<fo:block-container font-family="sans-serif" font-size="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.minimum="9pt" space-before.optimum="10pt" text-align="center" display-align="center"  id="{generate-id(.)}">
				<xsl:if test="descendant::graphic">
					<xsl:attribute name="text-align">
					<xsl:choose>
					<xsl:when test="descendant::graphic/@hplace='right'">right</xsl:when>
					<xsl:when test="descendant::graphic/@hplace='left'">left</xsl:when>
					<xsl:when test="descendant::graphic/@hplace='center'">center</xsl:when>
					<xsl:otherwise>center</xsl:otherwise>
					</xsl:choose>
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="(@orient = 'land') or (descendant::graphic/@rotation)">
					<xsl:attribute name="reference-orientation">90</xsl:attribute>
					<xsl:attribute name="writing-mode">rl-tb</xsl:attribute>
					<xsl:attribute name="margin-top">6pc</xsl:attribute>
					<xsl:attribute name="space-before.optimum">3pc</xsl:attribute>
					<xsl:attribute name="space-before.precedence">10</xsl:attribute>
				</xsl:if>
					<!-- Changed to add the change attributes directly in the figure template. This allows for the changebar to display properly along the whole figure.  Graphic element will not display the change bar as it is a sub element of Figure.-->
				<xsl:choose>
					<xsl:when test="self::*/@inschlvl != '0'">

		<fo:change-bar-begin change-bar-class="{generate-id(.)}" change-bar-placement="end" change-bar-width="2pt" change-bar-style="solid" change-bar-color="black"  />
				<xsl:apply-templates select="subfig | graphic | table | legend | verbatim"/>
				<xsl:if test="graphic | verbatim">
					<fo:block display-align="center" font-family="sans-serif" font-size="10pt" font-weight="bold" keep-with-previous.within-page="always" space-before.conditionality="discard" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center" white-space="normal" space-after="10pt">
						<xsl:text>Figure&#x2002;</xsl:text>
	<xsl:number count="figure[@figtype='normal-page'] [not(parent::figure-alt)]|figure-alt" format="1." from="aalwp | ammowp | auxeqpwp | ammo.markingwp | bdar-geninfowp | bdartoolswp | bulk_itemswp | coeibiiwp | compchklistwp | csi.wp | ctrlindwp | damage-assesswp | descwp |  destruct-introwp | destruct-materialwp | diagnosticwp | dmwr_introwp | dmwr_operationalreqwp | dmwr_qarwp | emergencywp | eqploadwp | explistwp | facilwp | gen.maintwp | genrepairwp | genwp | ginfowp | introwp | inventorywp | loepwp | lubewp | macintrowp | macwp | maintwp | manu_items_introwp | manuwp | mobilwp | mrplwp | natowp | nsnindxwp | oipwp | opcheck-tswp | opcheckwp | opunuwp | opusualwp | orschwp | perseqpwp | //pim | pm-ginfowp | pmcsintrowp | pmcswp | pmi-cklistwp | pmiwp | pms-ginfowp | pms-inspecwp | pnindxwp | ppmgeninfowp | pshopanalwp | qawp | refdesindxwp | refwp | storagewp | stowagewp | substitute-matwp | supitemwp | surwp | techdescwp | thrywp | toolidwp | torquewp | totnum.wps | tsindxwp | tsintrowp | tswp | wiringwp | wtloadwp | softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp | //howtouse" level="any"/>
							<xsl:text>&#x2002; </xsl:text>
<!-- BOLEN need applicable on figure title when parent ctrlindtable or comp-item -->
<!-- otherwise on figure when applicable attribute on figure element | stl_partswp | stlwp | plwp | kitswp-->
			<xsl:choose>
			<xsl:when test="parent::ctrlindtab|parent::comp-item">
				<xsl:call-template name="APPLICABLE"/>
			</xsl:when>			
			<xsl:when test="@applicable">
				<xsl:variable name="applicvalue">
					<xsl:value-of select="@applicable"/>
				</xsl:variable>
				<fo:inline font-weight="bold">
					<xsl:text> (</xsl:text>
					<xsl:value-of select="//*/applic[@id=$applicvalue]/@abbrevcode"/>
					<xsl:text>) </xsl:text>
				</fo:inline>
				<xsl:text>&#x2002;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="title"/>
						<xsl:text>.&#x2002; </xsl:text>
					</fo:block>
				</xsl:if>
				<fo:change-bar-end change-bar-class="{generate-id(.)}"/>
				</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="subfig | graphic |  table | legend | verbatim"/>
				<xsl:if test="graphic | verbatim">
					<fo:block display-align="center" font-family="sans-serif" font-size="10pt" font-weight="bold" keep-with-previous.within-page="always" space-before.conditionality="discard" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center" white-space="normal" space-after="10pt">
						<xsl:text>Figure&#x2002;</xsl:text>
	<xsl:number count="figure[@figtype='normal-page'] [not(parent::figure-alt)]|figure-alt" format="1." from="aalwp | ammowp | auxeqpwp | ammo.markingwp | bdar-geninfowp | bdartoolswp | bulk_itemswp | coeibiiwp | compchklistwp | csi.wp | ctrlindwp | damage-assesswp | descwp |  destruct-introwp | destruct-materialwp | diagnosticwp | dmwr_introwp | dmwr_operationalreqwp | dmwr_qarwp | emergencywp | eqploadwp | explistwp | facilwp | gen.maintwp | genrepairwp | genwp | ginfowp | introwp | inventorywp | loepwp | lubewp | macintrowp | macwp | maintwp | manu_items_introwp | manuwp | mobilwp | mrplwp | natowp | nsnindxwp | oipwp | opcheck-tswp | opcheckwp | opunuwp | opusualwp | orschwp | perseqpwp | //pim | pm-ginfowp | pmcsintrowp | pmcswp | pmi-cklistwp | pmiwp | pms-ginfowp | pms-inspecwp | pnindxwp | ppmgeninfowp | pshopanalwp | qawp | refdesindxwp | refwp | storagewp | stowagewp | substitute-matwp | supitemwp | surwp | techdescwp | thrywp | toolidwp | torquewp | totnum.wps | tsindxwp | tsintrowp | tswp | wiringwp | wtloadwp | softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp | //howtouse" level="any"/>
							<xsl:text>&#x2002; </xsl:text>
<!-- BOLEN need applicable on figure title when parent ctrlindtable or comp-item -->
<!-- otherwise on figure when applicable attribute on figure element | stl_partswp | stlwp | plwp | kitswp-->
			<xsl:choose>
			<xsl:when test="parent::ctrlindtab|parent::comp-item">
				<xsl:call-template name="APPLICABLE"/>
			</xsl:when>			
			<xsl:when test="@applicable">
				<xsl:variable name="applicvalue">
					<xsl:value-of select="@applicable"/>
				</xsl:variable>
				<fo:inline font-weight="bold">
					<xsl:text> (</xsl:text>
					<xsl:value-of select="//*/applic[@id=$applicvalue]/@abbrevcode"/>
					<xsl:text>) </xsl:text>
				</fo:inline>
				<xsl:text>&#x2002;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="title"/>
						<xsl:text>.&#x2002; </xsl:text>
					</fo:block>
				</xsl:if>
				</xsl:otherwise>
				</xsl:choose>
			</fo:block-container>
		</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!--Figure Title-->
	<xsl:template match="figure/title | subfig/subtitle">
		<xsl:call-template name="CHANGEBAR"/><!-- self when on title -->
		<xsl:apply-templates select="node()"/>
	</xsl:template>

	<xsl:template match="subfig">
	
			<fo:block-container font-family="sans-serif" font-size="10pt" margin-top="12pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.minimum="9pt" space-before.optimum="10pt" text-align="center">
				<xsl:if test="ancestor::faultreports/faultcode">
					<xsl:attribute name="margin-left">0pt</xsl:attribute>
				</xsl:if>
				<xsl:if test="descendant::graphic">
					<xsl:attribute name="text-align">
					<xsl:choose>
					<xsl:when test="descendant::graphic/@hplace='right'">right</xsl:when>
					<xsl:when test="descendant::graphic/@hplace='left'">left</xsl:when>
					<xsl:when test="descendant::graphic/@hplace='center'">center</xsl:when>
					<xsl:otherwise>center</xsl:otherwise></xsl:choose>
					</xsl:attribute>
				</xsl:if>
			<xsl:if test="(@orient = 'land') or (descendant::graphic/@rotation)">
					<xsl:attribute name="margin-top">6pc</xsl:attribute>
					<xsl:attribute name="space-before.optimum">3pc</xsl:attribute>
					<xsl:attribute name="space-before.precedence">10</xsl:attribute>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="self::*/@inschlvl != '0'">
		<fo:change-bar-begin change-bar-class="{generate-id(.)}" change-bar-placement="end" change-bar-width="2pt" change-bar-style="solid" change-bar-color="black"  />
				<xsl:apply-templates select="legend | graphic | table | figure"/>
				<fo:block font-family="sans-serif" font-weight="bold" space-before.conditionality="discard" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center" display-align="center" keep-with-previous.within-page="always">
					<xsl:text>Figure&#x2002;</xsl:text>
					<!--xsl:number count="figure[@figtype='normal-page']" format="1." from="aalwp | ammowp | auxeqpwp | ammo.markingwp | bdar-geninfowp | bdartoolswp | bulk_itemswp | coeibiiwp | compchklistwp | csi.wp | ctrlindwp | damage-assesswp | descwp |  destruct-introwp | destruct-materialwp | diagnosticwp | dmwr_introwp | dmwr_operationalreqwp | dmwr_qarwp | emergencywp | eqploadwp | explistwp | facilwp | gen.maintwp | genrepairwp | genwp | ginfowp | introwp | inventorywp | loepwp | lubewp | macintrowp | macwp | maintwp | manu_items_introwp | manuwp | mobilwp | mrplwp | natowp | nsnindxwp | oipwp | opcheck-tswp | opcheckwp | opunuwp | opusualwp | orschwp | perseqpwp | //pim | pm-ginfowp | pmcsintrowp | pmcswp | pmi-cklistwp | pmiwp | pms-ginfowp | pms-inspecwp | pnindxwp | ppmgeninfowp | pshopanalwp | qawp | refdesindxwp | refwp | storagewp | stowagewp | substitute-matwp | supitemwp | surwp | techdescwp | thrywp | toolidwp | torquewp | totnum.wps | tsindxwp | tsintrowp | tswp | wiringwp | wtloadwp | softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp //howtouse" level="any"/-->
	<xsl:number count="figure[@figtype='normal-page'] [not(parent::figure-alt)]|figure-alt" format="1." from="aalwp | ammowp | auxeqpwp | ammo.markingwp | bdar-geninfowp | bdartoolswp | bulk_itemswp | coeibiiwp | compchklistwp | csi.wp | ctrlindwp | damage-assesswp | descwp |  destruct-introwp | destruct-materialwp | diagnosticwp | dmwr_introwp | dmwr_operationalreqwp | dmwr_qarwp | emergencywp | eqploadwp | explistwp | facilwp | gen.maintwp | genrepairwp | genwp | ginfowp | introwp | inventorywp | loepwp | lubewp | macintrowp | macwp | maintwp | manu_items_introwp | manuwp | mobilwp | mrplwp | natowp | nsnindxwp | oipwp | opcheck-tswp | opcheckwp | opunuwp | opusualwp | orschwp | perseqpwp | //pim | pm-ginfowp | pmcsintrowp | pmcswp | pmi-cklistwp | pmiwp | pms-ginfowp | pms-inspecwp | pnindxwp | ppmgeninfowp | pshopanalwp | qawp | refdesindxwp | refwp | storagewp | stowagewp | substitute-matwp | supitemwp | surwp | techdescwp | thrywp | toolidwp | torquewp | totnum.wps | tsindxwp | tsintrowp | tswp | wiringwp | wtloadwp | softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp | //howtouse" level="any"/>
					
					<xsl:text>&#x2002;&#x2002;</xsl:text>
			<xsl:choose>
			<xsl:when test="parent::*/@applicable">
				<xsl:variable name="applicvalue">
					<xsl:value-of select="parent::*/@applicable"/>
				</xsl:variable>
				<fo:inline font-weight="bold">
					<xsl:text> (</xsl:text>
					<xsl:value-of select="//*/applic[@id=$applicvalue]/@abbrevcode"/>
					<xsl:text>) </xsl:text>
				</fo:inline>
				<xsl:text>&#x2002;</xsl:text>
			</xsl:when>			
			<xsl:when test="@applicable">
				<xsl:variable name="applicvalue">
					<xsl:value-of select="@applicable"/>
				</xsl:variable>
				<fo:inline font-weight="bold">
					<xsl:text> (</xsl:text>
					<xsl:value-of select="//*/applic[@id=$applicvalue]/@abbrevcode"/>
					<xsl:text>) </xsl:text>
				</fo:inline>
				<xsl:text>&#x2002;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
			</xsl:choose>
					<xsl:apply-templates select="preceding-sibling::title"/>
					<xsl:text>&#x2002;&#x2013;&#x2002;</xsl:text>
					<xsl:apply-templates select="subtitle"/>
					<xsl:text> (Sheet </xsl:text>
					<xsl:value-of select="@sheet"/>
					<xsl:text> of </xsl:text>
					<xsl:value-of select="@totalsheets"/>
					<xsl:text>).</xsl:text>
				</fo:block>
				<fo:change-bar-end change-bar-class="{generate-id(.)}"/>
				</xsl:when>
				<xsl:otherwise>
				<xsl:apply-templates select="legend | graphic | table | figure"/>
				<fo:block font-family="sans-serif" font-weight="bold" space-before.conditionality="discard" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center" display-align="center" keep-with-previous.within-page="always">
					<xsl:text>Figure&#x2002;</xsl:text>
					<!--xsl:number count="figure[@figtype='normal-page']" format="1." from="aalwp | ammowp | auxeqpwp | ammo.markingwp | bdar-geninfowp | bdartoolswp | bulk_itemswp | coeibiiwp | compchklistwp | csi.wp | ctrlindwp | damage-assesswp | descwp |  destruct-introwp | destruct-materialwp | diagnosticwp | dmwr_introwp | dmwr_operationalreqwp | dmwr_qarwp | emergencywp | eqploadwp | explistwp | facilwp | gen.maintwp | genrepairwp | genwp | ginfowp | introwp | inventorywp | loepwp | lubewp | macintrowp | macwp | maintwp | manu_items_introwp | manuwp | mobilwp | mrplwp | natowp | nsnindxwp | oipwp | opcheck-tswp | opcheckwp | opunuwp | opusualwp | orschwp | perseqpwp | //pim | pm-ginfowp | pmcsintrowp | pmcswp | pmi-cklistwp | pmiwp | pms-ginfowp | pms-inspecwp | pnindxwp | ppmgeninfowp | pshopanalwp | qawp | refdesindxwp | refwp | storagewp | stowagewp | substitute-matwp | supitemwp | surwp | techdescwp | thrywp | toolidwp | torquewp | totnum.wps | tsindxwp | tsintrowp | tswp | wiringwp | wtloadwp | softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp //howtouse" level="any"/-->
	<xsl:number count="figure[@figtype='normal-page'] [not(parent::figure-alt)]|figure-alt" format="1." from="aalwp | ammowp | auxeqpwp | ammo.markingwp | bdar-geninfowp | bdartoolswp | bulk_itemswp | coeibiiwp | compchklistwp | csi.wp | ctrlindwp | damage-assesswp | descwp |  destruct-introwp | destruct-materialwp | diagnosticwp | dmwr_introwp | dmwr_operationalreqwp | dmwr_qarwp | emergencywp | eqploadwp | explistwp | facilwp | gen.maintwp | genrepairwp | genwp | ginfowp | introwp | inventorywp | loepwp | lubewp | macintrowp | macwp | maintwp | manu_items_introwp | manuwp | mobilwp | mrplwp | natowp | nsnindxwp | oipwp | opcheck-tswp | opcheckwp | opunuwp | opusualwp | orschwp | perseqpwp | //pim | pm-ginfowp | pmcsintrowp | pmcswp | pmi-cklistwp | pmiwp | pms-ginfowp | pms-inspecwp | pnindxwp | ppmgeninfowp | pshopanalwp | qawp | refdesindxwp | refwp | storagewp | stowagewp | substitute-matwp | supitemwp | surwp | techdescwp | thrywp | toolidwp | torquewp | totnum.wps | tsindxwp | tsintrowp | tswp | wiringwp | wtloadwp | softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp | //howtouse" level="any"/>
					
					<xsl:text>&#x2002;&#x2002;</xsl:text>
			<xsl:choose>
			<xsl:when test="parent::*/@applicable">
				<xsl:variable name="applicvalue">
					<xsl:value-of select="parent::*/@applicable"/>
				</xsl:variable>
				<fo:inline font-weight="bold">
					<xsl:text> (</xsl:text>
					<xsl:value-of select="//*/applic[@id=$applicvalue]/@abbrevcode"/>
					<xsl:text>) </xsl:text>
				</fo:inline>
				<xsl:text>&#x2002;</xsl:text>
			</xsl:when>			
			<xsl:when test="@applicable">
				<xsl:variable name="applicvalue">
					<xsl:value-of select="@applicable"/>
				</xsl:variable>
				<fo:inline font-weight="bold">
					<xsl:text> (</xsl:text>
					<xsl:value-of select="//*/applic[@id=$applicvalue]/@abbrevcode"/>
					<xsl:text>) </xsl:text>
				</fo:inline>
				<xsl:text>&#x2002;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
			</xsl:choose>
					<xsl:apply-templates select="preceding-sibling::title"/>
					<xsl:text>&#x2002;&#x2013;&#x2002;</xsl:text>
					<xsl:apply-templates select="subtitle"/>
					<xsl:text> (Sheet </xsl:text>
					<xsl:value-of select="@sheet"/>
					<xsl:text> of </xsl:text>
					<xsl:value-of select="@totalsheets"/>
					<xsl:text>).</xsl:text>
				</fo:block>
				</xsl:otherwise>
				</xsl:choose>
			</fo:block-container>

		</xsl:template>
		
		<!--  SUBFIG -->
   <xsl:template match="subfig" mode="rear">
		</xsl:template>

	<!-- Graphic Element -->
	<xsl:template match="graphic">
	
	<xsl:if test="not(../@figtype='fo-rear')">
	<xsl:choose>
			<xsl:when test="self::*/@inschlvl != '0'">
			<fo:block space-before.maximum="10pt" space-before.minimum="8pt" space-before.optimum="8pt" span="all" display-align="center" id="{generate-id(.)}">

					<fo:change-bar-begin change-bar-class="{generate-id(.)}" change-bar-placement="end" change-bar-width="2pt" change-bar-style="solid" change-bar-color="black"  />
					<fo:external-graphic > <!-- content-height="" content-width="" -->
				<xsl:attribute name="src">
				<xsl:call-template name="substring-after-last">
				<xsl:with-param name="str" select="unparsed-entity-uri(@boardno)"/>
				</xsl:call-template>
				</xsl:attribute>
				<xsl:if test="@reprowid and @reprodep">
					<xsl:attribute name="scaling">non-uniform</xsl:attribute>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="@reprowid">
						<xsl:apply-templates mode="graphic-attribute" select="@reprowid"/>
					</xsl:when>
					<xsl:when test="@reprodep">
						<xsl:apply-templates mode="graphic-attribute" select="@reprodep"/>
					</xsl:when>
					<xsl:when test="@hscale">
						<xsl:apply-templates mode="graphic-attribute" select="@hscale"/>
					</xsl:when>
					<xsl:when test="@vscale">
						<xsl:apply-templates mode="graphic-attribute" select="@vscale"/>
					</xsl:when>
				</xsl:choose>
			</fo:external-graphic>
						<xsl:copy-of select="following-sibling::processing-instruction('Pub')[contains(.,'_graphic_data')]"/>
			<fo:change-bar-end change-bar-class="{generate-id(.)}"/>
			</fo:block>
		</xsl:when>
<xsl:otherwise>	
<fo:block space-before.maximum="10pt" space-before.minimum="8pt" space-before.optimum="8pt" span="all" display-align="center" id="{generate-id(.)}">
					<fo:external-graphic>
				<xsl:attribute name="src">
				<xsl:call-template name="substring-after-last">
				<xsl:with-param name="str" select="unparsed-entity-uri(@boardno)"/>
				</xsl:call-template>
				</xsl:attribute>
				<xsl:if test="@reprowid and @reprodep">
					<xsl:attribute name="scaling">non-uniform</xsl:attribute>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="@reprowid">
						<xsl:apply-templates mode="graphic-attribute" select="@reprowid"/>
					</xsl:when>
					<xsl:when test="@reprodep">
						<xsl:apply-templates mode="graphic-attribute" select="@reprodep"/>
					</xsl:when>
					<xsl:when test="@hscale">
						<xsl:apply-templates mode="graphic-attribute" select="@hscale"/>
					</xsl:when>
					<xsl:when test="@vscale">
						<xsl:apply-templates mode="graphic-attribute" select="@vscale"/>
					</xsl:when>
				</xsl:choose>
				 <xsl:choose>
               <xsl:when test="false()"/>
               <xsl:otherwise>
                  <xsl:choose>
                     <xsl:when test="normalize-space(@scale)!=''">
                        <xsl:attribute name="content-width">
                           <xsl:choose>
                              <xsl:when test="contains(@scale,'%')">
                                 <xsl:value-of select="@scale"/>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:value-of select="concat(@scale,'%')"/>
                              </xsl:otherwise>
                           </xsl:choose>
                        </xsl:attribute>
                     </xsl:when>
                     <xsl:when test="contains(concat('|','1|yes','|'),concat('|',@scalefit,'|')) and not((@scale))">
                        <xsl:attribute name="content-width">
                           <xsl:value-of select="'scale-to-fit'"/>
                        </xsl:attribute>
                     </xsl:when>
                  </xsl:choose>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
               <xsl:when test="false()"/>
               <xsl:otherwise>
                  <xsl:if test="contains(concat('|','1|yes','|'),concat('|',@scalefit,'|'))">
                     <xsl:attribute name="content-height">
                        <xsl:value-of select="'scale-to-fit'"/>
                     </xsl:attribute>
                  </xsl:if>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@width">
               <xsl:attribute name="width">
                  <xsl:value-of select="@width"/>
               </xsl:attribute>
            </xsl:if>
            <xsl:if test="@depth">
               <xsl:attribute name="height">
                  <xsl:value-of select="@depth"/>
               </xsl:attribute>
            </xsl:if>
			</fo:external-graphic>
			
			
						<xsl:copy-of select="following-sibling::processing-instruction('Pub')[contains(.,'_graphic_data')]"/>
						</fo:block>
						</xsl:otherwise>
						</xsl:choose>
		</xsl:if>
	</xsl:template>
	
<!--	<xsl:template match="graphic" priority="0">
      <fo:block role="tag:graphic">
         <xsl:call-template name="disinherit..indents"/>
         <xsl:call-template name="ps-paraspace"/>
         <xsl:call-template name="maybe-set-id"/>
         <xsl:if test="@lang">
            <xsl:attribute name="atixslfoext:xml-lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <fo:external-graphic>
            <xsl:attribute name="src">
               <xsl:choose>
                  <xsl:when test="@fileref">
                     <xsl:value-of select="@fileref"/>
                  </xsl:when>
                  <xsl:when test="@_gte:src!=''">
                     <xsl:value-of select="@_gte:src"/>
                  </xsl:when>
                  <xsl:otherwise>missing-graphic-reference</xsl:otherwise>
               </xsl:choose>
            </xsl:attribute>
            <xsl:choose>
               <xsl:when test="false()"/>
               <xsl:otherwise>
                  <xsl:choose>
                     <xsl:when test="normalize-space(@scale)!=''">
                        <xsl:attribute name="content-width">
                           <xsl:choose>
                              <xsl:when test="contains(@scale,'%')">
                                 <xsl:value-of select="@scale"/>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:value-of select="concat(@scale,'%')"/>
                              </xsl:otherwise>
                           </xsl:choose>
                        </xsl:attribute>
                     </xsl:when>
                     <xsl:when test="contains(concat('|','1|yes','|'),concat('|',@scalefit,'|')) and not((@scale))">
                        <xsl:attribute name="content-width">
                           <xsl:value-of select="'scale-to-fit'"/>
                        </xsl:attribute>
                     </xsl:when>
                  </xsl:choose>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
               <xsl:when test="false()"/>
               <xsl:otherwise>
                  <xsl:if test="contains(concat('|','1|yes','|'),concat('|',@scalefit,'|'))">
                     <xsl:attribute name="content-height">
                        <xsl:value-of select="'scale-to-fit'"/>
                     </xsl:attribute>
                  </xsl:if>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@width">
               <xsl:attribute name="width">
                  <xsl:value-of select="@width"/>
               </xsl:attribute>
            </xsl:if>
            <xsl:if test="@depth">
               <xsl:attribute name="height">
                  <xsl:value-of select="@depth"/>
               </xsl:attribute>
            </xsl:if>
         </fo:external-graphic>
         --><!--Process this element's content--><!--<xsl:apply-templates/>
      </fo:block>
   </xsl:template>-->

<!-- needed for foldouts -->
	<xsl:template match="graphic[@boardno]" name="graphic">
		<fo:block space-before.maximum="10pt" space-before.minimum="8pt" space-before.optimum="8pt" span="all">
			<xsl:if test="../@figtype='fo-rear'">
				<xsl:attribute name="margin-top">12pt</xsl:attribute>
			</xsl:if>
			<fo:external-graphic content-height="" content-width="">
				<xsl:attribute name="src"><xsl:call-template name="substring-after-last"><xsl:with-param name="str" select="unparsed-entity-uri(@boardno)"/></xsl:call-template></xsl:attribute>
				<xsl:if test="@reprowid and @reprodep">
					<xsl:attribute name="scaling">non-uniform</xsl:attribute>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="@reprowid">
						<xsl:apply-templates mode="graphic-attribute" select="@reprowid"/>
					</xsl:when>
					<xsl:when test="@reprodep">
						<xsl:apply-templates mode="graphic-attribute" select="@reprodep"/>
					</xsl:when>
					<xsl:when test="@hscale">
						<xsl:apply-templates mode="graphic-attribute" select="@hscale"/>
					</xsl:when>
					<xsl:when test="@vscale">
						<xsl:apply-templates mode="graphic-attribute" select="@vscale"/>
					</xsl:when>
				</xsl:choose>
			</fo:external-graphic>
	<!--<xsl:copy-of select="following-sibling::processing-instruction('Pub')[contains(.,'_graphic_data')]"/>-->
		<!-- PTC Suggestion for CGM graphics -->
		</fo:block>
	</xsl:template>
	
	<xsl:template match="inlinegraphic">
		<fo:external-graphic>
			<!--<fo:external-graphic src="{unparsed-entity-uri(@boardno)}">   -->
			<xsl:attribute name="src"><xsl:call-template name="substring-after-last"><xsl:with-param name="str" select="unparsed-entity-uri(@boardno)"/></xsl:call-template></xsl:attribute>
			<xsl:if test="@reprowid and @reprodep">
				<xsl:attribute name="scaling">non-uniform</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="@reprowid">
					<xsl:apply-templates mode="graphic-attribute" select="@reprowid"/>
				</xsl:when>
				<xsl:when test="@reprodep">
					<xsl:apply-templates mode="graphic-attribute" select="@reprodep"/>
				</xsl:when>
				<xsl:when test="@hscale">
					<xsl:apply-templates mode="graphic-attribute" select="@hscale"/>
				</xsl:when>
				<xsl:when test="@vscale">
					<xsl:apply-templates mode="graphic-attribute" select="@vscale"/>
				</xsl:when>
			</xsl:choose>
		</fo:external-graphic>
	</xsl:template>
	

   <!--Gentext template for Context: inlinegraphic-->
<!--<xsl:template match="inlinegraphic" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>-->

   <!--Initial pass template for Context: inlinegraphic-->
<!--<xsl:template match="inlinegraphic" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:call-template name="maybe-set-gte-src">
            <xsl:with-param name="unparsed-entity-ref-attr" select="'entityref'"/>
         </xsl:call-template>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>-->

   <!--Set count-as pass template for Context: inlinegraphic-->
<!--<xsl:template match="inlinegraphic" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>	-->
	
	<xsl:template match="@rotation" mode="graphic-attribute">
		<xsl:attribute name="reference-orientation"><xsl:value-of select="."/></xsl:attribute>
	</xsl:template>
	<xsl:template match="@reprowid" mode="graphic-attribute">
		<xsl:attribute name="content-width"><xsl:value-of select="."/></xsl:attribute>
	</xsl:template>
	<xsl:template match="@reprodep" mode="graphic-attribute">
		<xsl:attribute name="content-height"><xsl:value-of select="."/></xsl:attribute>
	</xsl:template>
	<xsl:template match="@hscale" mode="graphic-attribute">
		<xsl:attribute name="content-width"><xsl:value-of select="."/>%</xsl:attribute>
	</xsl:template>
	<xsl:template match="@vscale" mode="graphic-attribute">
		<xsl:attribute name="content-height"><xsl:value-of select="."/>%</xsl:attribute>
	</xsl:template>
	<xsl:template match="symbol">
		<fo:external-graphic>
			<xsl:attribute name="src"><xsl:call-template name="substring-after-last"><xsl:with-param name="str" select="unparsed-entity-uri(@boardno)"/></xsl:call-template></xsl:attribute>
			<xsl:if test="@reprowid and @reprodep">
				<xsl:attribute name="scaling">non-uniform</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="@reprowid">
					<xsl:apply-templates mode="graphic-attribute" select="@reprowid">
</xsl:apply-templates>
				</xsl:when>
				<xsl:when test="@reprodep">
					<xsl:apply-templates mode="graphic-attribute" select="@reprodep">
</xsl:apply-templates>
				</xsl:when>
				<xsl:when test="@hscale">
					<xsl:apply-templates mode="graphic-attribute" select="@hscale">
</xsl:apply-templates>
				</xsl:when>
				<xsl:when test="@vscale">
					<xsl:apply-templates mode="graphic-attribute" select="@vscale">
</xsl:apply-templates>
				</xsl:when>
			</xsl:choose>
		</fo:external-graphic>
	</xsl:template>

<!-- LEGEND -->
<xsl:template match="legend">
<xsl:call-template name="CHANGEBAR"/>
   <xsl:variable name="threshold" select="(count(legend.item) + 1) div 2"/>
   <xsl:variable name="numitem" select="count(legend.item)"/>

		<fo:block-container font-family="sans-serif" font-size="8pt"  space-after.minimum="3pt" space-after.optimum="6pt" space-before.minimum="9pt" space-before.optimum="10pt" text-align="left"> 
		<fo:block span="all">
			<fo:table table-layout="fixed" space-before.optimum="12pt" space-after.optimum="6pt" padding="6pt" font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="4pt" padding-left="4pt" padding-right="4pt" padding-top="4pt" relative-position="static" space-after="12pt" space-before="12pt" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve" >
          <xsl:choose>
          <xsl:when test="$numitem&gt;4">
      			<fo:column column-number="1" column-width="50%" padding-left="2pt"/> <!-- first column -->
				<fo:column column-number="2" column-width="50%" padding-left="2pt"/> <!-- second column -->
 				<fo:table-header>
					<fo:table-row>
						<fo:table-cell text-align="left" padding-right="6pt" padding-top="3pt" padding-bottom="6pt" border-bottom-width=".5pt" border-bottom-style="hidden" border-right-width=".5pt" border-right-style="hidden" padding-left="3pt" >
							<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="8pt" font-weight="bold" font-size="8pt">
								<xsl:choose>
									<xsl:when test="string-length(title[1])=0">
										<fo:inline text-decoration="underline">
											<xsl:text>LEGEND: </xsl:text>
										</fo:inline>
									</xsl:when>
									<xsl:otherwise>
										<fo:inline text-decoration="underline">
											<xsl:value-of select="title[1]"/>
										</fo:inline>
									</xsl:otherwise>
								</xsl:choose>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="left" padding-right="6pt" padding-top="3pt" padding-bottom="6pt" border-bottom-width=".5pt" border-bottom-style="hidden" border-right-width=".5pt" border-right-style="hidden" margin-left="3pt" margin-right="3pt" margin-top="5pt">
						<fo:block/>
						</fo:table-cell>
						
					</fo:table-row>
				</fo:table-header>
     			<fo:table-body>
				<xsl:if test="contains(child::processing-instruction()[1],'_newpage')">
				<fo:table-row break-after="page">
					<fo:table-cell column-number="1">
						<fo:block/>
						</fo:table-cell>
					<fo:table-cell column-number="2">
							<fo:block/>
					</fo:table-cell>
				</fo:table-row>
				</xsl:if>
         		<fo:table-row>
            		<fo:table-cell> <!-- First column -->
               	<fo:list-block provisional-distance-between-starts="0.33cm" provisional-label-separation="0cm" >
                  <xsl:apply-templates select="legend.item[position()&lt;=$threshold]"/>
               	</fo:list-block>
            		</fo:table-cell>
            		<fo:table-cell> <!-- Second column -->
               	<fo:list-block provisional-distance-between-starts="0.33cm" provisional-label-separation="0cm" >
                  <xsl:apply-templates select="legend.item[position()&gt;$threshold]"/>
               	</fo:list-block>
            		</fo:table-cell>
         		</fo:table-row>
      			</fo:table-body>
				</xsl:when>
         
         <xsl:otherwise>
			<fo:table-column column-number="1" column-width="100%" padding-left="2pt"/>
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell text-align="left" padding-right="6pt" padding-top="3pt" padding-bottom="6pt" border-bottom-width=".5pt" border-bottom-style="hidden" border-right-width=".5pt" border-right-style="hidden" padding-left="3pt">
							<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="8pt" font-weight="bold" font-size="8pt">
								<xsl:choose>
									<xsl:when test="string-length(title[1])=0">
										<fo:inline text-decoration="underline">
											<xsl:text>LEGEND: </xsl:text>
										</fo:inline>
									</xsl:when>
									<xsl:otherwise>
										<fo:inline text-decoration="underline">
											<xsl:value-of select="title[1]"/>
										</fo:inline>
									</xsl:otherwise>
								</xsl:choose>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
      		<fo:table-body>
				<xsl:if test="contains(child::processing-instruction()[1],'_newpage')">
					<fo:table-row break-after="page"><fo:table-cell column-number="1"><fo:block/></fo:table-cell></fo:table-row>
  				</xsl:if>
       			<fo:table-row>
            		<fo:table-cell> <!-- First column -->
               		<fo:list-block provisional-distance-between-starts="0.33cm" provisional-label-separation="0cm" >
                  		<xsl:apply-templates select="legend.item"/>
               		</fo:list-block>
            		</fo:table-cell>
         		</fo:table-row>
      		</fo:table-body>
         </xsl:otherwise>
        </xsl:choose>
          
   </fo:table>
</fo:block>
</fo:block-container>
</xsl:template>

<xsl:template match="legend/legend.item">
<xsl:call-template name="CHANGEBAR"/>
   <fo:list-item>
      <fo:list-item-label start-indent="0cm" end-indent="label-end()">
										  <fo:block>
													<xsl:value-of select="callout/@label"/>
												</fo:block>
      </fo:list-item-label>
      <fo:list-item-body start-indent="body-start()">
								<fo:block text-align="start" vertical-align="top" font-size="8pt">
								<fo:block>
								<xsl:value-of select="term"/>
								</fo:block>
								<fo:block space-after="6pt" space-before="16pt" margin="2pt" padding="2pt">
										<xsl:text>&#x2002;</xsl:text>
										<xsl:text>&#x2002;</xsl:text>
										<xsl:text>&#x2002;</xsl:text>
										<xsl:text>&#x2002;</xsl:text>
										<xsl:value-of select="def/para"/>
										<!-- 08262013 BOLEN added processing for xref which was declared in the DTD -->
										<xsl:if test="xref">
										   <xsl:text>&#x2002;</xsl:text>
										   <xsl:apply-templates select="xref"/>											
										</xsl:if>
									</fo:block>
								</fo:block>
      </fo:list-item-body>
   </fo:list-item>
</xsl:template>


<!--FOLDSECT-->
	<xsl:template match="foldsect">
		<!-- page numbearing issue when crossing pagesets, foldouts need to be one size, choose largest size -->
		<xsl:choose>
			<xsl:when test="//figure/@fo-size='45x11'">
				<fo:page-sequence color="#000000" font-family="sans-serif" font-size="10pt" force-page-count="end-on-even" hyphenate="true" initial-page-number="1" language="en" line-height="1.15em" master-reference="fo-45x11-page" text-align="right">
					<fo:static-content flow-name="xsl-region-before-fo">
						<fo:block font-size="14pt" font-weight="bold" space-after.conditionality="discard" space-after.maximum="8pt" space-after.minimum="8pt" space-after.optimum="8pt" space-before.conditionality="discard" space-before.maximum="0pt" space-before.minimum="0pt" space-before.optimum="0pt" span="all" text-align="center">
							<xsl:value-of select="$docsecr"/>
						</fo:block>
						<fo:block xsl:use-attribute-sets="tmno-header-attrs" text-align="right">
						<xsl:value-of select="(preceding::tmno)[1]"/>
					<xsl:choose>
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
					<fo:static-content flow-name="xsl-region-after-fo">
						<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" space-before.maximum="16pt" space-before.minimum="12pt" space-before.optimum="14pt" text-align="right">
							<xsl:text>FP&#x2013;</xsl:text>
							<fo:page-number />		
							<xsl:value-of select="concat('/',$blankcount,'blank')"/>			
						</fo:block>		<!--/xsl:if-->	
						<fo:block font-size="14pt" font-weight="bold" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all" text-align="center">
							<xsl:value-of select="$docsecr"/>
						</fo:block>
					</fo:static-content>
						<fo:flow flow-name="xsl-region-body-fo">
						<xsl:for-each select="//figure[@figtype = 'fo-rear'][not(subfig)] | //figure[@figtype = 'fo-rear']/subfig">
								<xsl:call-template name="foldout-fig"/>
						</xsl:for-each>
					</fo:flow>
				</fo:page-sequence>
			</xsl:when>
			<xsl:when test="//figure/@fo-size='35x11'">
				<fo:page-sequence color="#000000" font-family="sans-serif" font-size="10pt" force-page-count="end-on-even" hyphenate="true" initial-page-number="1" language="en" line-height="1.15em" master-reference="fo-35x11-page" text-align="right">
					<fo:static-content flow-name="xsl-region-before-fo">
						<fo:block font-size="14pt" font-weight="bold" space-after.conditionality="discard" space-after.maximum="8pt" space-after.minimum="8pt" space-after.optimum="8pt" space-before.conditionality="discard" space-before.maximum="0pt" space-before.minimum="0pt" space-before.optimum="0pt" span="all" text-align="center">
							<xsl:value-of select="$docsecr"/>
						</fo:block>
						<fo:block xsl:use-attribute-sets="tmno-header-attrs" text-align="right">
					<xsl:value-of select="(preceding::tmno)[1]"/>
					<xsl:choose>
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
					<fo:static-content flow-name="xsl-region-after-fo">
						<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" space-before.maximum="16pt" space-before.minimum="12pt" space-before.optimum="14pt" text-align="right">
							<xsl:text>FP&#x2013;</xsl:text>
							<fo:page-number />		
							<xsl:value-of select="concat('/',$blankcount,'blank')"/>			
						</fo:block>		<!--/xsl:if-->	
						<fo:block font-size="14pt" font-weight="bold" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all" text-align="center">
							<xsl:value-of select="$docsecr"/>
						</fo:block>
					</fo:static-content>
				<fo:flow flow-name="xsl-region-body-fo">
						<xsl:for-each select="//figure[@figtype = 'fo-rear'][not(subfig)] | //figure[@figtype = 'fo-rear']/subfig">
								<xsl:call-template name="foldout-fig"/>
						</xsl:for-each>
					</fo:flow>
				</fo:page-sequence>
			</xsl:when>
			<xsl:otherwise> <!-- @fo-size='25x11' and default when no size -->
			<fo:page-sequence color="#000000" font-family="sans-serif" font-size="10pt" force-page-count="end-on-even" hyphenate="true" initial-page-number="1" language="en" line-height="1.15em" master-reference="fo-25x11-page" >
						<fo:static-content flow-name="xsl-region-before-fo" >
								<fo:block font-size="14pt" font-weight="bold" space-after.conditionality="discard" space-after.maximum="8pt" space-after.minimum="8pt" space-after.optimum="8pt" space-before.conditionality="discard" space-before.maximum="0pt" space-before.minimum="0pt" space-before.optimum="0pt" span="all" text-align="left" >
								<xsl:value-of select="$docsecr"/>
							</fo:block>
							<fo:block xsl:use-attribute-sets="tmno-header-attrs" text-align="right">
						<xsl:value-of select="(preceding::tmno)[1]"/>
						<xsl:choose>
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
							<fo:block span="all" >
		<fo:leader xsl:use-attribute-sets="header-leader-attrs" />
							</fo:block>
						</fo:static-content>
						<fo:static-content flow-name="xsl-region-after-fo" >
							<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" space-before.maximum="16pt" space-before.minimum="12pt" space-before.optimum="14pt" text-align="right">
								<xsl:text>FP&#x2013;</xsl:text>
								<fo:page-number />		
								<xsl:value-of select="concat('/',$blankcount,'blank')"/>			
							</fo:block>		<!--/xsl:if-->	
							<fo:block font-size="14pt" font-weight="bold" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all" text-align="center">
								<xsl:value-of select="$docsecr"/>
							</fo:block>
						</fo:static-content>
				     <fo:flow flow-name="xsl-region-body-fo" >
							<xsl:for-each select="//figure[@figtype = 'fo-rear'][not(subfig)] | //figure[@figtype = 'fo-rear']/subfig">
									<xsl:call-template name="foldout-fig"/>
							</xsl:for-each>
						</fo:flow>
					</fo:page-sequence>
			</xsl:otherwise>
		</xsl:choose>
</xsl:template>

	<xsl:template name="foldout-fig">
		<xsl:variable name="figctr">
			<xsl:number count="figure[@figtype='fo-rear']" format="1." from="production" level="any"/>
		</xsl:variable>
		<xsl:variable name="figref">
			<xsl:text>FO&#x2013;</xsl:text>
			<xsl:value-of select="$figctr"/>
			<xsl:text>&#x2002;&#x2002;</xsl:text>
		</xsl:variable>
		<xsl:variable name="figtitle">
<!-- BOLEN 08302013 changed like 1_9 -->			
			<xsl:if test="name()='figure'">
				<xsl:value-of select="title"/>
				<xsl:text>.&#x2002; </xsl:text>
			</xsl:if>
			<xsl:if test="name()='subfig'">
				<xsl:value-of select="preceding-sibling::title"/>
				<xsl:text>&#x2002;&#x2013;&#x2002;</xsl:text>
				<xsl:value-of select="subtitle"/>
				<xsl:text> (Sheet </xsl:text>
				<xsl:value-of select="@sheet"/>
				<xsl:text> of </xsl:text>
				<xsl:value-of select="@totalsheets"/>
				<xsl:text>).</xsl:text>
			</xsl:if>
		</xsl:variable>
		<fo:block-container break-before="odd-page" font-family="sans-serif" font-size="10pt" keep-together.within-page="always" space-after.minimum="0pt" space-after.optimum="0pt" space-before.minimum="9pt" space-before.optimum="20pt" text-align="right" >
			<xsl:if test="descendant::graphic">
				<xsl:attribute name="text-align">
				<xsl:choose>
				<xsl:when test="descendant::graphic/@hplace='right'">right</xsl:when>
				<xsl:when test="descendant::graphic/@hplace='left'">left</xsl:when>
				<xsl:when test="descendant::graphic/@hplace='center'">center</xsl:when>
				<xsl:otherwise>right</xsl:otherwise>
				</xsl:choose>
				</xsl:attribute>
			<xsl:apply-templates select="graphic"/>	
			</xsl:if>
			<fo:block font-family="sans-serif" keep-together.within-page="always" space-before.conditionality="discard" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" id="{generate-id(.)}"> 
				<xsl:value-of select="$figref"/>
				<xsl:value-of select="$figtitle"/>
			</fo:block>
		</fo:block-container>
	</xsl:template>
</xsl:stylesheet>
