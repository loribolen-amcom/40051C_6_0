<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="xref">
		<xsl:variable name="UpperCase">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<xsl:variable name="LowerCase">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:if test="@pretext">
			<xsl:value-of disable-output-escaping="no" select="@pretext"/>
			<xsl:text disable-output-escaping="no"/>
		</xsl:if>

		<xsl:choose>
			<xsl:when test="@itemno and ancestor::initial_setup">
				<xsl:if test="@wpid">
				<xsl:call-template name="WPID"/>
				</xsl:if>
			<!-- 	<xsl:if test="not(contains(translate(@itemno, $UpperCase,$LowerCase),'item'))">
					<xsl:text disable-output-escaping="no">Item </xsl:text>
				</xsl:if> @itemno -->
			<xsl:if test="@wpid"> <!-- added from 2 -->
					<xsl:text disable-output-escaping="no">,&#x2002;</xsl:text>
				</xsl:if>	
			<fo:basic-link internal-destination="{@itemno}">
					<xsl:for-each select="id(@itemno)">
						<xsl:choose>
							<xsl:when test="contains('trim.para|para',local-name(.))">
								<xsl:apply-templates select="node()"/>
								<!--<xsl:value-of disable-output-escaping="no" select="@id"/>-->
							</xsl:when>
							<xsl:when test="contains('title|subtitle',local-name(.))">
								<xsl:apply-templates select="node()"/>
							</xsl:when>
							<xsl:when test="contains('proc',local-name(.))">
								<xsl:value-of disable-output-escaping="no" select="itemno"/>
							</xsl:when>
							<xsl:when test="contains('|itemno|illno|',local-name(.))">
								<xsl:text disable-output-escaping="no">Item </xsl:text>
								<xsl:apply-templates select="node()"/>
							</xsl:when>
							<xsl:when test="contains('|bii-entry|coei-entry|',local-name(.))">
								<xsl:text disable-output-escaping="no">Item </xsl:text>
								<xsl:value-of disable-output-escaping="no" select="illno"/>
							</xsl:when>
							<xsl:when
								test="contains('|mrpl-entry|expdur-entry|oipitem|pmcs-entry|pmi.pecul-entry|tool-entry|',local-name(.))">
								<xsl:text disable-output-escaping="no">Item </xsl:text>
								<xsl:value-of disable-output-escaping="no" select="itemno"/>
							</xsl:when>
							<xsl:when test="local-name(.)='callout'">
								<xsl:choose>
									<xsl:when test="@callout">
										<xsl:text disable-output-escaping="no">Item </xsl:text>
										<xsl:value-of disable-output-escaping="no" select="@callout"/>
									</xsl:when>
									<xsl:when test="@label">
										<xsl:text disable-output-escaping="no">Item </xsl:text>
										<xsl:value-of disable-output-escaping="no" select="@label"/>
									</xsl:when>
									<xsl:when test="@numref"/>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="local-name(.)='pi.item'">
								<xsl:choose>
									<xsl:when test="callout[@label]">
										<xsl:text disable-output-escaping="no">Item </xsl:text>
										<xsl:value-of disable-output-escaping="no" select="callout/@label"/>
									</xsl:when>
									<xsl:when test="callout[@numref]"/>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="local-name(.)='ctrlindrow'">
								<xsl:choose>
									<xsl:when test="key">
										<xsl:text disable-output-escaping="no">Item </xsl:text>
										<xsl:value-of disable-output-escaping="no" select="key"/>
									</xsl:when>
									<xsl:otherwise/>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="local-name(.)='key'">
								<xsl:text disable-output-escaping="no">Item </xsl:text>
								<xsl:value-of disable-output-escaping="no" select="node()"/>
							</xsl:when>
							<xsl:when test="local-name(.)='pubident'">
								<xsl:choose>
									<xsl:when test="name/extref">
										<xsl:value-of disable-output-escaping="no" select="name/extref/@docno"/>
									</xsl:when>	
									<xsl:otherwise>
										<xsl:value-of disable-output-escaping="no" select="name"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</fo:basic-link>
			</xsl:when>
			
			<xsl:when test="@itemid and ancestor::initial_setup">
				<xsl:if test="@wpid and not(name(id(@itemid))='pubident')">
					<xsl:call-template name="WPID"/>
					<xsl:text disable-output-escaping="no">,&#x2002;</xsl:text>
				</xsl:if>
				
<!--			<xsl:when test="@wpid and ancestor::initial_setup">
				<xsl:call-template name="WPID"/>
				</xsl:when>-->
	<!--			<xsl:when test="@itemid and ancestor::initial_setup">
			
	<xsl:if test="@wpid">
			<xsl:call-template name="WPID"/>
		</xsl:if>-->
				<xsl:variable name="ItemNotFound">NOT FOUND (ITEMID=<xsl:value-of
						disable-output-escaping="no" select="@itemid"/>)</xsl:variable>
				<xsl:variable name="element-name" select="name(id(@itemid))"/>
				<fo:basic-link internal-destination="{@itemid}">
					<xsl:for-each select="id(@itemid)">
						<xsl:choose>
						<xsl:when test="contains('terefcode',local-name(.))">
							<xsl:text disable-output-escaping="no">Table 2, Item </xsl:text>
							<xsl:value-of disable-output-escaping="no" select="node()"/>
						</xsl:when>
							<xsl:when test="contains('title|subtitle',local-name(.))">
								<xsl:apply-templates select="node()"/>
							</xsl:when>
							<xsl:when test="contains('proc',local-name(.))">
								<xsl:value-of disable-output-escaping="no" select="itemno"/>
							</xsl:when>
							<xsl:when test="contains('|itemno|illno|',local-name(.))">
								<xsl:text disable-output-escaping="no">Item </xsl:text>
								<xsl:apply-templates select="node()"/>
							</xsl:when>
							<xsl:when test="contains('|bii-entry|coei-entry|',local-name(.))">
								<xsl:text disable-output-escaping="no">Item </xsl:text>
								<xsl:value-of disable-output-escaping="no" select="illno"/>
							</xsl:when>
							<xsl:when test="contains('|mrpl-entry|expdur-entry|oipitem|pmcs-entry|pmi.pecul-entry|tool-entry|',local-name(.))">
								<xsl:text disable-output-escaping="no">Item </xsl:text>
								<xsl:value-of disable-output-escaping="no" select="itemno"/>
							</xsl:when>
							<xsl:when test="local-name(.)='callout'">
								<xsl:choose>
									<xsl:when test="@callout">
										<xsl:text disable-output-escaping="no">Item </xsl:text>
										<xsl:value-of disable-output-escaping="no" select="@callout"/>
									</xsl:when>
									<xsl:when test="@label">
										<xsl:text disable-output-escaping="no">Item </xsl:text>
										<xsl:value-of disable-output-escaping="no" select="@label"/>
									</xsl:when>
									<xsl:when test="@numref"/>
									<xsl:otherwise>
										<xsl:value-of disable-output-escaping="no" select="$ItemNotFound"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="local-name(.)='pi.item'">
								<xsl:choose>
									<xsl:when test="callout[@label]">
										<xsl:text disable-output-escaping="no">Item </xsl:text>
										<xsl:value-of disable-output-escaping="no" select="callout/@label"/>
									</xsl:when>
									<xsl:when test="callout[@numref]"/>
									<xsl:otherwise>
										<xsl:value-of disable-output-escaping="no" select="$ItemNotFound"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="local-name(.)='row'">
								<xsl:text disable-output-escaping="no">Item </xsl:text>
								<xsl:value-of disable-output-escaping="no" select="entry[1]"/>
							</xsl:when>
							<xsl:when test="local-name(.)='ctrlindrow'">
								<xsl:choose>
									<xsl:when test="key">
										<xsl:text disable-output-escaping="no">Item </xsl:text>
										<xsl:value-of disable-output-escaping="no" select="key"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of disable-output-escaping="no" select="$ItemNotFound"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="local-name(.)='key'">
								<xsl:text disable-output-escaping="no">Item </xsl:text>
								<xsl:value-of disable-output-escaping="no" select="node()"/>
							</xsl:when>
							<xsl:when test="local-name(.)='pubident'">
								<xsl:choose>
									<xsl:when test="name/extref">
										<xsl:value-of disable-output-escaping="no" select="name/extref/@docno"/>
									</xsl:when>	
									<xsl:otherwise>
										<xsl:value-of disable-output-escaping="no" select="name"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of disable-output-escaping="no" select="$ItemNotFound"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</fo:basic-link>
				<!-- BOLEN added PUBIDENT-->
<!--				<xsl:if test="@wpid and not(name(id(@itemid))='pubident')">
					<xsl:text disable-output-escaping="no">,&#x2002;</xsl:text>
				</xsl:if>-->
			</xsl:when>
		<xsl:otherwise>
		<xsl:if test="@wpid">
			<xsl:call-template name="WPID"/>
		</xsl:if>
			</xsl:otherwise>
		</xsl:choose>

		<xsl:if test="@taskid">
			<xsl:call-template name="TASKID"/>
		</xsl:if>
		<xsl:if test="@tableid">
			<xsl:call-template name="TABLEID"/>
		</xsl:if>
		<!-- Figure id linked to the attribute in the title. -->
		<xsl:if test="@figid">
			<xsl:if test="string-length(@wpid)+string-length(@taskid)>0">
				<xsl:text disable-output-escaping="no">,&#x2002;</xsl:text>
			</xsl:if>
			<fo:basic-link internal-destination="{@figid}">
				<xsl:for-each select="id(@figid)">
				
					<xsl:choose>
					<xsl:when test="@figtype = 'fo-rear'">
					  <xsl:text>FO&#x2013;</xsl:text>
					  <xsl:number count="figure[@figtype='fo-rear']" format="1" from="production" level="any"/>
					</xsl:when>
					<xsl:otherwise>
					<xsl:text disable-output-escaping="no">Figure&#x2002;</xsl:text>
	<xsl:number count="figure[@figtype='normal-page'] [not(parent::figure-alt)]|figure-alt" format="1" from="aalwp | ammowp | auxeqpwp | ammo.markingwp | bdar-geninfowp | bdartoolswp | bulk_itemswp | coeibiiwp | compchklistwp | csi.wp | ctrlindwp | damage-assesswp | descwp |  destruct-introwp | destruct-materialwp | diagnosticwp | dmwr_introwp | dmwr_operationalreqwp | dmwr_qarwp | emergencywp | eqploadwp | explistwp | facilwp | gen.maintwp | genrepairwp | genwp | ginfowp | introwp | inventorywp | loepwp | lubewp | macintrowp | macwp | maintwp | manu_items_introwp | manuwp | mobilwp | mrplwp | natowp | nsnindxwp | oipwp | opcheck-tswp | opcheckwp | opunuwp | opusualwp | orschwp | perseqpwp | //pim | pm-ginfowp | pmcsintrowp | pmcswp | pmi-cklistwp | pmiwp | pms-ginfowp | pms-inspecwp | pnindxwp | ppmgeninfowp | pshopanalwp | qawp | refdesindxwp | refwp | storagewp | stowagewp | substitute-matwp | supitemwp | surwp | techdescwp | thrywp | toolidwp | torquewp | totnum.wps | tsindxwp | tsintrowp | tswp | wiringwp | wtloadwp | softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp | //howtouse" level="any"/>
					</xsl:otherwise>
					</xsl:choose>	
				</xsl:for-each>
			</fo:basic-link>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="@itemno and not(ancestor::initial_setup)">
				<xsl:text disable-output-escaping="no">,&#x2002;</xsl:text>
				<xsl:if test="@wpid">
					<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
				</xsl:if>
				<xsl:if test="not(contains(translate(@itemno, $UpperCase,$LowerCase),'item'))">
					<xsl:text disable-output-escaping="no">Item </xsl:text>
				</xsl:if>
				<xsl:value-of disable-output-escaping="no" select="@itemno"/>
			</xsl:when>

			<xsl:when test="@itemid and not(ancestor::initial_setup)">
				<xsl:variable name="ItemNotFound">NOT FOUND(ITEMID=<xsl:value-of disable-output-escaping="no" select="@itemid"/>)</xsl:variable>
				<xsl:variable name="element-name" select="name(id(@itemid))"/>
				<xsl:if test="@wpid">
					<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
				</xsl:if>
				<fo:basic-link internal-destination="{@itemid}">
					<xsl:for-each select="id(@itemid)">
						<xsl:choose>
							<xsl:when test="contains('title|subtitle',local-name(.))">
								<xsl:apply-templates select="node()"/>
							</xsl:when>
							<xsl:when test="contains('proc',local-name(.))">
								<xsl:value-of disable-output-escaping="no" select="itemno"/>
							</xsl:when>
							<xsl:when test="contains('|itemno|illno|',local-name(.))">
								<xsl:text disable-output-escaping="no">Item </xsl:text>
								<xsl:apply-templates select="node()"/>
							</xsl:when>
							<xsl:when test="contains('|bii-entry|coei-entry|',local-name(.))">
								<xsl:text disable-output-escaping="no">Item </xsl:text>
								<xsl:value-of disable-output-escaping="no" select="illno"/>
							</xsl:when>
							<xsl:when test="contains('|legend|mrpl-entry|expdur-entry|oipitem|pmcs-entry|pmi.pecul-entry|tool-entry|',local-name(.))">
								<xsl:text disable-output-escaping="no">Item </xsl:text>
								<xsl:value-of disable-output-escaping="no" select="itemno"/>
							</xsl:when>
							<xsl:when test="local-name(.)='row'">
								<xsl:text disable-output-escaping="no">Item </xsl:text>
								<xsl:value-of disable-output-escaping="no" select="entry[1]"/>
							</xsl:when>
							<xsl:when test="local-name(.)='callout'">
								<xsl:choose>
									<xsl:when test="@label">
										<xsl:text disable-output-escaping="no">Item </xsl:text>
										<xsl:value-of disable-output-escaping="no" select="@label"/>
									</xsl:when>
									<xsl:when test="@numref"/>
									<xsl:otherwise>
										<xsl:value-of disable-output-escaping="no" select="$ItemNotFound"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="local-name(.)='pi.item'">
								<xsl:choose>
									<xsl:when test="callout[@label]">
										<xsl:text disable-output-escaping="no">Item </xsl:text>
										<xsl:value-of disable-output-escaping="no" select="callout/@label"/>
									</xsl:when>
									<xsl:when test="callout[@numref]"/>
									<xsl:otherwise>
										<xsl:value-of disable-output-escaping="no" select="$ItemNotFound"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="local-name(.)='ctrlindrow'">
								<xsl:choose>
									<xsl:when test="key">
										<xsl:text disable-output-escaping="no">Item </xsl:text>
										<xsl:value-of disable-output-escaping="no" select="key"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of disable-output-escaping="no" select="$ItemNotFound"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="local-name(.)='key'">
								<xsl:text disable-output-escaping="no">Item </xsl:text>
								<xsl:value-of disable-output-escaping="no" select="node()"/>
							</xsl:when>
							<xsl:when test="local-name(.)='legend'">
								<xsl:text disable-output-escaping="no">Item </xsl:text>
								<xsl:value-of disable-output-escaping="no" select="node()"/>
							</xsl:when>
							<xsl:when test="local-name(.)='pubident'">
								<xsl:choose>
									<xsl:when test="name/extref">
										<xsl:value-of disable-output-escaping="no" select="name/extref/@docno"/>
									</xsl:when>	
									<xsl:otherwise>
										<xsl:value-of disable-output-escaping="no" select="name"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of disable-output-escaping="no" select="$ItemNotFound"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</fo:basic-link>
			</xsl:when>
		</xsl:choose>

		<xsl:if test="@termdefid">
			<xsl:variable name="termdefid">
				<xsl:value-of disable-output-escaping="no" select="@termdefid"/>
			</xsl:variable>
			<xsl:if test="@wpid">
				<xsl:text disable-output-escaping="no">,&#x2002;</xsl:text>
			</xsl:if>
			<fo:inline>
				<fo:basic-link internal-destination="{@termdef}" >
					<xsl:for-each select="id(@termdefid)">
						<xsl:value-of disable-output-escaping="no" select="descendant::term"/>
					</xsl:for-each>
				</fo:basic-link>
			</fo:inline>
		</xsl:if>

		<xsl:if test="@stepstart">
			<xsl:variable name="element-name">
				<xsl:value-of disable-output-escaping="no" select="name(id(@stepstart))"/>
			</xsl:variable>
			<xsl:if test="string-length(@wpid)+string-length(@taskid)+string-length(@tableid)>0">
				<xsl:text disable-output-escaping="no">,&#x2002;</xsl:text>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="@stepend">
					<xsl:text disable-output-escaping="no">Steps </xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="no">Step </xsl:text>
				</xsl:otherwise>
			</xsl:choose>

			<fo:basic-link internal-destination="{@stepstart}" color="black" >
				<xsl:for-each select="id(@stepstart)">
					<xsl:if test="$element-name='step1' or $element-name=&#x22;malfunc&#x22;">
						<xsl:choose>
							<xsl:when test="ancestor::logicproc">
						<xsl:number count="step1 | endblock/action/para | test/proc/para" format="1" from="logicproc" level="any"/>
							</xsl:when>
					<xsl:when test="ancestor::checkstep and not(ancestor::indication) and not(ancestor::action)">
					<xsl:number count="checkstep/step1" format="1" from="testproc" level="any"/>
				<xsl:text>, TESTING - BRANCH </xsl:text>
				<xsl:number count="checkstep" level="any" from="testproc" format="1"/>
				<xsl:text>, OPERATIONAL CHECKOUT TEST PROCEDURE </xsl:text>
				<xsl:number count="testproc" level="any" from="opcheck | opcheck-tsproc" format="1"/>
			<xsl:choose>
				<xsl:when test="string-length(ancestor::opcheck/title)=0">
					<xsl:text>, OPCHECK </xsl:text>
							<xsl:number count="opcheck" level="any" from="opcheckproc" format="1"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>, </xsl:text>
					<xsl:value-of  select="ancestor::opcheck/title"/>
					<xsl:text> </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
				<xsl:text>, OPCHECK PROCEDURE </xsl:text>
			<xsl:number count="opcheckproc" level="single" from="opcheckwp" format="1"/>
				</xsl:when>
							<xsl:otherwise>
								<xsl:number count="step1[not(parent::step1-alt)]|step1-alt" format="1" level="single"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					<xsl:if test="$element-name='step2'">
					<xsl:choose>
							<xsl:when test="ancestor::logicproc">
								<xsl:number count="test//step1 | malfunc" format="1" from="logicproc/origin[1]" level="any"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:number count="step1[not(parent::step1-alt)]|step1-alt" format="1" level="single"/>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:number count="step2[not(parent::step2-alt)]|step1-alt" format="a" from="step1" level="single"/>
					</xsl:if>
					<xsl:if test="$element-name='step3'">
												<xsl:choose>
							<xsl:when test="ancestor::logicproc">
								<xsl:number count="test//step1 | malfunc" format="1" from="logicproc/origin[1]" level="any"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:number count="step1[not(parent::step1-alt)]|step1-alt" format="1" level="single"/>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:number count="step2[not(parent::step2-alt)]|step2-alt" format="a" from="step1" level="single"/>
						<xsl:number count="step3[not(parent::step3-alt)]|step3-alt" format="(1)" from="step2" level="single"/>
					</xsl:if>
					<xsl:if test="$element-name='step4'">
						<xsl:choose>
							<xsl:when test="ancestor::logicproc">
								<xsl:number count="test//step1 | malfunc" format="1" from="logicproc/origin[1]" level="any"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:number count="step1[not(parent::step1-alt)]|step1-alt" format="1" level="single"/>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:number count="step2[not(parent::step2-alt)]|step2-alt" format="a" from="step1" level="single"/>
						<xsl:number count="step3[not(parent::step3-alt)]|step3-alt" format="(1)" from="step2" level="single"/>
						<xsl:number count="step4[not(parent::step4-alt)]|step4-alt" format="(a)" from="step3" level="single"/>
					</xsl:if>
					<xsl:if test="$element-name='step5'">
						<xsl:choose>
							<xsl:when test="ancestor::logicproc">
								<xsl:number count="test//step1 | malfunc" format="1" from="logicproc/origin[1]" level="any"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:number count="step1[not(parent::step1-alt)]|step1-alt" format="1" level="single"/>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:number count="step2[not(parent::step2-alt)]|step2-alt" format="a" from="step1" level="single"/>
						<xsl:number count="step3[not(parent::step3-alt)]|step3-alt" format="(1)" from="step2" level="single"/>
						<xsl:number count="step4[not(parent::step4-alt)]|step4-alt" format="(a)" from="step3" level="single"/>
						<fo:inline text-decoration="underline">
							<xsl:number count="step5[not(parent::step5-alt)]|step5alt" format="1" from="step4" level="single"/>
						</fo:inline>
					</xsl:if>
					<xsl:if test="$element-name='step6'">
						<xsl:choose>
							<xsl:when test="ancestor::logicproc">
								<xsl:number count="test//step1 | malfunc" format="1" from="logicproc/origin[1]" level="any"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:number count="step1[not(parent::step1-alt)]|step1-alt" format="1" level="single"/>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:number count="step2[not(parent::step2-alt)]|step2-alt" format="a" from="step1" level="single"/>
						<xsl:number count="step3[not(parent::step3-alt)]|step3-alt" format="(1)" from="step2" level="single"/>
						<xsl:number count="step4[not(parent::step4-alt)]|step4-alt" format="(a)" from="step3" level="single"/>
						<fo:inline text-decoration="underline">
							<xsl:number count="step5[not(parent::step5-alt)]|step5alt" format="1" from="step4" level="single"/>
							<xsl:number count="step6[not(parent::step6-alt)]|step6alt" format="a" from="step5" level="single"/>
						</fo:inline>
					</xsl:if>
				</xsl:for-each>
			</fo:basic-link>
		</xsl:if>

		<xsl:if test="@stepend">
			<xsl:variable name="element-name">
				<xsl:value-of disable-output-escaping="no" select="name(id(@stepend))"/>
			</xsl:variable>
			<xsl:text disable-output-escaping="no">&#x2013;</xsl:text>
			<fo:basic-link internal-destination="{@stepend}" color="black" >
				<xsl:for-each select="id(@stepend)">
					<xsl:if test="$element-name='step1'">
						<xsl:number count="step1" format="1" level="single"/>
					</xsl:if>
					<xsl:if test="$element-name='step2'">
						<xsl:if test="$element-name='step1' or $element-name=&#x22;malfunc&#x22;">
						<xsl:choose>
							<xsl:when test="ancestor::logicproc">
								<xsl:number count="test//step1 | malfunc" format="1" from="logicproc/origin[1]" level="any"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:number count="step1" format="1" level="single"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
						<xsl:number count="step2" format="a" from="step1" level="single"/>
					</xsl:if>
					<xsl:if test="$element-name='step3'">
						<xsl:if test="$element-name='step1' or $element-name=&#x22;malfunc&#x22;">
						<xsl:choose>
							<xsl:when test="ancestor::logicproc">
								<xsl:number count="test//step1 | malfunc" format="1" from="logicproc/origin[1]" level="any"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:number count="step1" format="1" level="single"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
						<xsl:number count="step2" format="a" from="step1" level="single"/>
						<xsl:number count="step3" format="(1)" from="step2" level="single"/>
					</xsl:if>
					<xsl:if test="$element-name='step4'">
						<xsl:if test="$element-name='step1' or $element-name=&#x22;malfunc&#x22;">
						<xsl:choose>
							<xsl:when test="ancestor::logicproc">
								<xsl:number count="test//step1 | malfunc" format="1" from="logicproc/origin[1]" level="any"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:number count="step1" format="1" level="single"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
						<xsl:number count="step2" format="a" from="step1" level="single"/>
						<xsl:number count="step3" format="(1)" from="step2" level="single"/>
						<xsl:number count="step4" format="(a)" from="step3" level="single"/>
					</xsl:if>
					<xsl:if test="$element-name='step5'">
						<xsl:if test="$element-name='step1' or $element-name=&#x22;malfunc&#x22;">
						<xsl:choose>
							<xsl:when test="ancestor::logicproc">
								<xsl:number count="test//step1 | malfunc" format="1" from="logicproc/origin[1]" level="any"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:number count="step1" format="1" level="single"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
						<xsl:number count="step2" format="a" from="step1" level="single"/>
						<xsl:number count="step3" format="(1)" from="step2" level="single"/>
						<xsl:number count="step4" format="(a)" from="step3" level="single"/>
						<fo:inline text-decoration="underline">
							<xsl:number count="step5" format="1" from="step4" level="single"/>
						</fo:inline>
					</xsl:if>
					<xsl:if test="$element-name='step6'">
						<xsl:if test="$element-name='step1' or $element-name=&#x22;malfunc&#x22;">
						<xsl:choose>
							<xsl:when test="ancestor::logicproc">
								<xsl:number count="test//step1 | malfunc" format="1" from="logicproc/origin[1]" level="any"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:number count="step1" format="1" level="single"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
						<xsl:number count="step2" format="a" from="step1" level="single"/>
						<xsl:number count="step3" format="(1)" from="step2" level="single"/>
						<xsl:number count="step4" format="(a)" from="step3" level="single"/>
						<fo:inline text-decoration="underline">
							<xsl:number count="step5" format="1" from="step4" level="single"/>
							<xsl:number count="step6" format="a" from="step5" level="single"/>
						</fo:inline>
					</xsl:if>
				</xsl:for-each>
			</fo:basic-link>
		</xsl:if>

		<xsl:if test="@pagelocid">
			<xsl:text disable-output-escaping="no">,&#x2002;page&#x2002;</xsl:text>
			<fo:inline>
				<fo:basic-link internal-destination="{@pagelocid}" color="black" >
					<xsl:variable name="pageloc">
						<xsl:value-of disable-output-escaping="no" select="@pagelocid"/>
					</xsl:variable>
					<xsl:for-each select="//*[@wpno]">
						<xsl:if test=".//*[@id=$pageloc]">
					<xsl:text>WP&#x2002;</xsl:text>
							<xsl:choose>
								<xsl:when test="@wpseq">
									<!--<xsl:text disable-output-escaping="no">WP&#x2002;</xsl:text>-->
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
							</xsl:choose>
						</xsl:if>
					</xsl:for-each>
										<xsl:text>&#x2010;</xsl:text>
					<fo:page-number-citation>
						<xsl:attribute name="ref-id">
							<xsl:value-of disable-output-escaping="no" select="@pagelocid"/>
						</xsl:attribute>
					</fo:page-number-citation>
				</fo:basic-link>
			</fo:inline>
		</xsl:if>

		<xsl:if test="@tslocid">
			<xsl:text disable-output-escaping="no">,&#x2002;</xsl:text>
			<fo:inline>
				<fo:basic-link internal-destination="{@tslocid}" color="black"/>
			</fo:inline>
			<xsl:value-of disable-output-escaping="no" select="@tslocid"/>
		</xsl:if>

		<xsl:if test="@posttext">
			<xsl:value-of disable-output-escaping="no" select="@posttext"/>
		</xsl:if>
		<xsl:if test="@callout">
			<xsl:value-of disable-output-escaping="no" select="@callout"/>
		</xsl:if>
	
	</xsl:template>

	<xsl:template match="extref">
		<xsl:if test="@pretext">
			<xsl:value-of disable-output-escaping="no" select="@pretext"/>
		</xsl:if>
		<xsl:if test="@docno">
				<xsl:value-of disable-output-escaping="no" select="@docno"/>
		</xsl:if>
		<xsl:if test="@posttext">
			<xsl:value-of disable-output-escaping="no" select="@posttext"/>
		</xsl:if>
	</xsl:template>

	<!-- GENERATE WP SEQUENCE NUMBER -->
	<xsl:template name="WPID">
		<xsl:param name="WpId"/>
		<xsl:if test="@wpid">
			<xsl:variable name="workpkgid">
				<xsl:value-of disable-output-escaping="no" select="@wpid"/>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="name(id(@itemid))='pubident'"/>
				<xsl:otherwise>
					<fo:basic-link internal-destination="{@wpid}" color="black">
						<xsl:for-each select="//*[@wpno]">
							<xsl:if test="@wpno=$workpkgid">
					<xsl:text>WP&#x2002;</xsl:text>
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
								</xsl:choose>
							</xsl:if>
						</xsl:for-each>
					</fo:basic-link>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="WPID-TO-WPSEQ">
		<xsl:param name="Wpid"/>
		<xsl:for-each select="//wpidinfo">
			<xsl:if test="parent::*[@wpno=$Wpid]">
					<xsl:text>WP&#x2002;</xsl:text>
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
				</xsl:choose>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<!--GENERATE TABLE NUMBER -->
	<xsl:template name="TABLEID">
		<xsl:if test="string-length(@wpid)+string-length(@taskid)>0">
			<xsl:text disable-output-escaping="no">,&#x2002;</xsl:text>
		</xsl:if>
		<fo:basic-link internal-destination="{@tableid}" color="black">
			<xsl:for-each select="id(@tableid)">
				<xsl:call-template name="TABLE-CHOOSE">
					<xsl:with-param name="element-name">
						<xsl:choose>
							<xsl:when test="local-name(.)='title'">
								<xsl:value-of disable-output-escaping="no" select="local-name(.)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of disable-output-escaping="no" select="local-name(.)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>
				</xsl:call-template>
				<!--<xsl:text> p.</xsl:text>
				<xsl:text>&#x2013;</xsl:text>
				<fo:page-number-citation ref-id="{generate-id(.)}"/>-->
			</xsl:for-each>
		</fo:basic-link>
	</xsl:template>
	<xsl:template name="TABLE-CHOOSE">
		<xsl:param name="element-name"/>
		<xsl:text disable-output-escaping="no">Table&#x2002;</xsl:text>
		<xsl:choose>
			<!--OPIM Tables-->
			<xsl:when test="$element-name='ctrlindtab'">
				<xsl:number count="ctrlindtab | table" format="1" from="//ctrlindwp" level="any" />
			</xsl:when>
			<!--TIM Tables-->
			<xsl:when test="$element-name='pshopchk.tab'">
				<xsl:number count="pshopchk.tab" format="1" from="//pshopanalwp" level="any"/>
			</xsl:when>
			<!--MIM Tables-->
			<xsl:when test="$element-name='mobiltab'">
				<xsl:number count="mobiltab | table" format="1" from="//mobilwp" level="any"/>
			</xsl:when>
			<xsl:when test="$element-name='oiptab'">
				<xsl:number count="oiptab | table" format="1" from="//oipwp" level="any"/>
			</xsl:when>
			<xsl:when test="$element-name='pmcstable'">
				<xsl:number count="pmcstable | table" format="1" from="//pmcswp" level="any"/>
			</xsl:when>
			<xsl:when test="$element-name='crit.insp.tab'">
				<xsl:number count="table | crit.insp.tab | pecul.insp.tab" format="1" from="surwp" level="single"/>
			</xsl:when>
			<xsl:when test="$element-name='pecul.insp.tab'">
				<xsl:number count="table | crit.insp.tab | pecul.insp.tab" format="1" from="surwp" level="single"/>
			</xsl:when>
			<!--SIM Tables-->
			<xsl:when test="$element-name='mac'">
				<xsl:number count="mac | avmac | tereqtab | remarktab" format="1" from="//macwp" level="any"/>
			</xsl:when>
			<xsl:when test="$element-name='avmac'">
				<xsl:number count="mac | avmac | tereqtab | remarktab" format="1" from="//macwp" level="any"/>
			</xsl:when>
			<xsl:when test="$element-name='tereqtab'">
				<xsl:number count="mac | avmac | tereqtab | remarktab" format="1" from="//macwp" level="any"/>
			</xsl:when>
			<xsl:when test="$element-name='remarktab'">
				<xsl:number count="mac | avmac | tereqtab | remarktab" format="1" from="//macwp" level="any"/>
			</xsl:when>
			<xsl:when test="$element-name='biitab'">
				<xsl:number count="table | biitab | coeitab" format="1" from="//coeibiiwp" level="any"/>
			</xsl:when>
			<xsl:when test="$element-name='bii-opt'">
				<xsl:number count="table | bii-opt | coei-opt" format="1" from="//coeibiiwp" level="any"/>
			</xsl:when>
			<xsl:when test="$element-name='coeitab'">  
				<xsl:number count="table | biitab | coeitab" format="1" from="//coeibiiwp" level="any"/>
			</xsl:when>
			<xsl:when test="$element-name='coei-opt'">   
				<xsl:number count="table | bii-opt | coei-opt" format="1" from="//coeibiiwp" level="any"/>
			</xsl:when>
			<xsl:when test="$element-name='aal'">
				<xsl:number count="aal" format="1" from="//aalwp" level="any"/>
			</xsl:when>
			<xsl:when test="$element-name='explist'">
				<xsl:number count="explist" format="1" from="//explistwp" level="any"/>
			</xsl:when>
			<xsl:when test="$element-name='toolidlist'">
				<xsl:number count="toolidlist" format="1" from="//toolidwp" level="any"/>
			</xsl:when>
			<xsl:when test="$element-name='mrpl'">
				<xsl:number count="mrpl" format="1" from="//mrplwp" level="any"/>
			</xsl:when>
			<xsl:when test="$element-name='csi.tab'">
				<xsl:number count="csi.tab | table" format="1"	from="//csi.wp | //supitemwp" level="any"/>
			</xsl:when>
			<!--CALS Tables-->
			<xsl:when test="$element-name='table'">
				<xsl:number count="crit.insp.tab | pecul.insp.tab | pmcstable | oiptab | mobiltab | table | pshopchk.tab |  mac |  avmac | tereqtab | remarktab | fscap.tab |   mrpl | toolidlist | explist | aal | coeitab | biitab" format="1" from="aalwp | ammowp | auxeqpwp | ammo.markingwp | bdar-geninfowp | bdartoolswp | bulk_itemswp | coeibiiwp | compchklistwp | csi.wp | ctrlindwp | damage-assesswp | descwp |  destruct-introwp | destruct-materialwp | diagnosticwp | dmwr_introwp | dmwr_operationalreqwp | dmwr_qarwp | emergencywp | eqploadwp | explistwp | facilwp | gen.maintwp | genrepairwp | genwp | ginfowp | introwp | inventorywp | loepwp | lubewp | macintrowp | macwp | maintwp | manu_items_introwp | manuwp | mobilwp | mrplwp | natowp | nsnindxwp | oipwp | opcheck-tswp | opcheckwp | opunuwp | opusualwp | orschwp | perseqpwp | //pim | pm-ginfowp | pmcsintrowp | pmcswp | pmi-cklistwp | pmiwp | pms-ginfowp | pms-inspecwp | pnindxwp | ppmgeninfowp | pshopanalwp | qawp | refdesindxwp | refwp | storagewp | stowagewp | substitute-matwp | supitemwp | surwp | techdescwp | thrywp | toolidwp | torquewp | totnum.wps | tsindxwp | tsintrowp | tswp | wiringwp | wtloadwp | softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp | //howtouse" level="any"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- GENERATE TASK NUMBER -->
	<xsl:template name="TASKID">
		<xsl:param name="imtype">
			<xsl:if test="ancestor::gim">
				<xsl:text>GENERAL INFORMATION, EQUIPMENT DESCRIPTION AND THEORY OF OPERATION&#x2002;</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor::opim">
				<xsl:text>OPERATOR INSTRUCTIONS</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor::tim">
				<xsl:text>TROUBLESHOOTING PROCEDURES</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor::mim/maintenancecategory">
				<xsl:text>MAINTENANCE INSTRUCTIONS</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor::mim/ammunitioncategory">
				<xsl:text>AMMUNITION MAINTENANCE INSTRUCTIONS</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor::mim/auxiliarycategory">
				<xsl:text>AUXILIARY EQUIPMENT MAINTENANCE INSTRUCTIONS</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor::pim">
				<xsl:text>REPAIR PARTS LIST&#x2002;</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor::sim">
				<xsl:text>SUPPORTING INFORMATION</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor::dim">
				<xsl:text>DESTRUCTION OF ARMY MATERIEL TO PREVENT ENEMY USE INFORMATION</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor::baim">
				<xsl:text>BATTLE DAMAGE ASSESSMENT INFORMATION</xsl:text>
			</xsl:if>
			<xsl:if test="ancestor::brim">
				<xsl:text>BATTLE DAMAGE REPAIR INFORMATION</xsl:text>
			</xsl:if>	
			<xsl:if test="ancestor::bgim">
				<xsl:text>BDAR GENERAL INFORMATION</xsl:text>
			</xsl:if>					
		</xsl:param>
		<xsl:if test="@wpid">
			<xsl:text disable-output-escaping="no">,&#x2002;</xsl:text>
		</xsl:if>
		<xsl:variable name="TaskNotFound">NOT FOUND (TASKID=<xsl:value-of
				disable-output-escaping="no" select="@taskid"/>)</xsl:variable>
		<xsl:variable name="element-name">
			<xsl:text disable-output-escaping="no">|</xsl:text>
			<xsl:choose>
				<xsl:when
					test="contains('|maintsk|opertsk|opuntsk|groundtsk|tsproc|para0|',name(id(@taskid)))">
					<xsl:for-each select="id(@taskid)">
						<xsl:apply-templates mode="FIND-NON-WCN" select="node()[1]"/>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="contains('proc',name(id(@taskid)))">
					<xsl:for-each select="id(@taskid)">
						<xsl:apply-templates mode="FIND-NON-WCN" select="node()[1]"/>
					</xsl:for-each>
				</xsl:when>


				<xsl:when test="@taskid">
					<fo:basic-link internal-destination="target_{@taskid}">
						<xsl:value-of select="id(@taskid)/title"/>
					</fo:basic-link>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of disable-output-escaping="no" select="name(id(@taskid))"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text disable-output-escaping="no">|</xsl:text>
		</xsl:variable>
				<xsl:if test="ancestor::logicproc">
					<xsl:text disable-output-escaping="no"> - Step </xsl:text>
				</xsl:if>
		<fo:basic-link internal-destination="{@taskid}">
			<xsl:for-each select="id(@taskid)">
				<xsl:choose>
							<xsl:when test="ancestor::logicproc">
<!--     		<xsl:variable name="stepCount" select="count(preceding::step1[ancestor::logicproc/*[@branch or @origin or @step1]])"/>
-->				
<xsl:variable name="stepCount">
								<xsl:number count="step1 | endblock/action/para | test/proc/para" format="1" from="logicproc" level="any"/>
</xsl:variable>								
				<xsl:number format="1." value="number($stepCount + 1)"/>
							</xsl:when>
					<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="contains('|maintsk|opertsk|opuntsk|para0|',name(id(@taskid))) and contains('ammo.markings|ammo.defects|ammo.packing|acptrefinsp|loaddesc|arm|oper|operaux|',$element-name)">
					</xsl:when>
			<xsl:when	test="contains('|proc|ammo.markings|ammo.defects|ammo.packing|acptrefinsp|loaddesc|arm|oper|operaux|',$element-name)">
						<xsl:apply-templates select="title"/>
					</xsl:when>
					<xsl:when test="local-name(.) = 'faultproc'">
						<xsl:value-of select="title"/>
					</xsl:when>
					<xsl:when test="local-name(.) = 'logicproc'">
						<xsl:value-of select="title"/>
					</xsl:when>
					<xsl:when test="local-name(.) = 'proc'">
						<xsl:value-of select="title"/>
					</xsl:when>
					<xsl:when test="local-name(.) = 'pmcsproc'">
						<xsl:choose>
						  <xsl:when test="title"> <!-- problem here is title is optional, do what? if no title -->
							<xsl:value-of select="title"></xsl:value-of>
     					  </xsl:when>
     					  <xsl:otherwise>PMCS Procedure</xsl:otherwise>	
						</xsl:choose>
					</xsl:when>
	<xsl:when test="local-name(.) = 'para0' or local-name(.) = 'subpara1' or local-name(.) = 'subpara2' or local-name(.) = 'subpara3' or local-name(.) = 'subpara4'">
						<xsl:value-of select="title"/>
					</xsl:when>
					<xsl:when test="local-name(.) = 'title'">
						<xsl:value-of select="."/>
					</xsl:when>
                     <xsl:when test="$element-name='softwaremaint'">Software Maintenance</xsl:when>
                     <xsl:when test="local-name(.)='arm'">Activate Ammunition</xsl:when>
                    <xsl:when test="$element-name='install'">Install</xsl:when>
                    <xsl:when test="$element-name='overhaul'">Overhaul</xsl:when>
                    <xsl:when test="$element-name='rebuild'">Rebuild</xsl:when>
                    <xsl:when test="$element-name='unload'">Unload</xsl:when>
					<xsl:when test="$element-name='unpack'">Unpack</xsl:when>
					<xsl:when test="$element-name='preserv'">Preserve</xsl:when>
					<xsl:when test="$element-name='jack'">Jacking</xsl:when>
					<xsl:when test="$element-name='tow'">Towing</xsl:when>
					<xsl:when test="$element-name='park'">Parking</xsl:when>
					<xsl:when test="$element-name='moor'">Mooring</xsl:when>
					<xsl:when test="$element-name='cover'">Cover</xsl:when>
					<xsl:when test="$element-name='hoist'">Hoisting</xsl:when>
					<xsl:when test="$element-name='sling'">Sling Loading</xsl:when>
					<xsl:when test="$element-name='extpwr'">External Power</xsl:when>
					<xsl:when test="$element-name='inspect'">Inspect</xsl:when>
					<xsl:when test="$element-name='remove'">Removal</xsl:when>
					<xsl:when test="$element-name='disassem'">Disassembly</xsl:when>
					<xsl:when test="$element-name='clean'">Cleaning</xsl:when>
					<xsl:when test="$element-name='ndi'">Nondestructive Inspection (NDI)</xsl:when>
					<xsl:when test="$element-name='repair'">Repair</xsl:when>
					<xsl:when test="$element-name='replace'">Replace</xsl:when>
					<xsl:when test="$element-name='align'">Alignment</xsl:when>
					<xsl:when test="$element-name='paint'">Painting</xsl:when>
					<xsl:when test="$element-name='lube'">Lubrication</xsl:when>
					<xsl:when test="$element-name='assem'">Assembly</xsl:when>
					<xsl:when test="$element-name='test'">Test</xsl:when>
					<xsl:when test="$element-name='adjust'">Adjustment</xsl:when>
					<xsl:when test="$element-name='calibration'">Calibration</xsl:when>
					<xsl:when test="$element-name='ris'">Radio Interference Suppression</xsl:when>
					<xsl:when test="$element-name='pis'">Placing In Service</xsl:when>
					<xsl:when test="$element-name='softwaremaint'">Software Maintenance</xsl:when>
					<xsl:when test="$element-name='ppm'">Preservation, Packing, and Marking</xsl:when>
					<xsl:when test="$element-name='orsch'">Overhaul and Retirement Schedule</xsl:when>
					<xsl:when test="$element-name='pss'">Preparation for Storage and	Shipment</xsl:when>
					<xsl:when test="$element-name='service'">Servicing</xsl:when>
					<xsl:when test="$element-name='mobreq'">Mobilization Requirements</xsl:when>
					<xsl:when test="$element-name='unusualenv'">Unusual Environment/Weather</xsl:when>
					<xsl:when test="$element-name='fording'">Fording</xsl:when>
					<xsl:when test="$element-name='ecm'">Jamming and Electronic Countermeasures (ECM)</xsl:when>
					<xsl:when test="$element-name='site'">Siting</xsl:when>
					<xsl:when test="$element-name='shelter'">Shelter</xsl:when>
					<xsl:when test="$element-name='prepforuse'">Assembly and Preparation for Use</xsl:when>
					<xsl:when test="$element-name='initial'">Initial Adjustments, Before Use, and Self-Test</xsl:when>
					<xsl:when test="$element-name='prepmove'">Preparation for Movement</xsl:when>
					<xsl:when test="$element-name='instructplt'">Decals and Instruction Plates</xsl:when>		
					<xsl:when test="$element-name='mark'">Mark</xsl:when>		
					<xsl:when test="$element-name='pack'">Pack</xsl:when>
					<xsl:when test="$element-name='secref'">Security Measures for Electronic Data</xsl:when>	
					<xsl:when test="$element-name='decon'">Interim Chemical, Biological, Radiological, and Nuclear (CBRN) Decontamination</xsl:when>				
					<xsl:when test="$element-name='degraded'">Degraded Operations</xsl:when>					
					<xsl:otherwise>
						<xsl:value-of disable-output-escaping="no" select="$TaskNotFound"/>
					</xsl:otherwise>
				</xsl:choose>
				</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</fo:basic-link>
	</xsl:template>



	<xsl:template match="adjust | align | ammo.defect | ammo.handling | ammo.markings | arm | assem | calibration | caution | clean | decon | disassem | ecm | fording | groundtsk | initial | install | lube | ndi | note | oper | load | unload | softwaremaint | operaux | orsch | paint | pis | ppm | prepforuse | prepmove | pss | remove | repair | test | replace | ris | service | shelter | site | secref | instructplt | degraded | inspect | test-pass | unusualenv | warning | tow | jack | park | moor | cover | hoist | sling | extpwr | proc" mode="FIND-NON-WCN">
		<xsl:choose>
			<xsl:when test="contains('|warning|caution|note|',local-name(.))">
				<xsl:apply-templates mode="FIND-NON-WCN" select="following-sibling::node()[1]"/>
			</xsl:when>
			<xsl:when test="local-name(.)='groundtsk'">
				<xsl:apply-templates mode="FIND-NON-WCN" select="node()[1]"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of disable-output-escaping="no" select="local-name(.)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

<xsl:template name="WPREF">
		<xsl:param name="Wpref"/>
		<xsl:if test="@wpref">
			<xsl:variable name="workpkgref">
				<xsl:value-of disable-output-escaping="no" select="@wpref"/>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="@itemno"/>
				<xsl:otherwise>
					<fo:basic-link internal-destination="{@wpref}" color="black" >
			<xsl:for-each select="//*[@wpno]">
				<xsl:if test="@wpno=$workpkgref">
					<xsl:text>WP&#x2002;</xsl:text>
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
							</xsl:choose>
				</xsl:if>
			</xsl:for-each>
			</fo:basic-link>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	
<!--	<xsl:template name="WPREF">
		<xsl:param name="Wpref"/>
		<xsl:if test="@wpref">
			<xsl:variable name="workpkgref">
				<xsl:value-of disable-output-escaping="no" select="@wpref"/>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="@itemno"/>
				<xsl:otherwise>
					<fo:basic-link internal-destination="{@wpref}" color="black" text-decoration="underline">
						<xsl:for-each select="//*[@wpno]">
							<xsl:if test="@wpno=$workpkgref">
					<xsl:text>WP&#x2002;</xsl:text>
								<xsl:choose>
									<xsl:when test="@wpseq">
										<xsl:value-of select="@wpseq"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:variable name="WpCnt" select="count(preceding::wpidinfo)"/>
										<xsl:variable name="WpIns" select="count(preceding::node()[@insertwp='1'])"/>
										<xsl:choose>
      								<xsl:when test="@insertwp">
      								<xsl:variable name="majorNo" select="count(preceding::*[wpidinfo and not(@insertwp)])"/>
   						<xsl:variable name="minorNo" select="count(preceding::*[wpidinfo and @insertwp and count(preceding::*[wpidinfo and not(@insertwp)]) = $majorNo]) + 1"/>
												<xsl:number format="0000" value="number($majorNo)"/>
        								<xsl:text>.</xsl:text>
        								<xsl:value-of select="$minorNo"/>
      								</xsl:when>
      								<xsl:otherwise>
      								<xsl:variable name="majorNo" select="count(preceding::*[wpidinfo and not(@insertwp)])"/>
												<xsl:number format="0000" value="number($majorNo + 1)"/>
      								</xsl:otherwise>
    								</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</xsl:for-each>
					</fo:basic-link>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>-->
	<xsl:template match="link">
		<xsl:if test="posttext">
			<xsl:value-of disable-output-escaping="no" select="posttext"/>
		</xsl:if>
		<xsl:if test="prompt">
			<xsl:apply-templates select="prompt"/>
		</xsl:if>
		<xsl:if test="pretext">
			<xsl:value-of disable-output-escaping="no" select="pretext"/>
		</xsl:if>
		<xsl:if test="symbol">
			<fo:inline keep-together.within-line="always">
				<xsl:value-of disable-output-escaping="no" select="symbol"/>
			</fo:inline>
		</xsl:if>
    	    <fo:inline font-weight="normal" text-decoration="underline" font-style="italic" >
    	       <xsl:value-of select="@xlink:href"/>
    </fo:inline>
    <xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="prompt">
		<xsl:value-of disable-output-escaping="no" select="prompt"/>
	</xsl:template>
</xsl:stylesheet>
