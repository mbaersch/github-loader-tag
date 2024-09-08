# GitHub Script Loader

**Custom Tag Template for Google Tag Manager**

Loads multiple scripts that are stored on GitHub (or other available sources) via **jsdelivr.com, statically.io, or GitHub Pages (gitbub.io)**.   

![Template Status](https://img.shields.io/badge/Community%20Template%20Gallery%20Status-submitted-orange) ![Repo Size](https://img.shields.io/github/repo-size/mbaersch/github-loader-tag) ![License](https://img.shields.io/github/license/mbaersch/github-loader-tag)

This template serves as a way to load one or more scripts in a GTM container without access to Custom HTML tags ([restricted tag types](https://developers.google.com/tag-platform/tag-manager/restrict)).  

## Usage 
Add the template to your container, create a new *GitHub Script Loader* tag and trigger it when there is consent to load the external resources that you added to the tag. 

![image](https://github.com/user-attachments/assets/7c19a964-f43b-4829-a138-6f3f97d6b056)

### Add scripts
Your files on GitHub cannot be loaded directly from a reporitory URL, even if you try to load the raw contents from *githubusercontent.com*. But there are ways how to load a JavaScript file from a repository, using either one of the supported CDN services (*jsDelivr* and *statically.io*) or put your files into a repository that is published using [GitHub Pages](https://pages.github.com/).

Enter one or multiple URLs from...

- cdn.jsdelivr.net
- cdn.statically.io
- *.github.io

All URLs must start with `https://cdn.jsdelivr.net/`, `https://cdn.statically.io/`, `https://<yourname>.github.io/` or loading will fail. 

### Converting URLs to CDN links 
If you want to load a script that you host on GitHub without using GitHub pages, you can use [jsDelivr URL migration](https://www.jsdelivr.com/github) or the [statically.io converter](https://statically.io/convert/) to create a CDN URL for your file. that the loader tag is allowed to access. 


### Options
Check **Log script load status to console** to debug and verify that scripts are loaded as expected. 
When the tag might get fired multiple times, activate **Use Cache Token** to prevent loading the same script twice.
