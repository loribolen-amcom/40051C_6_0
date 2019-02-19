<?xml version="1.0" encoding="utf-8"?>
<!-- Fragment document type declaration subset:
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:template match="emergencywp">

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
				<!--xsl:otherwise>
					<xsl:apply-templates mode="count" select="wpidinfo"/>
				</xsl:otherwise-->
			</xsl:choose>
		</xsl:param>

			<xsl:call-template name="emerg-pageset">
			<xsl:with-param name="wpseqno" select="$wpseqno"/>
</xsl:call-template>
	</xsl:template>

<xsl:template name="emerg-pageset">
				<xsl:param name="Odd-Or-Even"/>
		<xsl:param name="wpseqno"/>
		<!--<xsl:variable name="importing-base-uri" select="base-uri()"/>--> <!-- is the xml file base directory -->
<xsl:variable name="resource-location-url" select="resolve-uri('emergencywp-v6_0.xsl')" /><!-- is the xsl file base directory -->
<xsl:variable name="resource">
	<xsl:value-of select="replace($resource-location-url,'file:/.:','')"/>
</xsl:variable>
<xsl:variable name="slash2">
	<xsl:value-of select="concat(replace($resource,'/emergencywp-v6_0.xsl',''), '//slash2.gif')"/>
</xsl:variable>
<xsl:variable name="slashrt">
	<xsl:value-of select="concat(replace($resource,'/emergencywp-v6_0.xsl',''), '//slashrt.gif')"/>
</xsl:variable>
<!--<xsl:variable name="resource-location-url" select="resolve-uri('emergencywp-v6_0.xsl')" />
<xsl:variable name="importing-base-uri" select="base-uri()"/> 	-->	

<fo:page-sequence color="#000000" font-family="sans-serif" font-size="10pt"  format="1" hyphenate="false" initial-page-number="1" language="en" line-height="1.15em" master-reference="emergpg" text-align="left" >
			<fo:static-content flow-name="emergpg-before">
    <fo:block-container absolute-position="fixed" bottom="10in" margin-left="-0.9in">
      <fo:block>
<!--      <fo:external-graphic src='url("slash2.gif")' />-->
                          <fo:external-graphic src="url({$slash2})" />
                          </fo:block>
                          </fo:block-container>
      <!--other header stuff that shows up in the before region-->
				<xsl:call-template name="WP-HEADER-EMERG">
					<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
					<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
				</xsl:call-template>
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-before-odd">
			 <fo:block-container absolute-position="fixed" bottom="9.75in" margin-left="-1.0in">
			 <fo:block>
				  <!--<fo:external-graphic src='url("slash2.gif")' />-->
                          <fo:external-graphic src="url({$slash2})" />
                          </fo:block>
                          </fo:block-container>
				<xsl:call-template name="WP-HEADER-EMERG">
					<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
					<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
				</xsl:call-template>
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-before-even">
			 <fo:block-container absolute-position="fixed" bottom="10.0in" margin-left="-1.0in">
			  <fo:block >
                          <fo:external-graphic src="url({$slash2})" />
                           </fo:block>
                          </fo:block-container>
				<xsl:call-template name="WP-HEADER-EMERG">
					<xsl:with-param name="Odd-Or-Even">Even</xsl:with-param>
					<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
				</xsl:call-template>
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-after-odd" >
			<xsl:call-template name="WP-FOOTER">
					<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
					<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
				</xsl:call-template>
      <fo:block-container absolute-position="fixed" top="10.0in" margin-left="-1.0in">
       <fo:block>
                        	<fo:external-graphic src="url({$slash2})" />
                        	 </fo:block>
							</fo:block-container>
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-after-even" >
				<xsl:call-template name="WP-FOOTER">
					<xsl:with-param name="Odd-Or-Even">Even</xsl:with-param>
					<xsl:with-param name="WpSeqNo" select="$wpseqno"/>
				</xsl:call-template>
      <fo:block-container absolute-position="fixed" top="10.0in" margin-left="-1.0in">
       <fo:block>
                        	<fo:external-graphic src="url({$slash2})" />
                        	 </fo:block>
							</fo:block-container>
			</fo:static-content>
			
			<fo:static-content flow-name="xsl-region-end">
			 <fo:block-container absolute-position="fixed"  margin-right="-0.5in">
				      <!--<fo:block-container absolute-position="fixed" >-->
				      <fo:block >
                        	<fo:external-graphic src="url({$slashrt})" /></fo:block>
							</fo:block-container>
			</fo:static-content>
			
			<fo:static-content flow-name="xsl-region-start" >
			  <fo:block-container absolute-position="fixed" margin-left="-0.5in">		
				      <fo:block >
                        	<fo:external-graphic src="url({$slashrt})" />
                        	</fo:block>
							</fo:block-container>
			</fo:static-content>			
			
			<fo:static-content flow-name="xsl-region-after-blank">
				<fo:block></fo:block>
			</fo:static-content>
			
			<fo:flow flow-name="xsl-region-body" >
		<fo:marker marker-class-name="blank-page"/>
		<fo:wrapper space-after.conditionality="discard" space-after.maximum="160pt" space-after.minimum="150pt" space-after.optimum="155pt" space-before.conditionality="discard" space-before.maximum="180pt" space-before.minimum="140pt" space-before.optimum="160pt"  margin-right="0.5in">

			<fo:block space-before="12pt">
			<xsl:text>&#x2002;</xsl:text>
			<xsl:apply-templates select="node()"/>
			</fo:block>
	</fo:wrapper>
				<fo:block keep-with-previous.within-page="always" space-before.optimum="12pt" span="all" xsl:use-attribute-sets="titlesub" border-right="2pt">
				<xsl:text>END OF WORK PACKAGE</xsl:text>
			</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
		<xsl:template name="WP-HEADER-EMERG">
		<xsl:param name="Odd-Or-Even"/>
		<xsl:param name="WpSeqNo"/>
		<fo:block xsl:use-attribute-sets="secur-header-attrs">
			<xsl:value-of select="$docsecr"/>
		</fo:block>

				<fo:wrapper>
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

				<fo:block span="all">
			<fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>