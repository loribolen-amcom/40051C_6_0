<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="maintwp | gen.maintwp" xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
<!--CHANGE C 00 - 16 March 2015 - TOG
*******************************************************************************
Per LOGSA direction and 40051-1C/2C, added attributes to match maintsk <configure>, <debug>, <installperdev>, <prepship>,
 <prepstore>,   <transport>, <uninstallperdev>, <upgrade> all added for maintsk types.  Also removed element <pss>
*******************************************************************************
-->
	<xsl:template match="maintsk">
		<xsl:apply-templates select="adjust | align | arm | assem | calibration | clean | cover | disassem | extpwr | hoist | inspect | install | jack | load | lube | mark | moor | ndi | other.maintsk | overhaul | pack | paint | park | pis | prepforuse | preservation | rebuild | remove | repair | replace | ris | service | sling | softwaremaint | test | tow | unload | unpack | configure | debug | installperdev | prepship | prepstore | transport | uninstallperdev | upgrade">
			</xsl:apply-templates>
			<fo:block text-align="start" font-weight="bold" keep-with-previous="1"
           space-before=".2in" space-before.conditionality="retain" space-after=".2in" space-after.conditionality="retain">
          END OF TASK</fo:block>
          
          <xsl:if test="followon.maintsk">
<xsl:apply-templates select="followon.maintsk"></xsl:apply-templates>
	<fo:block text-align="start" font-weight="bold" keep-with-previous="1" font-family="sans-serif" space-before=".2in" space-before.conditionality="retain" space-after=".2in" space-after.conditionality="retain">
	<xsl:attribute name="start-indent"><xsl:value-of select="0"/>pt</xsl:attribute>END OF TASK
	</fo:block>

</xsl:if>
	</xsl:template>
	
	<xsl:template match="tow">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">TOWING</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="jack">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">JACKING</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="moor">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">MOORING</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="cover">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">COVERING</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="sling">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">SLING LOADING</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="extpwr">
						<fo:block span="all" xsl:use-attribute-sets="titlesub">EXTERNAL POWER</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="softwaremaint">
						<fo:block span="all" xsl:use-attribute-sets="titlesub">SOFTWARE MAINTENANCE</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="maintsk/prepforuse">
						<fo:block span="all" xsl:use-attribute-sets="titlesub">PREPARE FOR USE</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="service">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">SERVICE</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="disassem">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">DISASSEMBLE</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="remove">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">REMOVE</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="clean">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">CLEAN</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="inspect">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">INSPECT</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="ndi">
						<fo:block span="all" xsl:use-attribute-sets="titlesub">NONDESTRUCTIVE INSPECTION (NDI)</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="repair">
						<fo:block span="all" xsl:use-attribute-sets="titlesub">REPAIR</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="replace">
						<fo:block span="all" xsl:use-attribute-sets="titlesub">REPLACE</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="align">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">ALIGN</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="paint">
						<fo:block span="all" xsl:use-attribute-sets="titlesub">PAINT</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="lube">
						<fo:block span="all" xsl:use-attribute-sets="titlesub">LUBRICATE</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="assem">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">ASSEMBLE</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="install">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">INSTALL</fo:block>
				<xsl:apply-templates/>
		</xsl:template>
	<xsl:template match="adjust">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">ADJUST</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="calibration">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">CALIBRATE</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="ris">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">RADIO INTERFERENCE SUPPRESSION</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="pis">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">PLACE IN SERVICE</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="mark">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">MARK</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="overhaul">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">OVERHAUL</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="rebuild">
						<fo:block span="all" xsl:use-attribute-sets="titlesub">REBUILD</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="pack">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">PACK</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="unpack">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">UNPACK</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="load">
						<fo:block span="all" xsl:use-attribute-sets="titlesub">LOAD</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="unload">
						<fo:block span="all" xsl:use-attribute-sets="titlesub">UNLOAD</fo:block>
				<xsl:apply-templates/>
		</xsl:template>
	<xsl:template match="preservation">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">PRESERVE</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="maintsk/arm">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">ARM</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="maintsk/test">
						<fo:block span="all" xsl:use-attribute-sets="titlesub">TEST</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="hoist">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">HOIST</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="park">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">PARK</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="defect.tab">
		<fo:block span="all">
			<fo:table-and-caption>
				<fo:table-caption font-family="sanserif" font-size="10pt" font-weight="bold" text-align="center">
					<fo:block  space-after="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all">
						<xsl:text>Table&#x2002;</xsl:text>
						<xsl:number count="defect.tab" format="1." from="maintwp" level="any"/>
						<xsl:text>&#x2002;&#x2002;Classification of Materiel Defects</xsl:text>
					</fo:block>
				</fo:table-caption>
				<fo:table border-bottom="solid" border-bottom-width="0.5pt" border-left="solid" border-left-width="0.5pt" border-right="solid" border-right-width="0.5pt" border-top="solid" border-top-width="0.5pt" font="sanserif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after="12pt" space-after.conditionality="discard" space-before="12pt" space-before.conditionality="discard" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve">
					<fo:table-column column-number="1" column-width="30%"/>
					<fo:table-column column-number="2" column-width="19%"/>
					<fo:table-column column-number="3" column-width="17%"/>
					<fo:table-column column-number="4" column-width="22%"/>
					<xsl:call-template name="DEFECT.TAB-HEADER"/>
					<fo:table-body>
						<xsl:apply-templates select="defect-row"/>
					</fo:table-body>
				</fo:table>
			</fo:table-and-caption>
		</fo:block>

	</xsl:template>
	<xsl:template match="defect-row">
		<fo:table-row padding-bottom="5pt" padding-top="5pt">
			<fo:table-cell border-right="thin solid black" padding-bottom="5pt" padding-top="5pt">
				<fo:block space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm" padding-before="2mm" padding-after="2mm" padding-bottom="5pt" padding-top="5pt" span="all">
					<xsl:choose>
						<xsl:when test="defecttype/@type='critical'">
							<fo:block text-decoration="underline">CRITICAL:</fo:block>
						</xsl:when>
						<xsl:when test="defecttype/@type='major'">
							<fo:block text-decoration="underline">MAJOR:</fo:block>
						</xsl:when>
						<xsl:when test="defecttype/@type='minor'">
							<fo:block text-decoration="underline">MINOR:</fo:block>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="defecttype"/>
						</xsl:otherwise>
					</xsl:choose>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell border-right="thin solid black" padding-bottom="5pt" padding-top="5pt">
				<fo:block>&#x2002;</fo:block>
			</fo:table-cell>
			<fo:table-cell border-right="thin solid black" padding-bottom="5pt" padding-top="5pt">
				<fo:block>&#x2002;</fo:block>
			</fo:table-cell>
			<fo:table-cell border-right="thin solid black" padding-bottom="5pt" padding-top="5pt">
				<fo:block>&#x2002;</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row padding-bottom="5pt" padding-top="5pt">
			<fo:table-cell border-right="thin solid black" padding-bottom="5pt" padding-top="5pt">
				<xsl:for-each select="defect-group">
					<fo:block space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm" padding-before="2mm" padding-after="2mm" padding-bottom="5pt" padding-top="5pt">
						<fo:list-block provisional-distance-between-starts="1pc" provisional-label-separation="1pc" start-indent="21pt">
							<fo:list-item>
								<fo:list-item-label>
									<fo:block>
										<xsl:number count="condition" format="1." from="defecttype" level="any"/>
									</fo:block>
								</fo:list-item-label>
								<fo:list-item-body start-indent="body-start()">
									<fo:block>
										<xsl:value-of select="condition"/>
									</fo:block>
								</fo:list-item-body>
							</fo:list-item>
						</fo:list-block>
					</fo:block>
				</xsl:for-each>
			</fo:table-cell>
			<fo:table-cell border-right="thin solid black" padding-bottom="5pt" padding-top="5pt">
				<xsl:for-each select="defect-group">
					<fo:block space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm" padding-before="2mm" padding-after="2mm" padding-bottom="5pt" padding-top="5pt">
						<fo:block text-align="center">
							WP&#x2002;<xsl:value-of select="xref/@wpid"/>
						</fo:block>
					</fo:block>
				</xsl:for-each>
			</fo:table-cell>
			<fo:table-cell border-right="thin solid black" padding-bottom="5pt" padding-top="5pt">
				<xsl:for-each select="defect-group">
					<fo:block space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm" padding-before="2mm" padding-after="2mm" padding-bottom="5pt" padding-top="5pt" text-align="center">
						<xsl:value-of select="insp-method"/>
					</fo:block>
				</xsl:for-each>
			</fo:table-cell>
			<fo:table-cell border-right="thin solid black" padding-bottom="5pt" padding-top="5pt">
				<xsl:for-each select="defect-group">
					<fo:block space-after="2mm" space-before="2mm" start-indent="2mm" end-indent="2mm" padding-before="2mm" padding-after="2mm" padding-bottom="5pt" padding-top="5pt">
						<xsl:value-of select="acceptqual"/>
					</fo:block>
				</xsl:for-each>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template name="DEFECT.TAB-HEADER">
		<fo:table-header font-weight="bold">
			<fo:table-row>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">CATEGORIES OF</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">DEFECTS/COMPONENTS</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">AND DEFECTS</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">WP NO. OR TM</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">WITH CORRECTIVE</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">ACTION</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">INSPECTION</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">METHODS AFTER</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">CORRECTIVE</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">ACTION</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">ACCEPTABLE</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">QUALITY	LEVEL</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
<!--
	<xsl:template match="pss">
		<xsl:variable name="psstitle">
			<xsl:if test="descendant::proc/title">
				<xsl:value-of select="descendant::proc/title"/>
			</xsl:if>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="descendant::proc/title">
				<xsl:choose>
					<xsl:when test="$psstitle=''">
						<fo:block span="all" xsl:use-attribute-sets="titlesub">PREPARATION FOR STORAGE OR SHIPMENT</fo:block>
						<xsl:apply-templates/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<fo:block span="all" xsl:use-attribute-sets="titlesub">PREPARATION FOR STORAGE OR SHIPMENT</fo:block>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
-->

	<xsl:template match="configure">
				<fo:block span="all" xsl:use-attribute-sets="titlesub">CONFIGURE SOFTWARE</fo:block>
				<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="debug">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">DEBUG SOFTWARE</fo:block>
				<xsl:apply-templates/>

	</xsl:template>

	<xsl:template match="installperdev">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">INSTALL PERIPHERAL DEVICE</fo:block>
				<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="prepship">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">PREPARATION FOR SHIPMENT</fo:block>
				<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="prepstore">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">PREPARATION FOR STORAGE</fo:block>
				<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="transport">
						<fo:block span="all" xsl:use-attribute-sets="titlesub">TRANSPORT</fo:block>
				<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="uninstallperdev">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">UNINSTALL PERIPHERAL DEVICE</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="upgrade">
					<fo:block span="all" xsl:use-attribute-sets="titlesub">UPGRADE/PATCH</fo:block>
				<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="followon.maintsk">
						<fo:block span="all" xsl:use-attribute-sets="titlesub">FOLLOW-ON MAINTENANCE</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="other.maintsk">
						<fo:block span="all" xsl:use-attribute-sets="titlesub">ADDITIONAL MAINTENANCE TASK</fo:block>
				<xsl:apply-templates/>
	</xsl:template>
</xsl:stylesheet>
