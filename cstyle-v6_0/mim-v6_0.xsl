<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="mim" >
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="pmcscategory | maintenancepmcscategory | maintenancecategory | depotcategory | aviationcategory | 
          ammunitioncategory | auxiliarycategory | pmscategory | checklistcategory | testinspectioncategory | ammomarkingcategory | 
          shipmentmovementstoragecategory | softmaintcategory" >
          <!--<fo:block  id="{generate-id(.)}">-->
    <xsl:apply-templates/>
   <!-- </fo:block>-->
  </xsl:template>
    </xsl:stylesheet>