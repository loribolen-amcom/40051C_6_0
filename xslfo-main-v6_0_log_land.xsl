<?xml version="1.0" encoding="utf-8"?>
<?APT StylesheetID Title="U.S. Army MIL-STD-40051-2C XSL-FO" CompositionTypes="print,pdf,xsl"?>
<!DOCTYPE xsl:stylesheet> 
<!-- C-Stylesheet for Paper-based TMs for MIL STD 40051-2C -->
<xsl:stylesheet version="2.0" 
xmlns:fo="http://www.w3.org/1999/XSL/Format" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:xlink="http://www.w3.org/1999/XSL/Transform"
xmlns:atixslts="http://www.arbortext.com/namespace/XslTurboStyler/3.0" 
xmlns:atixslfoext="http://www.arbortext.com/namespace/XslFoExtensions" 
xmlns:axf="http://www.antennahouse.com/names/XSL/Extensions" 
xmlns:xi="http://www.w3.org/2001/XSL/XInclude" 
xmlns:xalan="http://xml.apache.org/xalan" xmlns:saxon="http://saxon.sf.net/"
xmlns:exslt="http://exslt.org/common"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="http://www.arbortext.com/namespace/doctypes/styler"
xmlns:atidlm="http://www.arbortext.com/namespace/atidlm"
xmlns:ch="http://www.arbortext.com/namespace/chunker"
xmlns:_gte="http://www.arbortext.com/namespace/Styler/GeneratedTextElements"
xmlns:_sfe="http://www.arbortext.com/namespace/Styler/StylerFormattingElements"
xmlns:_ufe="http://www.arbortext.com/namespace/Styler/UserFormattingElements"
xmlns:_dtd="http://www.arbortext.com/namespace/Styler/UserElements"
xmlns:_acl="java:com.arbortext.epic.Acl"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:_js="java:com.arbortext.epic.internal.js.JavaScript"
                xmlns:atidmd="http://www.arbortext.com/namespace/DocumentMetaData"
                xmlns:rtf="http://www.cambridgedocs.com/namespace/fo/rtf"
>
<!--An application may provide an overriding setting for $fo-composer-vendor-->

<xsl:param name="fo-composer-vendor" select="'unknown'"/>
   <xsl:variable name="generator-product-name">Arbortext Editor with Styler</xsl:variable>
   <xsl:variable name="generator-version-number">6.0 M070</xsl:variable>
   <xsl:variable name="generator-version-date">January 22, 2013</xsl:variable>
   <xsl:variable name="generator-version-build">R60M070-1022</xsl:variable>

   <xsl:param name="max-expansion-pass-count" select="'7'"/>
   <xsl:param name="skip-post-gentext-pass" select="'no'"/>
   <xsl:param name="gte-namespace-uri"
              select="'http://www.arbortext.com/namespace/Styler/GeneratedTextElements'"/>

     <xsl:template match="@*|node()" mode="expand-gentext">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="@*|node()" mode="set-countas">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="@*|node()" mode="expand-numbering">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="expand-numbering"/>
      </xsl:copy>
   </xsl:template>

   <xsl:template match="/*" mode="initial-pass-mode" priority="999">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*" mode="initial-pass-mode"/>
         <_gte:XSLT-pass-control must-do-numbering-pass="true" must-do-countas-pass="true"/>
         <_gte:Must-Expand-Gentext/>
         <xsl:apply-templates select="node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="@*|node()" mode="initial-pass-mode">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <xsl:template match="_gte:XSLT-pass-control" mode="expand-gentext">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="_gte:XSLT-pass-control" mode="set-countas">
      <xsl:copy>
         <xsl:copy-of select="@*[not(name(.)='must-do-countas-pass')]"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="_gte:XSLT-pass-control" mode="expand-numbering">
      <xsl:copy>
         <xsl:copy-of select="@*[not(name(.)='must-do-numbering-pass')]"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="_gte:XSLT-pass-control"/>

   <xsl:template match="/" mode="post-gentext-expansion">
      <xsl:call-template name="user-visible-root-template"/>
   </xsl:template>

   <!--The user-visible root template-->
<xsl:template name="user-visible-root-template"><!--Do not change the above line, and edit this template with caution!-->
<fo:root id="styler-root_id">
         <xsl:choose>
            <xsl:when test="contains($fo-composer-vendor,'Arbortext')">
               <xsl:attribute name="atixslfoext:generator">Arbortext Styler</xsl:attribute>
               <xsl:attribute name="atixslfoext:xml-lang">
                  <xsl:choose>
                     <xsl:when test="/*[1]/@lang">
                        <xsl:value-of select="/*[1]/@lang"/>
                     </xsl:when>
                     <xsl:otherwise>en</xsl:otherwise>
                  </xsl:choose>
               </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
               <xsl:comment>generator="Arbortext Styler"</xsl:comment>
            </xsl:otherwise>
         </xsl:choose>
         <!--<xsl:call-template name="emit-layout-master-set"/>
         <xsl:if test="contains($fo-composer-vendor,'Arbortext')">
            <xsl:call-template name="emit-fo-declarations"/>
         </xsl:if>
         <xsl:if test="contains($fo-composer-vendor,'Arbortext')">
            <xsl:call-template name="emit-docinfo"/>
         </xsl:if>
         <xsl:call-template name="emit-bookmarks"/>-->
         <xsl:apply-templates/>
      </fo:root>
   </xsl:template>

   <xsl:template name="substring-before-last-occurrence">
      <xsl:param name="full-string"/>
      <xsl:param name="search-string"/>
      <xsl:variable name="front" select="substring-before($full-string,$search-string)"/>
      <xsl:variable name="back" select="substring-after($full-string,$search-string)"/>
      <xsl:choose>
         <xsl:when test="not(contains($back,$search-string))">
            <xsl:value-of select="$front"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$front"/>
            <xsl:value-of select="$search-string"/>
            <xsl:call-template name="substring-before-last-occurrence">
               <xsl:with-param name="full-string" select="$back"/>
               <xsl:with-param name="search-string" select="$search-string"/>
            </xsl:call-template>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template name="return-matching-lang-within-targets">
      <xsl:param name="doclang"/>
      <xsl:param name="target-langs"/>
      <xsl:variable name="lc-doclang"
                    select="translate($doclang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
      <xsl:variable name="lc-target-langs"
                    select="translate($target-langs,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
      <xsl:choose>
         <xsl:when test="contains($lc-target-langs,concat(' ',$lc-doclang,' '))">
            <xsl:value-of select="$lc-doclang"/>
         </xsl:when>
         <xsl:when test="contains($doclang,'-')">
            <xsl:call-template name="return-matching-lang-within-targets">
               <xsl:with-param name="doclang">
                  <xsl:call-template name="substring-before-last-occurrence">
                     <xsl:with-param name="full-string" select="$doclang"/>
                     <xsl:with-param name="search-string" select="'-'"/>
                  </xsl:call-template>
               </xsl:with-param>
               <xsl:with-param name="target-langs" select="$target-langs"/>
            </xsl:call-template>
         </xsl:when>
      </xsl:choose>
   </xsl:template>

   <xsl:template name="return-lang-applying-language-map">
      <xsl:param name="doclang"/>
      <xsl:variable name="lc-doclang"
                    select="translate($doclang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
      <xsl:choose>
         <xsl:when test="$lc-doclang='de'">
            <xsl:value-of select="'de-1996'"/>
         </xsl:when>
         <xsl:when test="$lc-doclang='en'">
            <xsl:value-of select="'en-US'"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$doclang"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template name="emit-unstyled-template-content"><!--Treat unstyled elements as no-ops--><xsl:apply-templates/>
   </xsl:template>

   <xsl:template name="maybe-set-gte-id">
      <xsl:if test="not(@_gte:id)">
         <xsl:variable name="context-node" select="."/>
         <xsl:variable name="this-elements-real-id">
            <xsl:choose>
               <xsl:when test="@xml:id">
                  <xsl:value-of select="@xml:id"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:for-each select="@*">
                     <xsl:variable name="can-call-generate-id">
                        <xsl:choose>
                           <xsl:when test="$using-msxsl">
                              <xsl:call-template name="can-call-generate-id"/>
                           </xsl:when>
                           <xsl:otherwise>true</xsl:otherwise>
                        </xsl:choose>
                     </xsl:variable>
                     <xsl:if test="$can-call-generate-id='true'">
                        <xsl:if test="generate-id(id(.)) = generate-id($context-node)">
                           <xsl:value-of select="."/>
                        </xsl:if>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:attribute name="_gte:id">
            <xsl:choose>
               <xsl:when test="$this-elements-real-id!=''">
                  <xsl:value-of select="$this-elements-real-id"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="'_g_'"/>
                  <xsl:value-of select="generate-id($context-node)"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:attribute>
         <xsl:if test="$this-elements-real-id!=''">
            <xsl:attribute name="xml:id">
               <xsl:value-of select="$this-elements-real-id"/>
            </xsl:attribute>
         </xsl:if>
      </xsl:if>
   </xsl:template>

   <xsl:variable name="name-start-chars"
                 select="'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_:'"/>
   <xsl:variable name="using-msxsl" select="function-available('msxsl:node-set')"/>
   <!--We need to avoid calling generate-id() on things that cannot be valid IDs to avoid an MSXSL bug.  This code isn't close to perfect, but it helps.-->
   <xsl:template name="can-call-generate-id">
      <xsl:param name="str" select="."/>
      <xsl:choose>
         <xsl:when test="not($using-msxsl)"><!--Not using MSXSL, so generate-id() on this value shouldn't give an error--><xsl:text>true</xsl:text>
         </xsl:when>
         <xsl:when test="not(contains($name-start-chars,substring($str,1,1)))">
            <xsl:text>false</xsl:text>
         </xsl:when>
         <xsl:when test="contains($str,'/')">
            <xsl:text>false</xsl:text>
         </xsl:when>
         <xsl:when test="contains($str,'@')">
            <xsl:text>false</xsl:text>
         </xsl:when>
         <xsl:when test="contains($str,'#')">
            <xsl:text>false</xsl:text>
         </xsl:when>
         <xsl:otherwise>true</xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template name="maybe-set-gte-src">
      <xsl:param name="unparsed-entity-ref-attr"/>
      <xsl:variable name="entity-ref" select="attribute::*[name()=$unparsed-entity-ref-attr]"/>
      <xsl:if test="not(@_gte:src)">
         <xsl:attribute name="_gte:src">
            <xsl:if test="$entity-ref != ''">
               <xsl:value-of select="string(unparsed-entity-uri($entity-ref))"/>
            </xsl:if>
         </xsl:attribute>
      </xsl:if>
   </xsl:template>
   <xsl:template match="*" mode="set-id">
      <xsl:number level="multiple"
                  count="*[not( (namespace-uri(.)='http://www.w3.org/1999/XSL/Format') or (namespace-uri(.)='http://www.arbortext.com/namespace/XslFoExtensions') or  (namespace-uri(.)='http://www.arbortext.com/namespace/Styler/StylerFormattingElements') or  (namespace-uri(.)='http://www.arbortext.com/namespace/Styler/GeneratedTextElements') or  (namespace-uri(.)='http://www.arbortext.com/namespace/Styler/UserElements') )]"/>
   </xsl:template>

   <xsl:template name="apply-templates-on-nodelist">
      <xsl:param name="nodelist-name"/>
      <!--This is no longer used by Styler code, but we include--><!--a definition since it may still be used by old edited source-->
     <!-- <xsl:choose>
         <xsl:when test="function-available('exslt:node-set')">
            <xsl:apply-templates select="exslt:node-set($nodelist-name)/node()"/>
         </xsl:when>
         <xsl:when test="function-available('msxsl:node-set')">
            <xsl:apply-templates select="msxsl:node-set($nodelist-name)/node()"/>
         </xsl:when>
         <xsl:otherwise><xsl:value-of select="$nodelist-name"/></xsl:otherwise>
      </xsl:choose>  -->
            
         
   </xsl:template>

   <xsl:template name="use-node-set-extension">
      <xsl:param name="nodelist"/>
      <xsl:param name="use-key" select="''"/>
     <!-- <xsl:choose>
         <xsl:when test="function-available('exslt:node-set')">
            <xsl:choose>
               <xsl:when test="$use-key='apply-templates-in-gentext-mode'">
                  <xsl:apply-templates select="exslt:node-set($nodelist)" mode="expand-gentext"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-set-ch-chunk-mode'">
                  <xsl:apply-templates select="exslt:node-set($nodelist)" mode="set-ch-chunk"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-post-gentext-mode'">
                  <xsl:apply-templates select="exslt:node-set($nodelist)" mode="post-gentext-expansion"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-remove-ns-mode'">
                  <xsl:apply-templates select="exslt:node-set($nodelist)" mode="remove-xhtml-namespace"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-countas-mode'">
                  <xsl:apply-templates select="exslt:node-set($nodelist)" mode="set-countas"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-expand-numbering-mode'">
                  <xsl:apply-templates select="exslt:node-set($nodelist)" mode="expand-numbering"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-cleanup-nested-indexterms-mode'">
                  <xsl:apply-templates select="exslt:node-set($nodelist)" mode="cleanup-nested-indexterms"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-did-set-ch-chunk'">
                  <xsl:value-of select="string(boolean(exslt:node-set($nodelist)//_gte:Must-Expand-Gentext/@did-set-ch-chunk))"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-Must-Expand_Gentext'">
                  <xsl:value-of select="string(boolean(exslt:node-set($nodelist)//_gte:Must-Expand-Gentext))"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-must-do-countas-pass'">
                  <xsl:value-of select="string(boolean(exslt:node-set($nodelist)/*/_gte:XSLT-pass-control[1]/@must-do-countas-pass))"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-must-do-numbering-pass'">
                  <xsl:value-of select="string(boolean(exslt:node-set($nodelist)/*/_gte:XSLT-pass-control[1]/@must-do-numbering-pass))"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-must-do-cleanup-nested-indexterms'">
                  <xsl:value-of select="string(boolean(exslt:node-set($nodelist)/*/_gte:XSLT-pass-control[1]/@must-cleanup-nested-indexterms))"/>
               </xsl:when>
               <xsl:otherwise/>
            </xsl:choose>
         </xsl:when>
 <xsl:otherwise>-->
            <xsl:choose>
               <xsl:when test="$use-key='apply-templates-in-gentext-mode'">
                  <xsl:value-of select="$nodelist"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-set-ch-chunk-mode'">
                  <xsl:value-of select="$nodelist"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-post-gentext-mode'">
                  <xsl:value-of select="$nodelist"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-remove-ns-mode'">
                  <xsl:value-of select="$nodelist"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-countas-mode'">
                  <xsl:value-of select="$nodelist"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-expand-numbering-mode'">
                  <xsl:value-of select="$nodelist"/>
               </xsl:when>
               <xsl:when test="$use-key='apply-templates-in-cleanup-nested-indexterms-mode'">
                  <xsl:value-of select="$nodelist"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-did-set-ch-chunk'">
                  <xsl:value-of select="string('false')"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-Must-Expand_Gentext'">
                  <xsl:value-of select="string('false')"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-must-do-countas-pass'">
                  <xsl:value-of select="string('false')"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-must-do-numbering-pass'">
                  <xsl:value-of select="string('false')"/>
               </xsl:when>
               <xsl:when test="$use-key='test-for-must-do-cleanup-nested-indexterms'">
                  <xsl:value-of select="string('false')"/>
               </xsl:when>
               <xsl:otherwise/>
            </xsl:choose>
         <!--</xsl:otherwise>
      </xsl:choose>-->
   </xsl:template>

   <xsl:template match="*" mode="ElementContent_All">
      <_gte:Must-Expand-Gentext/>
      <_sfe:CollectionItem>
         <xsl:apply-templates mode="expand-gentext">
            <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
         </xsl:apply-templates>
      </_sfe:CollectionItem>
   </xsl:template>

   <xsl:template name="maybe-set-id">
      <xsl:param name="attrname" select="'id'"/>
      <xsl:param name="only-if-id-attr" select="'yes'"/>
      <xsl:param name="check-for-real-id-attr" select="'no'"/>
      <xsl:param name="use-generated-gte-id" select="'no'"/>
      <xsl:param name="generated-id-prefix" select="'x'"/>
      <xsl:param name="context-node" select="."/>
      <xsl:if test="not(ancestor::_sfe:HeaderOrFooter)">
         <xsl:variable name="real-id-attr-value">
            <xsl:if test="$check-for-real-id-attr='yes'">
               <xsl:for-each select="$context-node/@*">
                  <xsl:if test="generate-id(id(.)) = generate-id($context-node)">
                     <xsl:value-of select="."/>
                  </xsl:if>
               </xsl:for-each>
            </xsl:if>
         </xsl:variable>
         <xsl:choose>
            <xsl:when test="$context-node/@_gte:id!='' and (not(starts-with($context-node/@_gte:id,'_g_')) or ($use-generated-gte-id='yes'))">
               <xsl:attribute name="{$attrname}">
                  <xsl:value-of select="$context-node/@_gte:id"/>
               </xsl:attribute>
            </xsl:when>
            <xsl:when test="$real-id-attr-value!=''">
               <xsl:attribute name="{$attrname}">
                  <xsl:value-of select="$real-id-attr-value"/>
               </xsl:attribute>
            </xsl:when>
            <xsl:when test="$only-if-id-attr!='yes'">
               <xsl:attribute name="{$attrname}">
                  <xsl:value-of select="$generated-id-prefix"/>
                  <xsl:if test="namespace-uri($context-node)='http://www.arbortext.com/namespace/Styler/UserFormattingElements'">u</xsl:if>
                  <xsl:apply-templates select="$context-node" mode="set-id"/>
               </xsl:attribute>
            </xsl:when>
         </xsl:choose>
      </xsl:if>
   </xsl:template>

   <xsl:template name="handle-gte-font-attrs">
      <xsl:call-template name="gte-font-attribute">
         <xsl:with-param name="attrval" select="string(@TypeSize)"/>
         <xsl:with-param name="fontattr">font-size</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-offset">
         <xsl:with-param name="attrval" select="string(@Offset)"/>
         <xsl:with-param name="fontattr">baseline-shift</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-attribute">
         <xsl:with-param name="attrval">
            <xsl:variable name="family" select="string(@FamName)"/>
            <xsl:variable name="apos">'</xsl:variable>
            <xsl:choose>
               <xsl:when test="$family = 'Serif'">serif</xsl:when>
               <xsl:when test="$family = 'Sanserif'">sans-serif</xsl:when>
               <xsl:when test="$family = 'Monospace'">monospace</xsl:when>
               <xsl:when test="contains($family,' ') and not(contains($family,$apos))">
                  <xsl:value-of select="concat($apos,$family,$apos)"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="$family"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:with-param>
         <xsl:with-param name="fontattr">font-family</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-posture">
         <xsl:with-param name="attrval" select="string(@Posture)"/>
         <xsl:with-param name="fontattr">font-style</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-weight">
         <xsl:with-param name="attrval" select="string(@Weight)"/>
         <xsl:with-param name="fontattr">font-weight</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-style">
         <xsl:with-param name="attrval" select="string(@FontStyle)"/>
         <xsl:with-param name="fontattr">font-family</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-color">
         <xsl:with-param name="attrval" select="string(@FontColor)"/>
         <xsl:with-param name="fontattr">color</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-backcolor">
         <xsl:with-param name="attrval" select="string(@BackColor)"/>
         <xsl:with-param name="fontattr">background-color</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-keepline">
         <xsl:with-param name="attrval" select="string(@KeepLine)"/>
         <xsl:with-param name="fontattr">keep-together.within-line</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-scorespaces">
         <xsl:with-param name="attrval" select="string(@ScoreSpace)"/>
         <xsl:with-param name="fontattr">score-spaces</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-allcaps">
         <xsl:with-param name="attrval" select="string(@AllCap)"/>
         <xsl:with-param name="fontattr">text-transform</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-smallcaps">
         <xsl:with-param name="attrval" select="string(@SmallCap)"/>
         <xsl:with-param name="fontattr">font-variant</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="gte-font-text-decoration">
         <xsl:with-param name="underline">
            <xsl:call-template name="gte-font-underline">
               <xsl:with-param name="attrval" select="string(@Underline)"/>
            </xsl:call-template>
         </xsl:with-param>
         <xsl:with-param name="strikethru">
            <xsl:call-template name="gte-font-strikethru">
               <xsl:with-param name="attrval" select="string(@ScoreCharOn)"/>
            </xsl:call-template>
         </xsl:with-param>
         <xsl:with-param name="fontattr">text-decoration</xsl:with-param>
      </xsl:call-template>
   </xsl:template>

   <xsl:template name="gte-font-attribute">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:if test="$attrval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$attrval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:param name="bg_colorizer"
              select="'&#34;bgreen=#C0FFC0; gray3=#D0D0D0; green=#C0FFC0; lime=#E0FFE0; bviolet=#FFC0FF; gray4=#C0C0C0; maroon=#C08080; navy=#A0A0C0; bred=#FFC0CB; borange=#FFC097; gray5=#B0B0B0; olive=#D0D000; red=#FFC0CB; byellow=#FFFFC0; bwhite=#FFFFFF; bbrown=#DEB887; bblack=#808080; black=#808080; brown=#DEB887; teal=#00E0E0; violet=#FFC0FF; white=#FFFFFF; bblue=#C0C0FF; blue=#C0C0FF; orange=#FFC097; transparent=transparent; aqua=#D0FFFF; gray1=#F0F0F0; bgray=#D0D0D0; gray2=#E0E0E0; gray=#D0D0D0; yellow=#FFFFC0;&#34;'"/>
   <xsl:template name="gte-font-posture">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='upright'">normal</xsl:when>
            <xsl:when test="$attrval=''"/>
            <xsl:otherwise>
               <xsl:value-of select="$attrval"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-weight">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='medium'">normal</xsl:when>
            <xsl:when test="$attrval=''"/>
            <xsl:otherwise>
               <xsl:value-of select="$attrval"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-style">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='serifed'">serif</xsl:when>
            <xsl:when test="$attrval='sans-serif'">sans-serif</xsl:when>
            <xsl:when test="$attrval='monospaced-serifed'">monospace</xsl:when>
            <xsl:when test="$attrval='monospaced-sans-serif'">monospace</xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-color">
   
	
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="fg_colorizer">
		<xsl:text> lime=#00ff00; green=#008000; gray3=#c0c0c0;
navy=#000080; maroon=#800000; gray4=#b0b0b0; red=#ff0000; olive=#808000; gray5=#808080;
white=#ffffff; violet=#ff00ff; teal=#008080; brown=#804000; black=#000000;
orange=#ff8000; blue=#0000ff; gray1=#e0e0e0; aqua=#00ffff; yellow=#ffff00;
gray=#c0c0c0; gray2=#d0d0d0;</xsl:text>
	</xsl:variable>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval=''"/>
            <xsl:when test="starts-with($attrval,'#')">
               <xsl:value-of select="$attrval"/>
            </xsl:when>
            <xsl:when test="contains($fg_colorizer,$attrval)">
               <xsl:value-of select="substring-before(substring-after($fg_colorizer,concat($attrval,'=')),';')"/>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:choose>
            <xsl:when test="$attrval='transparent'">
               <xsl:call-template name="set-property">
                  <xsl:with-param name="prop-name" select="'visibility'"/>
                  <xsl:with-param name="prop-value" select="'hidden'"/>
               </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
               <xsl:call-template name="set-property">
                  <xsl:with-param name="prop-name" select="$fontattr"/>
                  <xsl:with-param name="prop-value" select="$replval"/>
               </xsl:call-template>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-backcolor">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval=''"/>
            <xsl:when test="starts-with($attrval,'#')">
               <xsl:value-of select="$attrval"/>
            </xsl:when>
            <xsl:when test="$attrval='transparent'">transparent</xsl:when>
            <xsl:when test="contains($bg_colorizer,$attrval)">
               <xsl:value-of select="substring-before(substring-after($bg_colorizer,concat($attrval,'=')),';')"/>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-scorespaces">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='yes'">true</xsl:when>
            <xsl:when test="$attrval='no'">false</xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-allcaps">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='yes'">uppercase</xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-smallcaps">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='yes'">small-caps</xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-text-decoration">
      <xsl:param name="underline"/>
      <xsl:param name="strikethru"/>
      <xsl:param name="fontattr">text-decoration</xsl:param>
      <xsl:if test="concat($underline,$strikethru) != ''">
         <xsl:variable name="replval">
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
         </xsl:variable>
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-underline">
      <xsl:param name="attrval"/>
      <xsl:choose>
         <xsl:when test="$attrval='yes'">underline</xsl:when>
         <xsl:otherwise/>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="gte-font-strikethru">
      <xsl:param name="attrval"/>
      <xsl:choose>
         <xsl:when test="$attrval='yes'">line-through</xsl:when>
         <xsl:otherwise/>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="_gte:MetaElement|_gte:MetaName|_gte:MetaValue" mode="expand-gentext">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="_gte:MetaElement"><!-- Delete this element during last pass --></xsl:template>

   <xsl:template match="_gte:PageNumberReference">
      <fo:page-number-citation>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'ref-id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
         </xsl:call-template>
      </fo:page-number-citation>
   </xsl:template>

   <xsl:template match="_gte:FormattedPageNumber">
      <fo:page-number/>
   </xsl:template>

   <xsl:template match="_gte:Expanded-Static-Content"/>
   <xsl:template match="_gte:Expanded-Static-Content" mode="expand-gentext">
      <xsl:copy>
         <xsl:apply-templates mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Special no-op template for Context: fo:marker//_sfe:HeaderOrFooter-->
   <xsl:template match="fo:marker//_sfe:HeaderOrFooter" priority="999">
      <xsl:apply-templates/>
   </xsl:template>

   <!--Special passthru gentext template for Context: fo:marker//_sfe:HeaderOrFooter-->
   <xsl:template match="fo:marker//_sfe:HeaderOrFooter" mode="expand-gentext" priority="999">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Special "ignore" template for Context: _sfe:HeaderOrFooter//fo:marker-->
   <xsl:template match="_sfe:HeaderOrFooter//fo:marker" priority="999"/>

   <!--Special "toss" gentext template for Context: _sfe:HeaderOrFooter//fo:marker-->
   <xsl:template match="_sfe:HeaderOrFooter//fo:marker" mode="expand-gentext" priority="999"/>

   <!--Special "toss" gentext templates for footnotes within fo:marker and when generating bookmarks-->
<xsl:template match="fo:marker//footnote" mode="expand-gentext" priority="999"/>
   <xsl:template match="footnote" mode="eval-bookmark-mode" priority="999"/>
   <xsl:template match="fo:marker//footnoteref" mode="expand-gentext" priority="999"/>
   <xsl:template match="footnoteref" mode="eval-bookmark-mode" priority="999"/>

   <xsl:template match="fo:marker//processing-instruction('Pub')[starts-with(., '_font') or starts-with(., '/_font')]"
                 priority="4"/>
   <xsl:template match="fo:marker//processing-instruction('Pub')[starts-with(., '_newline') or starts-with(., '_newcolumn') or starts-with(., '_newpage')]"
                 priority="4"/>
   <xsl:template match="fo:marker//processing-instruction('Pub')[starts-with(., '_nolinebreak') or starts-with(., '/_nolinebreak')]"
                 priority="4"/>

   <xsl:template match="fo:*|atixslfoext:*">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates/>
      </xsl:copy>
   </xsl:template>

<xsl:template name="gte-font-offset">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:if test="$attrval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$attrval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gte-font-keepline">
      <xsl:param name="attrval"/>
      <xsl:param name="fontattr"/>
      <xsl:variable name="replval">
         <xsl:choose>
            <xsl:when test="$attrval='yes'">always</xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
      </xsl:variable>
      <xsl:if test="$replval!=''">
         <xsl:call-template name="set-property">
            <xsl:with-param name="prop-name" select="$fontattr"/>
            <xsl:with-param name="prop-value" select="$replval"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   
   <!--Fallback Template for unstyled document element-->
<!--<xsl:template match="/*" priority="-0.1">
      <fo:page-sequence role="[unstyled-document]">
         <xsl:attribute name="master-reference">.fallback-pagemaster</xsl:attribute>
         <xsl:attribute name="format">1</xsl:attribute>
         <xsl:attribute name="initial-page-number">auto</xsl:attribute>
         <fo:flow flow-name="xsl-region-body">
            <fo:block>
               <xsl:apply-templates/>
            </fo:block>
         </fo:flow>
      </fo:page-sequence>
   </xsl:template>-->

   <xsl:template name="emit-fo-declarations">
      <fo:declarations>
         <atixslfoext:fosi-passthru>&lt;e-i-c gi="_sfe:Index" occur="all"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0"&gt;&lt;textbrk startln="1" endln="1"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexAlphaGroup_Main_Index" occur="all"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0"&gt;&lt;presp priority="med" nominal="1.5pc" minimum="1.2pc" maximum="1.80pc"&gt;&lt;textbrk startln="1" endln="1"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexEndPage_Main_Index" occur="all"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0"&gt;&lt;savetext textid="beforetext" lang="en" deflang="1" conrule="!&amp;lt;_sfe:BeforeOrAfterText&gt;–&amp;lt;/_sfe:BeforeOrAfterText&gt;!" placemnt="before"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;charsubset&gt;&lt;usetext source="beforetext" placemnt="before"&gt;&lt;/usetext&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexEntry_Main_Index" context="_sfe:IndexEntry_Main_Index _sfe:IndexEntry_Main_Index _sfe:IndexEntry_Main_Index" occur="middle" selector="_sfe:IndexEntry_Main_Index/_sfe:IndexEntry_Main_Index/_sfe:IndexEntry_Main_Index/_sfe:IndexEntry_Main_Index[position()&gt;1 and not(position()=last())]"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0" firstln="*-.5em" leftind="@1em"&gt;&lt;quadding quad="left"&gt;&lt;textbrk startln="1" endln="1"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexEntry_Main_Index" context="_sfe:IndexEntry_Main_Index _sfe:IndexEntry_Main_Index _sfe:IndexEntry_Main_Index" occur="all" selector="_sfe:IndexEntry_Main_Index/_sfe:IndexEntry_Main_Index/_sfe:IndexEntry_Main_Index/_sfe:IndexEntry_Main_Index"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0" firstln="*-.5em" leftind="@1em"&gt;&lt;quadding quad="left"&gt;&lt;textbrk startln="1" endln="1"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;specval attloc="system-var" attval="#ANY" attname="PRINT-ONLY"&gt;&lt;charsubset&gt;&lt;indent inherit="0"&gt;&lt;keeps prev="4"&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexEntry_Main_Index" context="_sfe:IndexEntry_Main_Index _sfe:IndexEntry_Main_Index" occur="middle" selector="_sfe:IndexEntry_Main_Index/_sfe:IndexEntry_Main_Index/_sfe:IndexEntry_Main_Index[position()&gt;1 and not(position()=last())]"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0" firstln="*-.5em" leftind="@1em"&gt;&lt;quadding quad="left"&gt;&lt;textbrk startln="1" endln="1"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexEntry_Main_Index" context="_sfe:IndexEntry_Main_Index _sfe:IndexEntry_Main_Index" occur="all" selector="_sfe:IndexEntry_Main_Index/_sfe:IndexEntry_Main_Index/_sfe:IndexEntry_Main_Index"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0" firstln="*-.5em" leftind="@1em"&gt;&lt;quadding quad="left"&gt;&lt;textbrk startln="1" endln="1"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;specval attloc="system-var" attval="#ANY" attname="PRINT-ONLY"&gt;&lt;charsubset&gt;&lt;indent inherit="0"&gt;&lt;keeps prev="3"&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexEntry_Main_Index" context="_sfe:IndexEntry_Main_Index" occur="middle" selector="_sfe:IndexEntry_Main_Index/_sfe:IndexEntry_Main_Index[position()&gt;1 and not(position()=last())]"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0" firstln="*-.5em" leftind="@1em"&gt;&lt;quadding quad="left"&gt;&lt;presp minimum="0pt" maximum=".5pt"&gt;&lt;textbrk startln="1" endln="1"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexEntry_Main_Index" context="_sfe:IndexEntry_Main_Index" occur="all" selector="_sfe:IndexEntry_Main_Index/_sfe:IndexEntry_Main_Index"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0" firstln="*-.5em" leftind="@1em"&gt;&lt;quadding quad="left"&gt;&lt;presp minimum="0pt" maximum=".5pt"&gt;&lt;textbrk startln="1" endln="1"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;specval attloc="system-var" attval="#ANY" attname="PRINT-ONLY"&gt;&lt;charsubset&gt;&lt;indent inherit="0"&gt;&lt;keeps prev="2"&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexEntry_Main_Index" occur="middle" selector="_sfe:IndexEntry_Main_Index[position()&gt;1 and not(position()=last())]"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0" firstln="*-.5em" leftind=".5em" rightind="@2pc"&gt;&lt;quadding quad="left"&gt;&lt;presp minimum="0pt" maximum="1pt"&gt;&lt;textbrk startln="1" endln="1"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexEntry_Main_Index" occur="all"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0" firstln="*-.5em" leftind=".5em" rightind="@2pc"&gt;&lt;quadding quad="left"&gt;&lt;presp minimum="0pt" maximum="1pt"&gt;&lt;textbrk startln="1" endln="1"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;specval attloc="system-var" attval="#ANY" attname="PRINT-ONLY"&gt;&lt;charsubset&gt;&lt;indent inherit="0"&gt;&lt;keeps prev="1"&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexGroupHead_Main_Index" occur="all"&gt;&lt;charlist inherit="1"&gt;&lt;font weight="bold" size="20pt" style="sanserif" famname=""&gt;&lt;indent inherit="0"&gt;&lt;quadding quad="left"&gt;&lt;highlt allcap="1"&gt;&lt;postsp priority="med" nominal=".5pc" minimum=".3pc"&gt;&lt;keeps next="7"&gt;&lt;textbrk startln="1" endln="1"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexHeading_Main_Index" occur="all"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0"&gt;&lt;keeps scope="line"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexLocators_Main_Index" occur="all"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0"&gt;&lt;savetext textid="beforetext" lang="en" deflang="1" conrule="!&amp;lt;_sfe:BeforeOrAfterText&gt;&amp;lt;_leaders leaderType=&amp;#x22;dots&amp;#x22; lenType=&amp;#x22;fit&amp;#x22; minLen=&amp;#x22;3pc&amp;#x22; leaderSpacing=&amp;#x22;3pt&amp;#x22;  /&gt;&amp;lt;/_sfe:BeforeOrAfterText&gt;!" placemnt="before"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;charsubset&gt;&lt;usetext source="beforetext" placemnt="before"&gt;&lt;/usetext&gt;&lt;usetext source="-2pc" placemnt="after"&gt;&lt;/usetext&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexPage_Main_Index" occur="notfirst" selector="_sfe:IndexPage_Main_Index[position()&gt;1]"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0"&gt;&lt;savetext textid="beforetext" lang="en" deflang="1" conrule="!&amp;lt;_sfe:BeforeOrAfterText&gt;, &amp;lt;/_sfe:BeforeOrAfterText&gt;!" placemnt="before"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;charsubset&gt;&lt;usetext source="beforetext" placemnt="before"&gt;&lt;/usetext&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexPage_Main_Index" occur="all"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexPostGroup_Main_Index" occur="all"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0"&gt;&lt;presp priority="med" nominal="1.5pc" minimum="1.2pc" maximum="1.6pc"&gt;&lt;textbrk startln="1" endln="1"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexPreGroup_Main_Index" occur="all"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0"&gt;&lt;presp priority="med" nominal="1.5pc" minimum="1.2pc" maximum="1.6pc"&gt;&lt;textbrk startln="1" endln="1"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexRangeGroup_Main_Index" occur="all"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0"&gt;&lt;presp priority="med" nominal="1.5pc" minimum="1.2pc" maximum="1.6pc"&gt;&lt;textbrk startln="1" endln="1"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexSeeAlso_Main_Index" occur="all"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0" firstln="*-1.5em" leftind="@3em"&gt;&lt;textbrk startln="1" endln="1"&gt;&lt;savetext textid="beforetext" lang="en" deflang="1" conrule="!&amp;lt;_sfe:BeforeOrAfterText&gt;&amp;lt;_font Posture=&amp;#x22;italic&amp;#x22;  &gt;See also &amp;lt;/_font&gt;&amp;lt;/_sfe:BeforeOrAfterText&gt;!" placemnt="before"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;charsubset&gt;&lt;usetext source="beforetext" placemnt="before"&gt;&lt;/usetext&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexSee_Main_Index" occur="all"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0"&gt;&lt;savetext textid="beforetext" lang="en" deflang="1" conrule="!&amp;lt;_sfe:BeforeOrAfterText&gt;, &amp;lt;_font Posture=&amp;#x22;italic&amp;#x22;  &gt;See &amp;lt;/_font&gt;&amp;lt;/_sfe:BeforeOrAfterText&gt;!" placemnt="before"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;charsubset&gt;&lt;usetext source="beforetext" placemnt="before"&gt;&lt;/usetext&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:IndexSubGroupHead_Main_Index" occur="all"&gt;&lt;charlist inherit="1"&gt;&lt;font weight="bold" size="14pt"&gt;&lt;indent inherit="0"&gt;&lt;quadding quad="left"&gt;&lt;highlt allcap="1"&gt;&lt;presp priority="high" nominal="2pc" minimum="2pc" maximum="2pc"&gt;&lt;keeps next="7"&gt;&lt;textbrk startln="1" endln="1"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;&lt;e-i-c gi="_sfe:Index_Main_Index" occur="all"&gt;&lt;charlist inherit="1"&gt;&lt;indent inherit="0"&gt;&lt;textbrk startln="1" endln="1"&gt;&lt;/charlist&gt;&lt;att&gt;&lt;specval attname="gentext-only" attloc="system-var" attval="#ANY"&gt;&lt;specval attname="_styleexportfosi::reset_counters_seen" attloc="system-func" attval="1"&gt;&lt;charsubset&gt;&lt;/charsubset&gt;&lt;/att&gt;&lt;/e-i-c&gt;</atixslfoext:fosi-passthru>
         <atixslfoext:language language="breakWithoutHyphen" break-after-characters="\/-=_"/>
      </fo:declarations>
   </xsl:template>


   <xsl:template match="*" mode="bookmark-mode">
      <xsl:apply-templates mode="bookmark-mode"/>
   </xsl:template>

   <xsl:template match="text()|processing-instruction()|comment()" mode="bookmark-mode"/>

   <xsl:template match="fo:leader" mode="eval-bookmark-mode">
      <xsl:text> </xsl:text>
   </xsl:template>

   <xsl:template match="fo:marker" mode="eval-bookmark-mode"><!--Toss fo:marker in eval-bookmark-mode--></xsl:template>

   <xsl:template match="text()" mode="eval-bookmark-mode">
      <xsl:copy/>
   </xsl:template>

   <xsl:template match="*" mode="eval-bookmark-mode">
      <xsl:apply-templates mode="eval-bookmark-mode"/>
   </xsl:template>

   <xsl:template match="_sfe:BeforeOrAfterText" mode="eval-bookmark-mode" priority="100">
      <xsl:param name="skip-expanded-gentext" select="'yes'"/>
      <xsl:choose>
         <xsl:when test="$skip-expanded-gentext='yes'"/>
         <xsl:otherwise>
            <xsl:apply-templates select="node()" mode="eval-bookmark-mode"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <!--Template for Context: atidlm:target-->
<xsl:template match="atidlm:target" priority="0">
      <fo:wrapper role="tag:atidlm:target">
         <xsl:call-template name="disinherit..indents"/>
         <xsl:if test="@lang">
            <xsl:attribute name="atixslfoext:xml-lang">
               <xsl:call-template name="return-lang-applying-language-map">
                  <xsl:with-param name="doclang" select="@lang"/>
               </xsl:call-template>
            </xsl:attribute>
         </xsl:if>
         <xsl:call-template name="maybe-set-id"/>
         <!--Process this element's content--><xsl:apply-templates/>
      </fo:wrapper>
   </xsl:template>

   <!--Gentext template for Context: atidlm:target-->
<xsl:template match="atidlm:target" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@*|node()" mode="expand-gentext"/>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: atidlm:target-->
<xsl:template match="atidlm:target" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: atidlm:target-->
<xsl:template match="atidlm:target" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>

   <!--Gentext template for Context: xref-->
<xsl:template match="xref" mode="expand-gentext" priority="0">
      <xsl:copy>
         <xsl:attribute name="_gte:Gentext-Expanded">y</xsl:attribute>
         <xsl:apply-templates select="@*" mode="expand-gentext"/>
         <xsl:if test="not(@_gte:id)">
            <xsl:attribute name="_gte:id">
               <xsl:value-of select="'_g_'"/>
               <xsl:value-of select="generate-id(.)"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="* | text() | processing-instruction()" mode="expand-gentext"/>
         <!--Unconditional AddAfter--><xsl:if test="not(@_gte:Gentext-Expanded)">
            <_gte:Must-Expand-Gentext/>
            <_sfe:BeforeOrAfterText>
               <_sfe:CrossReference>
                  <xsl:variable name="division-name-token-list"> abstract appendix article bibliodiv bibliography blockquote book caution chapter dedication equation example figure formalpara glossary glossdiv important index itemizedlist legalnotice note orderedlist part partintro preface procedure refentry reference refsect1 refsect2 refsect3 refsynopsisdiv sect1 sect2 sect3 sect4 sect5 section set setindex sidebar simplelist simplesect substeps table tip variablelist warning </xsl:variable>
                  <xsl:variable name="refed-id" select="@linkend"/>
                  <xsl:variable name="idrefed-element-name"
                                select="concat(' ',name((//*[@_gte:id=$refed-id])[1]),' ')"/>
                  <_gte:Link linkRef="{@linkend}">
                     <xsl:choose>
                        <xsl:when test="contains($division-name-token-list,$idrefed-element-name)">
                           <_gte:Must-Expand-Gentext/>
                           <_gte:deferredCrossReference xrefStyle="Label_Number_Text" refed-id="{@linkend}"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:apply-templates select="(//*[@_gte:id=$refed-id])[1]" mode="styler_xref-Label_Number_Text"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </_gte:Link>
               </_sfe:CrossReference>
            </_sfe:BeforeOrAfterText>
         </xsl:if>
      </xsl:copy>
   </xsl:template>

   <!--Initial pass template for Context: xref-->
<xsl:template match="xref" mode="initial-pass-mode" priority="0">
      <xsl:copy>
         <xsl:call-template name="maybe-set-gte-id"/>
         <xsl:apply-templates select="@*|node()" mode="initial-pass-mode"/>
      </xsl:copy>
   </xsl:template>

   <!--Set count-as pass template for Context: xref-->
<xsl:template match="xref" mode="set-countas" priority="0">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="set-countas"/>
      </xsl:copy>
   </xsl:template>


   <!--Global ReferenceFormat template for referenceFormatName=Label_Number_Text_Page-->
<xsl:template match="*" mode="styler_xref-Label_Number_Text_Page">
      <_gte:Must-Expand-Gentext/>
      <xsl:apply-templates mode="styler-LabelAndNumberMarker" select="."/>
      <xsl:text> </xsl:text>
      <_sfe:CrossReferenceTitle>
         <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
            <_gte:Gentexted-Content-Wrapper>
               <xsl:apply-templates mode="expand-gentext">
                  <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
               </xsl:apply-templates>
            </_gte:Gentexted-Content-Wrapper>
         </xsl:if>
      </_sfe:CrossReferenceTitle>
      <xsl:text>, page </xsl:text>
      <fo:page-number-citation>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'ref-id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="check-for-real-id-attr" select="'yes'"/>
         </xsl:call-template>
      </fo:page-number-citation>
   </xsl:template>

   <!--Global ReferenceFormat template for referenceFormatName=Number-->
<xsl:template match="*" mode="styler_xref-Number">
      <_gte:Must-Expand-Gentext/>
      <_gte:styler_numbering do-qmark="no">
         <xsl:variable name="gte_id">
            <xsl:choose>
               <xsl:when test="@_gte:id">
                  <xsl:value-of select="@_gte:id"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="'_g_'"/>
                  <xsl:value-of select="generate-id(.)"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:attribute name="gte_id">
            <xsl:value-of select="$gte_id"/>
         </xsl:attribute>
      </_gte:styler_numbering>
   </xsl:template>

   <!--Global ReferenceFormat template for referenceFormatName=Number_Text-->
<xsl:template match="*" mode="styler_xref-Number_Text">
      <_gte:Must-Expand-Gentext/>
      <_gte:styler_numbering do-qmark="no">
         <xsl:variable name="gte_id">
            <xsl:choose>
               <xsl:when test="@_gte:id">
                  <xsl:value-of select="@_gte:id"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="'_g_'"/>
                  <xsl:value-of select="generate-id(.)"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:attribute name="gte_id">
            <xsl:value-of select="$gte_id"/>
         </xsl:attribute>
      </_gte:styler_numbering>
      <xsl:text> </xsl:text>
      <_sfe:CrossReferenceTitle>
         <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
            <_gte:Gentexted-Content-Wrapper>
               <xsl:apply-templates mode="expand-gentext">
                  <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
               </xsl:apply-templates>
            </_gte:Gentexted-Content-Wrapper>
         </xsl:if>
      </_sfe:CrossReferenceTitle>
   </xsl:template>

   <!--Global ReferenceFormat template for referenceFormatName=Page-->
<xsl:template match="*" mode="styler_xref-Page">
      <_gte:Must-Expand-Gentext/>
      <fo:page-number-citation>
         <xsl:call-template name="maybe-set-id">
            <xsl:with-param name="attrname" select="'ref-id'"/>
            <xsl:with-param name="only-if-id-attr" select="'no'"/>
            <xsl:with-param name="generated-id-prefix" select="'styler-id'"/>
            <xsl:with-param name="check-for-real-id-attr" select="'yes'"/>
         </xsl:call-template>
      </fo:page-number-citation>
   </xsl:template>

   <!--Global ReferenceFormat template for referenceFormatName=Text-->
<xsl:template match="*" mode="styler_xref-Text">
      <_gte:Must-Expand-Gentext/>
      <_sfe:CrossReferenceTitle>
         <xsl:if test="node()[not(self::_sfe:BeforeOrAfterText)]">
            <_gte:Gentexted-Content-Wrapper>
               <xsl:apply-templates mode="expand-gentext">
                  <xsl:with-param name="skip-expanded-gentext" select="'yes'"/>
               </xsl:apply-templates>
            </_gte:Gentexted-Content-Wrapper>
         </xsl:if>
      </_sfe:CrossReferenceTitle>
   </xsl:template>

   <!--Deferred templates for Index=Main_Index-->
<xsl:template mode="expand-gentext" match="_gte:doIndex-Main_Index">
      <xsl:apply-templates select="ancestor::_sfe:Index[1]//indexterm" mode="index-mode-Main_Index"/>
   </xsl:template>
   <xsl:template mode="expand-gentext" match="_gte:deferCollectIndex-Main_Index">
      <_gte:collectIndex-Main_Index/>
      <_gte:Must-Expand-Gentext/>
   </xsl:template>
   <xsl:template mode="expand-gentext" match="_gte:collectIndex-Main_Index">
      <xsl:copy-of select="//indexterm[not(ancestor::_sfe:Index)][not(ancestor::indexterm)]"/>
      <_gte:doIndex-Main_Index/>
      <_gte:Must-Expand-Gentext/>
   </xsl:template>

  <xsl:template match="*" mode="styler-LabelAndNumberMarker"/>

   <xsl:template match="*" mode="startat-xpath"><!-- This will evaluate to NaN which will cause no numbering offset -->
<xsl:value-of select="number('no-startAtXPath')"/>
   </xsl:template>

   <xsl:template match="*" mode="styler_numbering">
      <xsl:param name="do-qmark" select="'yes'"/>
      <xsl:if test="$do-qmark='yes'">
         <xsl:value-of select="'?'"/>
      </xsl:if>
   </xsl:template>

   <!-- This is an "atitag" (aka formatting PI), pass it through -->
<xsl:template match="*[starts-with(local-name(.),'_')]" priority="-0.9">
      <xsl:element name="{name(.)}">
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>

   <xsl:template xmlns:atievent="http://www.arbortext.com/namespace/AtiSaxEvents"
                 match="atievent:*">
      <xsl:element name="{name(.)}">
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="*" priority="-1">
      <xsl:call-template name="emit-unstyled-template-content"/>
   </xsl:template>


   <!--Pass through PI's controlling output escaping to enable ATI Math handling-->
<xsl:template match="processing-instruction('javax.xml.transform.disable-output-escaping')">
      <xsl:copy-of select="."/>
   </xsl:template>
   <xsl:template match="processing-instruction('javax.xml.transform.enable-output-escaping')">
      <xsl:copy-of select="."/>
   </xsl:template>	

	<xsl:include href="cstyle-v6_0/param-variable-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/attribute-set-v6_0.xsl"/>
<!--		<xsl:include href="cstyle-v6_0/param.xsl"/> <xsl:include href="cstyle-v6_0/VERSION.xsl"/>
<xsl:output method="xml" omit-xml-declaration="no" encoding="UTF-8" doctype-public="" indent="yes" doctype-system=""/>-->
	<xsl:param name="body.fontset" as="xs:string">
  <xsl:variable name="fontlist" as="xs:string+">
    <xsl:value-of select="$body.font.family"/>
    <xsl:if test="$symbol.font.family != ''">
      <xsl:value-of select="$symbol.font.family"/>
    </xsl:if>
  </xsl:variable>
  <xsl:value-of select="$fontlist" separator=","/>
</xsl:param>
	<xsl:strip-space elements="*"/>
	<xsl:template match="/">
		<fo:root id="{generate-id(/)}">
			<fo:layout-master-set>
	<!-- Landscape logbook binding on top -->
				<!--
SIMPLE PAGE MASTER Front/Rear Roman Lower
-->
	<fo:simple-page-master margin-bottom=".25in" margin-left=".5in" margin-right=".5in" margin-top=".75in" master-name="frntrear-rl-firstpage" page-height="6.5in" page-width="9.5in">
		<fo:region-body>
			<xsl:attribute name="margin-top"><xsl:value-of select="number($SecurHeaderFooterSize)+58"/>pt</xsl:attribute>
			<xsl:attribute name="margin-bottom"><xsl:value-of select="number($SecurHeaderFooterSize)+30"/>pt</xsl:attribute>
		</fo:region-body>
		<fo:region-before display-align="before" region-name="frntrear-rl-first-before">
			<xsl:attribute name="extent"><xsl:value-of select="number($SecurHeaderFooterSize)+58"/>pt</xsl:attribute>
		</fo:region-before>
		<fo:region-after display-align="after" region-name="frntrear-rl-first-after">
			<xsl:attribute name="extent"><xsl:value-of select="number($SecurHeaderFooterSize)+30"/>pt</xsl:attribute>
		</fo:region-after>
	</fo:simple-page-master>
	<fo:simple-page-master margin-bottom=".25in" margin-left=".5in" margin-right=".5in" margin-top=".75in" master-name="frntrear-rl-odd" page-height="6.5in" page-width="9.5in">
		<fo:region-body>
			<xsl:attribute name="margin-top"><xsl:value-of select="number($SecurHeaderFooterSize)+58"/>pt</xsl:attribute>
			<xsl:attribute name="margin-bottom"><xsl:value-of select="number($SecurHeaderFooterSize)+30"/>pt</xsl:attribute>
		</fo:region-body>
		<fo:region-before display-align="before" region-name="xsl-region-before">
			<xsl:attribute name="extent"><xsl:value-of select="number($SecurHeaderFooterSize)+58"/>pt</xsl:attribute>
		</fo:region-before>
		<fo:region-after display-align="after" region-name="xsl-region-after">
			<xsl:attribute name="extent"><xsl:value-of select="number($SecurHeaderFooterSize)+30"/>pt</xsl:attribute>
		</fo:region-after>
	</fo:simple-page-master>
	<fo:simple-page-master margin-bottom=".75in" margin-left=".5in" margin-right=".5in" margin-top=".25in" master-name="frntrear-rl-even" page-height="6.5in" page-width="9.5in">
		<fo:region-body>
			<xsl:attribute name="margin-top"><xsl:value-of select="number($SecurHeaderFooterSize)+58"/>pt</xsl:attribute>
			<xsl:attribute name="margin-bottom"><xsl:value-of select="number($SecurHeaderFooterSize)+30"/>pt</xsl:attribute>
		</fo:region-body>
		<fo:region-before display-align="before" region-name="xsl-region-before">
			<xsl:attribute name="extent"><xsl:value-of select="number($SecurHeaderFooterSize)+58"/>pt</xsl:attribute>
		</fo:region-before>
		<fo:region-after display-align="after" region-name="xsl-region-after">
			<xsl:attribute name="extent"><xsl:value-of select="number($SecurHeaderFooterSize)+30"/>pt</xsl:attribute>
		</fo:region-after>
	</fo:simple-page-master>
				<!--
SIMPLE PAGE MASTER Chapter Title Page
-->
	<fo:simple-page-master margin-bottom=".25in" margin-left=".5in" margin-right=".5in" margin-top=".75in" master-name="imtitlepg-odd" page-height="6.5in" page-width="9.5in">
		<fo:region-body column-count="2" column-gap="0.2in" margin-bottom="2pc" margin-top="2pc" padding-after="1.5pc" padding-before="1.5pc"/>
		<fo:region-before extent="2pc" region-name="imtitlepg-before"/>
		<fo:region-after extent="2pc" padding-top="1.5pc" region-name="xsl-region-after"/>
	</fo:simple-page-master>
	<fo:simple-page-master margin-bottom=".75in" margin-left=".5in" margin-right=".5in" margin-top=".25in" master-name="imtitlepg-even" page-height="6.5in" page-width="9.5in">
		<fo:region-body column-count="2" column-gap="0.2in" margin-bottom="2pc" margin-top="2pc" padding-after="1.5pc" padding-before="1.5pc"/>
		<fo:region-before extent="2pc" region-name="xsl-region-before"/>
		<fo:region-after extent="2pc" padding-top="1.5pc" region-name="xsl-region-after"/>
	</fo:simple-page-master>
	<fo:simple-page-master margin-bottom=".25in" margin-left=".5in" margin-right=".5in" margin-top=".75in" master-name="chap-toc-odd" page-height="6.5in" page-width="9.5in">
		<fo:region-body margin-bottom="2pc" margin-top="2pc" padding-after="1.5pc" padding-before="1.5pc"/>
		<fo:region-before extent="2pc" region-name="chap-toc-before"/>
		<fo:region-after extent="2pc" padding-top="1.5pc" region-name="chap-toc-after"/>
	</fo:simple-page-master>
	<fo:simple-page-master margin-bottom=".75in" margin-left=".5in" margin-right=".5in" margin-top=".25in" master-name="chap-toc-even" page-height="6.5in" page-width="9.5in">
		<fo:region-body margin-bottom="2pc" margin-top="2pc" padding-after="1.5pc" padding-before="1.5pc"/>
		<fo:region-before extent="2pc" region-name="chap-toc-before"/>
		<fo:region-after extent="2pc" padding-top="1.5pc" region-name="chap-toc-after"/>
	</fo:simple-page-master>
				<!--
SIMPLE PAGE MASTER Work Packages-->
	<fo:simple-page-master margin-bottom=".25in" margin-left=".5in" margin-right=".5in" margin-top=".75in" master-name="impg-odd-first" page-height="6.5in" page-width="9.5in">
		<fo:region-body column-count="2" column-gap="0.2in" margin-bottom="2pc" margin-top="3pc" padding-after="1.0pc" padding-before="1.0pc"/>
		<fo:region-before extent="3pc" region-name="impg-before"/>
		<fo:region-after extent="2pc" padding-top="1.5pc" region-name="xsl-region-after-odd"/>
	</fo:simple-page-master>
	<fo:simple-page-master margin-bottom=".75in" margin-left=".5in" margin-right=".5in" margin-top=".25in" master-name="impg-even" page-height="6.5in" page-width="9.5in">
		<fo:region-body column-count="2" column-gap="0.2in" margin-bottom="2pc" margin-top="3pc" padding-after="1.0pc" padding-before="1.0pc"/>
		<fo:region-before extent="3pc" padding-after="1.5pc" region-name="xsl-region-before-even"/>
		<fo:region-after extent="2pc" padding-top="1.5pc" region-name="xsl-region-after-even"/>
	</fo:simple-page-master>
	<fo:simple-page-master margin-left=".5in" margin-right=".5in" margin-bottom=".25in" margin-top=".75in" master-name="impg-odd" page-height="6.5in" page-width="9.5in">
		<fo:region-body column-count="2" column-gap="0.2in" margin-bottom="2pc" margin-top="3pc" padding-after="1.0pc" padding-before="1.0pc"/>
		<fo:region-before extent="3pc" padding-after="1.5pc" region-name="xsl-region-before-odd"/>
		<fo:region-after extent="2pc" padding-top="1.5pc" region-name="xsl-region-after-odd"/>
	</fo:simple-page-master>


<fo:simple-page-master master-name="normal"
       page-height="6.5in" page-width="9.5in"
      margin-bottom=".25in" margin-top=".75in"
      margin-left=".5in" margin-right=".5in">
      <fo:region-body margin-bottom="2pc"/>
      <fo:region-after region-name="footer-normal" extent=".25in"/>
    </fo:simple-page-master>
    <fo:simple-page-master master-name="blank"
       page-height="6.5in" page-width="9.5in"
      margin-bottom=".25in" margin-top=".75in"
      margin-left=".5in" margin-right=".5in">
      <fo:region-body/>
      <fo:region-before region-name="header-blank" extent="6.5in"/>
    </fo:simple-page-master>
    <fo:page-sequence-master master-name="document">
      <fo:repeatable-page-master-alternatives>
        <fo:conditional-page-master-reference blank-or-not-blank="not-blank"
          master-reference="normal"/>
        <fo:conditional-page-master-reference blank-or-not-blank="blank"
          master-reference="blank"/>
      </fo:repeatable-page-master-alternatives>
    </fo:page-sequence-master>

<!--
SIMPLE PAGE MASTER Blank Pages
-->
	<fo:simple-page-master margin-bottom=".75in" margin-left=".5in" margin-right=".5in" margin-top=".25in" master-name="blank-page-even" page-height="6.5in" page-width="9.5in">
		<fo:region-body region-name="xsl-region-body-blank">
		</fo:region-body>
		<fo:region-after region-name="xsl-region-after-blank"/>
	</fo:simple-page-master>
	<fo:simple-page-master margin-bottom=".25in" margin-left=".5in" margin-right=".5in" margin-top=".75in" master-name="blank-page-odd" page-height="6.5in" page-width="9.5in">
		<fo:region-body region-name="xsl-region-body-blank">
		</fo:region-body>
		<fo:region-after region-name="xsl-region-after-blank"/>
	</fo:simple-page-master>
				<!--
SIMPLE PAGE MASTER LOEPWP
-->
				<xsl:variable name="LOEPWP-SuperSize">
					<xsl:choose>
						<xsl:when test="number($insert-change)+number($del-change)=0">60</xsl:when>
						<xsl:otherwise>60</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
	<fo:simple-page-master margin-bottom=".25in" margin-left=".5in" margin-right=".5in" margin-top=".75in" master-name="loepwppg-first" page-height="6.5in" page-width="9.5in">
					<fo:region-body column-count="2" column-gap="10pt"> 
						<xsl:attribute name="margin-top"><xsl:value-of select="number($SecurHeaderFooterSize)+number($LOEPWP-SuperSize)+12"/>pt</xsl:attribute>
						<xsl:attribute name="margin-bottom"><xsl:value-of select="number($SecurHeaderFooterSize)+65"/>pt</xsl:attribute>
					</fo:region-body>
					<fo:region-before display-align="after" region-name="loepwppg-first-before">
						<xsl:attribute name="extent"><xsl:value-of select="number($SecurHeaderFooterSize)+number($LOEPWP-SuperSize)+6"/>pt</xsl:attribute>
					</fo:region-before>
					<fo:region-after display-align="before" region-name="loepwppg-first-after">
						<xsl:attribute name="extent"><xsl:value-of select="number($SecurHeaderFooterSize)+47"/>pt</xsl:attribute>
					</fo:region-after>
				</fo:simple-page-master>
		<fo:simple-page-master margin-bottom=".25in" margin-left=".5in" margin-right=".5in" margin-top=".75in" master-name="loepwppg-recto" page-height="6.5in" page-width="9.5in">
					<fo:region-body column-count="2" column-gap="10pt" margin-bottom="3.5pc" margin-top="0pc">
						<xsl:attribute name="margin-top"><xsl:value-of select="number($SecurHeaderFooterSize)+number($LOEPWP-SuperSize)+12"/>pt</xsl:attribute>
						<xsl:attribute name="margin-bottom"><xsl:value-of select="number($SecurHeaderFooterSize)+65"/>pt</xsl:attribute>
					</fo:region-body>
					<fo:region-before display-align="after" region-name="loepwppg-first-before">
						<xsl:attribute name="extent"><xsl:value-of select="number($SecurHeaderFooterSize)+number($LOEPWP-SuperSize)+6"/>pt</xsl:attribute>
					</fo:region-before>
					<fo:region-after display-align="before" region-name="loepwppg-first-after">
						<xsl:attribute name="extent"><xsl:value-of select="number($SecurHeaderFooterSize)+47"/>pt</xsl:attribute>
					</fo:region-after>
				</fo:simple-page-master>
	<fo:simple-page-master margin-bottom=".75in" margin-left=".5in" margin-right=".5in" margin-top=".25in" master-name="loepwppg-verso" page-height="6.5in" page-width="9.5in">
					<fo:region-body column-count="2" column-gap="10pt">
						<xsl:attribute name="margin-top"><xsl:value-of select="number($SecurHeaderFooterSize)+number($LOEPWP-SuperSize)+12"/>pt</xsl:attribute>
						<xsl:attribute name="margin-bottom"><xsl:value-of select="number($SecurHeaderFooterSize)+65"/>pt</xsl:attribute>
					</fo:region-body>
					<fo:region-before display-align="after" region-name="loepwppg-first-before">
						<xsl:attribute name="extent"><xsl:value-of select="number($SecurHeaderFooterSize)+number($LOEPWP-SuperSize)+6"/>pt</xsl:attribute>
					</fo:region-before>
					<fo:region-after display-align="before" region-name="loepwppg-first-after">
						<xsl:attribute name="extent"><xsl:value-of select="number($SecurHeaderFooterSize)+47"/>pt</xsl:attribute>
					</fo:region-after>
				</fo:simple-page-master>
				<!-- 					
SIMPLE PAGE MASTER Cover
-->
	<fo:simple-page-master margin-bottom=".25in" margin-left=".5in" margin-right=".5in" margin-top=".75in" master-name="tmcoverpg-recto-first" page-height="6.5in" page-width="9.5in">
					<xsl:variable name="AvailSize">
						<xsl:choose>
							<xsl:when test="//frntcover/notices/avail">26</xsl:when>
							<xsl:when test="//frntcover_abbreviated/notices/avail">26</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="SuperSize">
						<xsl:choose>
							<xsl:when test="//frntcover/notices/super">26</xsl:when>
							<xsl:when test="//frntcover_abbreviated/notices/super">26</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="DistribSize">
						<xsl:choose>
							<xsl:when test="//frntcover/notices/dist">35</xsl:when>
							<xsl:when test="//frntcover_abbreviated/notices/dist">35</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="ExportSize">
						<xsl:choose>
							<xsl:when test="//frntcover/notices/export">26</xsl:when>
							<xsl:when test="//frntcover_abbreviated/notices/export">26</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="DestrSize">
						<xsl:choose>
							<xsl:when test="//frntcover/notices/destr">17</xsl:when>
							<xsl:when test="//frntcover_abbreviated/notices/destr">17</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="SecurSize">
						<xsl:choose>
							<xsl:when test="string-length($docsecr)>0">32</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="CoverFooterSize">
						<xsl:value-of select="number($AvailSize)+number($SuperSize)+number($DistribSize)+number($ExportSize)+number($DestrSize)+number($SecurSize)+160"/>pt</xsl:variable>
					<fo:region-body margin-top="0pt" margin-bottom="160pt">
						<!--xsl:attribute name="margin-bottom"><xsl:value-of select="$CoverFooterSize"/></xsl:attribute-->
					</fo:region-body>
					<fo:region-after display-align="after" region-name="tmcoverpg-first-after">
						<xsl:attribute name="extent"><xsl:value-of select="$CoverFooterSize"/></xsl:attribute>
					</fo:region-after>
				</fo:simple-page-master>
	<fo:simple-page-master margin-bottom=".25in" margin-left=".5in" margin-right=".5in" margin-top=".75in" master-name="tmcoverpg-recto" page-height="6.5in" page-width="9.5in">
		<fo:region-body margin-bottom="1.5pc" margin-top="3pc"/>
		<fo:region-after extent="1.5pc" region-name="xsl-region-after"/>
	</fo:simple-page-master>
	<fo:simple-page-master margin-bottom=".75in" margin-left=".5in" margin-right=".5in" margin-top=".25in" master-name="tmcoverpg-verso" page-height="6.5in" page-width="9.5in">
	<fo:region-body margin-bottom="1.5pc" margin-top="3pc"/>
		<fo:region-after extent="1.5pc" region-name="xsl-region-after"/>
	</fo:simple-page-master>
				<!--
SIMPLE PAGE MASTER Title Block
-->
	<fo:simple-page-master margin-bottom=".25in" margin-left=".5in" margin-right=".5in" margin-top=".75in" master-name="titleblkpg-recto-first" page-height="6.5in" page-width="9.5in">
					<!--xsl:variable name="AvailSize">
						<xsl:choose>
							<xsl:when test="//titleblk/notices/avail">8</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="SuperSize">
						<xsl:choose>
							<xsl:when test="//titleblk/notices/super">8</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="DisclosSize">
						<xsl:choose>
							<xsl:when test="//titleblk/notices/disclos">8</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="DistribSize">
						<xsl:choose>
							<xsl:when test="//titleblk/notices/dist">8</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="ExportSize">
						<xsl:choose>
							<xsl:when test="//titleblk/notices/export">8</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="DestrSize">
						<xsl:choose>
							<xsl:when test="//titleblk/notices/destr">8</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="SecurSize">
						<xsl:choose>
							<xsl:when test="string-length($docsecr)>0">8</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="CoverFooterSize">
						<xsl:value-of select="number($AvailSize)+number($SuperSize)+number($DisclosSize)+number($DistribSize)+number($ExportSize)+number($DestrSize)+number($SecurSize)+36"/>pt</xsl:variable>-->
					<fo:region-body margin-bottom="1.5pc" margin-top="3pc">
						<!--xsl:attribute name="margin-bottom"><xsl:value-of select="$CoverFooterSize"/></xsl:attribute-->
					</fo:region-body>
					<fo:region-after display-align="after" extent="1.5pc" region-name="titleblkpg-first-after">
						<!--xsl:attribute name="extent"><xsl:value-of select="$CoverFooterSize"/></xsl:attribute-->
					</fo:region-after>
				</fo:simple-page-master>
	<fo:simple-page-master margin-bottom=".25in" margin-left=".5in" margin-right=".5in" margin-top=".75in" master-name="titleblkpg-recto" page-height="6.5in" page-width="9.5in">
		<fo:region-body margin-bottom="1.5pc" margin-top="3pc"/>
		<fo:region-after extent="1.5pc" region-name="xsl-region-after"/>
	</fo:simple-page-master>
	<fo:simple-page-master margin-bottom=".75in" margin-left=".5in" margin-right=".5in" margin-top=".25in" master-name="titleblkpg-verso" page-height="6.5in" page-width="9.5in">
		<fo:region-body margin-bottom="1.5pc" margin-top="3pc"/>
		<fo:region-after extent="1.5pc" region-name="xsl-region-after"/>
	</fo:simple-page-master>
				<!--
PAGE SEQUENCE MASTER Front/Rear Roman Lower
-->
				<fo:page-sequence-master master-name="frntrear-rl">
					<fo:repeatable-page-master-alternatives>
						<fo:conditional-page-master-reference blank-or-not-blank="not-blank" master-reference="frntrear-rl-firstpage" odd-or-even="odd" page-position="first"/>
						<fo:conditional-page-master-reference blank-or-not-blank="not-blank" master-reference="frntrear-rl-odd" odd-or-even="odd" page-position="any"/>
						<fo:conditional-page-master-reference blank-or-not-blank="not-blank" master-reference="frntrear-rl-even" odd-or-even="even" page-position="any"/>
						<fo:conditional-page-master-reference blank-or-not-blank="blank" master-reference="blank-page-odd" odd-or-even="odd"/>
						<fo:conditional-page-master-reference blank-or-not-blank="blank" master-reference="blank-page-even" odd-or-even="even"/>
					</fo:repeatable-page-master-alternatives>
				</fo:page-sequence-master>
				<!--
PAGE SEQUENCE MASTER Chapter Title Page
-->
				<fo:page-sequence-master master-name="imtitlepg">
					<fo:repeatable-page-master-alternatives>
						<fo:conditional-page-master-reference blank-or-not-blank="not-blank" master-reference="imtitlepg-odd" odd-or-even="odd"/>
						<fo:conditional-page-master-reference blank-or-not-blank="not-blank" master-reference="imtitlepg-even" odd-or-even="even" page-position="any"/>
						<fo:conditional-page-master-reference blank-or-not-blank="not-blank" master-reference="chap-toc-odd" odd-or-even="odd" page-position="any"/>
						<fo:conditional-page-master-reference blank-or-not-blank="not-blank" master-reference="chap-toc-even" odd-or-even="even" page-position="any"/>
						<fo:conditional-page-master-reference blank-or-not-blank="blank" master-reference="blank-page-odd" odd-or-even="odd"/>
						<fo:conditional-page-master-reference blank-or-not-blank="blank" master-reference="blank-page-even" odd-or-even="even"/>
					</fo:repeatable-page-master-alternatives>
				</fo:page-sequence-master>
				<!--
PAGE SEQUENCE MASTER Work Package
-->
				<fo:page-sequence-master master-name="impg">
					<fo:repeatable-page-master-alternatives>
						<fo:conditional-page-master-reference blank-or-not-blank="not-blank" master-reference="impg-odd-first" odd-or-even="odd" page-position="first"/>
						<fo:conditional-page-master-reference blank-or-not-blank="not-blank" master-reference="impg-odd" odd-or-even="odd" page-position="rest"/>
						<fo:conditional-page-master-reference blank-or-not-blank="not-blank" master-reference="impg-even" odd-or-even="even" page-position="any"/>
						<fo:conditional-page-master-reference blank-or-not-blank="blank" master-reference="blank-page-even" odd-or-even="even" page-position="any"/>
					</fo:repeatable-page-master-alternatives>
				</fo:page-sequence-master>
				<!--
PAGE SEQUENCE MASTER Cover
-->
				<fo:page-sequence-master master-name="tmcoverpg">
					<fo:repeatable-page-master-alternatives>
						<fo:conditional-page-master-reference master-reference="tmcoverpg-recto-first" odd-or-even="odd" page-position="first"/>
						<fo:conditional-page-master-reference master-reference="tmcoverpg-recto" odd-or-even="odd"/>
						<fo:conditional-page-master-reference master-reference="tmcoverpg-verso" odd-or-even="even"/>
						<fo:conditional-page-master-reference blank-or-not-blank="blank" master-reference="blank-page-odd" odd-or-even="odd"/>
						<fo:conditional-page-master-reference blank-or-not-blank="blank" master-reference="blank-page-even" odd-or-even="even"/>
					</fo:repeatable-page-master-alternatives>
				</fo:page-sequence-master>
				<!--
PAGE SEQUENCE MASTER Applicable 
-->
				<fo:page-sequence-master master-name="applicpg">
					<fo:repeatable-page-master-alternatives>
						<fo:conditional-page-master-reference master-reference="applicpg-recto-first" odd-or-even="odd" page-position="first"/>
						<fo:conditional-page-master-reference master-reference="applicpg-recto" odd-or-even="odd"/>
						<fo:conditional-page-master-reference master-reference="applicpg-verso" odd-or-even="even"/>
						<fo:conditional-page-master-reference blank-or-not-blank="blank" master-reference="blank-page-odd" odd-or-even="odd"/>
						<fo:conditional-page-master-reference blank-or-not-blank="blank" master-reference="blank-page-even" odd-or-even="even"/>
					</fo:repeatable-page-master-alternatives>
				</fo:page-sequence-master>
				<!--
PAGE SEQUENCE MASTER Title Block
-->
				<fo:page-sequence-master master-name="titleblkpg">
					<fo:repeatable-page-master-alternatives>
						<fo:conditional-page-master-reference master-reference="titleblkpg-recto-first" odd-or-even="odd" page-position="first"/>
						<fo:conditional-page-master-reference master-reference="titleblkpg-recto" odd-or-even="odd"/>
						<fo:conditional-page-master-reference master-reference="titleblkpg-verso" odd-or-even="even"/>
						<fo:conditional-page-master-reference blank-or-not-blank="blank" master-reference="blank-page-odd" odd-or-even="odd"/>
						<fo:conditional-page-master-reference blank-or-not-blank="blank" master-reference="blank-page-even" odd-or-even="even"/>
					</fo:repeatable-page-master-alternatives>
				</fo:page-sequence-master>
				<!--
PAGE SEQUENCE MASTER LOEPWP
-->
				<fo:page-sequence-master master-name="loepwppg">
					<fo:repeatable-page-master-alternatives>
						<fo:conditional-page-master-reference master-reference="loepwppg-first" odd-or-even="odd" page-position="first"/>
						<fo:conditional-page-master-reference master-reference="loepwppg-recto" odd-or-even="odd"/>
						<fo:conditional-page-master-reference master-reference="loepwppg-verso" odd-or-even="even"/>
						<fo:conditional-page-master-reference blank-or-not-blank="blank" master-reference="blank-page-odd" odd-or-even="odd"/>
						<fo:conditional-page-master-reference blank-or-not-blank="blank" master-reference="blank-page-even" odd-or-even="even"/>
					</fo:repeatable-page-master-alternatives>
				</fo:page-sequence-master>

			</fo:layout-master-set>
			<xsl:apply-templates select="node()"/>
		</fo:root>
	</xsl:template>

	<xsl:template name="substring-after-last">
		<xsl:param name="str"/>
		<xsl:param name="delim" select="'/'"/>
		<xsl:value-of select="$str"/>
	</xsl:template>
	
	<xsl:include href="cstyle-v6_0/chapter_titlepg-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/contents-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/pageset-templ-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/common-templ-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/para-seqlist-step-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/alert-templ-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/table-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/chgsheet-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/distribution-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/pi-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/explistwp-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/frntcover-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/figure-graphic-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/loepwp-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/lubeorder-pageset-templ-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/mim-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/pm-ginfowp-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/pmi-cklistwp-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/pmiwp-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/pms-ginfowp-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/pms-inspecwp-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/rear-templ-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/titleblk-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/toolidwp-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/warnsum-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/wpidinfo-templ-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/initial_setup-templ-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/xrefs-v6_0.xsl"/>
	<xsl:include href="cstyle-v6_0/basicpara-v6_0.xsl"/>
	<xsl:template match="*">
		<xsl:apply-templates/>
	</xsl:template>
</xsl:stylesheet>
