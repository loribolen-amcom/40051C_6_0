
Changes/corrections in 40051-2C stylesheet version 6.0;  Dec 2015

	Best when used with DTD 6.0 but will work with 40051-2C DTD version 5.0 and 4.12

SEPT 2018
*******************************************************************************

BDAR_GENINFOWP - Updated content model to allow output in all legal contexts.


AUG 2018
*******************************************************************************

ALERT-TEMPL - Warning icons had a frame around them in output. Corrected.

WARNSUM - Some warning icons were not centered in the warning summary (in Warning Groups). Corrected.
	  Some icons not centering in Haz Mat Desc section of WarnSum. Corrected.
	  Increased "space-before" of WARNING in Haz. Mat Desc. so it doesn't run into preceing text.

CONTENTS - Corrected error where wrong WP number displaying before "WP" in Multi-Volume TOC.
	   Corrected problem where WP number was not incrementing within a chapter in Multi-Volume TOC.
	   Corrected problem with incorrect WP ids in Single Volume TM TOC.

CHGSHEET - Altered changesheet style to allow for header if change sheet goes to multiple pages.
	   Added Change number to TM number in header.
	   Adjusted spacing of spec-para element.

PMCSWP - Corrected issues with PMCS table header.

CTRLINDWP - Corrected problem with <cntrlindtab-alt> not numbering correctly.


JULY 2018
*******************************************************************************

LUBETYPESWP - Corrected "lubetypewp" to "lubetypeswp" per MIL-STD. Changed anywhere in style sheet "lubetypewp" appears.

LUBEORDER-PAGESET-TEMPL - 

CONTENTS - Corrected problem with page number of WP not displaying correctly in TOC.

COEIBII - Style Sheet generating incorrect mutiple figure numbers that go with single COEI/BII table. Corrected errors in lines 182 and 187.


JUNE 2018 - per LB
*******************************************************************************

TABLE - Added change bars on rows with inchglvl att on row or entry.
	Added applicability output on row with applicable att on.

FGIURE-GRAPHIC - Added applicability output on figure title for applicable att on figure or figure/title.
		 Added changebar on figure title for inschglvl att on figure/title.
		 Fixed figure count when figure-alt is used.
		 Added applicability output on subfig title.
		 Added change bar on subfig title.

COEIBIIWP - Added applicability output to coeitab title when applicable att selected on coeitab.

PARA-SEQLIST-STEP - Added new changebar template for parent with inschglvl att selected.
		    Added applicability output on para0 title.
		    Added change bar on para0 title when inschglvl att on title or parent proc.
		    Added applicability output on proc title.
		    Added change bar on step1.
		    Fixed all step counts to allow for -alts.

COMMON-TEMPL - Added applicability output to callouts.

CTRLINDWP - Added change bar to cntrlindtab.
	    Added change bar to cntrlindrow.
	    Put a keeps back in (line 54).

WPIDINFO - Added output of change bar in WP title.

PAGESET-TEMPL - Updated numbering for deleted WPs.

CHAPTER-TITLEPG - Kept title of deleted WP with "(DELETED)" output after title.

CONTENTS-v6_0_NO - Kept title of deleted WP with "(DELETED)" output after title.
		   Updated wpno calculation for rpstl only case.

AALWP - Altered "CHANGEBAR_2" back to "CHANGEBAR".
	Added [1] in if statement around line 215. XSL blowing up when empty 2nd cagenos present.

FRNTCOVER - Added "chgsheet/prtitle/sysnomen" at line 307.



APRIL 2018
**********************************************************************************
Distribution Statement code updated to reflect current changes of DODI

CALLOUT - added applicability



NOVEMBER 2017
***********************************************************************************
LOEPWP - Updated chghistory attributes - 'modify' to display

warnsum - Adjusted Icon spacing

ALERT - Adjusted Icon spacing

CONTENTS - Adjusted wpseq to pull correct information when used.

CHAPTER_TITLEPG - Removed page numbering from Chapter title page and chapter index page.
			Updated to add SOIM chapter title information


August 2017
***********************************************************************************
warnsum - added space after SAFETY title
			removed margin-bottom from <table-row>  Attribute not allowed

Maintsk - preservation updated for correct title

QAWP - added uppercase to all titles Definitions, Certification Requirements, Acceptance Inspections, First Article Inspection

DESCWP - Updated title for eqpdiff to match MIL STD 'Equipment Differences'

GINFOWP - Corrected period after  PRODUCT QUALITY DEFICIENCY REPORTS (PQDR) in 'eir'

Removed fo:block from numerous files where they didnt follow XSL-FO rules.  
Added fo:blocks to all table cells required for PCDATA. This occured in 23 standard table files

Element <fo:inline> is not allowed under element <fo:list-item-body>.
Text '2.' is not allowed for element <fo:list-item-label>. The element declaration's content type is 'element-only'. Added fo:block

fo:block-container removed from ctrlindwp table  Out of order with fo:block
Element <fo:inline> is not allowed under element <fo:block-container> in figure.xsl file removed

Text  not allowed for element <fo:list-item-label>. added <fo:block>

Attribute 'span' is not allowed in element <fo:table> added to <fo:block> prior to table to ensure table spans width of page.

Attribute 'treat-as-word-space' is not allowed in element <fo:basic-link> - Removed

Updated tswp fault proc and lociproc code.

Restructured refwp stylsheet to create a table for the list.

Updated contents stylesheet to display ctrlindtab figures and subfigures corectly.

Updated refwp to handle name|extref and then add the title for an extref

June 2017
***********************************************************************************
Added cmwp templates

updated tswp style for better handling of steps

updated ctrlindwp style 

updated rear-templ to include all manual types

Fixed softmessageswp to allow for simple table layout

Updated bulk_itemswp-v6_0 for /blank page 

Added USER and ADMINSTRATOR to wpidinfo/maintlvl attributes for all software work packages listed under GIM (softginfowp, softsumwp, softeffectwp, softdiffversionwp, TIM - troublesoftcategory (softmessageswp, softerrorswp), MIM - softmaintcategory (maintwp), SOPIM (softsecprivwp, softsuperctrlswp, softpowerupwp, softpowerdownwp, softaccesswp, softkeycmdswp, softproccmdwp, softguiwp, softopconventionswp, softgenwp), SOFTDESCDATA (softfeaturescapwp, softscreendisplaywp, softmenuwp, softtoolswp), SOIM - softwarecategory (softginfowp, softsumwp, softeffectwp, softdiffversionwp, softfeaturescapwp, softscreendisplaywp, softmenuwp, softtoolswp, softsecprivwp, softsuperctrlswp, softpowerupwp, softpowerdownwp, softaccesswp, softkeycmdswp, softproccmdwp, softguiwp, softopconventionswp, softgenwp, softmessageswp, softerrorswp)


March 2017

***********************************************************************************

Corrected page layout for first work package pages when using security attribute. xslfo-main-v6_0.xsl

Updated titleblk templates to fix page keeps.

updated genmaint_ginfowp-v6_0 and created templates for scope, policy, reporting, safety

Updated SAM and SUM unique work packages to place END OF TASK after a operator task in the SOPIM

Updated softdescdata title SOFTWARE DESCRIPTION DATA	contents-v6_0.xsl

Updated change number to handle up to 99 changes


***********************************************************************************
January - May 2016

Updated SUM elements and stylsheet configuration 

PLWP - Updated Kititem for better format when displayed in the Name column adjusted table for better fit.
Added fo:block  to many itmes within each table cell.

Added block inside wrapper for emergency-wp

AUGUST - December 2015

CHANGE - figure-graphic updated to add the change attributes directly in the figure template. This allows for the changebar to display properly along the whole figure.  Graphic element will not display the change bar as it is a sub element of Figure

Elements for software manual (SAM and SUM) added and styled softginfowp, softeffectwp, softdiffversionwp, softfeaturescapwp, 
softscreendisplaywp, softmenuwp, softtoolswp, softsecprivwp, softsuperctrlswp,| softpowerupwp, softpowerdownwp, 
softaccesswp, softkeycmdswp, softproccmdwp, softguiwp, softopconventionswp, softgenwp, softmessageswp, softerrorswp, softbiiwp, softsumwp 

PLWP - updated xrefs to work with in the RPSTL tables when inside the DESC or NAME elements.

added ELEMENTs <configure>, <debug>, <installperdev>, <prepship>, <prepstore>, <transport>, <uninstallperdev>, <upgrade> all added for maintsk types.  
Also removed element <pss>

added ELEMENT <genmaintman> added

added ELEMENT <genmaint_ginfowp> added

added ELEMENT <genmaint_ginfowp> added for general maintenance type

added ELEMENT <softtoolswp> added

added ELEMENT <sopim> added

added ELEMENT <degree_of_destruct> added to  <destruct-introwp> 

added ELEMENT <data_install> added to  <framed.frnt>

added ELEMENT <disc_content> added to  <framed.frnt>
 
update for distribution statements for use on technical manuals. Added export controlled, Operations Security and 
   Vulnerability Informaiton to dist B and dist E. Added Export Controlled, Vulnerability Informaiton to dist C and dist D. Updated statements   
   for all 12 notices as per 23 August 2012 release date of 5230.24

added attributes "idref" and "assocfig" to element "key" in control and indicators tables. Provides links from key to the graphics callout.

added attribute to graphic element "boardfile" CDATA   #IMPLIED

added DMWR/NMWR Tool Identification List Introduction to simboil boiler plate to accomadate for DMWR/NMWR only paragraph.  new boiler plate is labeled toolidwp.intro.dmwr-nmwr

added intro.uoc-list.explain bolier plate for AAL intro

added navy_air | navy_sea as attributes to <servbranch>

added ELEMENT <softmaintcategory> added

added ELEMENT <genmaintcategory> added

added ELEMENT <softmaintcategory> and <genmaintcategory> added to <mim>

updated bolier plates to match text changes in the standard.

added ELEMENTs <lubricantsymbolwp>, <lubetypeswp>, <lospecnoteswp>, <lubeitem>, <lubetab>,    all added for lubeorder manual types.  

added ELEMENT da2028 to lubeorder_rear

added ELEMENTs <lointrowp> and <sim> to lubeorder

added ELEMENT <lointrowp>

added ELEMENT <capacity> added for lubetab

added ELEMENT <cageno> added to sysnomen for lube order front cover

added ELEMENT <sam> added

added ELEMENT <softsysover> added

added ELEMENT <softdocover> added

added ELEMENT <soft_app> added
 
added ELEMENT <soft_inventory> added

added ELEMENT <soft_environment> added

added ELEMENT <soft_secpriv> added

added ELEMENT <soft_superctrls> added

added ELEMENT <soft_assistreport> added

added ELEMENT <softkeycmdswp> added

added ELEMENT <term> and <term.def> added CHANGE attributes

added ELEMENT <dmwr_ammo> changed to allow chapter title pages and flow like a normal maintenance manual.

changed manuitem element for ease of use and better flow within the manuwp

added adding in <mrp> as part of <pi.item>

added ELEMENT <policy>

adding ELEMENT <preservation>

adding ELEMENT <transportability> added for general information in AMMO manuals. Used to reference to work packages of applicable publications



*******************************************************************************************************************************************************

APRIL - AUGUST 2015

CHANGE - figure-graphic updated to add the change attributes directly in the figure template. This allows for the changebar to display properly along the whole figure.  Graphic element will not display the change bar as it is a sub element of Figure

Elements for software manual (SAM and SUM) added and styled softginfowp | softeffectwp | softdiffversionwp | softfeaturescapwp | softscreendisplaywp | softmenuwp | softtoolswp | softsecprivwp | softsuperctrlswp | softpowerupwp | softpowerdownwp | softaccesswp | softkeycmdswp | softproccmdwp | softguiwp | softopconventionswp | softgenwp | softmessageswp | softerrorswp | softbiiwp | softsumwp 

PLWP - updated xrefs to work with in the RPSTL tables when inside the DESC or NAME elements.


*******************************************************************************************************************************************************

JANUARY - MARCH 2015

WPIDINFO - Updated maintlvl template so operator output in the proper work packages


*******************************************************************************************************************************************************
Changes/corrections in 40051-2B stylesheet version 5.0;  May 2014


DESCWP - <fo:block span="all" text-transform="uppercase" xsl:use-attribute-sets="titlesub"> To keep title with next text on same page

OCTOBER -  DECEMBER 2014

TSWP - change code to number from the logicproc all the way through origin, testblocks and endblock so the steps are consecutive and easier to read and link to and from.
TSWP - Added to code to properly process figures and tables in the steps within the proc
TSWP  - Added code to display WCN before each step that appear in 

XREF - Changed value of label for the callout Was: callout[@label]; Now: callout/@label

Table of Contents - Changed Fold outs to use the correct page number reference when list in the TOC and proper spacing; also updated proper listing for figures with sub figures pulling only the main title; contents-v6_0
TOC - update multi-volume to display on same line in TOC where possible

OPCHECKWP - 

Added template safeflght <xsl:call-template name="safeflght"/>


SEPTEMBER 2014

REFWP - added code to handle <pubident> <extref docno="..." /> as the DTD allows you to use <extref> or <name>.  This places the extref docno, pretext and or post text in the list as the label when composing.

PMCSWP - Added code to place equipment Not Available next to the pmcsstep1 when a warning caution or note preceed the step in a PMCS table. adjusted using the alignment of the cell

TSWP - ACTION added a period after the step number.
TSWP - Added code to origin to ensure /proc and child elements would be processed and displayed in the output. warning, caution, notes, csi.alert. Then also figure, table and ftnote.

AUGUST 2014

WARNINGSUM - added to check for no warninfo/title to allow for proper spacing  from the warning icons.  If no title then adds block area to keep previous icon with last <sfty-icons> and in line.

SURWP - Added span="all" to all title headers to ensure proper placement. Updated proc/title code for each surtsk to check for the title in the proc as no title element exist under surtsk

COEIBIIWP - 

TSWP, OPCHECK-TSWP - LOGICPROC Reworked LOGICPROC for a display using the procedure title followed by the current branch of the origin | testblock | endblock to signify where in the current procedure you are located.  This also facilitated the linking from one branch to the next by using xref's  <xref stepstart="T00001_stp5"/> and ID's in the steps <step1 id="T00001_stp5">

MANU_ITEM_INTROWP Updated the table output to include resizing the column widths to better accommodate the data.  Added hyphenation for any long items

MANUWP Updated the table output to include resizing the column widths to better accommodate the data.  Added hyphenation for any long items.  Added title for proper placement in the manuitem element.  Also added title of the materials-list/title to output as the table title.  Added code to look for <proc> when used.

OIPWP Updated table title for correct alignment and output of the title when included.  Added a default value if no title provided.

OPUNUWP - Updated proc/title code for each opunutsk to check for the title in the proc as no title element exist under opunutsk

***************************************************************************************************************************************************************
Changes/corrections in 40051-2B stylesheet version 5.0;  May 2014

	Best when used with DTD 5.0 but will work with 40051-2 DTD version 4.11 and 4.12

MAY 2014

PLWP - added INDENT template to handle pi.item/@indent for input sub items to a pi.item.  Displays with ... before the name in the PLWP list.

WIRINGWP - Added apply-templates for all children in the wiringwp.

EMERGENCYWP - Commented out continuing headers in the EmergencyWP

FIGURE TITLES - Bolded figure titles to match table titles through the document

APRIL 2014

Update the MAC template to include the Multi-service option by supplying an * with the C in the column header and placing the "*NOTE
This is a joint service manual. While Army uses a "C," other service may use an "O" in this column." at the end of the table.

Corrected mac template and added in the (c) around the C, F, H, and D.

para-seqlist-step - Updated ITEM in a list by adding term | def | term.def



MARCH 2014

Updated para template in the para-seqlist-step-v6_0 file to include term and term.def

Updated the tswp file to adjust the indention of action template - STEP 1 are now indented to align with ACTION

Updated xrefs file with maintsk proper path when referencing one of the maintsks, ie. pss, remove, install, etc.
Updated XREF file for maintsk and opertsk taskid titles to match standard and included all possible task names

Updated the titleblk-v6_0 Added reporting.para to template 	<xsl:template match="titleblk/reporting/para">

Updated manuwp-v6_0 to display figures, tables, steps and para after material-list

Updated <dist> (distribution statement D) to be in-line heading like <export> and <destr> notices in both front cover and title page

Cleaned up distribution file to remove the IF statements from many of the distribution types becuase there is no txt to search for under these entries frgngvt | softwaredoc | crittech | adminops | specauth | proprietary | testeval | cntrctperform | premature 

Updated xsl-fo_main - not pulling in "blank" in footer	when work package ends on odd page greater than or equal to "3", it's not generating the "/blank" in the footer

Updated Front - front matter not inserting blank page	If front matter ends of odd page, not inserting blank page

Updated SURWP Service Upon Receipt Procedure titles not left justified (only first), also UNPACKING need to be initial caps. Fixed to match Porcedure titles with maintwp.  All major procedure titles are all CAPS. Also cleaned up code to check for titles provided by writer.  Added table cell borders for crit.insp.tab and pecul.insp.tab for better appearence.

Updated Operation under usual conditions stylesheet opusualwp to look for PREPARATION FOR USE title

Updated and removed the <xsl:if test="@id"> in the tables.xsl file. This cleaned up the file and allowed the Table of Contents to put the proper table page entry. Search all style sheets to ensure this statement did not complete with the "generate-id" attribute.

Added a (keep-with-next.within-page="yes") in the figure-graphic-v6_0.xsl file to ensure the figure title stays on the same page as the grphic itself.

Udated COEIBIIWP.xsl file to display a graohic with each table in the coei and bii for OPTION A display.
Update to properly dis

Updated APPLICABLE Template with XSL version 2.0 language 

*************************************************************************************************************************************************

Dec 2013 UPDATES

UPDATED all files to bring forward updates from the 1.9 version of the stylsheet that effect ELEMENTS in the 5.0 DTD.

TABLE OF CONTENTS - fixed page number from WPs. Also added code to handle tables with no title.  They will not be included in the TOC.

PMCS WP - Fixed The WCN Trim.para that follows the <title> to display in the correct table column when Man-hours are used.

PLWP - Updated stylesheet to include a table for multiservice parts listing and also multiple SMR codes for each service. Must use the attribute for each service in order to display correctly.

OIPWP - Updated CSI warnings to display correctly

FOLDOUTS - Made changes to the FOLDSECT and also the figure template to accommodate all sizes of Fold-outs.  Page structure for foldout section now displays correctly with proper alignment.


*************************************************************************************************************************************************

Changes/corrections in 40051-2B stylesheet version 1.1;  July 2013
	Best when used with DTD 4.12 

JUL 2013 UPDATES

TABLE OF CONTENTS - How to use returning the correct page number for the TOC.
	
HOW TO USE - Corrected the howtouse template in the common.xsl and added new template for howtouse/title and added 
	<fo:block span="all" 		id="{generate-id(.)}">. 
	This allows the refid in the contents.xsl for identify the correct page by selcting the first element on the page.

FIGURE - Legends moved before the figure title as per MIL-HDBK 1222. Change to make 2 columns after 4 legend items

DISTRIBUTION STATEMENTS - removed extra - when titles are provided by the writer

TABLE MARKER - Table markers established for contiuation table headers from one page to the next



*************************************************************************************************************************************************

Updated June 2013. 

		June 2013 UPDATES
Changed Element <proc> to allow for attribute QA when not using steps.
	Added code to look for <xsl:if test="ancestor::*/@qa='yes'"> as well as ocal <xsl:if test="@qa='yes'">

Contents
	Added code to place CHANGE at footer of Table of contents when a change has been applied to that page

TITLEBLK
	Updated string-length code to work with ARBORTEXT 6.0 and xsl 2.0 formatting
		<xsl:when test="not(string-length(titleblk/state)=0)"> 
PSHOPANALWP
	DTD updated to add <proc> according to MIL STD
	Updated XSL-FO code to relect the change <!ELEMENT pshopanalwp (wp.metadata?, wpidinfo, initial_setup, %alert;, scope, proc, pshopanal)>

APPLICABLE code added for applicability in figures, para, PMCSWP, Tables, WPINFO


Updated Feb 2013. 

*************************************************************************************************************************************************
	

Updated Apr 2013. 

*************************************************************************************************************************************************
		Apr 2013 UPDATES
CHANGE Bars
	Added code to handle change bars with DTD update 4.12 using inschlvl="1" or greater.
	This adds the ability to place change bars on objects that don't have the change element available. One area is the 
	wpidinfo

PMCS
	Added code to allow figure to span the whole table  while placed in a proc in the PROCEDURE column

pmcsintrowp 	
	Fixed Fluid.leakage template

TABLE OF CONTENTS
	


Updated Feb 2013. 

*************************************************************************************************************************************************
		Feb 2013 UPDATES

CHANGE SHEET
		Code added to update change sheet
		Code added to insert proper WP number when inserting a work package. i.e. 0004.1 @ insertwp
TMNO
		Updated to display for volumes by adding -1, or -2, or -3 ... to the end of the TM number on each WP page and also front matter pages where needed

manu_items_introwp
		Updated to add figno element in the correct place and retrieve the correct WP number and figure number.

surwp 		Adusted for proper titles per DTD Added mark to template. Corrected pecul.insp.tab to place proper element content in the table correctly

xref	Adjusted the logic to xrefs to flow and link to the proper place within the content

Explistwp	Updated table headers

frntcover	Adjusted to put Model, nsn, pn and eic on one line if possible.

macwp 		table column widths; Cleaned up code
mrplwp	updated table col widths.  Table counter for PMCS

opcheck-tswp 	<xsl:template match="checkstep/action/step1" order different

para-seqlist-step		esd, hcp, crewmember template correction; for applicability; 

warnsum		Removed keep-together.within-page="always"  from safety template. Changed sfty-icons template from a table to a list. This allowed for proper page break of the explanation of safety icons. Removed warnsum/title - not needed, no such element

Blank page number adjusted for WP's and front matter pages. Will display last page of WP if odd as sample -  3/blank.
	Updated pageset_template-v6_0; xslfo-main; tltleblk; loepwp; 
	According to the standard (40051-2B) change sheet does not get numbered
	5.2.1.4 Change transmittal page <chgsheet>. A change transmittal page shall be prepared for
	each change to a TM and shall be included in the change package (refer to FIGURE 9). The
	change transmittal page shall not be numbered and shall be located following the warning
	summary (refer to FIGURE 9).

table of contents - contents-v6_0 TOC spacing is different. TOC entries have more space between them. Decreased spacing for TOC entries for make more room and shorten over all TOC length.

term.def - para-seqlist-step-v6_0 added a case for control indicator tables to help a definition list fit. Left the normal spacing to all other cases at this time.
	<fo:block>
		<fo:list-block space-before.minimum="2pt" space-before.optimum="4pt" space-before.maximum="6pt" space-before.conditionality="discard" >
          <xsl:choose>
              <xsl:when test="not(ancestor::ctrlindrow)">
            		<xsl:attribute name="provisional-distance-between-starts">16pc</xsl:attribute>
					<xsl:attribute name="provisional-label-separation">1pc</xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
            	   <xsl:attribute name="provisional-distance-between-starts">8pc</xsl:attribute>
					<xsl:attribute name="provisional-label-separation">4pt</xsl:attribute>
				</xsl:otherwise>            	
          </xsl:choose>


************************************************************************************************************************************************


*************************************************************************************************************************************************
	