<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ex="http://www.example.org/" 
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:foaf="http://xmlns.com/foaf/0.1/"
	> 
<xsl:output method='text' encoding='UTF-8'/>

<xsl:template match="document">
	<xsl:apply-templates select="data"/>
</xsl:template>

<xsl:variable name="incr" select="0"></xsl:variable>

<xsl:template match="data">
	<xsl:text>
@prefix dcterms: &lt;http://purl.org/dc/terms/&gt; .
@prefix : &lt;#&gt; .
@prefix void: &lt;http://rdfs.org/ns/void#&gt; .
@prefix TEMPORAIRE: &lt;http://temporaire.org/&gt; .
@prefix gr: &lt;http://purl.org/goodrelations/&gt; .
@prefix pdll: &lt;http://lodpaddle.univ-nantes.fr/&gt; .
@prefix dbpedia: &lt;http://dbpedia.org/resource/&gt; .
@prefix prop-fr: &lt;http://fr.dbpedia.org/property/&gt; .
@prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
@prefix ex: &lt;http://example.org/&gt; .
@prefix owl: &lt;http://www.w3.org/2002/07/owl#&gt; .
@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
@prefix dbpprop: &lt;http://dbpedia.org/property/&gt; .
@prefix dbpedia-owl: &lt;http://dbpedia.org/ontology/&gt; .
@prefix sc: &lt;http://schema.org/&gt; .
@prefix geo: &lt;http://www.w3.org/2003/01/geo/wgs84_pos#&gt; .

&lt;http://lodpaddle.univ-nantes.fr/airesDeCovoiturage&gt; rdf:type void:Dataset ;
	foaf:homepage "http://data.loire-atlantique.fr/donnees/detail/aires-de-covoiturage-de-nantes-metropole/";
	dcterms:title "Localisation des aires de covoiturage de Nantes Métropole"^^xsd:string ;
	dcterms:description "Localisation des aires de covoiturage de Nantes Métropole"^^xsd:string ;
	dcterms:created "2014-11-13"^^xsd:date;
	dcterms:publisher :pub .

:pub rdfs:label "Région des Pays de la Loire".

</xsl:text>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="element">
	<xsl:apply-templates select="geo/name"/>
<xsl:text>&#009;rdf:type&#009; pdll:airesDeCovoiturage;
</xsl:text>
	<xsl:apply-templates select="TELEPHONE"/>
	<xsl:apply-templates select="SERVICE_VELO"/>
	<xsl:apply-templates select="SITE_WEB"/>
	<xsl:apply-templates select="CODE_POSTAL"/>
	<xsl:apply-templates select="_l"/>
	<xsl:apply-templates select="ADRESSE"/>
	<xsl:apply-templates select="CONDITIONS_D_ACCES"/>
	<xsl:apply-templates select="CODCOMMUNE"/>
	<xsl:apply-templates select="COMMUNE"/>
	<xsl:apply-templates select="CAPACITE_VOITURE"/>
	<xsl:apply-templates select="PRESENTATION"/>
	<xsl:apply-templates select="_IDOBJ"/>
	<xsl:apply-templates select="EXPLOITANT"/>

</xsl:template>

<xsl:template match="TELEPHONE">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:telephone&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:telephone&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="SERVICE_VELO">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:hasBikeFeature&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:hasBikeFeature&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="SITE_WEB">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:website&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:website&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CODE_POSTAL">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:postalCode&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:postalCode&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="geo/name"><xsl:choose><xsl:when test=". = 'null'"></xsl:when>
<xsl:otherwise><xsl:value-of select="concat(concat('&lt;http://lodpaddle.univ-nantes.fr/airesDeCovoiturage/',encode-for-uri(.)),'&gt;')"/>&#009; foaf:name &#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="_l">&#009;geo:lat&#009;"<xsl:value-of select="substring-after(substring-before(.,' ,'),'[ ')"/>"^^xsd:decimal ;
&#009;geo:long&#009;"<xsl:value-of select="substring-before(substring-after(.,', '),']')"/>"^^xsd:decimal  ;
</xsl:template>

<xsl:template match="ADRESSE">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:location&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:location&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CONDITIONS_D_ACCES">
<xsl:choose><xsl:when test=". = 'null'">&#009;sc:price&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;sc:price&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CODCOMMUNE"><xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:insee&#009; "-120404040"^^xsd:int ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:insee&#009; "<xsl:value-of select="."/>"^^xsd:int ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="COMMUNE">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:town&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpprop:town&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="CAPACITE_VOITURE">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:carCapacity&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:carCapacity&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="PRESENTATION">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpedia-owl:abstract&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;dbpedia-owl:abstract&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="_IDOBJ">
<xsl:choose><xsl:when test=". = 'null'">&#009;pdll:id&#009; "undefined"^^xsd:string ;
</xsl:when>
<xsl:otherwise>&#009;pdll:id&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string ;
</xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="EXPLOITANT">
<xsl:choose><xsl:when test=". = 'null'">&#009;dbpprop:owner&#009; "undefined"^^xsd:string .

</xsl:when>
<xsl:otherwise>&#009;dbpprop:owner&#009; "<xsl:value-of select="translate(., '&quot;','')"/>"^^xsd:string .

</xsl:otherwise></xsl:choose></xsl:template>

</xsl:stylesheet>