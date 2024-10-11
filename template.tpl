___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "External Script Loader",
  "categories": [
    "UTILITY"
  ],
  "brand": {
    "id": "mbaersch",
    "displayName": "mbaersch",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAilBMVEUAAAAXFRUlJSUYFhYfFRUXFRUXFRUZFhYcGRkaGhoYFhYYFRUXFRUXFhYYFhYYFRUYFhYoGxsYFhYYFhYYFhYbFhYfHx9AQEAXFRUXFRUZFhYXFRUZFhYZFhYYFxcbGxsYFRUXFxcYGBgYGBgYFhYYFhYYFRUYFRUYFRUYFhYZFxcYFRUYGBgXFRUbXhiVAAAALXRSTlMA8waWF+XARiQc+eDZ0siRggzsdIAuEATuz2ZhXFJKEspBNCC4t6qonYF7bCqbhs9+AAABSklEQVQ4y31SV3bEIAwUYOOy7vZ6XbZm0xPuf70YCVf8Mj/wNINGBZjBPSEjxiIpPA42HMHUBCacDc0zomdJxlfPE2UhWSQ5umoH7nF6T7ytcIy/zh99FEuueW+1C9WR6UgHp95VLJYyblTxw+GioxkaYP0vAJD/AsKvAeCJvWgToUiwQYBhAcBpAOet4Erj4ODR5bkV3KhozziUYKE3HhJP3xbUSEiI0AF2cNBMBFjjYU9wp6fs/wyMDuXYPA8pd7I/BjD9J5DiebcFb0ikuJS9QfQUv0DO6JadVnxJUZbjstJzPJRTeTczosd3pAipXm6oGi9vaWwIqUaEOOGvIVPg691cSfCYBBU1POT/BKdMO24WOfKxCQQuPp4REu8Gy2//WnbV2Mjq21OOFkN8KYiD1eCrcC0IMw5r+Cljo0XBhA828npyzOfoH8B4RM+to1xdAAAAAElFTkSuQmCC"
  },
  "description": "Loads multiple scripts that are stored on GitHub or available via jsdelivr.com or statically.io. Can also load scripts directly from GitHub pages.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "grpScripts",
    "displayName": "Scripts to load",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "SIMPLE_TABLE",
        "name": "scriptsTable",
        "displayName": "",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Enter one or multiple URLs from jsdelivr.net or statically.io",
            "name": "scriptUrl",
            "type": "TEXT"
          }
        ],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "grpOptions",
    "displayName": "Options",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "logStatus",
        "checkboxText": "Log script load status to console",
        "simpleValueType": true
      },
      {
        "type": "CHECKBOX",
        "name": "useCacheToken",
        "checkboxText": "Use Cache Token",
        "simpleValueType": true,
        "help": "Using a token makes sure that the script is loaded only once, even if the tag might be executed several times on the same page",
        "defaultValue": true
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const log = data.logStatus === true ? require('logToConsole') : function(x){};

let index = 0, errorUrls = [], successUrls = [];

function loadNextScript() {
  if (index < data.scriptsTable.length) {
    let x = data.scriptsTable[index];
    if (x.scriptUrl) {
      injectScript(
        x.scriptUrl,
        e => { successUrls.push(x.scriptUrl); index++; loadNextScript(); },
        e => { errorUrls.push(x.scriptUrl); index++; loadNextScript(); },
        data.useCacheToken ? x.scriptUrl : null
      );
    }
  } else {
    if (errorUrls.length === 0) {
      log("All scripts loaded without errors:\n " + successUrls.join("\n"));
      data.gtmOnSuccess();
    } else {
      // error loading at least one script
      log("Some scripts could not be loaded:\n" + errorUrls.join("\n") + 
          "\n\n. Successfully loaded scripts:\n" + successUrls.join("\n"));
      data.gtmOFailure();
    }
  }
}

if (data.scriptsTable && data.scriptsTable.length > 0) 
  loadNextScript();
else 
  data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://cdn.jsdelivr.net/*"
              },
              {
                "type": 1,
                "string": "https://cdn.statically.io/*"
              },
              {
                "type": 1,
                "string": "https://*.github.io/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "all"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []
setup: ''


___NOTES___

Created on 8.9.2024, 12:38:31


