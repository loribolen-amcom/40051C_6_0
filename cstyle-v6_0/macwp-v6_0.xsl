<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!-- BEGIN Common Template(s)-->
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="macwp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="br">
		<fo:block>
			<xsl:text>&#x2002;</xsl:text>
		</fo:block>
	</xsl:template>

	<!--#######################################################################################################-->
	<xsl:template match="mac">
	<xsl:call-template name="CHANGEBAR"/>
	<fo:block span="all">
				<fo:table-and-caption hyphenate="true" hyphenation-character="-" hyphenation-keep="column">
				<fo:table-caption>
					<fo:block  font-size="10pt" font-weight="bold" keep-with-previous.within-column="always" keep-with-previous.within-page="always" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center" id="{generate-id()}" text-transform="capitalize">
						<xsl:text disable-output-escaping="no">Table&#x2002;</xsl:text>
						<xsl:number count="remarktab | tereqtab | mac | avmac" format="1." from="macwp" level="any"/>
						<xsl:text disable-output-escaping="no">&#x2002;&#x2002;</xsl:text>
						<xsl:apply-templates select="title"/>
					</fo:block>
				</fo:table-caption>
				
				<fo:table width="7.0in" border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt"  font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after.maximum="12pt" space-after.minimum="12pt" space-after.optimum="12pt" space-before.maximum="14pt" space-before.minimum="12pt" space-before.optimum="12pt" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve" hyphenate="true" hyphenation-character="-" hyphenation-keep="column" inline-progression-dimension="100%">
					<fo:table-column column-number="1" column-width="11%"/>
					<fo:table-column column-number="2" column-width="20%"/>
					<fo:table-column column-number="3" column-width="13%"/>
					<fo:table-column column-number="4" column-width="8%"/>
					<fo:table-column column-number="5" column-width="8%"/>
					<fo:table-column column-number="6" column-width="8%"/>
					<fo:table-column column-number="7" column-width="8%"/>
					<fo:table-column column-number="8" column-width="13%"/>
					<fo:table-column column-number="9" column-width="11%"/>
					<xsl:call-template name="MAC-HEADER-2lvl"/>
					<fo:table-body>
						<xsl:apply-templates select="mac-group-2lvl | mac-group"/>
					<xsl:if test="parent::macwp/@marines='yes' or macwp/@navy='yes' or macwp/@airforce='yes'">
						<fo:table-row>
			<fo:table-cell number-columns-spanned="9" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt" >
							<fo:block><xsl:text disable-output-escaping="no">&#x2002;&#x2002;</xsl:text></fo:block>
								<fo:block text-align="center" padding="6pt">*NOTE</fo:block>
					<fo:block text-align="center">This is a joint service manual. While Army uses a “C,” other services may use an “O” in this column.</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:if>
					</fo:table-body>
				
				</fo:table>
			</fo:table-and-caption>
	</fo:block>
	</xsl:template>
	<xsl:template name="MAC-HEADER-2lvl">
		<fo:table-header font-size="7pt" text-align="center" font-weight="bold">
			<fo:table-row>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>(1)</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>(2)</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>(3)</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" number-columns-spanned="4" padding-bottom="4pt" padding-top="4pt">
					<fo:block>(4)</fo:block>
					<fo:block>MAINTENANCE LEVEL</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="8" padding-bottom="4pt" padding-top="4pt">
					<fo:block>(5)</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="9" padding-bottom="4pt" padding-top="4pt">
					<fo:block>(6)</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<!-- ROW for FIELD and SUSTAINMENT -->
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" number-columns-spanned="2" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>FIELD</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="6" number-columns-spanned="2" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>SUSTAINMENT</fo:block>
				</fo:table-cell>
				<!--		-->
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="9" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<!-- Bottom Row -->
			<fo:table-row>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="1" display-align="after" empty-cells="show" number-columns-spanned="1" number-rows-spanned="2" padding-bottom="2pt" padding-top="2pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>GROUP</fo:block>
					<fo:block>NUMBER</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="2" display-align="after" empty-cells="show" number-columns-spanned="1" number-rows-spanned="2" padding-bottom="2pt" padding-top="2pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>COMPONENT/ASSEMBLY</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="3" display-align="after" empty-cells="show" number-columns-spanned="1" number-rows-spanned="2" padding-bottom="2pt" padding-top="2pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>MAINTENANCE</fo:block>
					<fo:block>FUNCTION</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" display-align="after" number-columns-spanned="1" number-rows-spanned="1" padding-bottom="2pt" padding-top="2pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>CREW</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="5" number-rows-spanned="1" padding-bottom="2pt" padding-top="2pt">
					<fo:block>MAIN-</fo:block>
					<fo:block>TAINER</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="6" number-rows-spanned="1" padding-bottom="2pt" padding-top="2pt">
					<fo:block>BELOW</fo:block>
					<fo:block>DEPOT</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="7" display-align="after" number-rows-spanned="1" padding-bottom="2pt" padding-top="2pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>DEPOT</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="8" display-align="after" empty-cells="show" number-columns-spanned="1" number-rows-spanned="2" padding-bottom="2pt" padding-top="2pt">
					<fo:block>TOOLS AND</fo:block>
					<fo:block>EQUIPMENT</fo:block>
					<fo:block>REF CODE</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="9" display-align="after" empty-cells="show" number-columns-spanned="1" number-rows-spanned="2" padding-bottom="2pt" padding-top="2pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>REMARKS</fo:block>
					<fo:block>CODE</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<!-- 4 levels of maintenance -->
			<fo:table-row>
			<xsl:choose>
					<xsl:when test="parent::macwp/@marines='yes' or parent::macwp/@airforce='yes' or parent::macwp/@navy='yes' ">
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" display-align="after" number-columns-spanned="1" number-rows-spanned="1" padding-bottom="2pt" padding-top="2pt">
					<fo:block>(C)*</fo:block>
				</fo:table-cell>
				</xsl:when>
				<xsl:otherwise>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" display-align="after" padding-bottom="2pt" padding-top="2pt" starts-row="false">
					<fo:block>(C)</fo:block>
				</fo:table-cell>
				</xsl:otherwise>
			</xsl:choose>
				
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="5" display-align="after" padding-bottom="2pt" padding-top="2pt">
					<fo:block>(F)</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="6" display-align="after" padding-bottom="2pt" padding-top="2pt">
					<fo:block>(H)</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="7" display-align="after" padding-bottom="2pt" padding-top="2pt">
					<fo:block>(D)</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>

	<xsl:template match="mac-group-2lvl">
	<!--<xsl:call-template name="CHANGEBAR"/>-->
		<fo:table-row>
			<fo:table-cell border-left="solid black" border-left-width=".5pt" padding-top="5pt">
				<fo:block space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm">
					<xsl:value-of select="groupno"/>
				</fo:block>
			</fo:table-cell>
			<xsl:choose>
				<xsl:when test="compassem">
					<xsl:apply-templates select="compassem[1]"/>
					<xsl:apply-templates select="qualify-2lvl[1]"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="compassemgroup-2lvl[1]/compassem"/>
					<xsl:apply-templates select="compassemgroup-2lvl[1]/qualify-2lvl[1]"/>
				</xsl:otherwise>
			</xsl:choose>
		</fo:table-row>
		<xsl:choose>
			<xsl:when test="compassem">
				<xsl:apply-templates select="qualify-2lvl[position()>1]"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="compassemgroup-2lvl[1]/qualify-2lvl[position()>1]"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="compassemgroup-2lvl[position()>1]"/>
	</xsl:template>
<xsl:template match="compassem">

		<fo:table-cell border-left="solid black" border-left-width=".5pt" padding-after="4pt" padding-before="4pt" border-right-style="solid" border-right-width="0.5pt" keep-together.within-column="always">
			<fo:block space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm">
			<xsl:call-template name="CHANGEBAR"/>
				<xsl:apply-templates/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
<xsl:template match="compassemgroup-2lvl">
		<xsl:if test="preceding-sibling::compassemgroup-2lvl">
			<fo:table-row>
				<fo:table-cell border-left="solid black" border-left-width=".5pt" padding-after="4pt" padding-before="4pt">
					<fo:block>
						<xsl:text>&#x2003;</xsl:text>
					</fo:block>
				</fo:table-cell>
				<xsl:apply-templates select="compassem[1]"/>
				<xsl:apply-templates select="qualify-2lvl[1]"/>
			</fo:table-row>
			<xsl:apply-templates select="qualify-2lvl[position()>1]"/>
		</xsl:if>
	</xsl:template>
<xsl:template match="qualify-2lvl">
	
		<xsl:choose>
			<xsl:when test="preceding-sibling::qualify-2lvl">
				<fo:table-row>
					<fo:table-cell border-left="solid black" border-left-width=".5pt" padding-after="4pt" padding-before="4pt">
						<fo:block><xsl:call-template name="CHANGEBAR_2"/>
							<xsl:text>&#x2003;</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-left="solid black" border-left-width=".5pt" padding-after="4pt" padding-before="4pt">
						<fo:block>
							<xsl:text>&#x2003;</xsl:text>
						</fo:block>
					</fo:table-cell>
					<xsl:call-template name="do-maintQualifier"/>
				</fo:table-row>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="do-maintQualifier"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="do-maintQualifier">
		<fo:table-cell border-left="solid black" border-right="solid black" border-right-width="0.5pt" border-left-width=".5pt" padding-after="4pt" padding-before="4pt">
			<fo:block text-align="left" space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm">
				<xsl:choose>
					<xsl:when test="normalize-space(maintfunc/@func)">
						<xsl:choose>
							<xsl:when test="maintfunc/@func='adjust'">Adjust</xsl:when>
							<xsl:when test="maintfunc/@func='align'">Align</xsl:when>
							<xsl:when test="maintfunc/@func='arm'">Arming</xsl:when>
							<xsl:when test="maintfunc/@func='assem'">Assemble</xsl:when>
							<xsl:when test="maintfunc/@func='calibration'">Calibrate</xsl:when>
							<xsl:when test="maintfunc/@func='clean'">Clean</xsl:when>
							<xsl:when test="maintfunc/@func='cover'">Covering</xsl:when>
							<xsl:when test="maintfunc/@func='configure'">Configure</xsl:when>
							<xsl:when test="maintfunc/@func='debug'">Debug</xsl:when>
							<xsl:when test="maintfunc/@func='disassem'">Disassemble</xsl:when>
							<xsl:when test="maintfunc/@func='extpwr'">External Power</xsl:when>
							<xsl:when test="maintfunc/@func='hoist'">Hoisting</xsl:when>
							<xsl:when test="maintfunc/@func='inspect'">Inspect</xsl:when>
							<xsl:when test="maintfunc/@func='installperdev'">Install Peripheral Device</xsl:when>
							<xsl:when test="maintfunc/@func='install'">Install</xsl:when>
							<xsl:when test="maintfunc/@func='jack'">Jacking</xsl:when>
							<xsl:when test="maintfunc/@func='load'">Loading</xsl:when>
							<xsl:when test="maintfunc/@func='lube'">Lubricate/Lubrication</xsl:when>
							<xsl:when test="maintfunc/@func='mark'">Marking</xsl:when>
							<xsl:when test="maintfunc/@func='moor'">Mooring</xsl:when>
							<xsl:when test="maintfunc/@func='ndi'">Non Destructive Inspection</xsl:when>
														
							<xsl:when test="maintfunc/@func='other.maintsk'">Other</xsl:when>
							
							<xsl:when test="maintfunc/@func='overhaul'">Overhaul</xsl:when>
							<xsl:when test="maintfunc/@func='pack'">Packing</xsl:when>
							<xsl:when test="maintfunc/@func='paint'">Paint</xsl:when>
							<xsl:when test="maintfunc/@func='park'">Parking</xsl:when>
							<xsl:when test="maintfunc/@func='pis'">Place In Service</xsl:when>
							<xsl:when test="maintfunc/@func='prepship'">Preparation for Shipment</xsl:when>
							<xsl:when test="maintfunc/@func='prepstore'">Preparation for Storage</xsl:when>
							<xsl:when test="maintfunc/@func='prepforuse'">Preparation for Use</xsl:when>
							<xsl:when test="maintfunc/@func='preserv'">Preservation</xsl:when>
							<xsl:when test="maintfunc/@func='rebuild'">ebuild</xsl:when>
							<xsl:when test="maintfunc/@func='remove'">Remove</xsl:when>
							<xsl:when test="maintfunc/@func='repair'">Repair</xsl:when>
							<xsl:when test="maintfunc/@func='replace'">Replace</xsl:when>
							<xsl:when test="maintfunc/@func='ris'">Radio Interference Suppression</xsl:when>
							<xsl:when test="maintfunc/@func='service'">Service</xsl:when>
							<xsl:when test="maintfunc/@func='sling'">Slinging</xsl:when>
							<xsl:when test="maintfunc/@func='softwaremaint'">Software Maintenance</xsl:when>
							<xsl:when test="maintfunc/@func='test'">Test</xsl:when>
							<xsl:when test="maintfunc/@func='transport'">Transport</xsl:when>
							<xsl:when test="maintfunc/@func='tow'">Towing</xsl:when>
							<xsl:when test="maintfunc/@func='uninstallperdev'">Uninstall Peripheral Device</xsl:when>
							<xsl:when test="maintfunc/@func='unload'">Unloading</xsl:when>
							<xsl:when test="maintfunc/@func='unpack'">Unpacking</xsl:when>
							<xsl:when test="maintfunc/@func='upgrade'">Upgrade/patch</xsl:when>
							<xsl:when test="maintfunc/@func='none'">&#x2002;</xsl:when>
							
						</xsl:choose>
						<xsl:apply-templates select="br"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>&#x2003;</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell text-align="center" padding-after="4pt" padding-before="4pt" border-right="solid black" border-right-width="0.5pt">
			<xsl:choose>
				<xsl:when test="normalize-space(maintclass-2lvl/c) ">
					<fo:block>
						<xsl:apply-templates select="maintclass-2lvl/c"/>
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
				<fo:block>
					<xsl:text>&#x2003;</xsl:text>
					</fo:block>
				</xsl:otherwise>
			</xsl:choose>
		</fo:table-cell>
		<fo:table-cell text-align="center" padding-after="4pt" padding-before="4pt" border-right-style="solid" border-right-width="0.5pt">
			<xsl:choose>
				<xsl:when test="normalize-space(maintclass-2lvl/f)">
					<fo:block>
						<xsl:apply-templates select="maintclass-2lvl/f"/>
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
				<fo:block>
					<xsl:text>&#x2003;</xsl:text>
					</fo:block>
				</xsl:otherwise>
			</xsl:choose>
		</fo:table-cell>
		<fo:table-cell text-align="center" padding-after="4pt" padding-before="4pt" border-right-style="solid" border-right-width="0.5pt">
			<xsl:choose>
				<xsl:when test="normalize-space(maintclass-2lvl/h)">
					<fo:block>
						<xsl:apply-templates select="maintclass-2lvl/h"/>
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
				<fo:block>
					<xsl:text>&#x2003;</xsl:text>
					</fo:block>
				</xsl:otherwise>
			</xsl:choose>
		</fo:table-cell>
		<fo:table-cell text-align="center" padding-after="4pt" padding-before="4pt" border-right-style="solid" border-right-width="0.5pt">
			<xsl:choose>
				<xsl:when test="normalize-space(maintclass-2lvl/d)">
					<fo:block>
						<xsl:apply-templates select="maintclass-2lvl/d"/>
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
				<fo:block>
					<xsl:text>&#x2003;</xsl:text>
					</fo:block>
				</xsl:otherwise>
			</xsl:choose>
		</fo:table-cell>
		<fo:table-cell text-align="left" padding-after="4pt" padding-before="4pt" border-right-style="solid" border-right-width="0.5pt">
			<fo:block space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm" width="1.5in">
				<xsl:choose>
					<xsl:when test="normalize-space(terefs[1]/teref[1]/@refs[1])">
						<xsl:apply-templates select="terefs/teref"/>
						<xsl:choose>
							<xsl:when test="following-sibling::teref">
								<xsl:text disable-output-escaping="no">, </xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>&#x2003;</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>&#x2003;</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-left="2pt" padding-after="4pt" padding-before="4pt">
			<xsl:choose>
				<xsl:when test="normalize-space(remarkrefs[1]/remarkref[1]/@refs[1])">
				<fo:block>
					<xsl:apply-templates select="remarkrefs/remarkref"/>
					<xsl:text>&#x2003;</xsl:text>
					<xsl:if test="following-sibling::remarkref">
						<xsl:text disable-output-escaping="no">, </xsl:text>
					</xsl:if>
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
				<fo:block>
					<xsl:text>&#x2003;</xsl:text>
					</fo:block>
				</xsl:otherwise>
			</xsl:choose>
		</fo:table-cell>
		<xsl:apply-templates select="br"/>
	</xsl:template>
	<xsl:template name="MAC-HEADER">
		<fo:table-header font-size="7pt" text-align="center">
			<fo:table-row>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>(1)</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>(2)</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>(3)</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" number-columns-spanned="4" padding-bottom="4pt" padding-top="4pt">
					<fo:block>(4)</fo:block>
					<fo:block>MAINTENANCE LEVEL</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="8" padding-bottom="4pt" padding-top="4pt">
					<fo:block>(5)</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="9" padding-bottom="4pt" padding-top="4pt">
					<fo:block>(6)</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<!-- ROW for FIELD and SUSTAINMENT -->
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" number-columns-spanned="2" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>FIELD</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="6" number-columns-spanned="2" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>SUSTAINMENT</fo:block>
				</fo:table-cell>
				<!--		-->
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="9" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="1" display-align="after" empty-cells="show" number-columns-spanned="1" number-rows-spanned="2" padding-bottom="2pt" padding-top="2pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>GROUP</fo:block>
					<fo:block>NUMBER</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="2" display-align="after" empty-cells="show" number-columns-spanned="1" number-rows-spanned="2" padding-bottom="2pt" padding-top="2pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>COMPONENT/ASSEMBLY</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="3" display-align="after" empty-cells="show" number-columns-spanned="1" number-rows-spanned="2" padding-bottom="2pt" padding-top="2pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>MAINTENANCE</fo:block>
					<fo:block>FUNCTION</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" display-align="after" number-columns-spanned="1" number-rows-spanned="1" padding-bottom="2pt" padding-top="2pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>CREW</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="5" number-rows-spanned="1" padding-bottom="2pt" padding-top="2pt">
					<fo:block>MAIN&#x2003;</fo:block>
					<fo:block>TAINER</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="6" number-rows-spanned="1" padding-bottom="2pt" padding-top="2pt">
					<fo:block>BELOW</fo:block>
					<fo:block>DEPOT</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="7" display-align="after" number-rows-spanned="1" padding-bottom="2pt" padding-top="2pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>DEPOT</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="8" display-align="after" empty-cells="show" number-columns-spanned="1" number-rows-spanned="2" padding-bottom="2pt" padding-top="2pt">
					<fo:block>TOOLS AND</fo:block>
					<fo:block>EQUIPMENT</fo:block>
					<fo:block>REF CODE</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="9" display-align="after" empty-cells="show" number-columns-spanned="1" number-rows-spanned="2" padding-bottom="2pt" padding-top="2pt">
					<fo:block>&#x2002;</fo:block>
					<fo:block>REMARKS</fo:block>
					<fo:block>CODE</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
						<xsl:choose>
				<xsl:when test="parent::macwp/@marines='yes' or parent::macwp/@airforce='yes' or parent::macwp/@navy='yes' ">
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" display-align="after" number-columns-spanned="1" number-rows-spanned="1" padding-bottom="2pt" padding-top="2pt">
					<fo:block>(C)*</fo:block>
				</fo:table-cell>
				</xsl:when>
				<xsl:otherwise>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" display-align="after" padding-bottom="2pt" padding-top="2pt" starts-row="false">
					<fo:block>(C)</fo:block>
				</fo:table-cell>
				</xsl:otherwise>
			</xsl:choose>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="5" display-align="after" padding-bottom="2pt" padding-top="2pt">
					<fo:block>)(F)</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="6" display-align="after" padding-bottom="2pt" padding-top="2pt">
					<fo:block>(H)</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="7" display-align="after" padding-bottom="2pt" padding-top="2pt">
					<fo:block>(D)</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<!--END [mac table...mil-std-2361D] stuff ...    -->
	<!--#######################################################################################################-->
	<xsl:template match="avmac">
	<xsl:call-template name="CHANGEBAR"/>
			<xsl:if test="@id">
				<xsl:attribute name="id"><xsl:value-of disable-output-escaping="no" select="@id"/></xsl:attribute>
			</xsl:if>
			<fo:block span="all"  >
			<fo:table-and-caption hyphenate="true" hyphenation-character="-" hyphenation-keep="column">
				<fo:table-caption>
					<fo:block  font-size="10pt" font-weight="bold" keep-with-previous.within-column="always" keep-with-previous.within-page="always" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center">
						<xsl:text disable-output-escaping="no">Table&#x2002;</xsl:text>
						<xsl:number count="remarktab | tereqtab | mac | avmac" format="1." from="macwp" level="any"/>
						<xsl:text disable-output-escaping="no">&#x2002;&#x2002;</xsl:text>
						<xsl:apply-templates select="title"/>
					</fo:block>
				</fo:table-caption>
				<fo:table width="7.0in" border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt"  font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after.maximum="12pt" space-after.minimum="12pt" space-after.optimum="12pt" space-before.maximum="14pt" space-before.minimum="12pt" space-before.optimum="12pt" span="all" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve" hyphenate="true" hyphenation-character="-" hyphenation-keep="column">
					<fo:table-column column-number="1" column-width="9%"/>
					<fo:table-column column-number="2" column-width="20%"/>
					<fo:table-column column-number="3" column-width="15%"/>
					<fo:table-column column-number="4" column-width="7%"/>
					<fo:table-column column-number="5" column-width="7%"/>
					<fo:table-column column-number="6" column-width="7%"/>
					<fo:table-column column-number="7" column-width="7%"/>
					<fo:table-column column-number="8" column-width="15%"/>
					<fo:table-column column-number="9" column-width="13%"/>
					<xsl:call-template name="AVMAC-HEADER-2lvl"/>
					<fo:table-body>
						<xsl:apply-templates select="avmac-group-2lvl"/>
					</fo:table-body>
				</fo:table>
			</fo:table-and-caption>
		</fo:block>
		</xsl:template>
	<!--
<!ELEMENT avmac-group (groupno, ((compassem, avqualify+) | avcompassem-group+))>
-->
	<!--GENERATE TOOL NUMBER -->
	<xsl:template name="TOOLID">
		<xsl:param name="tool-name">
			<xsl:for-each select="id(terefs/teref/@refs[1])">
				<xsl:choose>
					<xsl:when test="local-name(.)='macwp/tereqtab/teref-group/terefcode[1]'">
						<xsl:value-of disable-output-escaping="no" select="local-name(macwp/tereqtab/teref-group/terefcode[1])"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of disable-output-escaping="no" select="local-name(.)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:param>
	</xsl:template>
	<!-- <!ELEMENT avmac-group (groupno, ((compassem, avqualify+) | avcompassem-group+))> border-left="thin solid black" border-right="thin solid black"
-->
	<xsl:template name="AVMAC-HEADER-2lvl">
		<fo:table-header font-size="7pt" text-align="center" font-weight="bold">
			<fo:table-row>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>(1)</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>(2)</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>(3)</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" number-columns-spanned="4" padding-bottom="4pt" padding-top="4pt">
					<fo:block>(4)</fo:block>
					<fo:block>MAINTENANCE LEVEL</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="8" padding-bottom="4pt" padding-top="4pt">
					<fo:block>(5)</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="9" padding-bottom="4pt" padding-top="4pt">
					<fo:block>(6)</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<!-- ROW for FIELD and SUSTAINMENT -->
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" number-columns-spanned="2" padding-bottom="4pt" padding-top="4pt">
					<fo:block>FIELD</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="6" number-columns-spanned="2" padding-bottom="4pt" padding-top="4pt">
					<fo:block>SUSTAINMENT</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="1" display-align="after" empty-cells="show" number-columns-spanned="1" number-rows-spanned="2" padding-bottom="2pt" padding-top="2pt">
					<fo:block>GROUP</fo:block>
					<fo:block>NUMBER</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="2" display-align="after" empty-cells="show" number-columns-spanned="1" number-rows-spanned="2" padding-bottom="2pt" padding-top="2pt">
					<fo:block>DESCRIPTION</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="3" display-align="after" empty-cells="show" number-columns-spanned="1" number-rows-spanned="2" padding-bottom="2pt" padding-top="2pt">
					<fo:block>MAINTENANCE</fo:block>
					<fo:block>FUNCTION</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" display-align="after" number-columns-spanned="1" number-rows-spanned="1" padding-bottom="2pt" padding-top="2pt">
					<fo:block>AMC</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="5" display-align="after" number-columns-spanned="1" number-rows-spanned="1" padding-bottom="2pt" padding-top="2pt">
					<fo:block>ASB</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="6" number-rows-spanned="1" padding-bottom="2pt" padding-top="2pt">
					<fo:block>TASMG</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="7" number-rows-spanned="1" padding-bottom="2pt" padding-top="2pt">
					<fo:block>DEPOT</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="8" display-align="after" empty-cells="show" number-columns-spanned="1" number-rows-spanned="2" padding-bottom="2pt" padding-top="2pt">
					<fo:block>TOOLS AND</fo:block>
					<fo:block>EQUIPMENT</fo:block>
					<fo:block>REF CODE</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="9" display-align="after" empty-cells="show" number-columns-spanned="1" number-rows-spanned="2" padding-bottom="2pt" padding-top="2pt">
					<fo:block>REMARKS</fo:block>
					<fo:block>CODE</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" display-align="after" padding-bottom="2pt" padding-top="2pt" starts-row="false">
					<fo:block>O</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="5" display-align="after" padding-bottom="2pt" padding-top="2pt">
					<fo:block>F</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="6" display-align="after" padding-bottom="2pt" padding-top="2pt">
					<fo:block>L</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="7" display-align="after" padding-bottom="2pt" padding-top="2pt">
					<fo:block>D</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<!--  avmac-group-2lvl (groupno, ((compassem, avqualify-2lvl+) |  avcompassem-group-2lvl+))>  -->
	<xsl:template match="avqualify-2lvl">
		<xsl:choose>
			<xsl:when test="preceding-sibling::avqualify-2lvl">
				<fo:table-row>
					<fo:table-cell border-left="solid black" border-left-width=".5pt" padding-after="4pt" padding-before="4pt">
						<fo:block>
							<xsl:text>&#x2003;</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-left="solid black" border-left-width=".5pt" padding-after="4pt" padding-before="4pt">
						<fo:block>
							<xsl:text>&#x2003;</xsl:text>
						</fo:block>
					</fo:table-cell>
					<xsl:call-template name="do-maintAVqualifier-2lvl"/>
				</fo:table-row>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="do-maintAVqualifier-2lvl"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
<xsl:template match="avmac-group-2lvl">

		<fo:table-row>
			<fo:table-cell border-left="solid black" border-left-width=".5pt" padding-top="5pt"><xsl:call-template name="CHANGEBAR"/>
				<fo:block space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm">
					<xsl:value-of select="groupno"/>
				</fo:block>
			</fo:table-cell>
<xsl:choose>
				<xsl:when test="compassem">
					<xsl:apply-templates select="compassem[1]"/>
					<xsl:apply-templates select="avqualify-2lvl[1]"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="avcompassem-group-2lvl[1]/compassem"/>
					<xsl:apply-templates select="avcompassem-group-2lvl[1]/avqualify-2lvl[1]"/>
				</xsl:otherwise>
			</xsl:choose>
		</fo:table-row>
		<xsl:choose>
			<xsl:when test="compassem">
				<xsl:apply-templates select="avqualify-2lvl[position()>1]"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="avcompassem-group-2lvl[1]/avqualify-2lvl[position()>1]"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="avcompassem-group-2lvl[position()>1]"/>

	</xsl:template>
	
	<xsl:template match="avcompassem-group-2lvl">
		<xsl:if test="preceding-sibling::avcompassem-group-2lvl">
			<fo:table-row>
				<fo:table-cell border-left="solid black" border-left-width=".5pt"
					padding-after="4pt" padding-before="4pt">
					<fo:block>
						<xsl:text>&#x2003;</xsl:text>
					</fo:block>
				</fo:table-cell>
				<xsl:apply-templates select="compassem[1]"/>
					<xsl:apply-templates select="avqualify-2lvl[1]"/>
			</fo:table-row>
			<xsl:apply-templates select="avqualify-2lvl[position()>1]"/>
		</xsl:if>
	</xsl:template>

		<xsl:template name="do-maintAVqualifier-2lvl">
		<fo:table-cell border-left="solid black" border-right="solid black" border-right-width="0.5pt" border-left-width=".5pt" padding-after="4pt" padding-before="4pt">
			<fo:block text-align="left" space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm">
							<xsl:choose>
									<xsl:when test="normalize-space(maintfunc/@func)">
										<xsl:choose>
							<xsl:when test="maintfunc/@func='adjust'">Adjust</xsl:when>
							<xsl:when test="maintfunc/@func='align'">Align</xsl:when>
							<xsl:when test="maintfunc/@func='arm'">Arming</xsl:when>
							<xsl:when test="maintfunc/@func='assem'">Assemble</xsl:when>
							<xsl:when test="maintfunc/@func='calibration'">Calibrate</xsl:when>
							<xsl:when test="maintfunc/@func='clean'">Clean</xsl:when>
							<xsl:when test="maintfunc/@func='cover'">Covering</xsl:when>
							<xsl:when test="maintfunc/@func='configure'">Configure</xsl:when>
							<xsl:when test="maintfunc/@func='debug'">Debug</xsl:when>
							<xsl:when test="maintfunc/@func='disassem'">Disassemble</xsl:when>
							<xsl:when test="maintfunc/@func='extpwr'">External Power</xsl:when>
							<xsl:when test="maintfunc/@func='hoist'">Hoisting</xsl:when>
							<xsl:when test="maintfunc/@func='inspect'">Inspect</xsl:when>
							<xsl:when test="maintfunc/@func='installperdev'">Install Peripheral Device</xsl:when>
							<xsl:when test="maintfunc/@func='install'">Install</xsl:when>
							<xsl:when test="maintfunc/@func='jack'">Jacking</xsl:when>
							<xsl:when test="maintfunc/@func='load'">Loading</xsl:when>
							<xsl:when test="maintfunc/@func='lube'">Lubricate/Lubrication</xsl:when>
							<xsl:when test="maintfunc/@func='mark'">Marking</xsl:when>
							<xsl:when test="maintfunc/@func='moor'">Mooring</xsl:when>
							<xsl:when test="maintfunc/@func='ndi'">Non Destructive Inspection</xsl:when>
														
							<xsl:when test="maintfunc/@func='other.maintsk'">Other</xsl:when>
							
							<xsl:when test="maintfunc/@func='overhaul'">Overhaul</xsl:when>
							<xsl:when test="maintfunc/@func='pack'">Packing</xsl:when>
							<xsl:when test="maintfunc/@func='paint'">Paint</xsl:when>
							<xsl:when test="maintfunc/@func='park'">Parking</xsl:when>
							<xsl:when test="maintfunc/@func='pis'">Place In Service</xsl:when>
							<xsl:when test="maintfunc/@func='prepship'">Preparation for Shipment</xsl:when>
							<xsl:when test="maintfunc/@func='prepstore'">Preparation for Storage</xsl:when>
							<xsl:when test="maintfunc/@func='prepforuse'">Preparation for Use</xsl:when>
							<xsl:when test="maintfunc/@func='preserv'">Preservation</xsl:when>
							<xsl:when test="maintfunc/@func='rebuild'">ebuild</xsl:when>
							<xsl:when test="maintfunc/@func='remove'">Remove</xsl:when>
							<xsl:when test="maintfunc/@func='repair'">Repair</xsl:when>
							<xsl:when test="maintfunc/@func='replace'">Replace</xsl:when>
							<xsl:when test="maintfunc/@func='ris'">Radio Interference Suppression</xsl:when>
							<xsl:when test="maintfunc/@func='service'">Service</xsl:when>
							<xsl:when test="maintfunc/@func='sling'">Slinging</xsl:when>
							<xsl:when test="maintfunc/@func='softwaremaint'">Software Maintenance</xsl:when>
							<xsl:when test="maintfunc/@func='test'">Test</xsl:when>
							<xsl:when test="maintfunc/@func='transport'">Transport</xsl:when>
							<xsl:when test="maintfunc/@func='tow'">Towing</xsl:when>
							<xsl:when test="maintfunc/@func='uninstallperdev'">Uninstall Peripheral Device</xsl:when>
							<xsl:when test="maintfunc/@func='unload'">Unloading</xsl:when>
							<xsl:when test="maintfunc/@func='unpack'">Unpacking</xsl:when>
							<xsl:when test="maintfunc/@func='upgrade'">Upgrade/patch</xsl:when>
							<xsl:when test="maintfunc/@func='none'">&#x2002;</xsl:when>
							
						</xsl:choose>
										<xsl:apply-templates select="br"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>&#x2003;</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
			</fo:block>
		</fo:table-cell>
<fo:table-cell text-align="center" padding-after="4pt" padding-before="4pt" border-right="solid black" border-right-width="0.5pt">
									<xsl:choose>
										<xsl:when test="normalize-space(avmaintclass-2lvl/o) ">
										<fo:block>
											<xsl:apply-templates select="avmaintclass-2lvl/o"/>
											</fo:block>
										</xsl:when>
										<xsl:otherwise>
										<fo:block>
											<xsl:text>&#x2003;</xsl:text>
											</fo:block>
										</xsl:otherwise>
									</xsl:choose>
								</fo:table-cell>
								<fo:table-cell text-align="center" padding-after="4pt" padding-before="4pt" border-right-style="solid" border-right-width="0.5pt">
									<xsl:choose>
										<xsl:when test="normalize-space(avmaintclass-2lvl/f)"><fo:block>
											<xsl:apply-templates select="avmaintclass-2lvl/f"/>
											</fo:block>
										</xsl:when>
										<xsl:otherwise>
											<fo:block>
											<xsl:text>&#x2003;</xsl:text>
											</fo:block>
										</xsl:otherwise>
									</xsl:choose>
								</fo:table-cell>
								<fo:table-cell text-align="center" padding-after="4pt" padding-before="4pt" border-right-style="solid" border-right-width="0.5pt">
									<xsl:choose>
										<xsl:when test="normalize-space(avmaintclass-2lvl/l)">
										<fo:block>
											<xsl:apply-templates select="avmaintclass-2lvl/l"/>
											</fo:block>
										</xsl:when>
										<xsl:otherwise>
											<fo:block>
											<xsl:text>&#x2003;</xsl:text>
											</fo:block>
										</xsl:otherwise>
									</xsl:choose>
								</fo:table-cell>
								<fo:table-cell text-align="center" padding-after="4pt" padding-before="4pt" border-right-style="solid" border-right-width="0.5pt">
									<xsl:choose>
										<xsl:when test="normalize-space(avmaintclass-2lvl/d)">
										<fo:block>
											<xsl:apply-templates select="avmaintclass-2lvl/d"/>
											</fo:block>
										</xsl:when>
										<xsl:otherwise>
											<fo:block>
											<xsl:text>&#x2003;</xsl:text>
											</fo:block>
										</xsl:otherwise>
									</xsl:choose>
								</fo:table-cell>
								<fo:table-cell text-align="left" padding-after="4pt" padding-before="4pt" border-right-style="solid" border-right-width="0.5pt">
									<fo:block space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm" width="1.5in">
										<xsl:choose>
											<xsl:when test="normalize-space(terefs[1]/teref[1]/@refs[1])">
												<xsl:apply-templates select="terefs/teref"/>
												<xsl:choose>
													<xsl:when test="following-sibling::teref">
														<xsl:text disable-output-escaping="no">, </xsl:text>
													</xsl:when>
													<xsl:otherwise>
														<fo:block>
											<xsl:text>&#x2003;</xsl:text>
											</fo:block>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:otherwise>
												<fo:block>
											<xsl:text>&#x2003;</xsl:text>
											</fo:block>
											</xsl:otherwise>
										</xsl:choose>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-left="2pt" padding-after="4pt" padding-before="4pt">
									<xsl:choose>
										<xsl:when test="normalize-space(remarkrefs[1]/remarkref[1]/@refs[1])">
										<fo:block>
											<xsl:apply-templates select="remarkrefs/remarkref"/>
											<xsl:text>&#x2003;</xsl:text>
											<xsl:if test="following-sibling::remarkref">
												<xsl:text disable-output-escaping="no">, </xsl:text>
											</xsl:if></fo:block>
										</xsl:when>
										<xsl:otherwise>
											<fo:block>
											<xsl:text>&#x2003;</xsl:text>
											</fo:block>
										</xsl:otherwise>
									</xsl:choose>
								</fo:table-cell>
					<xsl:apply-templates select="br"/>
	</xsl:template>
	<xsl:template match="terefs/teref | remarkrefs/remarkref">
	<xsl:call-template name="CHANGEBAR"/>
		<xsl:call-template name="MACREF">
			<xsl:with-param name="IdString" select="@refs"/>
		</xsl:call-template>
		<xsl:choose>
			<xsl:when test="following-sibling::*">
				<xsl:text disable-output-escaping="no">, </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>&#x2003;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="MACREF">
		<xsl:param name="IdString"/>
		<xsl:variable name="IdRef">
			<xsl:value-of disable-output-escaping="no" select="substring-before($IdString,' ')"/>
		</xsl:variable>
		<xsl:variable name="Remaining">
			<xsl:value-of disable-output-escaping="no" select="substring-after($IdString,' ')"/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="string-length($IdRef)>0">
				<xsl:value-of disable-output-escaping="no" select="id($IdRef)"/>
				<xsl:if test="string-length($Remaining)>0">, <xsl:call-template name="MACREF">
						<xsl:with-param name="IdString" select="$Remaining"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:when test="string-length($IdString)>0">
				<xsl:value-of disable-output-escaping="no" select="id($IdString)"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="qualify-2lvl/maintfunc/@func | qualify-2lvl/remarkrefs | avqualify-2lvl/maintfunc/@func | avqualify-2lvl/remarkrefs">
</xsl:template>
	<xsl:template match="mac/title | avmac/title | tereqtab/title | remarktab/title">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="tereqtab">
	<xsl:call-template name="CHANGEBAR"/>
	<fo:block span="all">
		<fo:table-and-caption hyphenate="true" hyphenation-character="-" hyphenation-keep="column">
			<fo:table-caption>
				<fo:block  font-size="10pt" font-weight="bold" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center" id="{generate-id(.)}">
					<xsl:text disable-output-escaping="no">Table&#x2002;</xsl:text>
					<xsl:number count="remarktab | tereqtab | mac | avmac" format="1." from="macwp" level="any"/>
					<xsl:text disable-output-escaping="no">&#x2002;&#x2002;</xsl:text>
					<xsl:apply-templates select="title"/>
				</fo:block>
			</fo:table-caption>
			<fo:table border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt"  font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after.maximum="12pt" space-after.minimum="12pt" space-after.optimum="12pt" space-before.maximum="14pt" space-before.minimum="12pt" space-before.optimum="12pt" width="7in" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve" hyphenate="true" hyphenation-character="-" hyphenation-keep="column">
				<fo:table-column column-number="1" column-width="15%"/>
				<fo:table-column column-number="2" column-width="13%"/>
				<fo:table-column column-number="3" column-width="40%"/>
				<fo:table-column column-number="4" column-width="17%"/>
				<fo:table-column column-number="5" column-width="15%"/>
				<xsl:call-template name="TEREQTAB-HEADER"/>
				<fo:table-body>
					<xsl:apply-templates select="teref-group"/>
				</fo:table-body>
			</fo:table>
		</fo:table-and-caption>
</fo:block>
	</xsl:template>
	<xsl:template name="TEREQTAB-HEADER">
		<fo:table-header font-size="7pt" font-weight="bold" text-align="center">
			<fo:table-row>
				<fo:table-cell border-bottom-style="solid" border-bottom-width=".75pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>TOOLS OR TEST</fo:block>
					<fo:block>EQUIPMENT</fo:block>
					<fo:block>REF CODE</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width=".75pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>&#x2003;</fo:block>
					<fo:block>MAINTENANCE</fo:block>
					<fo:block>LEVEL</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width=".75pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>&#x2003;</fo:block>
					<fo:block>&#x2003;</fo:block>
					<fo:block>NOMENCLATURE</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width=".75pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>NATIONAL</fo:block>
					<fo:block>STOCK</fo:block>
					<fo:block>NUMBER</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width=".75pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>&#x2003;</fo:block>
					<fo:block>TOOL</fo:block>
					<fo:block>NUMBER</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<xsl:template match="teref-group">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-row>
			<xsl:apply-templates select="terefcode"/>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="terefcode">
		<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="1" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
			<fo:block span="all" text-align="center">
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="2" padding-bottom="4pt" padding-top="4pt" starts-row="false" text-transform="uppercase">
			<fo:block span="all" text-align="center">
				<xsl:choose>
					<xsl:when test="preceding::mac">
						<xsl:choose>
							<xsl:when test="following-sibling::maintenance[@lvl='o']">O</xsl:when>
							<xsl:when test="following-sibling::maintenance[@lvl='f']">F</xsl:when>
							<xsl:when test="following-sibling::maintenance[@lvl='d']">D</xsl:when>
							<xsl:when test="following-sibling::maintenance[@lvl='c']">C</xsl:when>
							<xsl:when test="following-sibling::maintenance[@lvl='h']">H</xsl:when>
							<xsl:otherwise>
								<xsl:value-of disable-output-escaping="no" select="following-sibling::maintenance[@lvl]"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="preceding::avmac">
						<xsl:choose>
							<xsl:when test="following-sibling::maintenance[@lvl='l']">TASMG</xsl:when>
							<xsl:when test="following-sibling::maintenance[@lvl='o']">AMC</xsl:when>
							<xsl:when test="following-sibling::maintenance[@lvl='f']">ASB</xsl:when>
							<xsl:when test="following-sibling::maintenance[@lvl='d']">DEPOT</xsl:when>
							<xsl:otherwise>
								<xsl:value-of disable-output-escaping="no" select="following-sibling::maintenance[@lvl]"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
				</xsl:choose>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="3" padding-bottom="4pt" padding-top="4pt" starts-row="false">
			<fo:block>
				<xsl:value-of disable-output-escaping="no" select="following-sibling::name"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" padding-bottom="4pt" padding-top="4pt">
			<fo:block>
				<xsl:call-template name="NSN-VALUE">
					<xsl:with-param name="Fsc" select="following-sibling::nsn/fsc"/>
					<xsl:with-param name="Niin" select="following-sibling::nsn/niin"/>
				</xsl:call-template>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="5" ends-row="true" padding-bottom="4pt" padding-top="4pt">
			<fo:block>
				<xsl:value-of disable-output-escaping="no" select="following-sibling::toolno"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="remarktab">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:block span="all"  >
			<fo:table-and-caption hyphenate="true" hyphenation-character="-" hyphenation-keep="column" >
				<fo:table-caption>
					<fo:block  font-size="10pt" font-weight="bold" keep-with-previous.within-column="always" keep-with-previous.within-page="always" space-after.maximum="10pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" text-align="center" id="{generate-id(.)}">
						<xsl:text disable-output-escaping="no">Table&#x2002;</xsl:text>
						<xsl:number count="remarktab | tereqtab | mac | avmac" format="1." from="macwp" level="any"/>
						<xsl:text disable-output-escaping="no">&#x2002;&#x2002;</xsl:text>
						<xsl:apply-templates select="title"/>
					</fo:block>
				</fo:table-caption>
				<fo:table border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt"  font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after.maximum="12pt" space-after.minimum="12pt" space-after.optimum="12pt" space-before.maximum="14pt" space-before.minimum="12pt" space-before.optimum="12pt" width="7in" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve" hyphenate="true" hyphenation-character="-" hyphenation-keep="column">
					<fo:table-column column-number="1" column-width="15%"/>
					<fo:table-column column-number="2" column-width="85%"/>
					<xsl:call-template name="REMARKTAB-HEADER"/>
					<fo:table-body>
						<xsl:apply-templates select="remark-group"/>
					</fo:table-body>
				</fo:table>
			</fo:table-and-caption>
</fo:block>	
	</xsl:template>
	<xsl:template name="REMARKTAB-HEADER">
		<fo:table-header font-size="7pt" font-weight="bold" text-align="center">
			<fo:table-row>
				<fo:table-cell border-bottom="solid" border-bottom-width=".75pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="1" padding-bottom="4pt" padding-top="4pt">
					<fo:block>REMARKS</fo:block>
					<fo:block>CODE</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".75pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="2" padding-bottom="4pt" padding-top="4pt">
					<fo:block>&#x2003;</fo:block>
					<fo:block>REMARKS</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<xsl:template match="remark-group">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-row>
			<xsl:apply-templates select="remarkcode"/>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="remark-group/remarkcode">
		<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
			<fo:block span="all" text-align="center">
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
			<fo:block span="all">
				<xsl:apply-templates select="following-sibling::remarks[1]"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="remark-group/remarks">
	<xsl:call-template name="CHANGEBAR"/>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	
		<xsl:template match="mac-alt">
	<xsl:apply-templates select="mac"/>
</xsl:template>	

</xsl:stylesheet>
