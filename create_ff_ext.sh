#!/bin/bash

# =======================================
# = Creates a skeleton for FF extension =
# =======================================

EXT_DIR="extension"
EXTENSION_ID="ID_OF_YOUR_EXTENSION"
EXTENSION_NAME="Extension name"
EXTENSION_DESCRIPTION="Extension description"
EXTENSION_VERSION="1.0"
EXTENSION_AUTHOR="Liviu Tudor"
EXTENSION_HOMEPAGE="http://liviutudor.com"


# install.rdf
INSTALL_RDF="<?xml version=\"1.0\"?>
<RDF xmlns=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"
     xmlns:em=\"http://www.mozilla.org/2004/em-rdf#\">

	<Description about=\"urn:mozilla:install-manifest\">
		<em:id>$EXTENSION_ID</em:id>

		<em:name>$EXTENSION_NAME</em:name>
		<em:version>$EXTENSION_VERSION</em:version>
		<em:type>2</em:type>
		<em:creator>$EXTENSION_AUTHOR</em:creator>

		<em:description>$EXTENSION_DESCRIPTION</em:description>
		<em:homepageURL>$EXTENSION_HOMEPAGE</em:homepageURL>
		<em:optionsURL>chrome://$EXT_DIR/content/options.xul</em:optionsURL>

		<em:targetApplication>

			<Description>
				<em:id>{ec8030f7-c20a-464f-9b0e-13a3a9e97384}</em:id>
				<em:minVersion>2.0</em:minVersion>
				<em:maxVersion>26.0</em:maxVersion>
			</Description>
		</em:targetApplication>
	</Description>
</RDF>"

# chrome.manifest
CHROME_MANIFEST="content	$EXT_DIR	chrome/content/
content	$EXT_DIR	chrome/content/	contentaccessible=yes
overlay	chrome://browser/content/browser.xul	chrome://$EXT_DIR/content/browser.xul

locale	$EXT_DIR	en-US	locale/en-US/

skin	$EXT_DIR	classic/1.0	skin/
style	chrome://global/content/customizeToolbar.xul	chrome://$EXT_DIR/skin/skin.css"

# browser.xul
BROWSER_XUL="<?xml version=\"1.0\"?>
<?xml-stylesheet href=\"chrome://$EXT_DIR/skin/skin.css\" type=\"text/css\"?>
<!DOCTYPE $EXT_DIR SYSTEM \"chrome://$EXT_DIR/locale/translations.dtd\">
<overlay id=\"$EXTENSION_ID\" xmlns=\"http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul\">
	<script src=\"$EXT_DIR.js\" />
	<!-- add your xul here -->
</overlay>"

# options.xul
OPTIONS_XUL="<?xml version=\"1.0\"?>
<?xml-stylesheet href=\"chrome://global/skin/\" type=\"text/css\"?>
<prefwindow title=\"$EXTENSION_NAME Preferences\" xmlns=\"http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul\">
	<prefpane label=\"$EXTENSION_NAME Preferences\">
		<preferences>
			<preference id=\"$EXT_DIR-preference\" name=\"extensions.$EXT_DIR.preference\" type=\"bool\"/>
		</preferences>

		<groupbox>
			<caption label=\"Settings\"/>
			<grid>
				<columns>
					<column flex=\"4\"/>
					<column flex=\"1\"/>
				</columns>
				<rows>
					<row>
						<label control=\"$EXT_DIR-pref\" value=\"$EXT_DIR Preference\"/>
						<checkbox id=\"$EXT_DIR-pref\" preference=\"$EXT_DIR-preference\"/>
					</row>
				</rows>
			</grid>
		</groupbox>	
	</prefpane>
</prefwindow>"

# pref.js
PREF_JS="
pref(\"extensions.$EXT_DIR.preference\", false);
"

# translations.dtd
TRANSLATIONS_DTD="
<!ENTITY somelocalizedmsg \"$EXTENSION_NAME\" >
"

# TODO: Should test if extension dir exist
mkdir $EXT_DIR
cd $EXT_DIR

CHROME_DIR="chrome"
echo "Setting up $CHROME_DIR dir"
mkdir $CHROME_DIR
cd $CHROME_DIR
echo "$CHROME_MANIFEST" > chrome.manifest
mkdir content
cd content
echo "$BROWSER_XUL" > browser.xul
echo $"OPTIONS_XUL" > options.xul
touch $EXT_DIR.js
cd ..
cd ..

DEFAULTS_DIR="defaults"
echo "Setting up $DEFAULTS_DIR dir"
mkdir $DEFAULTS_DIR
cd $DEFAULTS_DIR
echo "$INSTALL_RDF" > install.rdf
mkdir preferences
cd preferences
echo "$PREF_JS" > pref.js
cd ..
cd ..

LOCALE_DIR="locale"
echo "Setting up $LOCALE_DIR dir"
mkdir $LOCALE_DIR
cd $LOCALE_DIR
mkdir en-US
cd en-US
echo "$TRANSLATIONS_DTD" > translations.dtd
cd ..
cd ..

SKIN_DIR="skin"
echo "Setting up $SKIN_DIR dir"
mkdir $SKIN_DIR
cd $SKIN_DIR
touch skin.css
cd ..

# Back to where we started
cd ..

