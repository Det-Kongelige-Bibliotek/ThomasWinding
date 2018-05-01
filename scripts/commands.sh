# Cd into the following folder
# cd Documents/ThomasWinding/scripts/
# In command line type: 'bash commands.sh ipad4', which 'ipad4' is the name of the folder which contains videoes

#!/bin/bash
folderName=$1;

# Convert csv to HTML table
./converter.pl ../$folderName/$folderName.csv > tmp/tmp.xml

# Create index.html
xsltproc create_index_html.xsl tmp/tmp.xml > ../$folderName/index.html

# Cd into the folder
cd ..
cd $folderName

# Create html files for the videoes
xsltproc ../scripts/create_videos_html.xsl ../scripts/tmp/tmp.xml

# Cd back to the script folder
cd ..
cd scripts

# Copy assets
cp -R assets/css ../$folderName
cp -R assets/js ../$folderName
cp assets/play.png ../$folderName