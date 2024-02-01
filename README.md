### Install all necessary utils on a local PC
1.  Install nodejs(npm)
    ```shell
    curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
    ```
sudo apt-get install -y nodejs
		
2. Install dataform
    ```shell
    npm i -g @dataform/cli                          
    ```

3. Instal and configure Cloud SDK using the next command:
    1. Gcloud Initialising
        ```shell
        gcloud init
        ```
    2. Create application_default_credentials.json. It is necessary for "dataform init-creds"
        ```shell
        gcloud auth application-default login   
        ```	
### Run Dataform on a local PC

1. Create a new Dataform project
    ```shell
    dataform init bigquery cdw --default-database dataform-tutorial-412218 --default-location us-central1
    ```
2. Create a credentials file  .df-credentials.json
    ```shell
    cd cdw
    dataform init-creds bigquery
    ```
3. Dataform run model
    ```shell
    cd GIT/dataform_example/edw/df
    ```
    ```shell
    dataform compile
    ```
    ```shell
    dataform run --dry-run
    ```
    ```shell  
    dataform run
    ```