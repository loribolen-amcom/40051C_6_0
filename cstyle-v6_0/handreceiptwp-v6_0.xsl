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
ELEMENT hrlist
-->
	<xsl:template match="hrlist">
			<fo:table-and-caption hyphenate="true" hyphenation-character="-" hyphenation-keep="column">
				<fo:table-caption font-family="sans-serif" font-size="10pt" font-weight="bold" text-align="center">
					<fo:block space-after="10pt" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt" span="all">
						<xsl:choose>
							<xsl:when test="following-sibling::title">
								<xsl:apply-templates select="child::node()"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text >Hand Receipt</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</fo:block>
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

					<fo:table-header>
	<fo:table-row>
			<!-- 2 top rows -->
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" text-align="center" font-family="sans-serif" font-size="8pt" column-number="1" number-columns-spanned="4">
					<fo:block>HAND RECEIPT / ANNEX NUMBER</fo:block>
					<fo:block>For use of this form, see DA PAM 710-2-1</fo:block>
					<fo:block>The proponent agency is DCS, G-4.</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" column-number="5" number-columns-spanned="1">
					<fo:block>FROM:</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" column-number="6" number-columns-spanned="5">
					<fo:block>TO:</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="11" number-columns-spanned="6" padding-bottom="4pt" padding-top="4pt">
					<fo:block>HAND RECEIPT NUMBER</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				</fo:table-row>
				
				<!--Row 2-->
			
				<fo:table-row>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" text-align="center" font-family="sans-serif" font-size="8pt" column-number="1" starts-row="true" >
					<fo:block>&#x2002; FOR</fo:block>
					<fo:block>ANNEX/CR</fo:block>
					<fo:block>ONLY</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" column-number="2" number-columns-spanned="2"> 
					<fo:block>END ITEM STOCK NUMBER</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" column-number="4" number-columns-spanned="2">
					<fo:block>END ITEM DESCRIPTION</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="6" number-columns-spanned="4" padding-bottom="4pt" padding-top="4pt">
					<fo:block>PUBLICATION NUMBER</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="10" number-columns-spanned="4" padding-bottom="4pt" padding-top="4pt">
					<fo:block>PUBLICATION DATE</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<!--		-->
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="14" padding-bottom="4pt" padding-top="4pt" number-columns-spanned="3">
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
					<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold" column-number="10">
						<fo:block margin-bottom="3pt" span="all" text-align="center">QTY</fo:block>
					</fo:table-cell>
	<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" number-columns-spanned="6" padding-bottom="4pt" padding-top="4pt" column-number="11" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">g.  QUANTITY</fo:block>
					</fo:table-cell>
			</fo:table-row>
			
			<fo:table-row font-weight="bold" text-transform="uppercase">
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold" column-number="1" number-columns-spanned="2">
					<fo:block margin-bottom="3pt" span="all" text-align="center">STOCK NUMBER</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">a.</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" text-align="center" font-weight="bold" column-number="3" number-columns-spanned="4">
					<fo:block margin-bottom="3pt" span="all" text-align="center">ITEM DESCRIPTION</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">b.</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt"  text-align="center" font-weight="bold" column-number="7">
					<fo:block margin-bottom="3pt" span="all" text-align="center">*</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">c. </fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt"  text-align="center" font-weight="bold" column-number="8">
					<fo:block margin-bottom="3pt" span="all" text-align="center">SEC</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">d.</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt"  text-align="center" font-weight="bold" column-number="9">
						<fo:block margin-bottom="3pt" span="all" text-align="center">UI</fo:block>
						<fo:block margin-bottom="3pt" span="all" text-align="center">e.</fo:block>
					</fo:table-cell>
					<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" text-align="center" font-weight="bold" column-number="10">
						<fo:block margin-bottom="3pt" span="all" text-align="center">AUTH</fo:block>
						<fo:block margin-bottom="3pt" span="all" text-align="center">f.</fo:block>
					</fo:table-cell>
	<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="2" padding-bottom="4pt" padding-top="4pt" text-align="center" font-weight="bold" column-number="11">
						<fo:block margin-bottom="3pt" span="all" text-align="center">A</fo:block>
					</fo:table-cell>
		<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="2" padding-bottom="4pt" padding-top="4pt" column-number="12" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">B</fo:block>
					</fo:table-cell>	
						<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="2" padding-bottom="4pt" padding-top="4pt" column-number="13" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">C</fo:block>
					</fo:table-cell>
						<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="2" padding-bottom="4pt" padding-top="4pt" column-number="14" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">D</fo:block>
					</fo:table-cell>
						<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="2" padding-bottom="4pt" padding-top="4pt" column-number="15" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">E</fo:block>
					</fo:table-cell>
						<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="2" padding-bottom="4pt" padding-top="4pt" column-number="16" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">F</fo:block>
					</fo:table-cell>
			</fo:table-row>
			<!--<xsl:choose>					
					<xsl:when test="hr-category">
						<xsl:apply-templates select="hr-category"></xsl:apply-templates>
							</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="hr-entry"/>
						</xsl:otherwise>
						</xsl:choose>-->
		
			</fo:table-body>
		
					<!--	<fo:table-body>
					
					
				<xsl:call-template name="HR-HEADER"/>
						<xsl:choose>
							<xsl:when test="hr-category">
								<xsl:apply-templates select="hr-category"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="hr-entry"/>
							</xsl:otherwise>
						</xsl:choose>
					</fo:table-body>-->
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
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" text-align="center" font-family="sans-serif" font-size="8pt" column-number="1" number-columns-spanned="4">
					<fo:block>HAND RECEIPT / ANNEX NUMBER</fo:block>
					<fo:block>For use of this form, see DA PAM 710-2-1</fo:block>
					<fo:block>The proponent agency is DCS, G-4.</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" column-number="5" number-columns-spanned="1">
					<fo:block>FROM:</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" column-number="6" number-columns-spanned="5">
					<fo:block>TO:</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="11" number-columns-spanned="6" padding-bottom="4pt" padding-top="4pt">
					<fo:block>HAND RECEIPT NUMBER</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				</fo:table-row>
				
				<!--Row 2-->
			
				<fo:table-row>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" text-align="center" font-family="sans-serif" font-size="8pt" column-number="1" starts-row="true" >
					<fo:block>&#x2002; FOR</fo:block>
					<fo:block>ANNEX/CR</fo:block>
					<fo:block>ONLY</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" column-number="2" number-columns-spanned="2"> 
					<fo:block>END ITEM STOCK NUMBER</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" padding-bottom="4pt" padding-top="4pt" column-number="4" number-columns-spanned="2">
					<fo:block>END ITEM DESCRIPTION</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="6" number-columns-spanned="4" padding-bottom="4pt" padding-top="4pt">
					<fo:block>PUBLICATION NUMBER</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<fo:table-cell border-bottom="solid" border-bottom-width=".5pt" border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="10" number-columns-spanned="4" padding-bottom="4pt" padding-top="4pt">
					<fo:block>PUBLICATION DATE</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
				</fo:table-cell>
				<!--		-->
				<fo:table-cell border-left="solid" border-left-width=".5pt" border-right="solid" border-right-width=".5pt" column-number="14" padding-bottom="4pt" padding-top="4pt" number-columns-spanned="3">
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
					<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold" column-number="10">
						<fo:block margin-bottom="3pt" span="all" text-align="center">QTY</fo:block>
					</fo:table-cell>
	<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" number-columns-spanned="6" padding-bottom="4pt" padding-top="4pt" column-number="11" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">g.  QUANTITY</fo:block>
					</fo:table-cell>
			</fo:table-row>
			
			<fo:table-row font-weight="bold" text-transform="uppercase">
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" starts-row="true" text-align="center" font-weight="bold" column-number="1" number-columns-spanned="2">
					<fo:block margin-bottom="3pt" span="all" text-align="center">STOCK NUMBER</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">a.</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" text-align="center" font-weight="bold" column-number="3" number-columns-spanned="4">
					<fo:block margin-bottom="3pt" span="all" text-align="center">ITEM DESCRIPTION</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">b.</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt"  text-align="center" font-weight="bold" column-number="7">
					<fo:block margin-bottom="3pt" span="all" text-align="center">*</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">c. </fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt"  text-align="center" font-weight="bold" column-number="8">
					<fo:block margin-bottom="3pt" span="all" text-align="center">SEC</fo:block>
					<fo:block margin-bottom="3pt" span="all" text-align="center">d.</fo:block>
				</fo:table-cell>
				<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt"  text-align="center" font-weight="bold" column-number="9">
						<fo:block margin-bottom="3pt" span="all" text-align="center">UI</fo:block>
						<fo:block margin-bottom="3pt" span="all" text-align="center">e.</fo:block>
					</fo:table-cell>
					<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="0" padding-bottom="4pt" padding-top="4pt" text-align="center" font-weight="bold" column-number="10">
						<fo:block margin-bottom="3pt" span="all" text-align="center">AUTH</fo:block>
						<fo:block margin-bottom="3pt" span="all" text-align="center">f.</fo:block>
					</fo:table-cell>
	<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="2" padding-bottom="4pt" padding-top="4pt" text-align="center" font-weight="bold" column-number="11">
						<fo:block margin-bottom="3pt" span="all" text-align="center">A</fo:block>
					</fo:table-cell>
		<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="2" padding-bottom="4pt" padding-top="4pt" column-number="12" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">B</fo:block>
					</fo:table-cell>	
						<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="2" padding-bottom="4pt" padding-top="4pt" column-number="13" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">C</fo:block>
					</fo:table-cell>
						<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="2" padding-bottom="4pt" padding-top="4pt" column-number="14" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">D</fo:block>
					</fo:table-cell>
						<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="2" padding-bottom="4pt" padding-top="4pt" column-number="15" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">E</fo:block>
					</fo:table-cell>
						<fo:table-cell border-after-style="solid" border-after-width="1pt" border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" display-align="after" number-rows-spanned="2" padding-bottom="4pt" padding-top="4pt" column-number="16" text-align="center" font-weight="bold">
						<fo:block margin-bottom="3pt" span="all" text-align="center">F</fo:block>
					</fo:table-cell>
			</fo:table-row>
			<xsl:choose>					
					<xsl:when test="hr-category">
						<xsl:apply-templates select="hr-category"></xsl:apply-templates>
							</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="hr-entry"/>
						</xsl:otherwise>
						</xsl:choose>
		
			</fo:table-body>
		
	</xsl:template>
	
	
	<!--
ELEMENT hr-category
-->

<xsl:template match="hr-category">
<xsl:call-template name="CHANGEBAR"/>
		<fo:table-row vertical-align="middle">
			<fo:table-cell border-bottom-style="solid" border-bottom-width="0.75pt" border-top-style="solid" border-top-width="0.75pt" number-columns-spanned="16" padding="4pt" vertical-align="middle" column-number="1">
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
		<xsl:apply-templates select="hr-entry/nsn"/>
		<!--<xsl:apply-templates select="node()"/>
			<xsl:apply-templates select="cageno"/>
			<xsl:apply-templates select="partno"/>
			<xsl:apply-templates select="hr-annex"/>
			<xsl:apply-templates select="sec"/>
			<xsl:apply-templates select="ui"/>
			<xsl:apply-templates select="qty"/>-->
			<!--<xsl:apply-templates select="nsn | name | partno | partcage | hr-annex | sec | ui | qty"/>-->
		</fo:table-row>
		<!--<xsl:apply-templates mode="HR-MOREROWS" select="partcage[position()>1]"/>-->
	</xsl:template>
	<!--
ELEMENTtool-entry/itemno
-->
	<xsl:template match="hr-entry/nsn">
<!--		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left">
			<fo:block>
				<xsl:call-template name="NSN-VALUE">
					<xsl:with-param name="Fsc" select="fsc"/>
					<xsl:with-param name="Niin" select="niin"/>
				</xsl:call-template>
			</fo:block>
		</fo:table-cell>-->
		
		<fo:table-cell column-number="1" padding-bottom="3pt" padding-left="3pt" padding-right="3pt" padding-top="3pt" text-align="center" number-columns-spanned="2"  >
			<fo:block>
				<xsl:call-template name="NSN-VALUE">
					<xsl:with-param name="Fsc">
						<xsl:value-of select="fsc"/>
					</xsl:with-param>
					<xsl:with-param name="Niin">
						<xsl:value-of select="niin"/>
					</xsl:with-param>
				</xsl:call-template>
			</fo:block>
		</fo:table-cell>
		
	</xsl:template>
	<!--
ELEMENTtool-entry/name
-->
	<xsl:template match="hr-entry/name">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left" column-number="3" number-columns-spanned="4">
			<fo:block>
				<xsl:apply-templates select="node()"/>
				<xsl:apply-templates select="partcage"/>
				<xsl:apply-templates select="hr-entry/partno"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="hr-entry/partcage[1]">
		<!--<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left">-->
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
		<!--</fo:table-cell>-->
	</xsl:template>
	<!--
ELEMENTtool-entry/partno
-->
	<xsl:template match="hr-entry/partno">
<!--		<fo:table-cell border-left-style="solid" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left">-->
			<fo:block>
				<xsl:value-of disable-output-escaping="no" select="partno[1]"/>
				<xsl:text disable-output-escaping="no">&#x2002;</xsl:text>
			</fo:block>
			<xsl:if test="not(string-length(../cageno)=0)">
				<fo:block>
					<xsl:text> (</xsl:text>
					<xsl:value-of disable-output-escaping="no" select="cageno[1]"/>
					<xsl:text>) </xsl:text>
				</fo:block>
			</xsl:if>
	<!--	</fo:table-cell>-->
	</xsl:template>
	<!--<xsl:template match="partcage" mode="TOOL-MOREROWS">
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
	-->

	<xsl:template match="hr-entry/hr-annex">
		<fo:table-cell border-left-style="solid" column-number="7" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left" >
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="hr-entry/sec">
		<fo:table-cell border-left-style="solid" column-number="8" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left" >
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="hr-entry/ui">
		<fo:table-cell border-left-style="solid" column-number="9" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="hr-entry/qty">
		<fo:table-cell border-left-style="solid" column-number="10" border-left-width="0.5pt" border-right-style="solid" border-right-width="0.5pt" padding-after="4pt" padding-before="4pt" text-align="left">
			<fo:block>
				<xsl:apply-templates select="node()"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
</xsl:stylesheet>
