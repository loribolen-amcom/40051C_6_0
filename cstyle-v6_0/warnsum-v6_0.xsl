<?xml version="1.0" encoding="utf-8"?>
<!-- Fragment document type declaration subset:
	Arbortext, Inc., 1988-2005, v.4002
	<!DOCTYPE xsl:stylesheet>
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="warnsum">
		<xsl:call-template name="frntrear-rl"/>
	</xsl:template>
	<!-- ELEMENT warninfo -->
	<xsl:template match="first_aid">
		<fo:block>
			<xsl:text>&#x2003;</xsl:text>
		</fo:block>
		<fo:block>
			<xsl:text>&#x2003;</xsl:text>
		</fo:block>
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="safety">
		<fo:block>
			<xsl:text>&#x2003;</xsl:text>
		</fo:block>
		<fo:block>
			<xsl:text>&#x2003;</xsl:text>
		</fo:block>
		<!-- keep-together.within-page="always"  -->
		<fo:block text-align="left" font-weight="normal" space-after="12pt" space-before="12pt" space-before.conditionality="discard" span="all">
			<xsl:apply-templates select="node()"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="warninfo">
		<xsl:choose>
			<xsl:when test="not(string-length(title)=0)">
				<fo:block font-size="12pt" font-weight="bold" margin-left="10pt" text-align="left" margin-right="10pt">
					<xsl:value-of select="title"/>
				</fo:block>
			</xsl:when>
			<xsl:otherwise>
				<fo:block font-size="12pt" font-weight="bold" margin-left="10pt" text-align="left" margin-right="10pt">
					<xsl:text>&#x2003;</xsl:text>
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
		<fo:block font-weight="normal" space-after="6pt" space-before="12pt" space-before.conditionality="discard" span="all" display-align="center" text-align="center">
			<xsl:apply-templates select="warning | para"/>
		</fo:block>
	</xsl:template>
	<!-- ELEMENT warnsum title warnsum/title |-->
	<xsl:template match="first_aid/title | warninfo/title">
		<fo:block font-size="12pt" font-weight="bold" margin-left="0pt" text-align="left" text-align-last="left" display-align="center" margin-right="10pt">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="hazid">
		<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" margin-left="10pt" text-align="center" text-align-last="center" margin-right="10pt">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="safety/title">
		<fo:block font-size="12pt" font-weight="bold" margin-left="0pt" text-align="left" text-align-last="left" display-align="center" margin-right="10pt">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template name="WarnSumTag">
		<xsl:choose>
			<xsl:when test="ancestor::warnsum">
				<fo:block font-family="sans-serif" font-size="120%" space-after="6pt" text-align="center" display-align="center" text-indent="225pt">WARNING</fo:block>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="hazmat">
		<fo:block font-family="sans-serif" font-size="12pt" font-weight="bold" space-after.maximum="16pt" space-after.minimum="16pt" space-after.optimum="16pt" space-before.maximum="12pt" space-before.minimum="12pt" space-before.optimum="12pt" span="all" text-align="left" text-transform="uppercase"> EXPLANATION OF HAZARDOUS MATERIALS ICONS</fo:block>
		<xsl:apply-templates select="haz-icons"/>
		<xsl:if test="following::title[2]">
			<fo:block span="all" font-size="12pt" font-weight="bold" space-after="6pt" space-before="12pt">
				<xsl:value-of select="title[2]"/>
			</fo:block>
		</xsl:if>
		<xsl:apply-templates select="hazard"/>
	</xsl:template>
	<xsl:template match="hazard">
		<xsl:choose>
			<xsl:when test='local-name(.)="hazard" or (position()=1)'>
				<fo:block font-family="sans-serif" font-size="120%" font-weight="bold" text-indent="225pt" space-after="6pt" space-before="6pt" position="absolute" display-align="center" keep-with-next="always">WARNING</fo:block>
			</xsl:when>
		</xsl:choose>
		<!--	preceding::-->
		<xsl:if test="title[1]">
			<fo:block span="all" font-size="12pt" font-weight="bold" keep-with-next="always" text-align="center" display-align="center" space-after="6pt" space-before="12pt" text-align-last="center">
				<xsl:value-of select="title"/>
			</fo:block>
		</xsl:if>
		<fo:block text-align="left" font-weight="normal" space-after="6pt" space-before="12pt" space-before.conditionality="discard" span="all">
			<fo:list-block provisional-distance-between-starts="8pt" provisional-label-separation="0pt">
				<xsl:attribute name="keep-together.within-page"><xsl:choose><xsl:when test="ancestor::warnsum">always</xsl:when><xsl:otherwise>auto</xsl:otherwise></xsl:choose></xsl:attribute>
				<fo:list-item>
					<fo:list-item-label>
						<fo:block/>
					</fo:list-item-label>
					<fo:list-item-body>
						<xsl:variable name="IconCnt">
							<xsl:value-of disable-output-escaping="no" select="count(symbol)"/>
						</xsl:variable>
						<xsl:variable name="UseKeyword">
							<xsl:choose>
								<xsl:when test="signalword">1</xsl:when>
								<xsl:otherwise>0</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:choose>
						<!--	<xsl:when test="$IconCnt=4">
								<fo:table padding="10pt" text-align="center" display-align="center">
									<xsl:attribute name="width"><xsl:choose><xsl:when test="$UseKeyword='1'">280pt</xsl:when><xsl:otherwise>230pt</xsl:otherwise></xsl:choose></xsl:attribute>
									<fo:table-column column-number="1" column-width="56pt"/>
									<fo:table-column column-number="2" column-width="56pt"/>
									<fo:table-column column-number="3" column-width="56pt"/>
									<fo:table-column column-number="4" column-width="56pt"/>
									<fo:table-body margin="4pt">
										<fo:table-row line-height="54pt" height="56pt">
											<fo:table-cell column-number="1" display-align="center" >
												<xsl:apply-templates select="symbol[1]"/>
											</fo:table-cell>
											<fo:table-cell column-number="2" display-align="center" >
												<xsl:apply-templates select="symbol[2]"/>
											</fo:table-cell>
											<fo:table-cell column-number="3" display-align="center" >
												<xsl:apply-templates select="symbol[3]"/>
											</fo:table-cell>
											<fo:table-cell column-number="4" display-align="center" >
												<xsl:apply-templates select="symbol[4]"/>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</xsl:when>-->
						
						<xsl:when test="$IconCnt=4">
												<!--RG 20 AUG 2018 Added text-align center below to make icons centered.-->
												<fo:table padding="10pt" text-align="center" display-align="center">
					<xsl:attribute name="width"><xsl:choose><xsl:when test="$UseKeyword='1'">250pt</xsl:when><xsl:otherwise>200pt</xsl:otherwise></xsl:choose></xsl:attribute>
												<fo:table-column column-number="1" column-width="50pt"/>
												<fo:table-column column-number="2" column-width="50pt"/>
												<fo:table-column column-number="3" column-width="50pt"/>
												<fo:table-column column-number="4" column-width="50pt"/>
												<fo:table-body>
						<fo:table-row line-height="54pt" margin="4pt" height="50pt">
							<fo:table-cell column-number="1" text-align="center" display-align="center">
							<fo:block>
							<xsl:apply-templates select="symbol[1]"/></fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="2" text-align="center" display-align="center"><fo:block>
							<xsl:apply-templates select="symbol[2]"/></fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="3" text-align="center" display-align="center"><fo:block>
							<xsl:apply-templates select="symbol[3]"/></fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="4" text-align="center" display-align="center"><fo:block>
							<xsl:apply-templates select="symbol[4]"/></fo:block>
							</fo:table-cell>
							</fo:table-row>
							</fo:table-body>
												</fo:table>
												</xsl:when>	
						
							<xsl:when test="$IconCnt=3">
								<fo:table padding="10pt" text-align="center" display-align="center">
									<xsl:attribute name="width"><xsl:choose><xsl:when test="$UseKeyword='1'">280pt</xsl:when><xsl:otherwise>230pt</xsl:otherwise></xsl:choose></xsl:attribute>
									<fo:table-column column-number="1" column-width="50pt"/>
												<fo:table-column column-number="2" column-width="50pt"/>
												<fo:table-column column-number="3" column-width="50pt"/>
									<fo:table-body margin="4pt">
										<fo:table-row line-height="54pt" height="56pt">
											<fo:table-cell column-number="1" text-align="center" display-align="center">
												<xsl:apply-templates select="symbol[1]"/>
											</fo:table-cell>
											<fo:table-cell column-number="2" text-align="center" display-align="center">
												<xsl:apply-templates select="symbol[2]"/>
											</fo:table-cell>
											<fo:table-cell column-number="3" text-align="center" display-align="center">
												<xsl:apply-templates select="symbol[3]"/>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</xsl:when>
							<xsl:when test="$IconCnt=2">
								<fo:table padding="10pt" text-align="center" display-align="center">
									<xsl:attribute name="width"><xsl:choose><xsl:when test="$UseKeyword='1'">280pt</xsl:when><xsl:otherwise>230pt</xsl:otherwise></xsl:choose></xsl:attribute>
									<fo:table-column column-number="1" column-width="50pt"/>
												<fo:table-column column-number="2" column-width="50pt"/>
									<fo:table-body>
										<fo:table-row line-height="54pt" height="56pt">
											<fo:table-cell column-number="1" text-align="center" display-align="center">
												<xsl:apply-templates select="symbol[1]"/>
											</fo:table-cell>
											<fo:table-cell column-number="2" text-align="center" display-align="center">
												<xsl:apply-templates select="symbol[2]"/>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</xsl:when>
							<xsl:when test="$IconCnt=1">
								<fo:table padding="10pt" text-align="center" display-align="center">
									<xsl:attribute name="width"><xsl:choose><xsl:when test="$UseKeyword='1'">280pt</xsl:when><xsl:otherwise>230pt</xsl:otherwise></xsl:choose></xsl:attribute>
									<fo:table-column column-number="1" column-width="50pt"/>
									<fo:table-body >
										<fo:table-row line-height="54pt" height="56pt">
											<fo:table-cell column-number="1" text-align="center" display-align="center">
												<xsl:apply-templates select="symbol[1]"/>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</xsl:when>
							<xsl:when test="$IconCnt=5">
								<fo:table padding="10pt" text-align="center" display-align="center">
									<xsl:attribute name="width"><xsl:choose><xsl:when test="$UseKeyword='1'">280pt</xsl:when><xsl:otherwise>230pt</xsl:otherwise></xsl:choose></xsl:attribute>
									<fo:table-column column-number="1" column-width="50pt"/>
												<fo:table-column column-number="2" column-width="50pt"/>
												<fo:table-column column-number="3" column-width="50pt"/>
												<fo:table-column column-number="4" column-width="50pt"/>
									<fo:table-column column-number="5" column-width="50pt"/>
									<fo:table-body margin="4pt">
										<fo:table-row line-height="54pt" height="56pt">
											<fo:table-cell column-number="1" text-align="center">
												<xsl:apply-templates select="symbol[1]"/>
											</fo:table-cell>
											<fo:table-cell column-number="2" text-align="center">
												<xsl:apply-templates select="symbol[2]"/>
											</fo:table-cell>
											<fo:table-cell column-number="3" text-align="center">
												<xsl:apply-templates select="symbol[3]"/>
											</fo:table-cell>
											<fo:table-cell column-number="4" text-align="center">
												<xsl:apply-templates select="symbol[4]"/>
											</fo:table-cell>
											<fo:table-cell column-number="5" text-align="center">
												<xsl:apply-templates select="symbol[5]"/>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
								<!--			
												
												<fo:table padding="10pt" display-align="center">
												<xsl:attribute name="width"><xsl:choose><xsl:when test="$UseKeyword='1'">250pt</xsl:when><xsl:otherwise>200pt</xsl:otherwise></xsl:choose></xsl:attribute>
												<fo:table-column column-number="1" column-width="50pt"/>
													<fo:table-body margin="4pt" padding="10pt">
						<fo:table-row line-height="54pt" margin-bottom="4pt" height="56pt">
												<fo:table-cell column-number="1" margin-top="2pt" display-align="center">
														<xsl:apply-templates select="symbol[5]"/>
													</fo:table-cell>
							</fo:table-row>
							</fo:table-body>
												</fo:table>
												 -->
							</xsl:when>
							<xsl:when test="$IconCnt=6">
								<fo:table padding="10pt" text-align="center" display-align="center">
									<xsl:attribute name="width"><xsl:choose><xsl:when test="$UseKeyword='1'">280pt</xsl:when><xsl:otherwise>200pt</xsl:otherwise></xsl:choose></xsl:attribute>
									<fo:table-column column-number="1" column-width="50pt"/>
												<fo:table-column column-number="2" column-width="50pt"/>
												<fo:table-column column-number="3" column-width="50pt"/>
												<fo:table-column column-number="4" column-width="50pt"/>
									<fo:table-column column-number="5" column-width="50pt"/>
									<fo:table-column column-number="6" column-width="50pt"/>
									<fo:table-body margin="4pt">
										<fo:table-row line-height="54pt" height="56pt">
											<fo:table-cell column-number="1" text-align="center">
												<xsl:apply-templates select="symbol[1]"/>
											</fo:table-cell>
											<fo:table-cell column-number="2" text-align="center">
												<xsl:apply-templates select="symbol[2]"/>
											</fo:table-cell>
											<fo:table-cell column-number="3" text-align="center">
												<xsl:apply-templates select="symbol[3]"/>
											</fo:table-cell>
											<fo:table-cell column-number="4" text-align="center">
												<xsl:apply-templates select="symbol[4]"/>
											</fo:table-cell>
											<fo:table-cell column-number="5" text-align="center">
												<xsl:apply-templates select="symbol[5]"/>
											</fo:table-cell>
											<fo:table-cell column-number="6" text-align="center">
												<xsl:apply-templates select="symbol[6]"/>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</xsl:when>
							<xsl:when test="$IconCnt=7">
								<fo:table padding="10pt" text-align="center" display-align="center">
									<xsl:attribute name="width"><xsl:choose><xsl:when test="$UseKeyword='1'">250pt</xsl:when><xsl:otherwise>200pt</xsl:otherwise></xsl:choose></xsl:attribute>
									<fo:table-column column-number="1" column-width="50pt"/>
												<fo:table-column column-number="2" column-width="50pt"/>
												<fo:table-column column-number="3" column-width="50pt"/>
												<fo:table-column column-number="4" column-width="50pt"/>
												<fo:table-column column-number="2" column-width="50pt"/>
												<fo:table-column column-number="3" column-width="50pt"/>
												<fo:table-column column-number="4" column-width="50pt"/>
									<fo:table-body margin="4pt">
										<fo:table-row line-height="54pt" height="56pt">
											<fo:table-cell column-number="1" text-align="center">
												<xsl:apply-templates select="symbol[1]"/>
											</fo:table-cell>
											<fo:table-cell column-number="2" text-align="center">
												<xsl:apply-templates select="symbol[2]"/>
											</fo:table-cell>
											<fo:table-cell column-number="3" text-align="center">
												<xsl:apply-templates select="symbol[3]"/>
											</fo:table-cell>
											<fo:table-cell column-number="4" text-align="center">
												<xsl:apply-templates select="symbol[4]"/>
											</fo:table-cell>
											<fo:table-cell column-number="5" text-align="center">
												<xsl:apply-templates select="symbol[5]"/>
											</fo:table-cell>
											<fo:table-cell column-number="6" text-align="center">
												<xsl:apply-templates select="symbol[6]"/>
											</fo:table-cell>
											<fo:table-cell column-number="7" text-align="center">
												<xsl:apply-templates select="symbol[7]"/>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</xsl:when>
							<xsl:when test="$IconCnt=8">
								<fo:table padding="10pt" text-align="center" display-align="center">
									<xsl:attribute name="width"><xsl:choose><xsl:when test="$UseKeyword='1'">280pt</xsl:when><xsl:otherwise>230pt</xsl:otherwise></xsl:choose></xsl:attribute>
									<fo:table-column column-number="1" column-width="50pt"/>
												<fo:table-column column-number="2" column-width="50pt"/>
												<fo:table-column column-number="3" column-width="50pt"/>
												<fo:table-column column-number="4" column-width="50pt"/>
								<fo:table-column column-number="1" column-width="50pt"/>
												<fo:table-column column-number="2" column-width="50pt"/>
												<fo:table-column column-number="3" column-width="50pt"/>
												<fo:table-column column-number="4" column-width="50pt"/>
									<fo:table-body margin="4pt">
										<fo:table-row line-height="54pt" height="56pt">
											<fo:table-cell column-number="1" text-align="center">
												<xsl:apply-templates select="symbol[1]"/>
											</fo:table-cell>
											<fo:table-cell column-number="2" text-align="center">
												<xsl:apply-templates select="symbol[2]"/>
											</fo:table-cell>
											<fo:table-cell column-number="3" text-align="center">
												<xsl:apply-templates select="symbol[3]"/>
											</fo:table-cell>
											<fo:table-cell column-number="4" text-align="center">
												<xsl:apply-templates select="symbol[4]"/>
											</fo:table-cell>
											<fo:table-cell column-number="5" text-align="center">
												<xsl:apply-templates select="symbol[5]"/>
											</fo:table-cell>
											<fo:table-cell column-number="6" text-align="center">
												<xsl:apply-templates select="symbol[6]"/>
											</fo:table-cell>
											<fo:table-cell column-number="7" text-align="center">
												<xsl:apply-templates select="symbol[7]"/>
											</fo:table-cell>
											<fo:table-cell column-number="8" text-align="center">
												<xsl:apply-templates select="symbol[8]"/>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</xsl:when>
							<xsl:when test="$IconCnt=9">
								<fo:table padding="10pt" text-align="center" display-align="center">
									<xsl:attribute name="width"><xsl:choose><xsl:when test="$UseKeyword='1'">280pt</xsl:when><xsl:otherwise>230pt</xsl:otherwise></xsl:choose></xsl:attribute>
									<fo:table-column column-number="1" column-width="50pt"/>
												<fo:table-column column-number="2" column-width="50pt"/>
												<fo:table-column column-number="3" column-width="50pt"/>
												<fo:table-column column-number="4" column-width="50pt"/>
									<fo:table-column column-number="1" column-width="50pt"/>
												<fo:table-column column-number="2" column-width="50pt"/>
												<fo:table-column column-number="3" column-width="50pt"/>
												<fo:table-column column-number="4" column-width="50pt"/>
									<fo:table-body margin="4pt">
										<fo:table-row line-height="54pt" height="56pt">
											<fo:table-cell column-number="1" text-align="center">
												<xsl:apply-templates select="symbol[1]"/>
											</fo:table-cell>
											<fo:table-cell column-number="2" text-align="center">
												<xsl:apply-templates select="symbol[2]"/>
											</fo:table-cell>
											<fo:table-cell column-number="3" text-align="center">
												<xsl:apply-templates select="symbol[3]"/>
											</fo:table-cell>
											<fo:table-cell column-number="4" text-align="center">
												<xsl:apply-templates select="symbol[4]"/>
											</fo:table-cell>
											<fo:table-cell column-number="5" text-align="center">
												<xsl:apply-templates select="symbol[5]"/>
											</fo:table-cell>
											<fo:table-cell column-number="6" text-align="center">
												<xsl:apply-templates select="symbol[6]"/>
											</fo:table-cell>
											<fo:table-cell column-number="7" text-align="center">
												<xsl:apply-templates select="symbol[7]"/>
											</fo:table-cell>
											<fo:table-cell column-number="8" text-align="center">
												<xsl:apply-templates select="symbol[8]"/>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
								<fo:table padding="10pt" text-align="center" display-align="center">
									<xsl:attribute name="width"><xsl:choose><xsl:when test="$UseKeyword='1'">280pt</xsl:when><xsl:otherwise>230pt</xsl:otherwise></xsl:choose></xsl:attribute>
									<fo:table-column column-number="1" column-width="50pt"/>
									<fo:table-body margin="4pt">
										<fo:table-row line-height="54pt" height="56pt">
											<fo:table-cell column-number="1" text-align="center">
												<xsl:apply-templates select="symbol[9]"/>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</xsl:when>
							<xsl:when test="$IconCnt=10">
								<fo:table padding="10pt" text-align="center" display-align="center">
									<xsl:attribute name="width"><xsl:choose><xsl:when test="$UseKeyword='1'">280pt</xsl:when><xsl:otherwise>230pt</xsl:otherwise></xsl:choose></xsl:attribute>
									<fo:table-column column-number="1" column-width="50pt"/>
												<fo:table-column column-number="2" column-width="50pt"/>
												<fo:table-column column-number="3" column-width="50pt"/>
												<fo:table-column column-number="4" column-width="50pt"/>
									<fo:table-column column-number="1" column-width="50pt"/>
												<fo:table-column column-number="2" column-width="50pt"/>
												<fo:table-column column-number="3" column-width="50pt"/>
												<fo:table-column column-number="4" column-width="50pt"/>
									<fo:table-body margin="4pt">
										<fo:table-row line-height="54pt" height="56pt">
											<fo:table-cell column-number="1" text-align="center">
												<xsl:apply-templates select="symbol[1]"/>
											</fo:table-cell>
											<fo:table-cell column-number="2" text-align="center">
												<xsl:apply-templates select="symbol[2]"/>
											</fo:table-cell>
											<fo:table-cell column-number="3" text-align="center">
												<xsl:apply-templates select="symbol[3]"/>
											</fo:table-cell>
											<fo:table-cell column-number="4" text-align="center">
												<xsl:apply-templates select="symbol[4]"/>
											</fo:table-cell>
											<fo:table-cell column-number="5" text-align="center">
												<xsl:apply-templates select="symbol[5]"/>
											</fo:table-cell>
											<fo:table-cell column-number="6" text-align="center">
												<xsl:apply-templates select="symbol[6]"/>
											</fo:table-cell>
											<fo:table-cell column-number="7" text-align="center">
												<xsl:apply-templates select="symbol[7]"/>
											</fo:table-cell>
											<fo:table-cell column-number="8" text-align="center">
												<xsl:apply-templates select="symbol[8]"/>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
								<fo:table padding="10pt" text-align="center" display-align="center">
									<xsl:attribute name="width"><xsl:choose><xsl:when test="$UseKeyword='1'">280pt</xsl:when><xsl:otherwise>230pt</xsl:otherwise></xsl:choose></xsl:attribute>
									<fo:table-column column-number="1" column-width="50pt"/>
												<fo:table-column column-number="2" column-width="50pt"/>
									<fo:table-body margin="4pt">
										<fo:table-row line-height="54pt" height="56pt">
											<fo:table-cell column-number="1" text-align="center">
												<xsl:apply-templates select="symbol[9]"/>
											</fo:table-cell>
											<fo:table-cell column-number="2" text-align="center">
												<xsl:apply-templates select="symbol[10]"/>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</xsl:when>
						</xsl:choose>
						<fo:block font-family="sans-serif" font-size="12pt" font-weight="bold" margin-left="10pt" text-align="center" text-align-last="center" display-align="center" margin-right="10pt">
							<xsl:value-of select="signalword"/>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
		</fo:block>
		<fo:block text-align="left">
			<xsl:apply-templates select="hazid"/>
			<xsl:apply-templates select="para"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="sfty-icons | haz-icons">
		<fo:block span="all">
			<fo:list-block provisional-distance-between-starts="10pc" provisional-label-separation="1pc" space-before.conditionality="discard" space-before.maximum="6pt" space-before.minimum="2pt" space-before.optimum="4pt" start-indent="8pt" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
				<fo:list-item space-after="12pt">
					<fo:list-item-label end-indent="label-end()">
						<fo:block>
							<xsl:apply-templates select="symbol"/>
						</fo:block>
					</fo:list-item-label>
					<fo:list-item-body start-indent="body-start()">
						<fo:block>
							<xsl:choose>
								<xsl:when test="sftydesc[1]">
									<xsl:apply-templates select="sftydesc[1]"/>
								</xsl:when>
								<xsl:when test="hazdesc[1]">
									<xsl:apply-templates select="hazdesc[1]"/>
								</xsl:when>
							</xsl:choose>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
		</fo:block>
	</xsl:template>
	<xsl:template match="sfty-icons/symbol | haz-icons/symbol">
		<fo:block>
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
	<xsl:template match="hazard/symbol">
		<fo:block space-after="4pt" space-before="4pt" text-align="center" display-align="center">
			<fo:external-graphic>
				<xsl:attribute name="src"><xsl:call-template name="substring-after-last"><xsl:with-param name="str" select="unparsed-entity-uri(@boardno)"/></xsl:call-template></xsl:attribute>
				<xsl:if test="@reprowid and @reprodep">
					<xsl:attribute name="scaling">non-uniform</xsl:attribute>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="@reprowid">
						<xsl:apply-templates mode="graphic-attribute" select="@reprowid"> </xsl:apply-templates>
					</xsl:when>
					<xsl:when test="@reprodep">
						<xsl:apply-templates mode="graphic-attribute" select="@reprodep"> </xsl:apply-templates>
					</xsl:when>
					<xsl:when test="@hscale">
						<xsl:apply-templates mode="graphic-attribute" select="@hscale"> </xsl:apply-templates>
					</xsl:when>
					<xsl:when test="@vscale">
						<xsl:apply-templates mode="graphic-attribute" select="@vscale"> </xsl:apply-templates>
					</xsl:when>
				</xsl:choose>
			</fo:external-graphic>
		</fo:block>
	</xsl:template>
	<xsl:template match="hazdesc/title">
		<fo:inline font-weight="bold">
			<xsl:value-of select="node()"/>
			<xsl:text disable-output-escaping="no">&#x2002;&#x2013;&#x2002;</xsl:text>
		</fo:inline>
		<xsl:apply-templates select="hazdesc/text"/>
	</xsl:template>
	<xsl:template match="hazdesc/text">
		<xsl:value-of select="node()"/>
	</xsl:template>
	<xsl:template match="sftydesc/title">
		<fo:inline font-weight="bold">
			<xsl:value-of select="node()"/>
			<xsl:text disable-output-escaping="no">&#x2002;&#x2013;&#x2002;</xsl:text>
		</fo:inline>
		<xsl:apply-templates select="sftydesc/text"/>
	</xsl:template>
	<xsl:template match="sftydesc/text">
		<xsl:value-of select="node()"/>
	</xsl:template>
	<xsl:template match="warning/title | warning.group/title">
		<fo:block font-size="12pt" font-weight="bold" margin-left="10pt" text-align="center" text-align-last="center" display-align="center" margin-right="10pt" text-transform="uppercase">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
