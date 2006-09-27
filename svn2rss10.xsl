<?xml version="1.0"?>
<!-- Transform Subversion XML changelogs into RSS 1.0 feed. -->
<!-- (c) Karl-Martin Skontorp <kms@skontorp.net> -->

<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns="http://purl.org/rss/1.0/">

  <xsl:output method="xml" omit-xml-declaration="no" encoding="ISO-8859-1"/>

    <xsl:template match="/">
        <rdf:RDF>
            <channel>
                <title>SVN Changelog</title>
		<dc:date>
		    <xsl:value-of
		    select="document('http://xml.skontorp.net/misc/datetime.php')/datetime/full-iso8601" />
		</dc:date>
            </channel>
            <xsl:apply-templates select="/log/logentry" />
        </rdf:RDF>
    </xsl:template>

    <xsl:template match="/log/logentry">
        <item>
            <title>
	        <xsl:text>[</xsl:text>
	        <xsl:value-of select="date" />
	        <xsl:text>] Rev. </xsl:text>
                <xsl:value-of select="@revision" />
	        <xsl:text> (</xsl:text>
	        <xsl:value-of select="author" />
	        <xsl:text>)</xsl:text>
            </title>
	    <description>
	        <xsl:value-of select="msg" />
	    </description>
        </item>
    </xsl:template>

</xsl:stylesheet>
