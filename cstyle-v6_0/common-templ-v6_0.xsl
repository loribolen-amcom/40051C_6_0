<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:fo="http://www.w3.org/1999/XSL/Format" 
xmlns:exsl="http://exslt.org/common"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="http://www.arbortext.com/namespace/doctypes/styler"
xmlns:atidlm="http://www.arbortext.com/namespace/atidlm"
xmlns:ch="http://www.arbortext.com/namespace/chunker"
xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements"
xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements"
xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements"
xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements"
xmlns:saxon="http://saxon.sf.net/"
xmlns:xlink="http://www.w3.org/1999/xlink"
xmlns:_acl="java:com.arbortext.epic.Acl"
xmlns:msxsl="urn:schemas-microsoft-com:xslt"
xmlns:atixslfoext="http://www.arbortext.com/namespace/XslFoExtensions" xmlns:axf="http://www.antennahouse.com/names/XSL/Extensions"
xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript"
xmlns:atidmd="http://www.arbortext.com/namespace/DocumentMetaData"
xmlns:rtf="http://www.cambridgedocs.com/namespace/fo/rtf"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:my="http://whateverelse"
>
 		<xsl:function name="my:titleCase" as="xs:string">
		    <xsl:param name="s" as="xs:string"/>
		    <xsl:choose>
		       <xsl:when test="lower-case($s)=('and', 'or', 'in', 'the', 'of', 'for', 'to', 'a', 'an')">
				      <xsl:value-of select="lower-case($s)"/>
			     </xsl:when>
			     <xsl:when test="$s=upper-case($s)">
				      <xsl:value-of select="$s"/>
					</xsl:when>
				  <xsl:otherwise>
					    <xsl:value-of select="concat(upper-case(substring($s, 1, 1)), lower-case(substring($s, 2)))"/>
					</xsl:otherwise>
				</xsl:choose>
	  </xsl:function>

	<xsl:template match="title">
		<xsl:if test="parent::bdar-repair">
			<fo:block border-after-style="solid" border-after-width="2pt" border-before-style="solid" border-before-width="2pt" border-left-style="solid" border-left-width="2pt" border-right-style="solid" border-right-width="2pt" end-indent="4pc" font-family="sans-serif" font-size="12pt" font-weight="bold" padding-bottom="8pt" padding-left="8pt" padding-right="8pt" padding-top="8pt" space-before="48pt" space-after="28pt" span="all" start-indent="4pc" text-transform="uppercase">
				BDAR FIXES SHALL BE USED ONLY IN COMBAT OR FOR TRAINING AT THE DISCRETION OF THE COMMANDER. (AUTHORIZED TRAINING FIXES ARE LISTED IN THE BDAR TRAINING PROCEDURES WORK PACKAGE.) IN ANY CASE, DAMAGE SHALL BE REPAIRED BY STANDARD MAINTENANCE PROCEDURES AS SOON AS PRACTICABLE.
			</fo:block>
		</xsl:if>

	<xsl:choose>
	<xsl:when test="ancestor::subpara1 | ancestor::subpara2 | ancestor::subpara3 | ancestor::subpara4">
			<fo:block span="all" xsl:use-attribute-sets="titlesub"><!-- text-transform="capitalize"-->
			<xsl:call-template name="CHANGEBAR"/>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:when>
	<xsl:otherwise>
		<fo:block span="all" xsl:use-attribute-sets="titlesub" text-transform="uppercase">
			<xsl:call-template name="CHANGEBAR"/>
			<xsl:apply-templates/>
		</fo:block>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="text()[parent::title[parent::subpara1]] | text()[parent::title[parent::subpara2]] | text()[parent::title[parent::subpara3]] | text()[parent::title[parent::subpara4]]">
	  <!--<xsl:variable name="sentence">
			<xsl:value-of disable-output-escaping="no" select="."/>
		</xsl:variable>
  <xsl:value-of select="mf:titlecase($sentence, ('and', 'or', 'in', 'the', 'of', 'for', 'to', 'a'))"/> -->
		<xsl:variable name="text">
			<xsl:value-of disable-output-escaping="no" select="."/>
		</xsl:variable>
		<xsl:variable name="textoutput">
		<xsl:sequence select="string-join(for $x in tokenize($text,'\s') return my:titleCase($x),' ')"/>
		</xsl:variable>
		<xsl:value-of select="concat(upper-case(substring($textoutput, 1, 1)), substring($textoutput, 2))"/>
</xsl:template>

	<xsl:template match="wp.metadata" xml:space="preserve" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<fo:block visibility="hidden">
			<xsl:value-of select="wp.metadata"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="subtitle">
		<fo:block span="all" xsl:use-attribute-sets="titlesub">
			<xsl:if test="contains('trim.para|trim.specpara|para|specpara|figure|hazmat|warning|caution|note|csi.alert',local-name(preceding-sibling::node()[1])) or local-name(parent::node())='proc'">
				<xsl:attribute name="space-before.minimum">12pt</xsl:attribute>
				<xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
				<xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="brk">
		<fo:block></fo:block>
	</xsl:template>
		<!--**********************************************
Common elements for Formatting SUBSCRPT, SUPSCRPT, and EMPHASIS &ensp;
**********************************************-->
	<xsl:template match="subscrpt">
			<fo:inline baseline-shift="-2pt" font-size="70%">
				<xsl:apply-templates select="node()"/>
			</fo:inline>
	</xsl:template>
	<xsl:template match="supscrpt">
			<fo:inline baseline-shift="4pt" font-size="70%">
				<xsl:apply-templates select="node()"/>
			</fo:inline>
	</xsl:template>
	<xsl:template match="emphasis">
		<fo:inline>
			<xsl:choose>
				<xsl:when test="@emph='bold'">
					<xsl:attribute name="font-weight">bold</xsl:attribute>
				</xsl:when>
				<xsl:when test="@emph='italic'">
					<xsl:attribute name="font-style">italic</xsl:attribute>
				</xsl:when>
				<xsl:when test="@emph='bolditalic'">
					<xsl:attribute name="font-weight">bold</xsl:attribute>
					<xsl:attribute name="font-style">italic</xsl:attribute>
				</xsl:when>
				<xsl:when test="@emph='uline'">
					<xsl:attribute name="text-decoration">underline</xsl:attribute>
				</xsl:when>
				<xsl:when test="@emph='overline'">
					<xsl:attribute name="text-decoration">overline</xsl:attribute>
				</xsl:when>
				<xsl:when test="@emph='strikeout'">
					<xsl:attribute name="text-decoration">line-through</xsl:attribute>
				</xsl:when>
				<xsl:when test="@emph='caps'">
					<xsl:attribute name="text-transform">uppercase</xsl:attribute>
				</xsl:when>
				<xsl:when test="@emph='smallcaps'">
					<xsl:attribute name="font-variant">small-caps</xsl:attribute>
				</xsl:when>
				<xsl:when test="@emph='2line'">
					<xsl:attribute name="border-after-style">double</xsl:attribute>
					<xsl:attribute name="border-bottom-width">1.5pt</xsl:attribute>
				</xsl:when>
			</xsl:choose>
			<xsl:apply-templates select="node()"/>
		</fo:inline>
	</xsl:template>
	<!--**********************************************
Common elements for ADDRESS 
**********************************************-->
	<xsl:template match="address">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="street">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="city">
		<fo:block text-align="right" font-weight="bold">
			<xsl:value-of select="."/>
			<xsl:text>, </xsl:text>
		</fo:block>
	</xsl:template>
	<xsl:template match="state">
		<fo:block text-align="right" font-weight="bold">
			<xsl:value-of select="."/>
		</fo:block>
	</xsl:template>
	<xsl:template match="zip">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="country">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="phone">
		<fo:inline text-transform="uppercase">
			<xsl:value-of disable-output-escaping="no" select="@type"/>
			<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
			<xsl:apply-templates select="node()"/>
		</fo:inline>
	</xsl:template>
	
	<xsl:template match="callout" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<xsl:text disable-output-escaping="no">(</xsl:text> 
		<fo:basic-link internal-destination="{@assocfig}">
<xsl:choose>
					<xsl:when test="figure[@figtype='fo-rear']">
<xsl:text>FO-</xsl:text>
			<xsl:for-each select="id(@assocfig)">
				<xsl:number count="figure[@figtype='fo-rear'][not(parent::figure-alt)]|figure-alt" format="1"  from="ginfowp | descwp | thrywp | abbrevwp | symbolwp | ctrlindwp | opusualwp | opunuwp | stowagewp | eqploadwp | emergencywp | tsindxwp | pshopanalwp | compchklistwp | opcheck-tswp | tswp | opcheckwp | tsintrowp | techdescwp | surwp | perseqpwp | pmcsintrowp | pmcswp | gen.maintwp | maintwp | pmiwp | lubewp | facilwp | oipwp | mobilwp | qawp | manuwp | torquewp | inventorywp | storagewp | wtloadwp | wiringwp | ammowp | ammo.markingwp | natowp | auxeqpwp | wiringwp | pms-inspecwp | pmi-cklistwp | refwp | macintrowp | macwp | coeibiiwp | aalwp | explistwp | toolidwp | mrplwp | csi.wp | supitemwp | genwp | introwp | //pim | destruct-introwp | destruct-materialwp | //howtouse | ppmgeninfowp | softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp" level="any"/>
			</xsl:for-each>
					</xsl:when>
		<xsl:otherwise>
			<xsl:text disable-output-escaping="no">Figure </xsl:text>
			<xsl:for-each select="id(@assocfig)">
<xsl:number count="figure[@figtype='normal-page'][not(parent::figure-alt)]|figure-alt" format="1" from="ginfowp | descwp | thrywp | abbrevwp | symbolwp | ctrlindwp | opusualwp | opunuwp | stowagewp | eqploadwp | emergencywp | tsindxwp | pshopanalwp | compchklistwp | opcheck-tswp | tswp | opcheckwp | tsintrowp | techdescwp | surwp | perseqpwp | pmcsintrowp | pmcswp | gen.maintwp | maintwp | pmiwp | lubewp | facilwp | oipwp | mobilwp | qawp | manuwp | torquewp | inventorywp | storagewp | wtloadwp | wiringwp | ammowp | ammo.markingwp | natowp | auxeqpwp | wiringwp | pms-inspecwp | pmi-cklistwp | refwp | macintrowp | macwp | coeibiiwp | aalwp | explistwp | toolidwp | mrplwp | csi.fscap.wp | supitemwp | genwp | introwp | //pim | destruct-ginfowp | destruct-materialwp | //howtouse | ppmgeninfowp | softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp" level="any"/>
			</xsl:for-each>
			</xsl:otherwise>
						</xsl:choose>
		</fo:basic-link>
		<xsl:text disable-output-escaping="no">, Item </xsl:text>
		<xsl:value-of disable-output-escaping="no" select="@label"/>
		<xsl:apply-templates select="node()"/>
		<xsl:text disable-output-escaping="no">)</xsl:text>
			<xsl:if test="@applicable">
				<xsl:variable name="applicvalue">
					<xsl:value-of select="@applicable"/>
				</xsl:variable>
				<fo:inline font-weight="bold">
					<xsl:text> (</xsl:text>
					<xsl:value-of select="//*/applic[@id=$applicvalue]/@abbrevcode"/>
					<xsl:text>) </xsl:text>
				</fo:inline>
			</xsl:if>
	</xsl:template>
	

	<xsl:template match="reporting" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<fo:block border-after-style="solid" border-after-width="2pt" border-before-style="solid" border-before-width="2pt" border-left-style="solid" border-left-width="2pt" border-right-style="solid" border-right-width="2pt" end-indent="4pc" font-family="sans-serif" font-size="8pt" font-weight="bold" padding-bottom="8pt" padding-left="8pt" padding-right="8pt" padding-top="8pt" space-before="48pt" space-after="28pt" span="all" start-indent="4pc">
			<xsl:choose>
				<xsl:when test="string-length(frntcover/reporting/title)=0">
					<fo:block font-size="12pt" font-weight="bold" span="all" text-align="center" display-align="center">REPORTING ERRORS AND RECOMMENDING IMPROVEMENTS</fo:block>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="frntcover/reporting/title"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="node()"/>
		</fo:block>
		<!--xsl:if test="//paper.manual/@rpstl='yes' or //paper.manual/@rpstl='only'">
				<fo:block font-weight="bold" space-after.maximum="24pt" space-after.minimum="24pt" space-after.optimum="24pt" text-align="left" text-transform="uppercase">
			<xsl:text disable-output-escaping="no">CURRENT AS OF&#xa0;</xsl:text>
		<xsl:value-of disable-output-escaping="no" select="//production/@date"/>
		</fo:block>
		</xsl:if-->
	</xsl:template>
		<xsl:template match="frntcover/reporting/title">
		<fo:block font-size="12pt" font-weight="bold" span="all" text-align="center" display-align="center">
			<xsl:apply-templates select="title"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="proponent/name" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="proponent/address/servnomen" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<fo:inline >
			<xsl:text disable-output-escaping="no"> </xsl:text>
		</fo:inline>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="proponent/address/street" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<fo:inline >
			<xsl:text disable-output-escaping="no"> </xsl:text>
		</fo:inline>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="proponent/address/city" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<fo:inline >
			<xsl:text disable-output-escaping="no"> </xsl:text>
		</fo:inline>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="proponent/address/state" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<fo:inline >
			<xsl:text disable-output-escaping="no"> </xsl:text>
		</fo:inline>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="proponent/address/zip" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<xsl:apply-templates select="node()"> </xsl:apply-templates>
	</xsl:template>
	<!--**********************************************
Function NSN-VALUE
Checks the FSC and NIIN for the connecting dash existing already or does the stylesheet include the dash (either - or ndash).
**********************************************-->
	<xsl:template name="NSN-VALUE">
		<xsl:param name="Fsc"/>
		<xsl:param name="Niin"/>
		<xsl:choose>
			<xsl:when test="string-length($Fsc)+string-length($Niin)=0">&#x2002;</xsl:when>
			<xsl:when test="string-length($Fsc)>4 or not(contains('0123456789',substring($Niin,1,1)))">
				<xsl:value-of disable-output-escaping="no" select="$Fsc"/>
				<xsl:value-of disable-output-escaping="no" select="normalize-space($Niin)"/>
			</xsl:when>
			<xsl:when test="not(contains($Niin,'-'))">
				<xsl:value-of disable-output-escaping="no" select="$Fsc"/>
				<xsl:text disable-output-escaping="no">&#x2013;</xsl:text>
				<xsl:value-of disable-output-escaping="no" select="normalize-space($Niin)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of disable-output-escaping="no" select="$Fsc"/>
				<xsl:text disable-output-escaping="no">-</xsl:text>
				<xsl:value-of disable-output-escaping="no" select="normalize-space($Niin)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--**********************************************
Common elements for SYSNOMEN (excluding NAME)
**********************************************-->
	<xsl:template match="sysnomen/nsn">
		<fo:block>
			<fo:inline keep-together.within-line="always">
				<xsl:text disable-output-escaping="no">NSN&#x2002;</xsl:text>
				<xsl:call-template name="NSN-VALUE">
					<xsl:with-param name="Fsc" select="fsc"/>
					<xsl:with-param name="Niin" select="niin"/>
				</xsl:call-template>
			</fo:inline>
			<!--Next node is not NSN or last &#x2002; -->
			<xsl:if test="local-name(following-sibling::node()[1])!='nsn' and local-name(following-sibling::node()[1])!=''">
				<xsl:apply-templates select="following-sibling::node()[1]"/>
			</xsl:if>
		</fo:block>
		<xsl:choose>
			<xsl:when test="local-name(following-sibling::node()[1])='nsn'">
				<xsl:apply-templates select="following-sibling::node()[1]"/>
			</xsl:when>
			<xsl:when test="local-name(following-sibling::node()[1])='modelno' and contains('nsn|modelno',local-name(following-sibling::node()[2]))">
				<xsl:apply-templates select="following-sibling::node()[2]"/>
			</xsl:when>
			<xsl:when test="local-name(following-sibling::node()[1])='partno' and contains('nsn|modelno|partno',local-name(following-sibling::node()[2]))">
				<xsl:apply-templates select="following-sibling::node()[2]"/>
			</xsl:when>
			<xsl:when test="local-name(following-sibling::node()[1])='modelno' and local-name(following-sibling::node()[2])='partno' and contains('nsn|modelno|partno',local-name(following-sibling::node()[3]))">
				<xsl:apply-templates select="following-sibling::node()[3]"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="sysnomen/modelno">
		<xsl:choose>
			<xsl:when test="local-name(preceding-sibling::node()[1])='nsn' or local-name(preceding-sibling::node()[1])=' ' ">
				<fo:block>
					<xsl:text disable-output-escaping="no">,&#x2002;</xsl:text>
					<fo:inline keep-together.within-line="always">
						<xsl:apply-templates select="modelno"/>
					</fo:inline>
					<!--Only part # or EIC can follow model #, if exist-->
					<xsl:if test="contains('partno|eic',local-name(following-sibling::node()[1]))">
						<xsl:apply-templates select="following-sibling::node()[1]"/>
					</xsl:if>
				</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<fo:block>
					<fo:inline keep-together.within-line="always">
						<xsl:apply-templates select="model"/>
					</fo:inline>
					<!--Only part # or EIC can follow model #, if exist-->
					<xsl:if test="contains('partno|eic',local-name(following-sibling::node()[1]))">
						<xsl:apply-templates select="following-sibling::node()[1]"/>
					</xsl:if>
				</fo:block>
				<xsl:choose>
					<xsl:when test="contains('nsn|modelno',local-name(following-sibling::node()[1]))">
						<xsl:apply-templates select="following-sibling::node()[1]"/>
					</xsl:when>
					<xsl:when test="local-name(following-sibling::node()[1])='partno' and contains('nsn|modelno|partno',local-name(following-sibling::node()[2]))">
						<xsl:apply-templates select="following-sibling::node()[2]"/>
					</xsl:when>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="sysnomen/partno">
		<xsl:choose>
			<!--Part # is end of group of NSN and/or model #-->
			<xsl:when test="contains('nsn|modelno',local-name(preceding-sibling::node()[1]))">
				<fo:block>
					<xsl:text disable-output-escaping="no">,</xsl:text>
					<fo:inline keep-with-previous.within-line="always">P/N&#x2002;<xsl:apply-templates select="partno"/>
					</fo:inline>
				</fo:block>
				<!--Only EIC can follow partno, if exist-->
				<xsl:if test="local-name(following-sibling::node()[1])='eic'">
					<xsl:apply-templates select="following-sibling::eic"/>
				</xsl:if>
			</xsl:when>
			<!--Only part # is sysnomen group&#x2002;&#x2002;-->
			<xsl:otherwise>
				<fo:block>
					<fo:inline keep-with-previous.within-line="always">P/N<xsl:apply-templates select="normalize-spacepartno"/>
					</fo:inline>
					<!--Only EIC can follow partno, if exist-->
					<xsl:if test="local-name(following-sibling::node()[1])='eic'">
						<xsl:apply-templates select="following-sibling::eic"/>
					</xsl:if>
				</fo:block>
				<!--Start the next set of NSN, model # and/or part # group-->
				<xsl:if test="local-name(following-sibling::node()[1])!='eic' and local-name(following-sibling::node()[1])!=''">
					<xsl:apply-templates select="following-sibling::node()[1]"/>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="sysnomen/eic">
		<xsl:choose>
			<!--Only EIC is sysnomen block it only.-->
			<xsl:when test="local-name(preceding-sibling::node()[1])='name'">
				<fo:block>
					<!--<fo:inline keep-with-previous.within-line="always">		</fo:inline>-->
						<xsl:if test="ancestor::frntcover">(</xsl:if>
						<xsl:text disable-output-escaping="no">EIC&#x2002;</xsl:text>
						<xsl:apply-templates select="node()"/>
						<xsl:if test="ancestor::frntcover">)</xsl:if>
			
				</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<fo:block>
					<xsl:if test="ancestor::wpidinfo">,</xsl:if>
					<xsl:text>&#x2002;</xsl:text>
					<!--<fo:inline keep-with-previous.within-line="always"></fo:inline>-->
						<xsl:if test="ancestor::frntcover">(</xsl:if>
						<xsl:text disable-output-escaping="no">EIC&#x2002;</xsl:text>
						<xsl:apply-templates select="node()"/>
						<xsl:if test="ancestor::frntcover">)</xsl:if>
					
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="change">
	<fo:change-bar-begin change-bar-class="{generate-id(.)}" change-bar-placement="end" change-bar-width="2pt" change-bar-style="solid" change-bar-color="black" />
			<xsl:apply-templates/> 
	<fo:change-bar-end change-bar-class="{generate-id(.)}"/>
</xsl:template>

	<xsl:template match="chgdate" name="chgdate" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<fo:block text-align="right" font-weight="bold">
			<xsl:value-of select="."/>
		</fo:block>
	</xsl:template>
	<xsl:template match="ctrlind-val" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<fo:inline font-weight="bold">
			<xsl:apply-templates select="node()"/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="email" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<xsl:text> <!--Our email address is--> </xsl:text>
		<fo:inline color="blue" text-decoration="underline">
			<xsl:value-of disable-output-escaping="no" select="@address"/>
		</fo:inline>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="node()"/>
	</xsl:template>

	<xsl:template match="homepage" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<xsl:text> </xsl:text>
		<fo:inline color="blue" text-decoration="underline">
			<xsl:value-of disable-output-escaping="no" select="@protocol"/>
			<xsl:text>://</xsl:text>
			<xsl:value-of disable-output-escaping="no" select="@uri"/>
		</fo:inline>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	
<xsl:template match="howtouse" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
		<xsl:choose >
			<xsl:when test="parent::paper.frnt" >
				<xsl:call-template name="frntrear-rl"/>
			</xsl:when>
			<xsl:otherwise>
					<xsl:apply-templates select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="howtouse/title" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- LB - first title not bolding - added xsl:use-attribute-sets="titlesub" text-transform="capitalize" to make consistent -->
		<fo:block span="all" id="{generate-id(.)}" xsl:use-attribute-sets="titlesub" text-transform="capitalize">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	
	
	<xsl:template match="intro">
		<xsl:if test="parent::damage-assesswp or parent::substitute-matwp">
			<fo:block border-after-style="solid" border-after-width="2pt" border-before-style="solid" border-before-width="2pt" border-left-style="solid" border-left-width="2pt" border-right-style="solid" border-right-width="2pt" end-indent="4pc" font-family="sans-serif" font-size="12pt" font-weight="bold" padding-bottom="8pt" padding-left="8pt" padding-right="8pt" padding-top="8pt" space-before="48pt" space-after="28pt" span="all" start-indent="4pc" text-transform="uppercase">
				BDAR FIXES SHALL BE USED ONLY IN COMBAT OR FOR TRAINING AT THE DISCRETION OF THE COMMANDER. (AUTHORIZED TRAINING FIXES ARE LISTED IN THE BDAR TRAINING PROCEDURES WORK PACKAGE.) IN ANY CASE, DAMAGE SHALL BE REPAIRED BY STANDARD MAINTENANCE PROCEDURES AS SOON AS PRACTICABLE.
			</fo:block>
		</xsl:if>
		<xsl:if test="parent::lubeorder">
			<xsl:apply-templates select="para0 | para0-alt"/>
		</xsl:if>
		<xsl:variable name="Content">
			<xsl:value-of disable-output-escaping="no" select="node()"/>
		</xsl:variable>
		<xsl:if test="string-length($Content)>0">
			<!--Skip empty intro-->
			<xsl:apply-templates select="para0 | para0-alt"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="intro/title">
		<fo:block span="all" xsl:use-attribute-sets="titlesub">
			<xsl:if test="contains('trim.para|trim.specpara|para|para0|specpara|proc|figure|hazmat|warning|caution|note',local-name(preceding-sibling::node()[1])) or local-name(parent::node())='proc'">
				<xsl:attribute name="space-before.minimum">10pt</xsl:attribute>
				<xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
				<xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="nameid" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atixslts="http://www.arbortext.com/namespace/XslTurboStyler/3.0">
		<fo:inline>
			<xsl:apply-templates select="document(&quot;&quot;)//atixslts:gentext[@id=&quot;x32&quot;]/atixslts:before/node()"> </xsl:apply-templates>
			<xsl:apply-templates select="node()"/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="scope">
		<xsl:choose>
			<xsl:when test="string-length(title[1])=0">
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt" text-transform="uppercase">SCOPE</fo:block>
						<xsl:apply-templates select="para | para0 | para0-alt | note | figure | figure-alt | table | table-alt"/>
			</xsl:when>
			<xsl:otherwise>
				<fo:block span="all" xsl:use-attribute-sets="titlesub" space-before="12pt">
					<xsl:apply-templates select="node()"/>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="servbranch">
		<xsl:value-of select="@service "/>
		<xsl:text/>
	</xsl:template>
	<xsl:template match="trim.para">
		<!--<fo:block font-family="sans-serif" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all">-->
			<xsl:if test="@bullet = yes">
				<xsl:text disable-output-escaping="no">&#x2022;&#x2002;</xsl:text>
			</xsl:if>
			<xsl:apply-templates select="node()"/>
		<!--</fo:block>-->
	</xsl:template>
	<xsl:template match="verbatim"> <!-- xml:space="preserve" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"-->
		<fo:block linefeed-treatment="preserve" white-space-collapse="false" white-space-treatment="preserve">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="ppmgeninfowp">
	<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
		</xsl:template>	
		
	  <xsl:template name="disinherit..indents">
      <xsl:attribute name="margin-left">0pt</xsl:attribute>
      <xsl:attribute name="margin-right">0pt</xsl:attribute>
      <xsl:attribute name="text-indent">0pt</xsl:attribute>
   </xsl:template>
	
	  <xsl:template name="set-property">
      <xsl:param name="prop-name"/>
      <xsl:param name="prop-value"/>
      <xsl:if test="$prop-value!=''">
         <xsl:attribute name="{$prop-name}">
            <xsl:value-of select="$prop-value"/>
         </xsl:attribute>
      </xsl:if>
   </xsl:template>
   
</xsl:stylesheet>
