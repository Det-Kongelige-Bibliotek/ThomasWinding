<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform version="1.0"
	       xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns:exsl="http://exslt.org/common"
	       extension-element-prefixes="exsl">

  <xsl:template match="/">
    <xsl:apply-templates select="table"/>
  </xsl:template>

  <xsl:template match="table">
    <xsl:for-each select="tr">
      <xsl:variable name="html_href">
          <xsl:text>html/</xsl:text>
          <xsl:value-of select="td[@class='folderName']"/>/<xsl:value-of select="td[@class='VideoName']"/>
          <xsl:text>.html</xsl:text>
      </xsl:variable>
       <exsl:document href="{$html_href}"
		      method="xml">
	 <xsl:call-template name="html_body_stuff"/>
       </exsl:document>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="make_video">
    <div id="videoWrapper" class="wrapper">
      <video id="video" controls="controls" autoplay="autoplay"  align="middle">
	<source src="../../video/{td[@class='folderName']}/{td[@class='VideoName']}.mp4" type="video/mp4"/>
	Your browser does not support the video tag.
      </video>
        <div id="swip" onclick="toggleControls();"></div>
      <xsl:variable name="prev">
	<xsl:choose>
	  <xsl:when test="position() &gt; 1"><xsl:value-of select="position() - 1"/></xsl:when>
	  <xsl:otherwise><xsl:value-of select="last()"/></xsl:otherwise>
	</xsl:choose>
      </xsl:variable>
      <xsl:variable name="next">
	<xsl:choose>
	  <xsl:when test="position() = last()">1</xsl:when>
	  <xsl:otherwise><xsl:value-of select="position() + 1"/></xsl:otherwise>
	</xsl:choose>
      </xsl:variable>

      <a  id="previousButton" class="button previous" type="button" aria-label="Previous">
	<xsl:attribute name="href">../../index.html#carousel-cell<xsl:value-of select="$prev"/></xsl:attribute>
	<svg class="flickity-button-icon" viewBox="0 0 100 100">
	  <path d="M 10,50 L 60,100 L 70,90 L 30,50  L 70,10 L 60,0 Z" class="arrow">
	  </path>
	</svg>
      </a>
      <a id="nextButton" class="button next" type="button" aria-label="Next">
	<xsl:attribute name="href">../../index.html#carousel-cell<xsl:value-of select="$next"/></xsl:attribute>
        <svg class="flickity-button-icon" viewBox="0 0 100 100">
	  <path d="M 10,50 L 60,100 L 70,90 L 30,50  L 70,10 L 60,0 Z" 
		class="arrow" 
		transform="translate(100, 100) rotate(180) ">
	  </path>
        </svg>
      </a>
    </div>
  </xsl:template>

  <xsl:template name="html_body_stuff">
    <html lang="en">
      <head>
    <script src="../../js/hammer.js">//</script>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<title>
	  <xsl:value-of select="td[@class='Header1']"/>: <xsl:value-of select="td[@class='Header2']"/>
	</title>
	<link rel="stylesheet" href="../../css/video_style.css"/>
      </head>
      <body>
	<xsl:call-template name="make_video"/>
<script>
    var previousButton = document.getElementById("previousButton");
    var nextButton = document.getElementById("nextButton");
    var videoWrapper = document.getElementById("swip");
    

    var previousButtonClick = new Hammer(previousButton);
    var nextButtonClick = new Hammer(nextButton);
    var videoWrapperSwip = new Hammer(videoWrapper);
    
 videoWrapperSwip.on('pan', function(ev) { 
     if (ev.isFinal){ 
         if(ev.direction == 4) { 
             previousButton.click();
         } 
         if(ev.direction == 2) { 
             nextButton.click();
         } 
     } });

</script>
      </body>
    </html>
  </xsl:template>


</xsl:transform>


