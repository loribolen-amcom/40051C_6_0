<?xml version="1.0" encoding="utf-8"?>
<!-- Fragment document type declaration subset:
	Arbortext, Inc., 1988-2005, v.4002
	<!DOCTYPE xsl:stylesheet>
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!--
ELEMENTtoolidwp
-->
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="handreceiptwp">
		<xsl:choose>
		<xsl:when test="./@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="HR-INTRO">
		<xsl:apply-templates mode="HR-INTRO" select="../wpidinfo/title"/>
	</xsl:template>
	<!--
ELEMENTtoolidlist
-->
	<xsl:template match="hrlist">
			<fo:table-and-caption >
				<fo:table-caption>
					
<!--						<xsl:text disable-output-escaping="no">Table&#x2002;</xsl:text>
						<xsl:value-of disable-output-escaping="no" select="$tblctr"/>-->
						<xsl:text >&#x2002;&#x2002;</xsl:text>
								<xsl:choose>
									<xsl:when test="string-length(title[1])=0">
										<xsl:text disable-output-escaping="no">Hand Receipt List.</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="title"/>
									</xsl:otherwise>
								</xsl:choose>
				</fo:table-caption>
				
				<fo:table border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" border-top="solid" border-top-width=".5pt" font-family="sans-serif" font-size="8pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" relative-position="static" space-after.maximum="12pt" space-after.minimum="12pt" space-after.optimum="12pt" space-before.maximum="14pt" space-before.minimum="12pt" space-before.optimum="12pt" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve">
							<fo:table-column column-number="1" column-width="7%"/>
							<fo:table-column column-number="2" column-width="13%"/>
							<fo:table-column column-number="3" column-width="4%"/>
							<fo:table-column column-number="4" column-width="4%"/>
							<fo:table-column column-number="5" column-width="20%"/>
							<fo:table-column column-number="6" column-width="6%"/>
							<fo:table-column column-number="7" column-width="4%"/>
							<fo:table-column column-number="8" column-width="6%"/>
							<fo:table-column column-number="9" column-width="6%"/>
							<fo:table-column column-number="10" column-width="6%"/>
							<fo:table-column column-number="11" column-width="4%"/>
							<fo:table-column column-number="12" column-width="4%"/>
							<fo:table-column column-number="13" column-width="4%"/>
							<fo:table-column column-number="14" column-width="4%"/>
							<fo:table-column column-number="15" column-width="4%"/>
							<fo:table-column column-number="16" column-width="4%"/>

					<xsl:call-template name="HR-HEADER"/>
					<fo:table-body>
						<xsl:choose>
							<xsl:when test="hr-category">
								<xsl:apply-templates select="hr-category"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="hr-entry"/>
							</xsl:otherwise>
						</xsl:choose>
					</fo:table-body>
				</fo:table>
				</fo:table-and-caption>

	</xsl:template>
	<!--
PROCEDURE TOOLID-HEADER
-->
	<xsl:template name="HR-HEADER">
	<fo:table-header>
	<fo:table-row>
			<!-- 2 top rows -->
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" text-align="center" font-family="sans-serif" font-size="8pt">
					<fo:block>HAND RECEIPT / ANNEX NUMBER</fo:block>
					<fo:block>For use of this form, see DA PAM 710-2-1</fo:block>
					<fo:block>The proponent agency is DCS, G-4.</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>FROM:</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt">
					<fo:block>TO:</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="4" number-columns-spanned="2" padding-bottom="4pt" padding-top="4pt">
					<fo:block>HAND RECEIPT NUMBER</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="6" number-columns-spanned="2" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>&#x2002;</fo:block>
					<fo:block/>
				</fo:table-cell>
				<!--		-->
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="9" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>&#x2002;</fo:block>
					<fo:block/>
				</fo:table-cell>
<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="9" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>&#x2002;</fo:block>
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="9" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>&#x2002;</fo:block>
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="9" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>&#x2002;</fo:block>
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="9" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>&#x2002;</fo:block>
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="9" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>&#x2002;</fo:block>
					<fo:block/>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="9" padding-bottom="4pt" padding-top="4pt">
					<fo:block/>
					<fo:block>&#x2002;</fo:block>
					<fo:block/>
				</fo:table-cell>				

			</fo:table-row>
				<fo:table-row>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" text-align="center" font-family="sans-serif" font-size="8pt" column-number="1" >
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" column-number="2" number-columns-spanned="2"> 
					<fo:block>END ITEM STOCK NUMBER</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" column-number="4" number-columns-spanned="3">
					<fo:block>END ITEM DESCRIPTION</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="3" number-columns-spanned="3" padding-bottom="4pt" padding-top="4pt">
					<fo:block>PUBLICATION NUMBER</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="6" number-columns-spanned="4" padding-bottom="4pt" padding-top="4pt">
					<fo:block>PUBLICATION DATE</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<!--		-->
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="10" padding-bottom="4pt" padding-top="4pt" number-rows-spanned="0" number-columns-spanned="3" >
					<fo:block>QUANTITY</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<!-- Bottom Row -->
		</fo:table-header>
		
		<fo:table-body>
			<fo:table-row font-weight="bold" text-transform="uppercase">
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
					<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
				</fo:table-cell>
					<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">&#x2002;</fo:block>
					</fo:table-cell>
					<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">QTY</fo:block>
					</fo:table-cell>
	<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" number-columns-spanned="6" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">g.  QUANTITY</fo:block>
					</fo:table-cell>
			</fo:table-row>
			
			<fo:table-row font-weight="bold" text-transform="uppercase">
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
					<fo:block margin-bottom="3pt" span="all" text-align="center">STOCK NUMBER</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">a.</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
					<fo:block margin-bottom="3pt" span="all" text-align="center">ITEM DESCRIPTION</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">b.</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
					<fo:block margin-bottom="3pt" span="all" text-align="center">*</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">c. </fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
					<fo:block margin-bottom="3pt" span="all" text-align="center">SEC</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">d.</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">UI</fo:block>
						<fo:block margin-bottom="3pt" span="all" text-align="center">e.</fo:block>
					</fo:table-cell>
					<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">AUTH</fo:block>
						<fo:block margin-bottom="3pt" span="all" text-align="center">f.</fo:block>
					</fo:table-cell>
	<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="2" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">A</fo:block>
					</fo:table-cell>
		<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="2" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">B</fo:block>
					</fo:table-cell>	
						<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="2" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">C</fo:block>
					</fo:table-cell>
						<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="2" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">D</fo:block>
					</fo:table-cell>
						<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="2" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">E</fo:block>
					</fo:table-cell>
						<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="2" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">F</fo:block>
					</fo:table-cell>
			</fo:table-row>
			</fo:table-body>
		
	</xsl:template>
	<!--
ELEMENT tool-category
-->

<xsl:template match="hr-category">
<xsl:call-template name="CHANGEBAR"/>
		<fo:table-row vertical-align="middle">
			<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-top-style="solid" border-top-width="0.75pt" number-columns-spanned="16" padding="4pt" vertical-align="middle">
				<fo:block font-weight="bold" margin-bottom="3pt" margin-top="3pt" text-align="center" vertical-align="middle">
					<xsl:value-of disable-output-escaping="no" select="title"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:apply-templates select="hr-entry"/>
	</xsl:template>
	
	<!--
ELEMENTtool-entry
-->

<xsl:template match="hr-entry">
<xsl:call-template name="CHANGEBAR"/>
		<fo:table-row padding-after="4pt" padding-before="4pt">
			<xsl:apply-templates select="nsn | name | partno | cageno | partcage | serialno | hr-annex | hr-sec | ui | qty"/>
		</fo:table-row>
		<xsl:apply-templates mode="TOOL-MOREROWS" select="partcage[position()>1]"/>
	</xsl:template>
	
	<xsl:template match="hr-entry/nsn">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left" column-number="1">
			<fo:block>
				<xsl:call-template name="NSN-VALUE">
					<xsl:with-param name="Fsc" select="fsc"/>
					<xsl:with-param name="Niin" select="niin"/>
				</xsl:call-template>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="hr-entry/name">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left" column-number="3">
			<fo:block>
				<xsl:apply-templates select="node()"/>
				
			</fo:block>
			
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="hr-entry/partcage[1]">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left" column-number="7">
			<fo:block>
				<xsl:value-of disable-output-escaping="no" select="partno"/>
				<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
			</fo:block>
			<xsl:if test="not(string-length(cageno)=0)">
				<fo:block>
					<xsl:text> (</xsl:text>
					<xsl:value-of disable-output-escaping="no" select="cageno"/>
					<xsl:text>) </xsl:text>
				</fo:block>
			</xsl:if>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENTtool-entry/partno
-->
	<xsl:template match="hr-entry/partno">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left" column-number="7">
			<fo:block>
				<xsl:value-of disable-output-escaping="no" select="../partno[1]"/>
				<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
			</fo:block>
			<xsl:if test="not(string-length(../cageno)=0)">
				<fo:block>
					<xsl:text> (</xsl:text>
					<xsl:value-of disable-output-escaping="no" select="../cageno[1]"/>
					<xsl:text>) </xsl:text>
				</fo:block>
			</xsl:if>
		</fo:table-cell>
	</xsl:template>
	
	<!--
ELEMENTtool-entry/itemno
-->
	<xsl:template match="hr-item/serialno">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center" column-number="7">
			<xsl:apply-templates select="node()"/>
		</fo:table-cell>
	</xsl:template>
	<!--
ELEMENTtool-entry/name
-->

	<xsl:template match="hr-item/hr-annex">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center">
			<xsl:apply-templates select="node()"/>
		</fo:table-cell>
	</xsl:template>
	
		<xsl:template match="hr-item/hr-sec">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center">
			<xsl:apply-templates select="node()"/>
		</fo:table-cell>
	</xsl:template>
	
		<xsl:template match="hr-item/ui">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center">
			<xsl:apply-templates select="node()"/>
		</fo:table-cell>
	</xsl:template>
	
		<xsl:template match="hr-item/qty">
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center">
			<xsl:apply-templates select="node()"/>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="partcage" mode="TOOL-MOREROWS">
		<fo:table-row>
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center">
		</fo:table-cell>
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center">
		</fo:table-cell>
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="center">
		</fo:table-cell>
			<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left">
				<fo:block>
					<xsl:value-of disable-output-escaping="no" select="partno"/>
					<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
				</fo:block>
				<fo:block>
					<xsl:text disable-output-escaping="no"> (</xsl:text>
					<xsl:value-of disable-output-escaping="no" select="cageno"/>
					<xsl:text disable-output-escaping="no">) </xsl:text>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<!--
ELEMENTtool-entry/nsn
-->
	
</xsl:stylesheet>
