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
  "displayName": "jsDelivr Script Loader",
  "categories": [
    "UTILITY",
    "SALES"
  ],
  "brand": {
    "id": "mbaersch",
    "displayName": "mbaersch",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAABj1BMVEUAAADmTj2+SDvMSjvQSjraTDzmTj29SDu9SDvmTj3mTjzmTj3XSzzmTj2+SDvmTj3mTj29SDu9SDu+SDvmTjy+SDrmTj2/STrmTj29SDvmTj2+SDrmTj29SDu+SDu+RzvmTj3mTjzRSzzcTDy9SDvmTj3mTj29SDvmTT29SDvmTj3mTj29SDvmTj3jTTy/SDvmTj3nTj2+SDrnTT2/SDu9STq9SDu9SDu9SDvmTj3aTTy9SDu+SDu9SDu+SDvkTj29SDu9SDvmTj3fnCb+yC/+xi/cTDzASDu+SzrMbjL3vi3ckynnUT3tdTnATjnwhzfSfy/WiCzhnyfpXDzpYTvwgjjvfzjIZDXJaDT4rDPLazP6szL6tjH8vjDQejDscDruezjxjDfGXjb3qDP8wTDZjirakSnemCjdlSjfmifmTz3DVjjEWzf0mzXzlzXHYTX2oDTOcjP5rzLPdTHnVDzsbDrpiDXtljTypzH1ty7XiivdUDzqZjvfWjvmfTjykDbqkDTLaDTTfi/Ugy7Xhy0gJWumAAAAQXRSTlMA/foNCAT49d/PSxgG9O/t3M+sX10iIBfCl4iIem9TOjgoEfrp6ObXu7expqOVjntvZUovLinWwcCse25mV0I9MT0cJPgAAAJHSURBVDjLddP3W9pgEAdwCIYNsjcy3Ftr7V6UpG1ADJG99yoKCHV2jz+8771BUh7q99f7PJfL5SL6N6RKubPr8Yv+H9LvddmWFwn5uvuhZLYsOdjfWJGK3757HwjI5AbjtJmzmDZ1qIqCAES2umU0z/FVtUW5rdBAdQIghOyRfQEMabLNQ5XP0ecPASFa/QtSRDqkk2o8lrj6dd4XDOFEj3Ddgfj3YXIQOmmPutXjO/AcARMPPl7UaLrH3oSZNBcujoVsAQGlBoMvGZqicqXL9Hk4GGyNhdaDgHce6p/OaAqB5FW2GURppzGQHyLg0wGIFCiUTOIaNYBE8aR6KwIqBbwAbkCflb6lcIdWFj9jXQJLXkMgNoQG+UjmZsSgFp1oKgtgaw72vAmvmIcGvQodajFMo/G7z+FnONUAdsRjUIhkqNBJmKkyp9EOAMJNwrdwIXBUqaMRywUEgly2keZaRVjDSxFkXwpDsPl6JVmnQh0uXc2m+kwVgaVXGChhESU2UmYTvdqPn6lis9luMDCC/A0Gr1egQy2XGAxKycs/eA+dEQC9GYMDHXyKciGXjORoNAOE6wZQHlsxsCjwrtnCMJKneHB7GoAYJBiobPw1lGuJSh1AO8rXCbsaA/+GmP/g8YsYex2+LaZgzQB2xyfr0Agn97V7PDkoOVwDxLKngFUIR4ujNTyYnL7a59CJp4HsidE69Wd4t5fFAiD0bvPMr6V8CucPgFh1HpKi2ahMaxoxAkt2z/ifmiV7ikU8270hfc/42YT8Be4pvuDEw1JnAAAAAElFTkSuQmCC"
  },
  "description": "Loads multiple scripts that are stored on GitHub, npm or other sources that are available via jsdelivr.com",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "grpScripts",
    "displayName": "Script URLs to load from jsDelivr",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "SIMPLE_TABLE",
        "name": "scriptsTable",
        "displayName": "",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Enter one or multiple URLs from cdn.jsdelivr.net",
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

let errorUrls = [], successUrls = [];

function countSuccess(x) { 
  log("Script load success: ", x); 
  successUrls.push(x); 
}

function countError(x) { 
  log("ERROR loading script: ", x); 
  errorUrls.push(x); 
}

data.scriptsTable.forEach(x => {
  if (x.scriptUrl) {
    injectScript(
      x.scriptUrl,
      e => { countSuccess(x.scriptUrl); },
      e => { countError(x.scriptUrl); },
      data.useCacheToken ? x.scriptUrl : null
    );
  }
});


if (errorUrls.length === 0)
  data.gtmOnSuccess();
else
  data.gtmOnFailure();


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

scenarios:
- name: test load
  code: |-
    runCode();
    assertApi('injectScript').wasCalled();
    assertApi('gtmOnSuccess').wasCalled();


___NOTES___

Created on 8.9.2024, 12:38:31


