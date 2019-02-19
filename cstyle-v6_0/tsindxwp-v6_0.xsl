<?xml version="1.0" encoding="utf-8"?>
<!-- Fragment document type declaration subset:
	Arbortext, Inc., 1988-2005, v.4002
	<!DOCTYPE xsl:stylesheet>
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="tsindxwp">
<xsl:choose>
		<xsl:when test="@deletewp='yes'">
		<xsl:call-template name="delete-pageset"/>
		</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="wp-pageset"/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="tsindx.system">
<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" keep-with-previous.within-column="always" keep-with-previous.within-page="always" id="{generate-id(.)}">
					<xsl:choose>
						<xsl:when test="string-length(title[1])=0">
							<fo:block span="all" xsl:use-attribute-sets="titlesub" text-align="center">
							<xsl:text>&#x2002;Troubleshooting Index</xsl:text></fo:block>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="child::title"/>
						</xsl:otherwise>
				</xsl:choose>
			</fo:block>
			<fo:block span="all">
<fo:table font-family="sans-serif" font-size="10pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="4pt" padding-left="4pt" padding-right="4pt" padding-top="4pt" relative-position="static" space-after="12pt" space-before="12pt" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve">
	
				
					<fo:table-column column-number="1" column-width="6%"/>
					<fo:table-column column-number="2" column-width="66%"/>
					<fo:table-column column-number="3" column-width="28%"/>
					<fo:table-header>
						<fo:table-row>
						<fo:table-cell column-number="1" text-align="left" margin="3pt" padding-after="4pt" padding-before="4pt" >
								<fo:block> <xsl:text>&#x2002;&#x2002;</xsl:text></fo:block>
						  </fo:table-cell>
							<fo:table-cell column-number="2" padding-after="4pt" padding-before="4pt" font-weight="bold">
								<fo:block padding="3pt" padding-after="4pt" padding-before="4pt">Malfunction/Symptom</fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="3">
								<fo:block padding-after="4pt" padding-before="4pt" font-weight="bold">Troubleshooting Procedure</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>
					<fo:table-body>
						<xsl:choose>
							<xsl:when test="tsindx.system-category">
								<xsl:apply-templates select="tsindx.system-category"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="tsindx.system-entry"/>
							</xsl:otherwise>
						</xsl:choose>
					</fo:table-body>
				</fo:table>
	
	</fo:block>
	</xsl:template>
	<xsl:template match="tsindx.system-category">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-row padding-after="12pt" > <!--vertical-align="middle" -->
			<fo:table-cell column-number="2" padding-after="4pt" padding-before="4pt">
				<fo:block font-weight="bold" margin-bottom="3pt" margin-top="3pt" text-align="center" space-after="12pt" >
					<xsl:value-of disable-output-escaping="no" select="title"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
			<xsl:apply-templates select="tsindx.system-entry"/>
	</xsl:template>

<xsl:template match="tsindx.system-entry">
<xsl:call-template name="CHANGEBAR"/>
		<fo:table-row padding-after="4pt" padding-before="4pt">
		 <fo:table-cell column-number="1" padding-after="8pt" padding-before="4pt" text-align="left" margin="3pt" >
		 <fo:block padding-after="4pt" padding-before="4pt" >
		 <!--<xsl:text>&#x2002;&#x2002;</xsl:text>-->
						<xsl:number count="tsindx.system-entry" format="1." from="tsindxwp" level="any"/>
						
						</fo:block>
		</fo:table-cell>
		<fo:table-cell column-number="2" text-align="left" margin="left" padding-after="4pt" padding-before="4pt">
		<fo:block padding-after="4pt" padding-before="4pt" space-before.maximum="8pt" space-before.minimum="5pt" space-before.optimum="6pt" span="all" start-indent="0pt" font-size="10pt" space-after="12pt">
		             <xsl:apply-templates select="name"/>
		                      <!--  <fo:leader leader-pattern="dots"/>-->
		                        </fo:block>
		    </fo:table-cell>
			<fo:table-cell column-number="3" text-align="right" padding-after="4pt" padding-before="4pt" > <!-- display-align="after" -->
			<fo:block>
			<fo:leader leader-length.minimum="0pt" leader-pattern="dots"/><fo:leader leader-pattern="dots"/>
			<xsl:apply-templates select="xref | action | extref | link"/></fo:block>
		</fo:table-cell>
		</fo:table-row>
	</xsl:template>
		
	<xsl:template name="WPID-TO-WPNO">
		<xsl:param name="WpId"/>
		<xsl:for-each select="//wpidinfo">
			<xsl:if test="parent::*[@wpno=$WpId]">
				<xsl:choose>
					<xsl:when test="../@wpseq">
						<xsl:value-of select="../@wpseq"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:number count="wpidinfo" format="0000" from="paper.manual | bdar" level="any"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	
	<xsl:template match="tsindx.symptom">
<fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" keep-with-previous.within-column="always" keep-with-previous.within-page="always" id="{generate-id(.)}">
					<xsl:choose>
						<xsl:when test="string-length(title[1])=0">
							<fo:block span="all" xsl:use-attribute-sets="titlesub" text-align="center">
							<xsl:text>&#x2002;Troubleshooting Symptom Index</xsl:text></fo:block>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="child::title"/>
						</xsl:otherwise>
				</xsl:choose>
			</fo:block>
			<fo:block span="all">
<fo:table font-family="sans-serif" font-size="10pt" margin-bottom="8pt" margin-left="3pt" margin-right="3pt" margin-top="8pt" padding-bottom="4pt" padding-left="4pt" padding-right="4pt" padding-top="4pt" relative-position="static" space-after="12pt" space-before="12pt" table-layout="fixed" table-omit-header-at-break="false" text-align="left" white-space-treatment="preserve">
	
				
					<fo:table-column column-number="1" column-width="6%"/>
					<fo:table-column column-number="2" column-width="66%"/>
					<fo:table-column column-number="3" column-width="28%"/>
					<fo:table-header>
						<fo:table-row>
						<fo:table-cell column-number="1" text-align="left" margin="3pt" padding-after="4pt" padding-before="4pt" >
								<fo:block> <xsl:text>&#x2002;&#x2002;</xsl:text></fo:block>
						  </fo:table-cell>
							<fo:table-cell column-number="2" padding-after="4pt" padding-before="4pt" font-weight="bold">
								<fo:block padding="3pt" padding-after="4pt" padding-before="4pt">Malfunction/Symptom</fo:block>
							</fo:table-cell>
							<fo:table-cell column-number="3">
								<fo:block padding-after="4pt" padding-before="4pt" font-weight="bold">Troubleshooting Procedure</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>
					<fo:table-body>
						<xsl:choose>
						<xsl:when test="tsindx.symptom-category">
							<xsl:apply-templates select="tsindx.symptom-category"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="tsindx.symptom-entry"/>
						</xsl:otherwise>
					</xsl:choose>
					</fo:table-body>
				</fo:table>
	
	</fo:block>
	</xsl:template>
	
	
		
	
<!--	<xsl:template match="tsindx.symptom">
			<fo:list-block font-family="sans-serif" font-size="10pt" provisional-distance-between-starts="31pc" provisional-label-separation="0pt" space-after="12pt" space-before.conditionality="discard" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt">
			<fo:list-item>
				<fo:list-item-label>
					<fo:block font-weight="bold" text-decoration="underline">Malfunction/Symptom<fo:leader leader-pattern="space"> </fo:leader></fo:block>
				</fo:list-item-label>
				
				<fo:list-item-body>
					<fo:block  font-weight="bold" text-decoration="underline">Troubleshooting Procedure</fo:block>
				</fo:list-item-body>
			</fo:list-item>
			</fo:list-block>
			<fo:list-block>
				<fo:list-item>
					<fo:list-item-label>
						<fo:block space-after="12pt" span="all">
					<xsl:choose>
						<xsl:when test="tsindx.symptom-category">
							<xsl:apply-templates select="tsindx.symptom-category"/>
					<xsl:text>&#x2002;</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="tsindx.symptom-entry"/>
						</xsl:otherwise>
					</xsl:choose>
					</fo:block>
					</fo:list-item-label>
					<fo:list-item-body>
						<fo:block></fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</fo:list-block>
			
	</xsl:template>-->
	
	
<!--	<xsl:template match="tsindx.symptom-category">
		<fo:block font-weight="bold" space-after="12pt" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="5pt" space-before.optimum="6pt" span="all" start-indent="0pt" font-size="10pt">
			<xsl:value-of select="title"/>
			<xsl:apply-templates select="tsindx.symptom-entry"/>
		</fo:block>
	</xsl:template>-->


	<xsl:template match="tsindx.symptom-category">
	<xsl:call-template name="CHANGEBAR"/>
		<fo:table-row padding-after="12pt" > 
			<fo:table-cell column-number="2" padding-after="4pt" padding-before="4pt">
				<fo:block font-weight="bold" margin-bottom="3pt" margin-top="3pt" text-align="center" space-after="12pt" >
					<xsl:value-of disable-output-escaping="no" select="title"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:apply-templates select="tsindx.symptom-entry"/>
	</xsl:template>
	
	
	<xsl:template match="tsindx.symptom-entry">
<xsl:call-template name="CHANGEBAR"/>
		<fo:table-row padding-after="4pt" padding-before="4pt">
		 <fo:table-cell column-number="1" padding-after="8pt" padding-before="4pt" text-align="left" margin="3pt" >
		 <fo:block padding-after="4pt" padding-before="4pt" >
						<xsl:number count="tsindx.symptom-entry" format="1." from="tsindxwp" level="any"/>
						</fo:block>
		</fo:table-cell>
		<fo:table-cell column-number="2" text-align="left" margin="left" padding-after="4pt" padding-before="4pt">
		<fo:block padding-after="4pt" padding-before="4pt" space-before.maximum="8pt" space-before.minimum="5pt" space-before.optimum="6pt" span="all" start-indent="0pt" font-size="10pt" space-after="12pt">
		             <xsl:apply-templates select="malfunc"/>
		                      <!--  <fo:leader leader-pattern="dots"/>-->
		                        </fo:block>
		    </fo:table-cell>
			<fo:table-cell column-number="3" text-align="right" padding-after="4pt" padding-before="4pt" > <!-- display-align="after" -->
			<fo:block>
			<fo:leader leader-length.minimum="0pt" leader-pattern="dots"/><fo:leader leader-pattern="dots"/>
			<xsl:apply-templates select="xref | action | extref | link"/></fo:block>
		</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
<!--	<xsl:template match="tsindx.symptom-entry">
	<fo:list-block>
		<fo:list-item>
			<fo:list-item-label>
				<fo:block start-indent="6pt" font-weight="normal" font-size="10pt">
					<xsl:number count="tsindx.symptom-entry" format="1." from="tsindxwp" level="any"/>
					<xsl:text disable-output-escaping="no">&#x2003;</xsl:text>
					<xsl:apply-templates select="name | malfunc"/>
					<fo:leader leader-pattern="dots"/>
				</fo:block>
			</fo:list-item-label>
			<fo:list-item-body relative-align="baseline" start-indent="31pc">

				 <xsl:choose>
                  <xsl:when test="normalize-space(action) ">
                    <xsl:apply-templates select="action"/>
                  </xsl:when>
                     <xsl:when test="xref">
                     <xsl:apply-templates select="xref"/>
                  </xsl:when>
                   <xsl:when test="normalize-space(link) ">
                    <xsl:apply-templates select="link"/>
                  </xsl:when>
                   <xsl:otherwise>
                    <xsl:text>&#x2003;</xsl:text>
                   <xsl:value-of select="action/para/xref/@callout"/>
                    </xsl:otherwise>
                </xsl:choose>

			</fo:list-item-body>
		</fo:list-item>
		</fo:list-block>
	</xsl:template>
	<xsl:template match="tsindx.symptom-entry/name | tsindx.symptom-entry/malfunc">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
	<xsl:template match="tsindx.symptom-entry/action">
		<xsl:apply-templates select="node()"/>
	</xsl:template>-->

	<!-- ====================================================================== -->
	<!-- tsindx.Message -->
	<!-- ====================================================================== -->
	<xsl:template match="tsindx.messageword">
			<fo:block font-family="sans-serif" font-size="10pt" provisional-distance-between-starts="31pc" provisional-label-separation="0pt" space-before.conditionality="discard" space-before.maximum="12pt" space-before.minimum="8pt" space-before.optimum="10pt">
				<fo:block space-after="12pt" span="all">
					<fo:inline font-family="sans-serif" font-weight="bold" text-decoration="underline">Malfunction</fo:inline>
					<fo:leader leader-pattern="space"> </fo:leader>
					<fo:inline font-family="sans-serif" font-weight="bold" text-decoration="underline"> Troubleshooting Procedure</fo:inline>
				</fo:block>
				<fo:block span="all">
					<xsl:choose>
						<xsl:when test="tsindx.messageword-category">
							<xsl:apply-templates select="tsindx.messageword-category"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="tsindx.messageword-entry"/>
						</xsl:otherwise>
					</xsl:choose>
				</fo:block>
				</fo:block>
	</xsl:template>
	<xsl:template match="tsindx.messageword-category">
		<fo:block font-weight="bold" space-before.conditionality="discard" space-before.maximum="8pt" space-before.minimum="5pt" space-before.optimum="6pt" span="all" start-indent="0pt">
			<xsl:value-of select="title"/>
			<xsl:apply-templates select="tsindx.messageword-entry"/>
		</fo:block>
	</xsl:template>
	<xsl:template match="tsindx.messageword-entry">
	<fo:list-block>
		<fo:list-item>
			<fo:list-item-label>
				<fo:block start-indent="6pt">
					<xsl:number count="tsindx.messageword-entry" format="1." from="tsindxwp" level="any"/>
					<xsl:text disable-output-escaping="no">&#x2003;</xsl:text>
					<xsl:apply-templates select="messageword"/>
					<fo:leader leader-length.minimum="0pt" leader-pattern="dots"/><fo:leader leader-pattern="dots"/>
				</fo:block>
			</fo:list-item-label>
				<fo:list-item-body relative-align="baseline" start-indent="31pc">
				<!-- LB 7-10-12commented out messageword it was being out put twice -->

					<xsl:apply-templates select="action | xref | extref | link"/><!--  | messageword-->

			</fo:list-item-body>
		</fo:list-item>
	</fo:list-block>
	</xsl:template>
	<xsl:template match="tsindx.messageword-entry/messageword">
		<xsl:apply-templates select="node()"/>
	</xsl:template>
</xsl:stylesheet>
