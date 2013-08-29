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

In order to customize the contents of the files (and some of the directories names) have a look at the following bash piece of code (at the beginning):

	EXT_DIR="extension"
	EXTENSION_ID="ID_OF_YOUR_EXTENSION"
	EXTENSION_NAME="Extension name"
	EXTENSION_DESCRIPTION="Extension description"
	EXTENSION_VERSION="1.0"
	EXTENSION_AUTHOR="Liviu Tudor"
	EXTENSION_HOMEPAGE="http://liviutudor.com"


* `EXT_DIR` : directory name for your extension -- this will also be used for `chrome://` url's in the files created.
* `EXTENSION_ID` : the unique identifier for your extension
* `EXTENSION_NAME` : human-readable name for your extension 
* `EXTENSION_DESCRIPTION` : describe what your extension does
* `EXTENSION_VERSION` : version for your extension; in most cases you will probably want to start with `1.0` (default) but if you are planning on going through a lengthy development cycle, you might want to consider changing this to `0.1` or similar
* `EXTENSION_AUTHOR` : you! derr! :D
* `EXTENSION_HOMEPAGE` : where your extension can be downloaded from -- this can be a project on github or similar, your website, etc.

Acknowledgements
----------------

Big thanks to [Sean Wong](https://twitter.com/MovingDecoy "Sean Wong") for his [initial pull request](https://github.com/liviutudor/SpringMVCSkeleton/pull/1) on [SpringMVCSkeleton](https://github.com/liviutudor/SpringMVCSkeleton) where he signalled the usage of `mkdir -p` and also introduced heredocs in the bash script. I've taken the liberty of applying the same to this script -- thanks, buddy!
