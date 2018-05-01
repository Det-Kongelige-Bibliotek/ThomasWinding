<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform version="1.0"
	       xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html"
              indent="yes"
	      omit-xml-declaration="yes"
	      encoding="UTF-8"/>

  <xsl:template match="/">
    <html lang="en">
      <head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
	<link rel="stylesheet" href="css/flickity.css" media="screen" />
	<link rel="stylesheet" href="css/style.css" media="screen" />
      </head>
      <body>
	<xsl:apply-templates mode="html" select="table"/>
          
    <script src="js/hammer.js"></script><xsl:text>
    </xsl:text>
	<script src="js/flickity.pkgd.min.js"></script>
	<script src="js/hash.js"></script>
          
	<xsl:apply-templates mode="script"  select="table"/>

      </body>
    </html>
  </xsl:template>

  <xsl:template mode="html" match="table" >
    <div class="carousel is-fullscreen"> 
      <xsl:attribute name="data-flickity"><xsl:text>{"freeScroll":false,"wrapAround":true,"lazyLoad": 50,"cellAlign":"center","hash":true,"pageDots": false}</xsl:text></xsl:attribute>
      <xsl:for-each select="tr">
	<div class="carousel-cell">
	  <xsl:attribute name="id">carousel-cell<xsl:value-of select="position()"/></xsl:attribute>
	  <xsl:element name="img">
	    <xsl:attribute name="class">carousel-image</xsl:attribute>
	    <xsl:attribute name="data-flickity-lazyload">img/<xsl:value-of select="td[@class='folderName']"/>.jpg</xsl:attribute>
	  </xsl:element>
	    <h1><xsl:value-of select="td[@class='Header1']"/></h1>
	    <h2><xsl:value-of select="td[@class='Header2']"/></h2>
	    <a><xsl:attribute name="id">playButton<xsl:value-of select="position()"/></xsl:attribute>
            <img src="play.png"/></a>
	</div>
      </xsl:for-each>
    </div>
  </xsl:template>
    
  <xsl:template  mode="script" match="table">
  <script>

      <xsl:for-each select="tr">
        var playButton<xsl:value-of select="position()"/> = document.getElementById("playButton<xsl:value-of select="position()"/>");
        var playButtonClick<xsl:value-of select="position()"/> = new Hammer(playButton<xsl:value-of select="position()"/>);
        playButtonClick<xsl:value-of select="position()"/>.on('panstart tap press', function(ev) { 
            location.replace("<xsl:text>html/</xsl:text><xsl:value-of select="td[@class='folderName']"/>/<xsl:value-of select="td[@class='VideoName']"/><xsl:text>.html</xsl:text>");
            });
       </xsl:for-each>
</script>
  </xsl:template>
</xsl:transform>


