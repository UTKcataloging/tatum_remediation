<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.og/2001/XMLSchema"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns="http://www.loc.gov/mods/v3"
    xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-5.xsd"
    exclude-result-prefixes="xs"
    xpath-default-namespace="http://www.loc.gov/mods/v3"
    version="2.0">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    
    <xsl:template match="topic">
        <xsl:choose>
            <xsl:when test="ends-with(., '.')">
                <topic>
                    <xsl:apply-templates select="substring(., 1, string-length(.) -1)"/>
                </topic>
            </xsl:when>
            <xsl:otherwise>
                <topic>
                    <xsl:apply-templates/>
                </topic>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="relatedItem[@displayLabel='Project']"/>

    <xsl:template match="relatedItem[@displayLabel='Collection']"/>

    <xsl:template match="accessCondition"/>
    
    <xsl:template match="recordInfo"/>
    
    <xsl:template match='mods'>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
            <name>
                <namePart>Tatum, Robert G. (Robert George), 1891-1964</namePart>
                <role>
                    <roleTerm authority="marcrelator" valueURI="http://id.loc.gov/vocabulary/relators/aut">Author</roleTerm>
                </role>
            </name>
            <physicalDescription>
                <form authority="aat" valueURI="http://vocab.getty.edu/aat/300027112">diaries</form>
                <form authority="aat" valueURI="http://vocab.getty.edu/aat/300028051">books</form>
            </physicalDescription>
            <relatedItem displayLabel="Project" type="host">
                <titleInfo>
                    <title>Robert G. Tatum Collection</title>
                </titleInfo>
            </relatedItem>
            <relatedItem displayLabel="Collection" type="host">
                <titleInfo>
                    <title>Robert G. Tatum Papers</title>
                </titleInfo>
                <identifier>MS.0774</identifier>
            </relatedItem>
            <recordInfo>
                <recordContentSource valueURI="http://id.loc.gov/authorities/names/n87808088">University of Tennessee Knoxville. Libraries</recordContentSource>
                <languageOfCataloging>
                    <languageTerm authority="iso639-2b" type="code">eng</languageTerm>
                </languageOfCataloging>
                <recordCreationDate>2020-04-23-04:00</recordCreationDate>
                <recordOrigin>This MODS record was generated into MODS v3.5 from the TEI teiHeader by
                    University of Tennessee Libraries Digital Initiatives, using a stylesheet available at
                    https://github.com/utkdigitalinitiatives/tei-to-mods.</recordOrigin>
            </recordInfo>
            <accessCondition type="use and reproduction" xlink:href="http://rightsstatements.org/vocab/InC/1.0/">In Copyright</accessCondition>
        </xsl:copy>
    </xsl:template>
    
    <xsl:strip-space elements="*"/>
</xsl:stylesheet>