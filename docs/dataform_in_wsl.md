#### _The instruction describes how the Dataform is configurated and run on the local PC using the WSL tool (Ubuntu)._ 

### Install all necessary utils on a local PC
1. Instal WSL on a local PC (Windows PowerShell by Administrator)
    ```shell
    wsl --install -d ubuntu
    ```
2. Edit etc/sudoers to password entering disable
    ```shell
    sudo nano /etc/sudoers
    ```
    Add the next string at the end of the config file:   
    `dbuza ALL=(ALL) NOPASSWD: ALL` 


3. Mounting worked Windows folder ot the home WSL directory
   1. Create a new directory (e.g. 'git')  
      ```shell
      mkdir git
      ``` 

   2. Edit ~/.bashrc to docker auto run
      ```shell
      nano ~/.bashrc       
      ```
      Add the next string at the end of the config file:      
        ```
        # mount git folder
        win_dir=D:/dev_envs/dimonet/GIT
        wsl_dir=/home/dbuza/git
        sudo mount -t drvfs $win_dir $wsl_dir -o "metadata,rw,noatime,dirsync,mmap,access=client,msize=262144,trans=virtio"
        # Change permision
        sudo chown -R root:$(whoami) $wsl_dir
        sudo chmod -R 775 $wsl_dir
        ```

3. Install nodejs(npm)
   1. Install nodejs 
      ```shell
       sudo apt install npm
      ``` 
   2. Update version of the nodejs
      ```shell
      sudo npm cache clean -f
      ```
      ```shell
      sudo npm install -g n
      ```
      ```shell
      sudo n stable
      ```
 
2. Install dataform
    ```shell
    sudo npm i -g @dataform/cli                         
    ```

3. Instal and configure Cloud SDK using the next command:
    1. Gcloud Initialising
        ```shell
        gcloud init
        ```
    2. Create application_default_credentials.json. It is necessary for "dataform init-creds"
        ```shell
        gcloud auth application-default login               	

### Run Dataform on a local PC

1. Create a new Dataform project
    ```shell
    dataform init bigquery cdw --default-database dataform-tutorial-412218 --default-location us-central1
    ```
2. Create a credentials file  .df-credentials.json
    ```shell
    cd dataform_example/edw/df    
    ```
    ```shell    
    dataform init-creds bigquery
    ```
    _NOTES: the correct "Region" and "ProjectID" should be set absolutle the same like in the GCP datasets_


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