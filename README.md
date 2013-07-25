FFExtensionSkeleton
===================

Creates a skeleton for a Firefox extension.

This is based on the blog post on Mozilla's website here: http://blog.mozilla.org/addons/2009/01/28/how-to-develop-a-firefox-extension/

Simply automates some of the steps described in the page by creating the required directories and some skeleton functions.

The whole "project" is really just a bash script (`create_ff_ext.sh`) which when launched creates the directories and skeleton files.


Directory Structure
-------------------

This script creates the basic directory structure showed here:

![Basic FF extension directory structure](http://blog.mozilla.org/addons/files/2009/01/extension-structure.png "Basic FF extension directory structure")

It also initializes the following files with a "skeleton" contents:

* `install.rdf`
* `chrome.manifest`
* `chrome/browser.xul`
* `chrome/options.xul`

(The contents of these files is based on the contents shown in the original blog post mentioned above. See below for customizing the contents.)

Customization
-------------

