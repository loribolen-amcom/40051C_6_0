<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:axf="http://www.antennahouse.com/names/XSL/Extensions">
	
	<xsl:template match="coeibiiwp">
	<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="softbiiwp">
	<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="coei">
			<xsl:call-template name="COEIBII-INTRO"/>
		<xsl:if test="contains(processing-instruction()[1],'_newpage')">
			<fo:block break-after="page" span="all"> </fo:block>
		</xsl:if>
		<fo:block space-before.maximum="28pt" space-before.minimum="20pt" space-before.optimum="24pt" span="all">
		<xsl:for-each select="current()">
			<xsl:apply-templates select="coeitab"/>
		</xsl:for-each>
		</fo:block>
	</xsl:template>
	
	<!--ELEMENT coei-opt (title, std.table.header, coei-opt-entry+, 
          on-board-spares-opt?)  -->
	<xsl:template match="coei-opt | bii-opt">
			<xsl:call-template name="COEIBII-INTRO-B"/>
			<fo:block span="all">
			<fo:table-and-caption >
				<fo:table-caption font-family="sans-serif" font-size="10pt" font-weight="bold" text-align="center">
					<fo:block space-after="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all">
						<xsl:text >Table&#x2002;</xsl:text>
						<xsl:number count="coei-opt | bii-opt" format="1." from="coeibiiwp|softbiiwp" level="any"/>
						<xsl:choose>
							<xsl:when test="ancestor-or-self::coei-opt">
								<xsl:text >&#x2002;&#x2002;Components of End Item List</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text >&#x2002;&#x2002;Basic Issue Items List</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</fo:block>
				</fo:table-caption>
				<fo:table border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt" font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after="12pt" space-after.conditionality="discard" space-before="12pt" space-before.conditionality="discard" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve" >
<!-- id="{generate-id(.)}" -->
					<fo:table-column column-number="1" column-width="10%"/>
					<fo:table-column column-number="2" column-width="38%"/>
					<fo:table-column column-number="3" column-width="28%"/>
					<fo:table-column column-number="4" column-width="12%"/>
					<fo:table-column column-number="5" column-width="6%"/>
					<fo:table-column column-number="6" column-width="6%"/>
					<xsl:call-template name="COEIBII-HEADER-B"></xsl:call-template>
		<fo:table-body>
			
				<xsl:choose>					
					<xsl:when test="coei-opt-category | bii-opt-category">
						<xsl:apply-templates select="coei-opt-category | bii-opt-category"/>
							</xsl:when>
					<xsl:when test="on-board-spares">
						<xsl:apply-templates select="on-board-spares"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="coei-opt-entry | bii-opt-entry"/>
						</xsl:otherwise>
						</xsl:choose>
			</fo:table-body>
		
			<!--fo:table-body>
				<xsl:choose>					
					<xsl:when test="on-board-spares-opt">
						<xsl:apply-templates select="on-board-spares-opt"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="coei-opt-entry | bii-opt-entry"/>
					</xsl:otherwise>
				</xsl:choose>
			</fo:table-body>-->
			</fo:table>
			</fo:table-and-caption>
		</fo:block>
	</xsl:template>
	

	
	<xsl:template match="bii | softbii"> 
	<xsl:if test="contains(processing-instruction()[1],'_newpage')">
			<fo:block break-after="page" span="all"> </fo:block>
		</xsl:if>
		<fo:block space-before.maximum="28pt" space-before.minimum="20pt" space-before.optimum="24pt" span="all">
			<xsl:for-each select="current()">
			<xsl:apply-templates select="biitab"/>
		</xsl:for-each>
		</fo:block>			
	</xsl:template>
	

	<xsl:template match="coeibiiwp/uoc | coeibiiwp/modelno"/>
	
	<xsl:template match="uoc | modelno |  name" mode="COEIBII-INTRO">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	
	
	
	<xsl:template name="COEIBII-INTRO">
		<xsl:if test="preceding-sibling::uoc">
			<!--<fo:block span="all">-->
				<fo:list-block provisional-distance-between-starts="10pc" provisional-label-separation="1pc" space-before.conditionality="discard" space-before.maximum="6pt" space-before.minimum="2pt" space-before.optimum="4pt" start-indent="15pt" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" span="all" font-weight="bold" text-decoration="underline">
					<fo:list-item space-after="2pt" >
						<fo:list-item-label >
							<fo:block font-weight="bold" text-decoration="underline">Code</fo:block>
						<!--<fo:inline font-weight="bold" text-decoration="underline"></fo:inline>-->
						</fo:list-item-label>
						<fo:list-item-body start-indent="11pc">
							<fo:block font-weight="bold" text-decoration="underline">Used On</fo:block>
						<!--<fo:inline font-weight="bold" text-decoration="underline"></fo:inline>-->
						</fo:list-item-body>
					</fo:list-item>
				</fo:list-block>
				<xsl:for-each select="preceding-sibling::uoc">
					<fo:list-block provisional-distance-between-starts="10pc" provisional-label-separation="1pc" space-before.conditionality="discard" space-before.maximum="6pt" space-before.minimum="2pt" space-before.optimum="4pt" start-indent="15pt" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
						<fo:list-item space-after="2pt">
							<fo:list-item-label>
								<xsl:apply-templates mode="COEIBII-INTRO" select="node()"/>
							</fo:list-item-label>
							<fo:list-item-body start-indent="11pc">
								<xsl:apply-templates mode="COEIBII-UOC" select="following-sibling::modelno[1]">
</xsl:apply-templates>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
				</xsl:for-each>
			<!--</fo:block>-->
		</xsl:if>
		</xsl:template>
	
	<!-- COEI-OPT Introduction -->
	<xsl:template name="COEIBII-INTRO-B">
		<xsl:if test="preceding-sibling::uoc">
			<fo:block span="all">
				<fo:list-block provisional-distance-between-starts="10pc" provisional-label-separation="1pc" space-before.conditionality="discard" space-before.maximum="6pt" space-before.minimum="2pt" space-before.optimum="4pt" start-indent="15pt" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
					<fo:list-item space-after="2pt">
						<fo:list-item-label>
							<fo:block font-weight="bold" text-decoration="underline">Code</fo:block>
						</fo:list-item-label>
						<fo:list-item-body start-indent="11pc">
							<fo:block font-weight="bold" text-decoration="underline">Used On</fo:block>
						</fo:list-item-body>
					</fo:list-item>
				</fo:list-block>
				<xsl:for-each select="preceding-sibling::uoc">
					<fo:list-block provisional-distance-between-starts="10pc" provisional-label-separation="1pc" space-before.conditionality="discard" space-before.maximum="6pt" space-before.minimum="2pt" space-before.optimum="4pt" start-indent="15pt" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
						<fo:list-item space-after="2pt">
							<fo:list-item-label>
								<xsl:apply-templates mode="COEIBII-INTRO-B" select="node()"/>
							</fo:list-item-label>
							<fo:list-item-body start-indent="11pc">
								<xsl:apply-templates mode="COEIBII-UOC" select="following-sibling::modelno[1]"></xsl:apply-templates>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>
				</xsl:for-each>
			</fo:block>
		</xsl:if>
	</xsl:template>
	
	<!--
ELEMENT&nbsp; coeitab | biitab
-->

	<xsl:template match="coeitab | biitab">
	<xsl:if test="contains(processing-instruction()[1],'_newpage')">
			<fo:block break-after="page" span="all"> </fo:block>
		</xsl:if>
<xsl:if test="preceding-sibling::graphic">
			<fo:block space-after="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" text-align="center">
<!-- need 2 cases: multiple figures for 1 table or one figure each multple tables -->
			<xsl:apply-templates select="preceding-sibling::graphic[following-sibling::coeitab[1] = current()] | preceding-sibling::graphic[following-sibling::biitab[1] = current()]"/>
			<!--xsl:apply-templates select="preceding-sibling::graphic"/--> <!-- Do we need [1] here? Check 5.0-->
			</fo:block>
			</xsl:if>
<xsl:if test="preceding-sibling::figure">
			<fo:block space-after="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" text-align="center">
			<xsl:apply-templates select="preceding-sibling::figure[following-sibling::coeitab[1] = current()] | preceding-sibling::figure[following-sibling::biitab[1] = current()]"/>
			<!--xsl:apply-templates select="preceding-sibling::figure"/-->
			</fo:block>
			</xsl:if>
		<!--<fo:block span="all">-->
<xsl:call-template name="CHANGEBAR"/>

			<fo:table-and-caption >
				<fo:table-caption font-family="sans-serif" font-size="10pt" font-weight="bold" text-align="center">
					<fo:block space-after="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all" id="{generate-id(.)}">
						<xsl:text >Table&#x2002;</xsl:text>
						<xsl:number count="table | coeitab | biitab" format="1." from="coeibiiwp|softbiiwp" level="any"/>
						<xsl:text>&#x2002;&#x2002;</xsl:text>
						<xsl:choose>
							<xsl:when test="ancestor::coeibiiwp/@marines='yes'">
								<xsl:choose>
									<xsl:when test="string-length(title[1])=0">
									<xsl:text>SUPPLY SYSTEM RESPONSIBILITY (SSR) LIST</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="title"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="ancestor::coei">
					<xsl:call-template name="APPLICABLE"/>
								<xsl:choose>
									<xsl:when test="string-length(title[1])=0">
									<xsl:text>Components of End Item List</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="title"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="string-length(title[1])=0">
									<xsl:text>Basic Issue Items List</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="title"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
					</fo:block>
				</fo:table-caption>
				<fo:table border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt" font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after="12pt" space-after.conditionality="discard" space-before="12pt" space-before.conditionality="discard" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve" id="{generate-id(.)}" width="7in" inline-progression-dimension="100%">

					<fo:table-column column-number="1" column-width="10%"/>
					<fo:table-column column-number="2" column-width="20%"/>
					<fo:table-column column-number="3" column-width="48%"/>
					<fo:table-column column-number="4" column-width="10%"/>
					<fo:table-column column-number="5" column-width="6%"/>
					<fo:table-column column-number="6" column-width="6%"/>
					<xsl:call-template name="COEIBII-HEADER"></xsl:call-template>
					<fo:table-body>
				<xsl:choose>					
					<xsl:when test="coei-category | bii-category">
						<xsl:apply-templates select="coei-category | bii-category"/>
							</xsl:when>
					<xsl:when test="on-board-spares">
						<xsl:apply-templates select="on-board-spares"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="coei-entry | bii-entry"/>
						</xsl:otherwise>
						</xsl:choose>
					</fo:table-body>
				</fo:table>
			</fo:table-and-caption>
		<!--</fo:block>-->
	</xsl:template>
	<!--
PROCEDURE COEIBII-HEADER
-->
	<xsl:template name="COEIBII-HEADER">
				<fo:table-header font-weight="bold" text-transform="uppercase">
			<fo:table-row>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(1)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Illus</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Number</fo:block>
					</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(2)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">National Stock</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Number (NSN)</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(3)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Description, Part Number/(CAGEC)</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(4)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Usable</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center"> On</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Code</fo:block>
					
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(5)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">U/I</fo:block>
										
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(6)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Qty</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Rqr</fo:block>
					
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	<!--
ELEMENT coei-category | bii-category
-->
	<xsl:template match="coei-category | bii-category">
	
		<fo:table-row vertical-align="middle" text-align="center">
	<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-top-style="solid" border-top-width="0.75pt" number-columns-spanned="6" padding="4pt" vertical-align="middle" ><xsl:call-template name="CHANGEBAR"/>
				<fo:block font-weight="normal" margin-bottom="3pt" margin-top="3pt" text-align="center" vertical-align="middle">
				<xsl:choose>
					<xsl:when test="string-length(title[1])=0">Components of End Item (COEI)
					</xsl:when>
		<xsl:otherwise>
				<xsl:value-of  select="title"/>
		</xsl:otherwise>
		</xsl:choose>
			</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:apply-templates select="coei-entry | bii-entry"/>

	</xsl:template>
	
	<xsl:template match="coei-opt-category | bii-opt-category">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-row vertical-align="middle">
	<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-top-style="solid" border-top-width="0.75pt" number-columns-spanned="6" padding="4pt" vertical-align="middle" text-align="center" >
				<fo:block font-weight="normal" margin-bottom="3pt" margin-top="3pt" text-align="center" vertical-align="middle">
					<xsl:choose>
					<xsl:when test="string-length(title[1])=0">Components of End Item (COEI)
					</xsl:when>
		<xsl:otherwise>
				<xsl:value-of  select="title"/>
		</xsl:otherwise>
		</xsl:choose>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:apply-templates select="coei-opt-entry | bii-opt-entry"/>
	</xsl:template>
<!--
ELEMENT on-board-spares
-->	
	
		<xsl:template match="on-board-spares">
			<fo:table-row vertical-align="middle">
			<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-top-style="solid" border-top-width="0.75pt" number-columns-spanned="6" padding="4pt" vertical-align="middle">
				<fo:block font-weight="normal" margin-bottom="3pt" margin-top="3pt" text-align="center" vertical-align="middle">
				<xsl:choose>
					<xsl:when test="string-length(title[1])=0">ON BOARD SPARES
					</xsl:when>
		<xsl:otherwise>
				<xsl:value-of  select="title"/>
		</xsl:otherwise>
		</xsl:choose>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:apply-templates select="coei-entry"/>
	</xsl:template>
	
	<!--
ELEMENT on-board-spares-opt
-->		
		
		<xsl:template match="on-board-spares-opt">
			<fo:table-row vertical-align="middle">
			<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-top-style="solid" border-top-width="0.75pt" number-columns-spanned="6" padding="4pt" vertical-align="middle">
				<fo:block font-weight="normal" margin-bottom="3pt" margin-top="3pt" text-align="center" vertical-align="middle">
					<xsl:choose>
					<xsl:when test="string-length(title[1])=0">ON BOARD SPARES
					</xsl:when>
		<xsl:otherwise>
				<xsl:value-of  select="title"/>
		</xsl:otherwise>
		</xsl:choose>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:apply-templates select="coei-opt-entry"/>
	</xsl:template>
	
	
	<!-- COEI-OPT table format with headers -->
	
	<xsl:template name="COEIBII-HEADER-B">
		<fo:table-header font-weight="bold" text-transform="uppercase">
			<fo:table-row>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(1)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Item</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Number</fo:block>
					</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(2)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">National Stock Number (NSN) and Illustration</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(3)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Description, Part</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center"> Number/(CAGEC)</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(4)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Usable On</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Code</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(5)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">U/I</fo:block>
										
				</fo:table-cell>
				<fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center">
					<fo:block margin-bottom="3pt" span="all" text-align="center">(6)</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Qty</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">Rqr</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
	</xsl:template>
	
	
	<!--
ELEMENT coei-entry | bii-entry-->
	<xsl:template match="coei-entry | bii-entry">
	
		<fo:table-row><!--<xsl:call-template name="CHANGEBAR"/>-->
			<xsl:call-template name="CHANGEBAR"/>
			<xsl:apply-templates select="illno | nsn[1] | dcpno[1] | ui[1] | qty[1]"/>
		</fo:table-row>
		<xsl:apply-templates mode="COEIBII-MOREROWS" select="nsn[position()>1]"/>
	</xsl:template>
	<!-- coei-opt-entry | bii-opt-entry 
	ELEMENT coei-opt-entry (itemno, nsn, graphic, dcpno, ui, qty
	graphic[1] |-->
		<xsl:template match="coei-opt-entry | bii-opt-entry">
		
			<fo:table-row><xsl:call-template name="CHANGEBAR"/>
			<xsl:apply-templates select="itemno[1] | nsn[1] | dcpno[1] | ui[1] | qty[1]"/>
		</fo:table-row>
		<xsl:apply-templates mode="COEIBII-MOREROWS" select="nsn[position()>1]"/>
	</xsl:template>
	

	<!--
ELEMENT coei-entry/illno | bii-entry/illno
-->
	<xsl:template match="coei-entry/illno | bii-entry/illno">
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center">
			<fo:block>
			<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<!--
ELEMENT coei-opt-entry/item | bii-opt-entry/item
-->	
		<xsl:template match="coei-opt-entry/itemno | bii-opt-entry/itemno">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center" border-bottom-style="solid" border-bottom-width="0.5pt">
			<fo:block>
			<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	
		<!--
ELEMENT coei-entry/bii-entry/nsn 1st
-->
	<xsl:template match="coei-entry/nsn|bii-entry/nsn">
	
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="2" padding-after="4pt" padding-before="4pt" text-align="left">
			<fo:block>
				<xsl:call-template name="NSN-VALUE">
					<xsl:with-param name="Fsc" select="fsc"/>
					<xsl:with-param name="Niin" select="niin"/>
				</xsl:call-template>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<!--
ELEMENT coei-opt-entry/bii-optentry/nsn 1st
-->
<!--coei-opt-entry/	-->

<xsl:template match="coei-opt-entry/nsn | bii-opt-entry/nsn">
	<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="2" padding-after="4pt" padding-before="4pt" text-align="left" border-bottom-style="solid" border-bottom-width="0.5pt">
			<fo:block>
				<xsl:call-template name="NSN-VALUE">
					<xsl:with-param name="Fsc" select="fsc"/>
					<xsl:with-param name="Niin" select="niin"/>
				</xsl:call-template>
			</fo:block>
		<fo:block space-before.maximum="10pt" space-before.minimum="8pt" space-before.optimum="8pt" span="all" display-align="center">
				<xsl:apply-templates select="following-sibling::graphic" />
		</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<!--
ELEMENT coei-opt-entry/bii-opt-entry/nsn 2nd or more
Ignore so all NSN are in the same cell
-->
	<xsl:template match="nsn" mode="COEIBII-MOREROWS">
		<fo:table-row>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" column-number="2" padding-after="4pt" padding-before="4pt" text-align="left">
				<fo:block>
					<xsl:call-template name="NSN-VALUE">
						<xsl:with-param name="Fsc" select="fsc"/>
						<xsl:with-param name="Niin" select="niin"/>
					</xsl:call-template>
				</fo:block>
			</fo:table-cell>
			<xsl:apply-templates select="following-sibling::dcpno[1] | following-sibling::ui[1] |  following-sibling::qty[1]"/>
		</fo:table-row>
	</xsl:template>
	<!--
ELEMENT dcpno
-->
	<xsl:template match="coei-entry/dcpno | bii-entry/dcpno">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt">
			<fo:block>
				<xsl:apply-templates select="name"/>
				<xsl:if test="desc">
					<xsl:text >: </xsl:text>
					<xsl:apply-templates select="desc"/>
				</xsl:if>
			</fo:block>
			<fo:block>
			<xsl:value-of  select="partno[1]"/>
				<xsl:if test="not(string-length(cageno)=0)">
					<xsl:text> (</xsl:text><xsl:value-of disable-output-escaping="no" select="cageno[1]"/><xsl:text>) </xsl:text>
			</xsl:if>
		</fo:block>
			<xsl:if test="cageno[2]">
				<fo:block><xsl:value-of  select="partno[2]"/>
				<xsl:if test="not(string-length(../cageno)=0)">
			<fo:block>
					<xsl:text> (</xsl:text><xsl:value-of disable-output-escaping="no" select="../cageno[2]"/><xsl:text>) </xsl:text>
							</fo:block>
			</xsl:if>
		</fo:block>
			</xsl:if>
			<xsl:if test="cageno[3]">
				<fo:block><xsl:value-of  select="partno[3]"/>
				<xsl:if test="not(string-length(../cageno)=0)">
			<fo:block>
					<xsl:text> (</xsl:text><xsl:value-of disable-output-escaping="no" select="../cageno[3]"/><xsl:text>) </xsl:text>
							</fo:block>
			</xsl:if>
				</fo:block>
			</xsl:if>
			<xsl:if test="cageno[4]">
				<fo:block><xsl:value-of  select="partno[4]"/>
				<xsl:if test="not(string-length(../cageno)=0)">
			<fo:block>
					<xsl:text> (</xsl:text><xsl:value-of disable-output-escaping="no" select="../cageno[4]"/><xsl:text>) </xsl:text>
				</fo:block>
			</xsl:if>
				</fo:block>
			</xsl:if>
		</fo:table-cell>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center" >
			<xsl:for-each select="uoc">
				<fo:block>
			<xsl:apply-templates select="node()"/>
			</fo:block>
			</xsl:for-each>
		</fo:table-cell>
	</xsl:template>

	<xsl:template match="coei-opt-entry/dcpno | bii-opt-entry/dcpno">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" border-bottom-style="solid" border-bottom-width="0.5pt">
			<fo:block>
				<xsl:apply-templates select=" name"/>
				<xsl:text >: </xsl:text>
				<xsl:apply-templates select="desc"/>
			</fo:block>
			<fo:block>
				<xsl:value-of  select="partno[1]"/>
				<xsl:if test="not(string-length(cageno)=0)">
				<xsl:text > (</xsl:text>
				<xsl:value-of  select="cageno[1]"/>
				<xsl:text >) </xsl:text>
				</xsl:if>
			</fo:block>
			<xsl:if test="cageno[2]">
				<fo:block>
					<xsl:value-of  select="partno[2]"/>
					<xsl:if test="not(string-length(../cageno)=0)">
					<xsl:text > (</xsl:text>
					<xsl:value-of  select="cageno[2]"/>
					<xsl:text >) </xsl:text>
					</xsl:if>
				</fo:block>
			</xsl:if>
			<xsl:if test="cageno[3]">
				<fo:block>
				<xsl:value-of  select="partno[3]"/>
					<xsl:if test="not(string-length(../cageno)=0)">
					<xsl:text > (</xsl:text>
					<xsl:value-of  select="cageno[3]"/>
					<xsl:text >) </xsl:text>
					</xsl:if>
				</fo:block>
			</xsl:if>
			<xsl:if test="cageno[4]">
				<fo:block>
					<xsl:value-of  select="partno[4]"/>
					<xsl:if test="not(string-length(../cageno)=0)">
					<xsl:text > (</xsl:text>
					<xsl:value-of  select="cageno[4]"/>
					<xsl:text >) </xsl:text>
					</xsl:if>
				</fo:block>
			</xsl:if>
		</fo:table-cell>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center" border-bottom-style="solid" border-bottom-width="0.5pt">
			<xsl:for-each select="uoc">
				<fo:block>
			<xsl:apply-templates select="node()"/>
			</fo:block>
			</xsl:for-each>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENT name | desc
-->
	<xsl:template match="coei-entry/dcpno/name  | coei-entry/dcpno/desc |  bii-entry/dcpno/name | bii-entry/dcpno/desc">
			<xsl:apply-templates  select="node()"/>
	</xsl:template>
	
	<xsl:template match="coei-opt-entry/dcpno/name  | coei-opt-entry/dcpno/desc |  bii-opt-entry/dcpno/name | bii-opt-entry/dcpno/desc">
			<xsl:apply-templates  select="node()"/>
	</xsl:template>
	<!--
ELEMENT ui
-->
	<xsl:template match="coei-entry/ui | bii-entry/ui">
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center">
			<fo:block>
			<xsl:apply-templates select="node()"/>
			
			<xsl:value-of select="ui/@um"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="coei-opt-entry/ui | bii-opt-entry/ui">
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center" border-bottom-style="solid" border-bottom-width="0.5pt">
			<fo:block>
			<xsl:apply-templates select="node()"/>
			
			<xsl:value-of select="ui/@um"/></fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<!--
ELEMENT qty
-->
	<xsl:template match="coei-entry/qty | bii-entry/qty">
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-right="4pt" text-align="center">
			<fo:block>
			<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
		<xsl:template match="coei-opt-entry/qty | bii-opt-entry/qty">
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" padding-right="4pt" text-align="center" border-bottom-style="solid" border-bottom-width="0.5pt">
			<fo:block>
			<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
		</xsl:template>
</xsl:stylesheet>
