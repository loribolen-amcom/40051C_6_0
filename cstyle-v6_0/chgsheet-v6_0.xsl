<?xml version="1.0" encoding="utf-8"?>
<!-- Fragment document type declaration subset:
Arbortext, Inc., 1988-2005, v.4002
<!DOCTYPE xsl:stylesheet>
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="chgsheet">
	<xsl:param name="Odd-Or-Even"/>
			<fo:page-sequence color="#000000" force-page-count="even" format="1" hyphenate="true" initial-page-number="1" language="en" line-height="1.15em" master-reference="chgrecpg" text-align="center">
			
					<fo:static-content flow-name="xsl-region-before-first">
						<xsl:call-template name="chgsheet-HEADER">
							<xsl:with-param name="Odd-First">First</xsl:with-param>
						</xsl:call-template>
					</fo:static-content>

					<fo:static-content flow-name="xsl-region-before">
						<xsl:call-template name="chgsheet-HEADER">
						</xsl:call-template>
					</fo:static-content>			
			
			<fo:static-content flow-name="titleblkpg-first-after">
				<fo:block xsl:use-attribute-sets="secur-footer-attrs">
					<xsl:value-of select="$docsecr"/>
				</fo:block>
			</fo:static-content>
			
			<fo:static-content flow-name="xsl-region-after">
				<fo:block xsl:use-attribute-sets="secur-footer-attrs">
					<xsl:value-of select="$docsecr"/>
				</fo:block>
			</fo:static-content>
			
			<fo:flow flow-name="xsl-region-body">
			<!-- copied from titleblk.xsl minus reporting and currentasof-->
			<fo:block space-before.conditionality="retain" space-before.maximum="8pt" space-before.minimum="6pt" space-before.optimum="7pt" span="all">
				<!--<fo:block xsl:use-attribute-sets="secur-header-attrs">
					<xsl:value-of select="$docsecr"/>
				</fo:block>-->
				<!--<fo:block font-family="sans-serif" font-size="12pt" font-weight="bold" span="all" text-align="center">
					<xsl:value-of select="(preceding::tmno)[1]"/>
				<xsl:choose>
					<xsl:when test="//sum">
						<xsl:text>&#x02010;SUM</xsl:text>
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
				</xsl:if>This adds the volume number after the TM number
				</fo:block>-->
				 <!--<fo:block text-align="justify"><fo:leader leader-pattern="rule" leader-length="100%"/>
			</fo:block>-->

					<fo:block font-family="sans-serif" font-size="12pt" font-weight="bold" text-align="right" space-after="2pt" space-before="12pt" span="all" text-transform="uppercase">
<fo:table table-layout="fixed" width="100%">
   <fo:table-column column-width="proportional-column-width(1)"/>
   <fo:table-column column-width="proportional-column-width(2)"/>
					<fo:table-body margin="4pt">
						<fo:table-row>
							<fo:table-cell column-number="1" text-align="left">
								<fo:block font-family="sans-serif" font-size="12pt" >
								<xsl:text disable-output-escaping="no">Change</xsl:text>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="2" text-align="right">
					<fo:block font-family="sans-serif" font-size="12pt" font-weight="bold" text-align="right" space-after="2pt" space-before="12pt" span="all" text-transform="uppercase">
						<xsl:apply-templates select="servnomen"/>
					</fo:block>
							</fo:table-cell>
							</fo:table-row>
						<fo:table-row>
							<fo:table-cell column-number="1" text-align="left">
								<fo:block font-family="sans-serif" font-size="12pt" margin="6pt" >
									<xsl:text disable-output-escaping="no">No. </xsl:text>
									<xsl:value-of select="chgno"/>							
								</fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="2" text-align="right">
					<fo:block font-family="sans-serif" font-size="12pt" font-weight="bold" space-after="36pt" space-before="2pt" span="all" text-align="right" text-transform="uppercase">
								<xsl:choose>
								<xsl:when test="string-length(/production/paper.manual/paper.frnt/chgsheet/city)&gt;0">
								<xsl:value-of disable-output-escaping="no" select="city"/>
								<xsl:text disable-output-escaping="no">, </xsl:text>
							</xsl:when>
							<xsl:otherwise>WASHINGTON, </xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
							<xsl:when test="string-length(/production/paper.manual/paper.frnt/chgsheet/state)&gt;0">
								<xsl:value-of disable-output-escaping="no" select="state"/>
								<xsl:text disable-output-escaping="no">, </xsl:text>
							</xsl:when>
							<xsl:otherwise>D.C.
							<xsl:text disable-output-escaping="no">, </xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:value-of disable-output-escaping="no" select="chgdate"/>
					</fo:block>
							</fo:table-cell>
							</fo:table-row>
							</fo:table-body>
					</fo:table>
					</fo:block>

					<fo:block><xsl:apply-templates select="prtitle | stitle | weapon-system"/></fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
					<fo:block>&#x2002;</fo:block>
					<!--fo:block>&#x2002;</fo:block-->
				</fo:block>
				
				<fo:block font-family="sans-serif" font-size="7pt">
					<xsl:apply-templates select="notices"/>
				</fo:block>				
				<fo:block font-family="sans-serif" span="all">
					<xsl:apply-templates select="trim.para | chglist | authent"/>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>

	<xsl:template match="chgsheet/prtitle">
		<fo:wrapper font-family="sans-serif" font-size="12pt" margin="20pt" font-weight="bold" text-transform="uppercase">
			<xsl:if test="ancestor::frntcover">
				<fo:block span="all">
					<fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
				</fo:block>
			</xsl:if>
		 	<xsl:choose>			<!-- dmwr and lo and TMs are the 3 pubs types to consider -->
				<xsl:when test="//dmwr_ammo"> <!-- type and maintlvl same do nothing -->
				</xsl:when>
				<xsl:when test="//paper.manual[@maintlvls='dmwr'] or //paper.manual[@maintlvls='nmwr'] or //paper.manual[@maintlvls='dmwr-nmwr']"> <!-- type and maintlvl same, do nothing -->
				</xsl:when>				
				<xsl:when test="//lubeorder"> <!-- type and maintlvl same do nothing -->
				</xsl:when>
				<xsl:otherwise> <!-- all other cases get TECHNICAL MANUAL -->
					<fo:block space-after.maximum="6pt" space-after.minimum="2pt" space-after.optimum="2pt" space-before.maximum="26pt" space-before.minimum="20pt" space-before.optimum="24pt" span="all" text-align="center">TECHNICAL MANUAL</fo:block>
		 		</xsl:otherwise>			
		 	</xsl:choose>			

		 	<fo:block space-after.maximum="6pt" space-after.minimum="4pt" space-after.optimum="4pt" space-before.conditionality="discard" space-before.maximum="18pt" space-before.minimum="14pt" space-before.optimum="17pt" span="all" text-align="center">
				<xsl:value-of select="$typelvltitle"/>
			</fo:block>
			<xsl:if test="//paper.manual/@maintlvls='dmwr-nmwr'">
			  <fo:block space-after.maximum="6pt" space-after.minimum="2pt" space-after.optimum="2pt" space-before.maximum="2pt" space-before.minimum="2pt" space-before.optimum="2pt" span="all" text-align="center">CONTAINING</fo:block>
				<fo:block font-weight="bold" space-after.maximum="6pt" space-after.minimum="2pt" space-after.optimum="2pt" space-before.maximum="2pt" space-before.minimum="2pt" space-before.optimum="2pt" span="all" text-align="center">NATIONAL OVERHAUL STANDARDS</fo:block>
			</xsl:if>
			<fo:block space-after.maximum="6pt" space-after.minimum="4pt" space-after.optimum="4pt" space-before.conditionality="discard" space-before.maximum="18pt" space-before.minimum="14pt" space-before.optimum="17pt" span="all" text-align="center">
				<xsl:value-of select="$rpstl"/>
			</fo:block>
			<fo:block space-after.maximum="12pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="4pt" space-before.minimum="0pt" space-before.optimum="4pt" span="all" text-align="center">
				<xsl:text>FOR</xsl:text>
			</fo:block>
			<fo:block space-after.maximum="12pt" space-after.minimum="10pt" space-after.optimum="10pt" space-before.maximum="4pt" space-before.minimum="0pt" space-before.optimum="4pt" span="all" text-align="center">
  			<xsl:apply-templates/>
  		</fo:block>
		</fo:wrapper>
	</xsl:template>

	<xsl:template match="chgsheet/trim.para">
		<xsl:value-of select="node()"/>
		<xsl:if test="count(preceding-sibling::trim.para)=0">
			<fo:block font-family="sans-serif" font-size="12pt" font-weight="normal" space-before="12pt" text-align="left">
				<xsl:value-of select="(preceding::tmno)[1]"/>
				<xsl:text>, </xsl:text>
				<fo:inline text-transform="capitalize">
					<xsl:value-of select="$pubdate"/>
				</fo:inline>
				<xsl:text>, is updated as follows:</xsl:text>
			</fo:block>
		</xsl:if>
	</xsl:template>

	<xsl:template match="chglist">
	<!--<fo:block text-align="left">		-->
		<fo:list-block provisional-distance-between-starts="21pt" provisional-label-separation="4pt" text-align="left" space-before.conditionality="retain" space-before="12pt" >
			<fo:list-item relative-align="baseline" space-before.conditionality="discard" space-before.maximum="2pt" space-before.minimum="2pt" space-before.optimum="2pt">
				<fo:list-item-label relative-align="baseline" end-indent="label-end()">
					<fo:block font-family="sans-serif" relative-align="baseline">
						<xsl:number count="chglist" format="1." from="chgsheet" level="any"/>
					</fo:block>
				</fo:list-item-label>
				<fo:list-item-body relative-align="baseline" start-indent="body-start()">
					<fo:block>
						<xsl:apply-templates select="trim.para | chgpagelist | chgwplist"/>
					</fo:block>
				</fo:list-item-body>
			</fo:list-item>
		</fo:list-block>
	<!--</fo:block>-->
	</xsl:template>

	<xsl:template match="chgpagelist">
		<xsl:choose>
		<xsl:when test="string-length(title[1])=0">
			<!--<fo:block start-indent="6pc">-->
					<fo:list-block provisional-distance-between-starts="12pc" provisional-label-separation="1pc" start-indent="6pc">
						<fo:list-item space-before="10pt">
							<fo:list-item-label>
								<fo:inline font-weight="bold" text-decoration="underline">Remove Pages</fo:inline>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:inline font-weight="bold" text-decoration="underline">Insert Pages</fo:inline>
							</fo:list-item-body>
						</fo:list-item>
						<xsl:apply-templates select="chgpage"/>
					</fo:list-block>
				<!--</fo:block>-->
		</xsl:when>
		<xsl:otherwise>
		<!--<fo:block start-indent="6pc">-->
					<fo:list-block provisional-distance-between-starts="12pc" provisional-label-separation="1pc" start-indent="6pc">
						<fo:list-item space-before="10pt">
							<fo:list-item-label>
								<fo:inline font-weight="bold" text-decoration="underline"><xsl:value-of select="child::title[1]"/></fo:inline>
							</fo:list-item-label>
							<fo:list-item-body>
								<fo:inline font-weight="bold" text-decoration="underline"><xsl:value-of select="child::title[2]"/></fo:inline>
							</fo:list-item-body>
						</fo:list-item>
						<xsl:apply-templates select="chgpage"/>
					</fo:list-block>
				<!--</fo:block>-->
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="chglist/trim.para">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="chgpage">
		<xsl:apply-templates select="node()"></xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="removepg">
	<fo:list-block>
			<fo:list-item space-before.conditionality="retain" space-before="6pt">
			<fo:list-item-label end-indent="label-end()">
				<xsl:apply-templates></xsl:apply-templates>
			</fo:list-item-label>
			<fo:list-item-body>
				<xsl:value-of select="following-sibling::node()[1]"/>
			</fo:list-item-body>
		</fo:list-item>
		</fo:list-block>
	</xsl:template>

	<xsl:template match="insertpg">
		<!--<xsl:apply-templates/>-->
	</xsl:template>
	<xsl:template match="chgwplist">
		<fo:block font-weight="bold" space-before="10pt" start-indent="9pc" text-decoration="underline">Work Package Number</fo:block>
		<xsl:apply-templates select="wpno"/>
	</xsl:template>

	<xsl:template match="chgwplist/wpno">
		<xsl:variable name="workpkgno">
			<xsl:value-of select="@wpref"/>
		</xsl:variable>
		<fo:block space-before="3pt" span="all" start-indent="9pc" space-before.maximum="1pt" space-before.minimum="1pt" >
			<fo:inline>
				<fo:basic-link internal-destination="{@wpref}">
			<xsl:for-each select="//*[@wpno]">
				<xsl:if test="@wpno=$workpkgno">
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
			</fo:inline>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="chgsheet/authent[@boardno]" name="authent">
		<fo:block space-before.maximum="10pt" space-before.minimum="8pt" space-before.optimum="8pt" span="all">
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
			</fo:external-graphic>
		</fo:block>
	</xsl:template>

	<xsl:template name="chgsheet-HEADER">
		<xsl:param name="Odd-First"/>
	
				<fo:block xsl:use-attribute-sets="secur-header-attrs">
					<xsl:value-of select="$docsecr"/>
					<fo:block font-family="sans-serif" font-size="12pt" font-weight="bold" span="all" text-align="center">
							<xsl:value-of select="(preceding::tmno)[1]"/>

						<xsl:choose>
					<xsl:when test="$Odd-First='First'">
					</xsl:when>
					<xsl:otherwise>
    									<xsl:text>, C&#x02010;</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
							<xsl:value-of select="chgno"/>
						<xsl:choose>
					<xsl:when test="//sum">
						<xsl:text>&#x02010;SUM</xsl:text>
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
						<fo:block text-align="justify"><fo:leader leader-pattern="rule" leader-length="100%"/>
						</fo:block>
					</fo:block>
				</fo:block>
</xsl:template>

</xsl:stylesheet>