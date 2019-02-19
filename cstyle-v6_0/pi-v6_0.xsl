<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<!-- **********************************************************
    Pass through PIs controlling output escaping 
   ********************************************************** -->
	<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		match="processing-instruction('javax.xml.transform.disable-output-escaping')">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="processing-instruction('javax.xml.transform.enable-output-escaping')">
		<xsl:copy-of select="."/>
	</xsl:template>
	<!-- **********************************************************
    pi.xsl - transforms some Epic formatting PIs into FOs
   ********************************************************** -->
	<xsl:template match="processing-instruction('Pub')">
		<xsl:variable name="pi" select="."/>
		<xsl:choose>
			<xsl:when test="starts-with($pi, '_font')">
				<xsl:call-template name="PI_Pub_font_start"> </xsl:call-template>
			</xsl:when>
			<xsl:when test="starts-with($pi, '/_font')">
				<xsl:call-template name="PI_Pub_font_end"> </xsl:call-template>
			</xsl:when>
			<xsl:when test="starts-with($pi, '_newline')">
				<fo:block space-before.conditionality="discard" space-before.maximum="1pt"
					space-before.minimum="1pt" space-before.optimum="1pt" span="all"> </fo:block>
			</xsl:when>
			<xsl:when test="starts-with($pi, '_hardspace')">
				<xsl:text>&#x2002;</xsl:text>
			</xsl:when>
			<xsl:when test="starts-with($pi, '_eos-space')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="starts-with($pi, '_hyphen-point')">
				<xsl:text>&#xad;</xsl:text>
			</xsl:when>
			<xsl:when test="starts-with($pi, '_interword-space')">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:when test="starts-with($pi, '_newpage')">
				<fo:block break-after="page" span="all"> </fo:block>
			</xsl:when>
			<xsl:when test="starts-with($pi, '_newcolumn')">
				<fo:block break-after="column" span="all"> </fo:block>
			</xsl:when>
			<xsl:when test="starts-with($pi, '_nolinebreak')">
				<xsl:text disable-output-escaping="yes">fo:wrapper keep-together.within-line="always" </xsl:text>
			</xsl:when>
			<xsl:when test="starts-with($pi, '/_nolinebreak')">
				<xsl:text disable-output-escaping="yes">/fo:wrapper 				</xsl:text>
			</xsl:when>
			<xsl:when test="starts-with($pi, '_putgraphic')">
				<xsl:call-template name="putgraphic">
					<xsl:with-param name="pi" select="$pi"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="starts-with($pi, '_kern')">
				<xsl:call-template name="kernpi">
					<xsl:with-param name="pi" select="$pi"> </xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="starts-with($pi, '_cellfont')">
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="processing-instruction('_newpage')">
		<fo:block break-after="page"/>
	</xsl:template>

	<xsl:template name="kernpi">
		<xsl:param name="pi" select="."> </xsl:param>
		<fo:leader keep-with-next="always" keep-with-previous="always" leader-pattern="space">
			<xsl:call-template name="add-property">
				<xsl:with-param name="pi" select="$pi"> </xsl:with-param>
				<xsl:with-param name="piattr">Amount</xsl:with-param>
				<xsl:with-param name="property">leader-length</xsl:with-param>
			</xsl:call-template>
		</fo:leader>
	</xsl:template>
	<xsl:template name="putgraphic">
		<xsl:param name="pi" select="."> </xsl:param>
		<fo:external-graphic>
			<xsl:call-template name="add-property">
				<xsl:with-param name="pi" select="$pi"> </xsl:with-param>
				<xsl:with-param name="piattr">pathname</xsl:with-param>
				<xsl:with-param name="property">src</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="add-property">
				<xsl:with-param name="pi" select="$pi"> </xsl:with-param>
				<xsl:with-param name="piattr">width</xsl:with-param>
				<xsl:with-param name="property">width</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="add-property">
				<xsl:with-param name="pi" select="$pi"> </xsl:with-param>
				<xsl:with-param name="piattr">depth</xsl:with-param>
				<xsl:with-param name="property">height</xsl:with-param>
			</xsl:call-template>
		</fo:external-graphic>
	</xsl:template>
	<xsl:template name="add-property">
		<xsl:param name="pi" select="."> </xsl:param>
		<xsl:param name="piattr">xxx</xsl:param>
		<xsl:param name="property">yyy</xsl:param>
		<xsl:if test="contains($pi,concat($piattr, '='))">
			<xsl:variable name="restq" select="substring-after($pi,concat($piattr,'='))"> </xsl:variable>
			<xsl:variable name="quote" select="substring($restq,1,1)"> </xsl:variable>
			<xsl:variable name="rest" select="substring-before(substring($restq,2),$quote)"> </xsl:variable>
			<xsl:if test="$rest!=''">
				<xsl:attribute name="{$property}">
					<xsl:value-of disable-output-escaping="no" select="$rest"/>
				</xsl:attribute>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="PI_Pub_font_start">
		<xsl:param name="pi" select="."> </xsl:param>
		<xsl:text disable-output-escaping="yes">fo:inline font-size="18pt" </xsl:text>
		<xsl:call-template name="font-attribute">
			<xsl:with-param name="pi" select="$pi"> </xsl:with-param>
			<xsl:with-param name="piattr">FontColor</xsl:with-param>
			<xsl:with-param name="fontattr">color</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="font-attribute">
			<xsl:with-param name="pi" select="$pi"> </xsl:with-param>
			<xsl:with-param name="piattr">Offset</xsl:with-param>
			<xsl:with-param name="fontattr">baseline-shift</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="font-attribute">
			<xsl:with-param name="pi" select="$pi"> </xsl:with-param>
			<xsl:with-param name="piattr">FamName</xsl:with-param>
			<xsl:with-param name="fontattr">font-family</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="font-attribute">
			<xsl:with-param name="pi" select="$pi"> </xsl:with-param>
			<xsl:with-param name="piattr">Posture</xsl:with-param>
			<xsl:with-param name="fontattr">font-style</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="font-attribute">
			<xsl:with-param name="pi" select="$pi"> </xsl:with-param>
			<xsl:with-param name="piattr">Weight</xsl:with-param>
			<xsl:with-param name="fontattr">font-weight</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="font-style">
			<xsl:with-param name="pi" select="$pi"> </xsl:with-param>
			<xsl:with-param name="piattr">FontStyle</xsl:with-param>
			<xsl:with-param name="fontattr">font-family</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="font-backcolor">
			<xsl:with-param name="pi" select="$pi"> </xsl:with-param>
			<xsl:with-param name="piattr">BackColor</xsl:with-param>
			<xsl:with-param name="fontattr">background-color</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="font-keepline">
			<xsl:with-param name="pi" select="$pi"> </xsl:with-param>
			<xsl:with-param name="piattr">KeepLine</xsl:with-param>
			<xsl:with-param name="fontattr">keep-together.within-line</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="font-scorespaces">
			<xsl:with-param name="pi" select="$pi"> </xsl:with-param>
			<xsl:with-param name="piattr">ScoreSpace</xsl:with-param>
			<xsl:with-param name="fontattr">score-spaces</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="font-allcaps">
			<xsl:with-param name="pi" select="$pi"> </xsl:with-param>
			<xsl:with-param name="piattr">AllCap</xsl:with-param>
			<xsl:with-param name="fontattr">text-transform</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="font-text-decoration">
			<xsl:with-param name="underline">
				<xsl:call-template name="font-underline">
					<xsl:with-param name="pi" select="$pi"> </xsl:with-param>
					<xsl:with-param name="piattr">Underline</xsl:with-param>
				</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="strikethru">
				<xsl:call-template name="font-strikethru">
					<xsl:with-param name="pi" select="$pi"> </xsl:with-param>
					<xsl:with-param name="piattr">ScoreCharOn</xsl:with-param>
				</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="fontattr">text-decoration</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="PI_Pub_font_end">
		<xsl:text disable-output-escaping="yes">/fo:inline 		</xsl:text>
	</xsl:template>
	<!-- for BackColor and FontColor, we have to map given names to associated RGB
   values and leave a given RGB value as is. The mapping of names to RGB values
   for background colors is given by the variable fg2bg_colorizer whose
   value is generated and assigned outside this file. The mapping of names to
   RGB values for font colors is given by the variable fg_colorizer whose
   value is generated and assigned outside this file.
    If this file is used in another context, the following (commented out)
   assignments are feasible values to use:
    xsl:variable name="fg2bg_colorizer"
xsl:text bgreen=#c0ffc0; gray3=#d0d0d0; green=#c0ffc0;/xsl:text
xsl:text lime=#e0ffe0; bviolet=#ffc0ff; gray4=#c0c0c0;/xsl:text
xsl:text maroon=#c08080; navy=#a0a0c0; bred=#ffc0cb;/xsl:text
xsl:text borange=#ffc097; gray5=#b0b0b0; olive=#cccc00;/xsl:text
xsl:text red=#ffc0cb; byellow=#ffffc0; bwhite=#ffffff;/xsl:text
xsl:text bbrown=#deb887; bblack=#808080; black=#808080;/xsl:text
xsl:text brown=#deb887; teal=#00e0e0; violet=#ffc0ff;/xsl:text
xsl:text white=#ffffff; bblue=#c0c0ff; blue=#c0c0ff;/xsl:text
xsl:text orange=#ffc097; aqua=#d0ffff; gray1=#f0f0f0;/xsl:text
xsl:text bgray=#d0d0d0; gray2=#e0e0e0; gray=#d0d0d0; yellow=#ffffc0;/xsl:text
/xsl:variable
xsl:variable name="fg_colorizer"
xsl:text lime=#00ff00; green=#008000; gray3=#c0c0c0;/xsl:text
xsl:text navy=#000080; maroon=#800000; gray4=#b0b0b0;/xsl:text
xsl:text red=#ff0000; olive=#808000; gray5=#808080;/xsl:text
xsl:text white=#ffffff; violet=#ff00ff; teal=#008080;/xsl:text
xsl:text brown=#804000; black=#000000; orange=#ff8000;/xsl:text
xsl:text blue=#0000ff; gray1=#e0e0e0; aqua=#00ffff;/xsl:text
xsl:text yellow=#ffff00; gray=#c0c0c0; gray2=#d0d0d0;/xsl:text
/xsl:variable
-->
	<xsl:template name="font-backcolor">
		<xsl:param name="pi" select="."> </xsl:param>
		<xsl:param name="piattr">BackColor</xsl:param>
		<xsl:param name="fontattr">background-color</xsl:param>
		<xsl:if test="contains($pi,concat($piattr, '='))">
			<xsl:variable name="restq" select="substring-after($pi,concat($piattr,'='))"> </xsl:variable>
			<xsl:variable name="quote" select="substring($restq,1,1)"> </xsl:variable>
			<xsl:variable name="given_bgcolor" select="substring-before(substring($restq,2),$quote)"> </xsl:variable>
			<!-- Now convert given color to associated background intensity -->
			<xsl:variable name="xbgcolor" select="substring-after($fg2bg_colorizer,concat($given_bgcolor,'='))"> </xsl:variable>
			<xsl:variable name="bgcolor" select="substring-before($xbgcolor,';')"> </xsl:variable>
			<xsl:variable name="final_bgcolor">
				<xsl:choose>
					<xsl:when test="$bgcolor=''">
						<xsl:value-of select="$given_bgcolor"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$bgcolor"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:if test="$final_bgcolor != ''">
				<fo:block>
					<xsl:text disable-output-escaping="no"> </xsl:text>
					<xsl:value-of select="$fontattr"/>
					<xsl:text>="</xsl:text>
					<xsl:value-of select="$final_bgcolor"/>
					<xsl:text>"</xsl:text>
				</fo:block>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="font-color">
		<xsl:param name="pi" select="."> </xsl:param>
		<xsl:param name="piattr">FontColor</xsl:param>
		<xsl:param name="fontattr">color</xsl:param>
		<xsl:if test="contains($pi,concat($piattr, '='))">
			<xsl:variable name="restq" select="substring-after($pi,concat($piattr,'='))"> </xsl:variable>
			<xsl:variable name="quote" select="substring($restq,1,1)"> </xsl:variable>
			<xsl:variable name="given_color" select="substring-before(substring($restq,2),$quote)"> </xsl:variable>
			<!-- Now convert given color to associated RGB number -->
			<xsl:variable name="xcolor" select="substring-after($fg_colorizer,concat($given_color,'='))"> </xsl:variable>
			<xsl:variable name="color" select="substring-before($xcolor,';')"> </xsl:variable>
			<xsl:variable name="final_color">
				<xsl:choose>
					<xsl:when test="$color=''">
						<xsl:value-of select="$given_color"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$color"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:if test="$final_color != ''">
				<fo:block>
					<xsl:text disable-output-escaping="no"> </xsl:text>
					<xsl:value-of select="$fontattr"/>
					<xsl:text>="</xsl:text>
					<xsl:value-of select="$final_color"/>
					<xsl:text disable-output-escaping="no">"</xsl:text>
				</fo:block>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="font-keepline">
		<xsl:param name="pi" select="."> </xsl:param>
		<xsl:param name="piattr">KeepLine</xsl:param>
		<xsl:param name="fontattr">keep-together.within-line</xsl:param>
		<xsl:if test="contains($pi,concat($piattr, '='))">
			<xsl:variable name="restq" select="substring-after($pi,concat($piattr,'='))"> </xsl:variable>
			<xsl:variable name="quote" select="substring($restq,1,1)"> </xsl:variable>
			<xsl:variable name="rest" select="substring-before(substring($restq,2),$quote)"> </xsl:variable>
			<fo:block>
				<xsl:if test="$rest = 'yes'">
					<xsl:text> </xsl:text>
					<xsl:value-of select="$fontattr"/>
					<xsl:text disable-output-escaping="no">="always"</xsl:text>
				</xsl:if>
			</fo:block>
		</xsl:if>
	</xsl:template>
	<xsl:template name="font-underline">
		<xsl:param name="pi" select="."> </xsl:param>
		<xsl:param name="piattr">Underline</xsl:param>
		<xsl:if test="contains($pi,concat($piattr, '='))">
			<xsl:variable name="restq" select="substring-after($pi,concat($piattr,'='))"> </xsl:variable>
			<xsl:variable name="quote" select="substring($restq,1,1)"> </xsl:variable>
			<xsl:variable name="rest" select="substring-before(substring($restq,2),$quote)"> </xsl:variable>
			<xsl:if test="$rest = 'yes'">
				<xsl:text>underline</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="font-strikethru">
		<xsl:param name="pi" select="."> </xsl:param>
		<xsl:param name="piattr">ScoreCharOn</xsl:param>
		<xsl:if test="contains($pi,concat($piattr, '='))">
			<xsl:variable name="restq" select="substring-after($pi,concat($piattr,'='))"> </xsl:variable>
			<xsl:variable name="quote" select="substring($restq,1,1)"> </xsl:variable>
			<xsl:variable name="rest" select="substring-before(substring($restq,2),$quote)"> </xsl:variable>
			<xsl:if test="$rest = 'yes'">
				<xsl:text>line-through</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="font-text-decoration">
		<xsl:param name="underline"> </xsl:param>
		<xsl:param name="strikethru"> </xsl:param>
		<xsl:param name="fontattr">text-decoration</xsl:param>
		<xsl:if test="concat($underline,$strikethru) != ''">
			<xsl:variable name="text-decoration-value">
				<fo:block>
					<xsl:choose>
						<xsl:when test="$underline = ''">
							<xsl:text>line-through</xsl:text>
						</xsl:when>
						<xsl:when test="$strikethru = ''">
							<xsl:text>underline</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>underline line-through</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</fo:block>
			</xsl:variable>
			<xsl:text> </xsl:text>
			<xsl:value-of select="$fontattr"/>
			<xsl:text disable-output-escaping="no">="</xsl:text>
			<xsl:value-of select="$text-decoration-value"/>
			<xsl:text>"</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template name="font-allcaps">
		<xsl:param name="pi" select="."> </xsl:param>
		<xsl:param name="piattr">AllCap</xsl:param>
		<xsl:param name="fontattr">text-transform</xsl:param>
		<xsl:if test="contains($pi,concat($piattr, '='))">
			<xsl:variable name="restq" select="substring-after($pi,concat($piattr,'='))"> </xsl:variable>
			<xsl:variable name="quote" select="substring($restq,1,1)"> </xsl:variable>
			<xsl:variable name="rest" select="substring-before(substring($restq,2),$quote)"> </xsl:variable>
			<fo:block>
				<xsl:if test="$rest = 'yes'">
					<xsl:text> </xsl:text>
					<xsl:value-of select="$fontattr"/>
					<xsl:text disable-output-escaping="no">="uppercase"</xsl:text>
				</xsl:if>
			</fo:block>
		</xsl:if>
	</xsl:template>
	<xsl:template name="font-scorespaces">
		<xsl:param name="pi" select="."> </xsl:param>
		<xsl:param name="piattr">ScoreSpace</xsl:param>
		<xsl:param name="fontattr">score-spaces</xsl:param>
		<xsl:if test="contains($pi,concat($piattr, '='))">
			<xsl:variable name="restq" select="substring-after($pi,concat($piattr,'='))"> </xsl:variable>
			<xsl:variable name="quote" select="substring($restq,1,1)"> </xsl:variable>
			<xsl:variable name="rest" select="substring-before(substring($restq,2),$quote)"> </xsl:variable>
			<fo:block>
				<xsl:choose>
					<xsl:when test="$rest = 'yes'">
						<xsl:text> </xsl:text>
						<xsl:value-of select="$fontattr"/>
						<xsl:text disable-output-escaping="no">="true"</xsl:text>
					</xsl:when>
					<xsl:when test="$rest = 'no'">
						<xsl:text> </xsl:text>
						<xsl:value-of select="$fontattr"/>
						<xsl:text disable-output-escaping="no">="false"</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text> </xsl:text>
						<xsl:value-of disable-output-escaping="no" select="$fontattr"/>
						<xsl:text>="true"</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</fo:block>
		</xsl:if>
	</xsl:template>
	<xsl:template name="font-style">
		<xsl:param name="pi" select="."> </xsl:param>
		<xsl:param name="piattr">FontStyle</xsl:param>
		<xsl:param name="fontattr">font-family</xsl:param>
		<xsl:if test="contains($pi,concat($piattr, '='))">
			<xsl:variable name="restq" select="substring-after($pi,concat($piattr,'='))"> </xsl:variable>
			<xsl:variable name="quote" select="substring($restq,1,1)"> </xsl:variable>
			<xsl:variable name="rest" select="substring-before(substring($restq,2),$quote)"> </xsl:variable>
			<xsl:variable name="genfontfam">
				<xsl:choose>
					<xsl:when test="$rest='serifed'">serif</xsl:when>
					<xsl:when test="$rest='sans-serif'">sans-serif</xsl:when>
					<xsl:when test="$rest='monospaced-serifed'">monospace</xsl:when>
					<xsl:when test="$rest='monospaced-sans-serif'">monospace</xsl:when>
					<xsl:otherwise>none</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:if test="$genfontfam!='none'">
				<fo:block>
					<xsl:text disable-output-escaping="no"> </xsl:text>
					<xsl:value-of select="$fontattr"/>
					<xsl:text>="</xsl:text>
					<xsl:value-of select="$genfontfam"/>
					<xsl:text disable-output-escaping="no">"</xsl:text>
				</fo:block>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="font-attribute">
		<xsl:param name="pi" select="."> </xsl:param>
		<xsl:param name="piattr">xxx</xsl:param>
		<xsl:param name="fontattr">yyy</xsl:param>
		<xsl:if test="contains($pi,concat($piattr, '='))">
			<xsl:variable name="restq" select="substring-after($pi,concat($piattr,'='))"> </xsl:variable>
			<xsl:variable name="quote" select="substring($restq,1,1)"> </xsl:variable>
			<xsl:variable name="rest" select="substring-before(substring($restq,2),$quote)"> </xsl:variable>
			<xsl:if test="$rest!=''">
				<fo:block>
					<xsl:text disable-output-escaping="yes"> </xsl:text>
					<xsl:value-of disable-output-escaping="yes" select="$fontattr"/>
					<xsl:text disable-output-escaping="yes">="</xsl:text>
					<xsl:value-of disable-output-escaping="yes" select="$rest"/>
					<xsl:text disable-output-escaping="yes">"</xsl:text>
				</fo:block>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<!-- **********************************************************
               end  pi.xsl 
               ********************************************************** -->
</xsl:stylesheet>
