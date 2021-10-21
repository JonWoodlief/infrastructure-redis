# Supporting scripts

The script directory contain scripts to
  * Enable one to run the template from localhost/tekton script leveraging our CI/CD environment variable  
    * **main.sh** top level script to execute from local/ci/cd script
    * **set_env.sh** converts typical script environment variables, into a terraform variable context
  * Template driven scripts to drive configuration, or things that can not be driven from a template

  ### To run locally:  
  * export APIKEY=\<api key to use with ibm provider\>
  * Run from the top of this repo/project: `main.sh [env] [region] [rg]` e.g.:
    ```
    ./scripts/main.sh prod us-south <target resource group id>
    ```