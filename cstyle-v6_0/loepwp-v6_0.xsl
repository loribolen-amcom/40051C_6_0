<?xml version="1.0" encoding="utf-8"?>
<!-- Fragment document type declaration subset:
	Arbortext, Inc., 1988-2005, v.4002
	<!DOCTYPE xsl:stylesheet>
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="loepwp">

		<fo:page-sequence font-family="sans-serif" font-size="10pt" force-page-count="even" format="A" hyphenate="true" initial-page-number="1" language="en" master-reference="loepwppg" text-align="left">
			<fo:static-content flow-name="loepwppg-first-before">
				<fo:block xsl:use-attribute-sets="secur-header-attrs">
					<xsl:value-of select="$docsecr"/>
				</fo:block>
								<fo:block xsl:use-attribute-sets="tmno-header-attrs">
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
				</xsl:if> <!-- This adds the volume number after the TM number -->
				</fo:block>
			
				<fo:block text-align="justify">
					<fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
				</fo:block>
				<fo:block font-family="sans-serif" font-size="14pt" font-weight="bold" space-before="8pt" span="all" text-align="left" space-after.optimum="7pt">
					<xsl:choose>
						<xsl:when test="string-length(title[1])=0">
		<fo:block span="all" text-align="left" font-weight="bold" space-before="8pt" space-after="8pt">LIST OF EFFECTIVE PAGES/WORK
								PACKAGES</fo:block>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="title"/>
						</xsl:otherwise>
					</xsl:choose>
				</fo:block>
			</fo:static-content>
			<fo:static-content flow-name="loepwppg-first-after">
				<xsl:call-template name="LOEPWP-FOOTER">
				<xsl:with-param name="Odd-First">First</xsl:with-param>
				<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
				</xsl:call-template>
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-before">
				<fo:block xsl:use-attribute-sets="secur-header-attrs">
					<xsl:value-of select="$docsecr"/>
				</fo:block>
				<fo:block xsl:use-attribute-sets="tmno-header-attrs">
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
				<fo:block text-align="justify">
					<fo:leader xsl:use-attribute-sets="header-leader-attrs"/>
				</fo:block>
				<fo:block font-family="sans-serif" font-size="14pt" font-weight="bold" space-before="12pt" space-after="8pt" span="all" text-align="center">LIST OF
					EFFECTIVE PAGES/WORK PACKAGES - (Continued) </fo:block>
			</fo:static-content>
<fo:static-content flow-name="xsl-region-after">
				<xsl:call-template name="LOEPWP-FOOTER">
					<xsl:with-param name="Odd-Or-Even">Odd</xsl:with-param>
				</xsl:call-template>
			</fo:static-content>
			
			<fo:static-content flow-name="xsl-region-after-even">
				<xsl:call-template name="LOEPWP-FOOTER">
					<xsl:with-param name="Odd-Or-Even">Even</xsl:with-param>
				</xsl:call-template>
			</fo:static-content>

			<fo:flow flow-name="xsl-region-body">
					<fo:block>
		<fo:marker marker-class-name="blank-page"></fo:marker>
				</fo:block>
				<fo:wrapper font-family="sans-serif" font-size="10pt">
					<fo:block font-size="10pt" margin-top="10pt" space-before="10pt" span="all" text-align="left">
						<xsl:apply-templates mode="LOEPWP" select="note"/>
					</fo:block>
					<fo:block font-family="sans-serif" space-before="12pt" space-after="8pt" span="all" text-align="center">
						<xsl:choose>
							<xsl:when test="number($insert-change)+number($del-change)>0">Date of
								issue for original and changed pages/work packages are: </xsl:when>
							<xsl:when test="number($revno)+number($insert-change)+number($del-change)=0">Date of issue for original manual is: </xsl:when>
							<xsl:when test="number($revno)>0 and number($insert-change)+number($del-change)=0">Date of issue for revision is: </xsl:when>
						</xsl:choose>
					</fo:block>
					<fo:block font-family="sans-serif" span="all" text-align="left">
						<xsl:apply-templates mode="LOEPWP" select="issuechg"/>
					</fo:block>
					<fo:block space-after="10pt" space-before="10pt" text-align="center" margin-left="20pt" margin-right="20pt">
						<xsl:apply-templates select="totalnumberof"/>
					</fo:block>
					<xsl:apply-templates select="col.title[1]"/>

					<xsl:choose>
						<xsl:when test="chgvol">
							<xsl:apply-templates select="chgvol[1]"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="chghistory"/>
						</xsl:otherwise>
					</xsl:choose>
					
				</fo:wrapper>
				<fo:block>
				<fo:marker marker-class-name="blank-page">
					<xsl:text>/</xsl:text>
					<xsl:text>blank</xsl:text>
				</fo:marker>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	<xsl:template name="LOEPWP-FOOTER">
		<xsl:param name="Odd-First"/>
		<xsl:param name="Odd-Or-Even"/>
				<fo:block font-family="sans-serif" font-size="10pt" space-before.maximum="10pt" space-before.minimum="8pt" space-before.optimum="8pt" text-align="left"></fo:block>
		<fo:block space-before.maximum="10pt" space-before.minimum="8pt" space-before.optimum="9pt" text-align="center">
			<fo:page-number />
			<xsl:if test="$Odd-Or-Even='Odd'">
   	<fo:retrieve-marker retrieve-boundary="page-sequence" retrieve-class-name="blank-page" retrieve-position="last-starting-within-page" />
								</xsl:if>
								
			<!--<xsl:if test="$Odd-Or-Even='Odd' or $Odd-First='First'">
    		<fo:retrieve-marker retrieve-boundary="page-sequence" retrieve-class-name="blank_page" retrieve-position="last-ending-within-page"/>
    		</xsl:if>-->
		</fo:block>
		<fo:block xsl:use-attribute-sets="secur-footer-attrs">
			<xsl:value-of select="$docsecr"/>
		</fo:block>
	</xsl:template>

	<xsl:template match="title" mode="LOEPWP">
		<fo:block font-family="sans-serif" font-size="11pt" font-weight="bold" space-before="8pt" span="all" text-align="left">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="note" mode="LOEPWP">
			<fo:block font-size="10pt" space-before="10pt" span="all" text-align="left">
		<fo:list-block provisional-distance-between-starts="4pc" provisional-label-separation="1pc">
							<fo:list-item>
					<fo:list-item-label font-weight="bold">
					<fo:block>NOTE:</fo:block>
						
					</fo:list-item-label>
					<fo:list-item-body font-weight="normal">
					<fo:block>
						<xsl:apply-templates select="trim.para" mode="LOEPWP"/></fo:block>
					</fo:list-item-body>
				</fo:list-item>
		</fo:list-block>
					</fo:block>
	</xsl:template>
	
	<xsl:template match="trim.para" mode="LOEPWP">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="issuechg" mode="LOEPWP">
		<xsl:for-each select="issued">
			<fo:block text-align="left" span="all">
				<fo:list-block provisional-distance-between-starts="5pc" provisional-label-separation="1pc">
					<fo:list-item relative-align="baseline">
						<fo:list-item-label end-indent="label-end()">

							<fo:block>
								<xsl:value-of select="chgno"/>
								</fo:block>

						</fo:list-item-label>
						<fo:list-item-body start-indent="body-start()">
							<fo:block>
								<xsl:value-of select="chgdate"/>
							</fo:block>
						</fo:list-item-body>
					</fo:list-item>
				</fo:list-block>
			</fo:block>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="loepwp/col.title[1]">
		<fo:block space-after.maximum="30pt" space-after.minimum="10pt" space-after.optimum="20pt" span="all">
			<fo:inline font-family="sans-serif" font-size="10pt" font-weight="bold">
			<!--fo:block-->
				<xsl:text>Page/WP No.</xsl:text>
				<fo:leader leader-pattern="space"/>
				<xsl:text>Change No.</xsl:text>
				<!--/fo:block-->
			</fo:inline>
			<fo:leader leader-pattern="space"/>
			<fo:inline font-family="sans-serif" font-size="10pt" font-weight="bold">
			<!--fo:block-->
				<xsl:text>Page/WP No.</xsl:text>
				<fo:leader leader-pattern="space"/>
				<xsl:text>Change No.</xsl:text>
				<!--/fo:block-->
			</fo:inline>
		</fo:block>
	</xsl:template>
	<xsl:template match="paper.manual" mode="VOLUME">
		<xsl:value-of select="@multivolume='yes'"/>
						<xsl:text disable-output-escaping="no">VOLUME&#xa0;</xsl:text>
						<xsl:number count="volume" format="1." from="paper.manual" level="any"/>
						<xsl:text disable-output-escaping="no">&#x2002;&#x2002;</xsl:text>
		<xsl:apply-templates select="title"/>
	</xsl:template>
	
		<xsl:template match="genmaintman" mode="VOLUME">
		<xsl:value-of select="@multivolume='yes'"/>
						<xsl:text disable-output-escaping="no">VOLUME&#xa0;</xsl:text>
						<xsl:number count="volume" format="1." from="genmaintman" level="any"/>
						<xsl:text disable-output-escaping="no">&#x2002;&#x2002;</xsl:text>
		<xsl:apply-templates select="title"/>
	</xsl:template>

	<xsl:template match="chgvol[1]">
		<fo:block text-transform="uppercase" font-weight="bold">
			<xsl:apply-templates/>
		</fo:block>
		<xsl:apply-templates select="following-sibling::node()"/>
	</xsl:template>
	<xsl:template match="chghistory">
		<fo:block text-align="left">
			<fo:inline>
				<xsl:apply-templates select="wpno | pageno | title"/>
		<xsl:choose>
		<xsl:when test="@modified='added'">
					<xsl:text> (</xsl:text>
					<xsl:text>Added</xsl:text>
					<xsl:text>) </xsl:text>
		</xsl:when>
		<xsl:when test="@modified='deleted'">
					<xsl:text> (</xsl:text>
					<xsl:text>Deleted</xsl:text>
					<xsl:text>) </xsl:text>
		</xsl:when>
		<xsl:when test="@modified='blank'">
					<xsl:text> (</xsl:text>
					<xsl:text>Blank</xsl:text>
					<xsl:text>) </xsl:text>
		</xsl:when>
		<xsl:when test="@modified='none'">
		</xsl:when>
		<xsl:otherwise/>
		</xsl:choose>
				<!--<xsl:value-of select="@modified"/>-->
	<fo:leader leader-pattern="dots" leader-length.optimum="100%" leader-length.maximum="100%" leader-length.minimum="0pt"/>
	    		<xsl:value-of select="chgno"/>
			</fo:inline>
		</fo:block>
	</xsl:template>

	<xsl:template match="chghistory/wpno">
		<xsl:variable name="workpkgid">
			<xsl:value-of select="@wpref"/>
		</xsl:variable>
		<fo:basic-link internal-destination="{@wpref}">
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
<xsl:choose>
		<xsl:when test="string-length(following-sibling::wppages)&gt;0">
					<xsl:text> (</xsl:text>
		<xsl:value-of select="following-sibling::wppages"/>
		<xsl:text>) </xsl:text>
		
					</xsl:when>
					
		<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="chghistory/title[1]">
		<xsl:apply-templates/>
		<xsl:choose>
					<xsl:when test="string-length(following-sibling::totnum.pages)&gt;0">
					<xsl:text> (</xsl:text>
		<xsl:value-of select="following-sibling::totnum.pages"/>
		<xsl:text>) </xsl:text>
			</xsl:when>
		<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="chghistory/pageno[1]">
		<xsl:apply-templates/>
				<!--<xsl:value-of
 select="pageno"/>-->
	</xsl:template>
	<xsl:template match="chghistory/pageno[2]">
		<xsl:text> &#x2013; </xsl:text>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="chghistory/chgno">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="totalnumberof">
		<fo:block space-after.maximum="24pt" space-after.minimum="20pt" space-after.optimum="22pt" span="all" text-align="center">
			<fo:inline font-family="sans-serif" font-weight="bold" font-size="10pt">
				<xsl:apply-templates select="node()"/>
				<xsl:text>&#x2002;</xsl:text>
			</fo:inline>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
