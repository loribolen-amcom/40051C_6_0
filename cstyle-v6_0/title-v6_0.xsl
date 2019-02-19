<?xml version="1.0" encoding="utf-8"?>
<!-- Fragment document type declaration subset:
    Arbortext, Inc., 1988-2005, v.4002
    <!DOCTYPE xsl:stylesheet>
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template name="FLOAT-TITLE" xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name="FO-IDREF">
</xsl:param>
<xsl:param name="TaskTitle">
</xsl:param>
<xsl:param name="ProcTitle">
</xsl:param>
<xsl:param name="Sub1Title">
</xsl:param>
<xsl:param name="Sub2Title">
</xsl:param>
<xsl:param name="Sub3Title">
</xsl:param>
<xsl:choose>
<xsl:when test="string-length($ProcTitle)=0 and string-length($Sub1Title)=0 and string-length($Sub2Title)=0 and string-length($Sub3Title)=0">
<fo:block span="all" xsl:use-attribute-sets="tasktitlesub">
<xsl:copy-of select="$TaskTitle"/>
</fo:block>
</xsl:when>
<xsl:when test="string-length($Sub1Title)=0 and string-length($Sub2Title)=0 and string-length($Sub3Title)=0">
<fo:block span="all" xsl:use-attribute-sets="titlesub">
<xsl:if test="local-name(preceding-sibling::node()[1])='trim.para' or local-name(preceding-sibling::node()[1])='trim.specpara' or local-name(preceding-sibling::node()[1])='para' or local-name(preceding-sibling::node()[1])='specpara' or local-name(preceding-sibling::node()[1])='proc' or local-name(preceding-sibling::node()[1])='figure' or local-name(preceding-sibling::node()[1])='hazmat' or local-name(preceding-sibling::node()[1])='warning' or local-name(preceding-sibling::node()[1])='caution' or local-name(preceding-sibling::node()[1])='note' or local-name(parent::node())='proc'">
<xsl:attribute name="space-before.minimum">10pt</xsl:attribute>
<xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
<xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
</xsl:if>
<xsl:copy-of select="$ProcTitle"/>
</fo:block>
</xsl:when>
<xsl:when test="string-length($Sub2Title)=0 and string-length($Sub3Title)=0">
<fo:block span="all" xsl:use-attribute-sets="titlesub">
<xsl:if test="local-name(preceding-sibling::node()[1])='para' or local-name(preceding-sibling::node()[1])='specpara' or local-name(preceding-sibling::node()[1])='proc' or local-name(preceding-sibling::node()[1])='figure' or local-name(preceding-sibling::node()[1])='hazmat' or local-name(preceding-sibling::node()[1])='warning' or local-name(preceding-sibling::node()[1])='caution' or local-name(preceding-sibling::node()[1])='note'">
<xsl:attribute name="space-before.minimum">10pt</xsl:attribute>
<xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
<xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
</xsl:if>
<xsl:copy-of select="$Sub1Title"/>
</fo:block>
</xsl:when>
<xsl:when test="string-length($Sub3Title)=0">
<fo:block span="all" xsl:use-attribute-sets="titlesub">
<xsl:if test="local-name(preceding-sibling::node()[1])='para' or local-name(preceding-sibling::node()[1])='specpara' or local-name(preceding-sibling::node()[1])='proc' or local-name(preceding-sibling::node()[1])='figure' or local-name(preceding-sibling::node()[1])='hazmat' or local-name(preceding-sibling::node()[1])='warning' or local-name(preceding-sibling::node()[1])='caution' or local-name(preceding-sibling::node()[1])='note'">
<xsl:attribute name="space-before.minimum">10pt</xsl:attribute>
<xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
<xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
</xsl:if>
<xsl:copy-of select="$Sub2Title"/>
</fo:block>
</xsl:when>
<xsl:otherwise>
<fo:block span="all" xsl:use-attribute-sets="titlesub">
<xsl:if test="local-name(preceding-sibling::node()[1])='para' or local-name(preceding-sibling::node()[1])='specpara' or local-name(preceding-sibling::node()[1])='proc' or local-name(preceding-sibling::node()[1])='figure' or local-name(preceding-sibling::node()[1])='hazmat' or local-name(preceding-sibling::node()[1])='warning' or local-name(preceding-sibling::node()[1])='caution' or local-name(preceding-sibling::node()[1])='note'">
<xsl:attribute name="space-before.minimum">10pt</xsl:attribute>
<xsl:attribute name="space-before.optimum">12pt</xsl:attribute>
<xsl:attribute name="space-before.maximum">12pt</xsl:attribute>
</xsl:if>
<xsl:copy-of select="$Sub3Title"/>
</fo:block>
</xsl:otherwise>
</xsl:choose>
</xsl:template>
</xsl:stylesheet>