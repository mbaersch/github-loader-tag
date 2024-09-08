# jsDelivr Script Loader

**Custom Tag Template for Google Tag Manager**

Loads multiple scripts that are stored on GitHub, npn or other available sources via **jsdelivr.com**.   

![Template Status](https://img.shields.io/badge/Community%20Template%20Gallery%20Status-testing-blue) ![Repo Size](https://img.shields.io/github/repo-size/mbaersch/jsdelivr-loader-tag) ![License](https://img.shields.io/github/license/mbaersch/heyflow-loader-tag)

This template serves as a way to load one or more scripts in a GTM container without access to Custom HTML tags ([restricted tag types](https://developers.google.com/tag-platform/tag-manager/restrict)).  

![image](https://github.com/user-attachments/assets/2a2131c8-3b9e-431a-a07d-c1ea4576ad66)

## Usage 
Add the template to your container, create a new *jsDelivr Script Loader* tag and trigger it when there is consent to load the external resources that you added to the tag. 

### Add scripts
Enter one or multiple URLs from cdn.jsdelivr.net. All URLs must start with `https://cdn.jsdelivr.net/` or loading will fail. If you want to load a script that you host on GitHub, you can use the [jsDelivr GitHub Migration Form](https://www.jsdelivr.com/github) to create a CDN URL for your file.

### Options
Check **Log script load status to console** to debug and verify that scripts are loaded as expected. 
When the tag might get fired multiple times, activate **Use Cache Token** to prevent loading the same script twice.
