<?xml version="1.0" encoding="utf-8"?>
<!-- Fragment document type declaration subset:
Arbortext, Inc., 1988-2305, v.4002
<!DOCTYPE xsl:stylesheet>
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="warning.group | caution.group | note.group">
		<!--	<fo:block font-weight="normal" space-after="6pt" space-before="12pt" space-before.conditionality="discard" span="all" display-align="center" text-align="center">-->
		<xsl:if test="not(ancestor::warnsum)">
			<!--<xsl:attribute name="keep-with-next">always</xsl:attribute>-->
		</xsl:if>
		<xsl:choose>
			<xsl:when test='(position()=1 and local-name(.)="warning.group")'>
				<fo:block font-family="sans-serif" font-size="120%" font-weight="bold" keep-with-next="always" space-after="6pt" text-align="center" display-align="center" margin-left="20pt" margin-right="20pt" text-align-last="center">WARNING</fo:block>
			</xsl:when>
			<xsl:when test='(position()=1 and local-name(.)="caution.group")'>
				<fo:block font-family="sans-serif" font-size="120%" font-weight="bold" keep-with-next="always" space-after="6pt" text-align="center" display-align="center" margin-left="20pt" margin-right="20pt" text-align-last="center">CAUTION</fo:block>
			</xsl:when>
			<xsl:when test='(position()=1 and local-name(.)="note.group")'>
				<fo:block font-family="sans-serif" font-size="120%" font-weight="bold" keep-with-next="always" space-after="6pt" text-align="center" display-align="center" margin-left="20pt" margin-right="20pt" text-align-last="center">NOTE</fo:block>
			</xsl:when>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="title">
				<fo:block keep-together="always" keep-with-next="always" space-after.maximum="8pt" space-after.minimum="5pt" space-after.optimum="6pt" span="all" text-align="center" font-family="sanserif" font-size="12pt" text-transform="uppercase">
					<xsl:apply-templates select="title"/>
				</fo:block>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="ancestor::table | ancestor:: pmcstable | ancestor::messageindx ">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<fo:block font-weight="normal" space-after="6pt" space-before="12pt" space-before.conditionality="discard" span="all" display-align="center" text-align="left" keep-with-previous.within-page="always">
					<xsl:attribute name="end-indent">42pt</xsl:attribute>
					<xsl:attribute name="start-indent">34pt</xsl:attribute>
					<!--		<fo:block font-weight="normal" space-after="6pt" space-before="12pt" space-before.conditionality="discard" span="all" display-align="center" text-align="center" keep-with-previous.within-page="always">-->
					<xsl:call-template name="INSERT-ICONS"/>
					<!--	</fo:block>-->
					<xsl:apply-templates select="trim.para | seqlist | randlist"/>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
		<!--</fo:block>-->
	</xsl:template>
	<xsl:template match="warning | caution | note | csi.alert">
		<fo:block font-weight="normal" space-after="6pt" space-before="6pt" space-before.conditionality="discard" display-align="center" text-align="center" span="all">
			<xsl:if test="parent::specpara">
				<!--	<xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>-->
			</xsl:if>
			<xsl:choose>
				<!--When inside a table need to reduce the indents |  ancestor::faultproc-->
				<xsl:when test="ancestor::table | ancestor:: pmcstable | ancestor::messageindx ">
					<xsl:attribute name="end-indent">10pt</xsl:attribute>
					<xsl:attribute name="start-indent">2pt</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="end-indent">42pt</xsl:attribute>
					<xsl:attribute name="start-indent">34pt</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="warning.group">
					<xsl:apply-templates select="warning.group"/>
				</xsl:when>
				<xsl:when test="caution.group">
					<xsl:apply-templates select="caution.group"/>
				</xsl:when>
				<xsl:when test="note.group">
					<xsl:apply-templates select="note.group"/>
				</xsl:when>
				<xsl:when test='local-name(.)="warning" or (position()=1 and local-name(.)="warning.group")'>
					<fo:block font-family="sans-serif" font-size="120%" font-weight="bold" space-after="6pt" text-align="center" display-align="center" margin-left="20pt" margin-right="20pt" text-align-last="center" keep-with-next.within-page="always">WARNING</fo:block>
				</xsl:when>
				<xsl:when test='local-name(.)="csi.alert"'>
					<fo:block font-family="sans-serif" font-size="120%" font-weight="bold" space-after="6pt" text-align="center" display-align="center" margin-left="20pt" margin-right="20pt" text-align-last="center" keep-with-next.within-page="always">CRITICAL SAFETY ITEM</fo:block>
				</xsl:when>
				<xsl:when test='local-name(.)="caution" or (position()=1 and local-name(.)="caution.group")'>
					<fo:block font-family="sans-serif" font-size="120%" font-weight="bold" space-after="6pt" text-align="center" display-align="center" margin-left="20pt" margin-right="20pt" text-align-last="center" keep-with-next.within-page="always">CAUTION</fo:block>
				</xsl:when>
				<xsl:when test='local-name(.)="note" or (position()=1 and local-name(.)="note.group")'>
					<fo:block font-family="sans-serif" font-size="120%" font-weight="bold" space-after="6pt" text-align="center" display-align="center" margin-left="20pt" margin-right="20pt" text-align-last="center" keep-with-next.within-page="always">NOTE</fo:block>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="title">
					<fo:block keep-with-previous.within-page="always" space-after.maximum="8pt" space-after.minimum="5pt" space-after.optimum="6pt" span="all" text-align="center" font-size="12pt" text-transform="uppercase">
						<xsl:apply-templates select="title"/>
					</fo:block>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
			<xsl:call-template name="INSERT-ICONS"/>
		<!-- Added test for keyword attribute in Warning to output keyword after icon. -->	
			<xsl:choose>
				<xsl:when test="@keyword">
					<fo:block text-align="center" font-size="10pt" font-weight="bold" text-transform="uppercase">
						<xsl:value-of select="@keyword"/>
					</fo:block>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
			
			<fo:list-block keep-with-previous.within-page="always" provisional-distance-between-starts="8pt" provisional-label-separation="0pt">
				<fo:list-item text-align="left">
					<fo:list-item-label>
						<fo:block>
							<xsl:if test='local-name(.)="warning.group" or local-name(.)="caution.group" or local-name(.)="note.group"'>
								<xsl:text> </xsl:text>
								<xsl:choose>
									<xsl:when test="trim.para">
										<!--<fo:inline><fo:block> &#x2022; </fo:block></fo:inline>-->
									</xsl:when>
									<xsl:otherwise/>
								</xsl:choose>
							</xsl:if>
						</fo:block>
					</fo:list-item-label>
					<fo:list-item-body>
						<fo:block>
							<xsl:choose>
								<!--When inside a table need to reduce the indents&#x2302;-->
								<xsl:when test="ancestor::table | ancestor:: pmcstable | ancestor::messageindx">
									<xsl:attribute name="start-indent">12pt</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="start-indent">44pt</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</fo:block>
						<xsl:apply-templates select="trim.para | randlist"/>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
		</fo:block>
	</xsl:template>
	<xsl:template match="note//trim.para | caution//trim.para | warning//trim.para | csi.alert//trim.para">
		<xsl:call-template name="CHANGEBAR"/>
<!--		<xsl:if test="seqlist">
			<xsl:apply-templates/>
		</xsl:if>-->
		<xsl:if test="randlist">
			<xsl:apply-templates/>
		</xsl:if>
		<fo:block space-after.maximum="8pt" space-after.minimum="5pt" space-after.optimum="6pt" text-align="left" font-family="sans-serif" display-align="center" margin-right="60pt" keep-with-previous.within-page="always">
		
		<xsl:choose>
			<xsl:when test="ancestor-or-self::note.group">
				<fo:block space-after="6pt" space-before="6pt" keep-together.within-page="always" display-align="center" text-align="left" margin-left="10pt">
					<xsl:apply-templates select="node()"/>
				</fo:block>
			</xsl:when>
			<xsl:when test="ancestor-or-self::warning.group">
				<fo:block space-after="6pt" space-before="6pt" keep-together.within-page="always" display-align="center" text-align="left" margin-left="10pt">
					<xsl:apply-templates select="node()"/>
				</fo:block>
			</xsl:when>
			<xsl:when test="ancestor-or-self::caution.group">
				<fo:block space-after="6pt" space-before="6pt" keep-together.within-page="always" display-align="center" text-align="left" margin-left="10pt">
					<xsl:apply-templates select="node()"/>
				</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<fo:block space-after="6pt" space-before="6pt" keep-together.within-page="always" keep-with-previous.within-page="always" display-align="center">
					<xsl:apply-templates select="node()"/>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
		</fo:block>
	</xsl:template>
	<!--
PROCEDURE INSERT-ICONS
-->
	<xsl:template name="INSERT-ICONS">
		<xsl:variable name="IconCnt">
			<xsl:value-of select="count(icon-set)"/>
		</xsl:variable>
		<xsl:variable name="UseKeyword">
			<xsl:choose>
				<xsl:when test="signalword">1</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$IconCnt=4">
<!--				<fo:block display-align="center" span="all">-->
				<fo:table-and-caption text-align="center">
			
			<fo:table display-align="center" >
												<xsl:attribute name="width">
												<xsl:choose>
												<xsl:when test="$UseKeyword='1'">250pt</xsl:when>
												<xsl:otherwise>200pt</xsl:otherwise>
												</xsl:choose>
												</xsl:attribute>
												<fo:table-column column-number="1" column-width="50pt"/>
												<fo:table-column column-number="2" column-width="50pt"/>
												<fo:table-column column-number="3" column-width="50pt"/>
												<fo:table-column column-number="4" column-width="50pt"/>
												
					
						<fo:table-body margin="2pt">
							<fo:table-row>
								<fo:table-cell column-number="1">
									<fo:block>
										<xsl:apply-templates select="icon-set[1]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="2">
									<fo:block>
										<xsl:apply-templates select="icon-set[2]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="3">
									<fo:block>
										<xsl:apply-templates select="icon-set[3]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="4">
									<fo:block>
										<xsl:apply-templates select="icon-set[4]"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					</fo:table-and-caption>
				<!--</fo:block>-->
			</xsl:when>
			<xsl:when test="$IconCnt=3">
				<fo:table-and-caption text-align="center" >
					<!--SRH START removed border="solid 1pt" to get rid of the border around warning icons-->
					<fo:table display-align="center" >
					<!--SRH END-->	
							<xsl:attribute name="width">
								<xsl:choose>
								<xsl:when test="$UseKeyword='1'">250pt</xsl:when>
								<xsl:otherwise>150pt</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
								<fo:table-column column-number="1" column-width="50pt"/>
								<fo:table-column column-number="2" column-width="50pt"/>
								<fo:table-column column-number="3" column-width="50pt"/>
						<fo:table-body margin="2pt" >   <!--margin="4pt"-->
							<fo:table-row >  <!--line-height="54pt" margin="4pt" height="50pt"-->
								<fo:table-cell column-number="1">
									<fo:block>
										<xsl:apply-templates select="icon-set[1]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="2">
									<fo:block>
										<xsl:apply-templates select="icon-set[2]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="3">
									<fo:block>
										<xsl:apply-templates select="icon-set[3]"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
</fo:table-and-caption>
			</xsl:when>
			<xsl:when test="$IconCnt=2">
			<!--SRH START added text-align="center" to center icons when in pairs-->
				<fo:table-and-caption text-align="center">
			<!--SRH END-->
					<!--SRH START removed border="solid 1pt" to get rid of the border around warning icons-->	
					<fo:table display-align="center">
					<!--SRH END-->
					<xsl:attribute name="width">
												<xsl:choose>
												<xsl:when test="$UseKeyword='1'">250pt</xsl:when>
												<xsl:otherwise>100pt</xsl:otherwise>
												</xsl:choose>
												</xsl:attribute>
						<fo:table-column column-number="1" column-width="50pt"/>
						<fo:table-column column-number="2" column-width="50pt"/>
						<fo:table-body margin="2pt" >
						<!--margin="4pt" line-height="54pt" margin="4pt" height="50pt" -->
							<fo:table-row >
								<fo:table-cell column-number="1" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[1]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="2" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[2]"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:table-and-caption>
			</xsl:when>
			<xsl:when test="$IconCnt=1">
			<fo:table-and-caption text-align="center" >
					<!--SRH START removed border="solid 1pt" to get rid of the border around warning icons-->
					<fo:table display-align="center">
					<!--SRH END-->
						<xsl:attribute name="width">
						<xsl:choose><xsl:when test="$UseKeyword='1'">250pt</xsl:when>
						<xsl:otherwise>50pt</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>
						<fo:table-column column-number="1" column-width="50pt"/>
						<fo:table-body margin="2pt">
							<fo:table-row>
								<fo:table-cell column-number="1" text-align="center" display-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[1]"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:table-and-caption>
			</xsl:when>
			<xsl:when test="$IconCnt=5">
<fo:table-and-caption text-align="center" >
					<!--SRH START removed border="solid 1pt" to get rid of the border around warning icons-->
					<fo:table display-align="center">
					<!--SRH END-->
						<xsl:attribute name="width"><xsl:choose><xsl:when test="$UseKeyword='1'">250pt</xsl:when><xsl:otherwise>250pt</xsl:otherwise></xsl:choose></xsl:attribute>
						<fo:table-column column-number="1" column-width="50pt"/>
						<fo:table-column column-number="2" column-width="50pt"/>
						<fo:table-column column-number="3" column-width="50pt"/>
						<fo:table-column column-number="4" column-width="50pt"/>
						<fo:table-column column-number="5" column-width="50pt"/>
						<fo:table-body margin="2pt">
							<fo:table-row>
								<fo:table-cell column-number="1" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[1]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="2" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[2]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="3" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[3]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="4" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[4]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="5" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[5]"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:table-and-caption>
			</xsl:when>
			<xsl:when test="$IconCnt=6">
<fo:table-and-caption text-align="center" >
					<!--SRH START removed border="solid 1pt" to get rid of the border around warning icons-->
					<fo:table display-align="center">
					<!--SRH END-->
						<!--<xsl:attribute name="width"><xsl:choose><xsl:when test="$UseKeyword='1'">250pt</xsl:when><xsl:otherwise>300pt</xsl:otherwise></xsl:choose></xsl:attribute>-->
						<fo:table-column column-number="1" column-width="50pt"/>
						<fo:table-column column-number="2" column-width="50pt"/>
						<fo:table-column column-number="3" column-width="50pt"/>
						<fo:table-column column-number="4" column-width="50pt"/>
						<fo:table-column column-number="5" column-width="50pt"/>
						<fo:table-column column-number="6" column-width="50pt"/>
						<fo:table-body margin="4pt">
							<fo:table-row>
								<fo:table-cell column-number="1" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[1]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="2" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[2]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="3" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[3]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="4" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[4]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="5" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[5]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="6" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[6]"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
			</fo:table-and-caption>
			</xsl:when>
			<xsl:when test="$IconCnt=7">
<fo:table-and-caption text-align="center" >
					<!--SRH START removed border="solid 1pt" to get rid of the border around warning icons-->
					<fo:table display-align="center">
					<!--SRH END-->
						<fo:table-column column-number="1" column-width="50pt"/>
						<fo:table-column column-number="2" column-width="50pt"/>
						<fo:table-column column-number="3" column-width="50pt"/>
						<fo:table-column column-number="4" column-width="50pt"/>
						<fo:table-column column-number="5" column-width="50pt"/>
						<fo:table-column column-number="6" column-width="50pt"/>
						<fo:table-column column-number="7" column-width="50pt"/>
						<fo:table-body margin="2pt">
							<fo:table-row>
								<fo:table-cell column-number="1" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[1]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="2" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[2]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="3" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[3]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="4" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[4]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="5" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[5]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="6" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[6]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="7" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[7]"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
			</fo:table-and-caption>
			</xsl:when>
			<xsl:when test="$IconCnt=8">
<fo:table-and-caption text-align="center" >
					<!--SRH START removed border="solid 1pt" to get rid of the border around warning icons-->
					<fo:table display-align="center">
					<!--SRH END-->
						<fo:table-column column-number="1" column-width="50pt"/>
						<fo:table-column column-number="2" column-width="50pt"/>
						<fo:table-column column-number="3" column-width="50pt"/>
						<fo:table-column column-number="4" column-width="50pt"/>
						<fo:table-column column-number="5" column-width="50pt"/>
						<fo:table-column column-number="6" column-width="50pt"/>
						<fo:table-column column-number="7" column-width="50pt"/>
						<fo:table-column column-number="8" column-width="50pt"/>
						<fo:table-body margin="2pt">
							<fo:table-row>
								<fo:table-cell column-number="1" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[1]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="2" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[2]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="3" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[3]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="4" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[4]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="5" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[5]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="6" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[6]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="7" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[7]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="8" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[8]"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:table-and-caption>
			</xsl:when>
			<xsl:when test="$IconCnt=9">
				<fo:table-and-caption text-align="center" >
					<!--SRH START removed border="solid 1pt" to get rid of the border around warning icons-->
					<fo:table display-align="center">
					<!--SRH END-->
						<fo:table-column column-number="1" column-width="50pt"/>
						<fo:table-column column-number="2" column-width="50pt"/>
						<fo:table-column column-number="3" column-width="50pt"/>
						<fo:table-column column-number="4" column-width="50pt"/>
						<fo:table-column column-number="5" column-width="50pt"/>
						<fo:table-column column-number="6" column-width="50pt"/>
						<fo:table-column column-number="7" column-width="50pt"/>
						<fo:table-column column-number="8" column-width="50pt"/>
						<fo:table-body margin="2pt">
							<fo:table-row>
								<fo:table-cell column-number="1" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[1]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="2" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[2]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="3" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[3]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="4" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[4]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="5" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[5]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="6" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[6]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="7" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[7]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="8" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[8]"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					<fo:table>
						<xsl:attribute name="width">
						<xsl:choose>
						<xsl:when test="$UseKeyword='1'">250pt</xsl:when><xsl:otherwise>50pt</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>
						<fo:table-column column-number="1" column-width="50pt"/>
						<fo:table-body margin="4pt">
							<fo:table-row>
								<fo:table-cell column-number="1" text-align="center">
									<xsl:apply-templates select="icon-set[9]"/>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
			</fo:table-and-caption>
			</xsl:when>
			<xsl:when test="$IconCnt=10">
				<fo:table-and-caption text-align="center" >
					<!--SRH START removed border="solid 1pt" to get rid of the border around warning icons-->
					<fo:table display-align="center">
					<!--SRH END-->
						<xsl:attribute name="width"><xsl:choose><xsl:when test="$UseKeyword='1'">250pt</xsl:when><xsl:otherwise>400pt</xsl:otherwise></xsl:choose></xsl:attribute>
						<fo:table-column column-number="1" column-width="50pt"/>
						<fo:table-column column-number="2" column-width="50pt"/>
						<fo:table-column column-number="3" column-width="50pt"/>
						<fo:table-column column-number="4" column-width="50pt"/>
						<fo:table-column column-number="5" column-width="50pt"/>
						<fo:table-column column-number="6" column-width="50pt"/>
						<fo:table-column column-number="7" column-width="50pt"/>
						<fo:table-column column-number="8" column-width="50pt"/>
						<fo:table-body margin="4pt">
							<fo:table-row>
								<fo:table-cell column-number="1" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[1]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="2" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[2]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="3" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[3]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="4" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[4]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="5" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[5]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="6" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[6]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="7" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[7]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="8" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[8]"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					<fo:table>
						<xsl:attribute name="width"><xsl:choose><xsl:when test="$UseKeyword='1'">250pt</xsl:when><xsl:otherwise>100pt</xsl:otherwise></xsl:choose></xsl:attribute>
						<fo:table-column column-number="1" column-width="50pt"/>
						<fo:table-column column-number="2" column-width="50pt"/>
						<fo:table-body margin="4pt">
							<fo:table-row>
								<fo:table-cell column-number="1" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[9]"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell column-number="2" text-align="center">
									<fo:block>
										<xsl:apply-templates select="icon-set[10]"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
			</fo:table-and-caption>
			</xsl:when>
		</xsl:choose>
		<fo:block keep-together="always" keep-with-previous="always" space-after.maximum="8pt" space-after.minimum="5pt" space-after.optimum="6pt" span="all" text-align="center" text-align-last="center" font-family="sans-serif" font-weight="bold" display-align="center" margin-right="15pt">
			<xsl:value-of select="signalword"/>
		</fo:block>
	</xsl:template>
	<!--
ELEMENT icon-set
-->
	<xsl:template match="icon-set[@boardno]">
		<fo:external-graphic>
			<xsl:attribute name="src"><xsl:call-template name="substring-after-last"><xsl:with-param name="str" select="unparsed-entity-uri(@boardno)"/></xsl:call-template></xsl:attribute>
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
	</xsl:template>
</xsl:stylesheet>
