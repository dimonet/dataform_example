#### _The instruction describes how the Docker is instaled and configurated in the WSL tool (Ubuntu) without Docker Desktop._ 
https://nickjanetakis.com/blog/install-docker-in-wsl-2-without-docker-desktop 

### Activate Hyper-V in the Windows on a local PC
1. Win+R 
2. Type "optionalfeatures" in the search box
3. Turn On "Hyper-V" checkbox

### Install and configure WSL on a local PC
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

### Install and configure Docker in the WSL
1. Uninstall Docker Desktop  
   On my machine it added these 2 files in ~/.docker within my WSL 2 instance:
   ```
   lrwxrwxrwx  1 nick nick   30 Sep 16  2020 contexts -> /c/Users/Nick/.docker/contexts
   lrwxrwxrwx  1 nick nick   35 Aug 21 17:24 features.json -> /c/Users/Nick/.docker/features.json
   ```
   Uninstalling Docker Desktop will not remove those Windows paths so things will technically still work but if you ever delete them later you’ll end getting Docker endpoint for "default" not found errors when you try to run most Docker commands within WSL 2 since the symlinks will have no destination.

2. Install Docker / Docker Compose v2 in WSL 2
   1. Install Docker, you can ignore the warning from Docker about using WSL
      ```shell
      curl -fsSL https://get.docker.com -o get-docker.sh
      ```
      ```shell
      sudo sh get-docker.sh
      ```
   2. Add your user to the Docker group
      ```shell
      sudo usermod -aG docker $USER
      ```
   3. Sanity check that both tools were installed successfully
      ```shell
      docker --version
      ```
      ```shell
      docker compose version
      ```
3. Set iptables compatibility
   ```shel
   sudo update-alternatives --config iptables
   ```
   select iptables-legacy

4. Edit ~/.profile to docker auto run
   ```shell
   nano ~/.profile
   ```
    Add the next string at the end of the config file:      
   ```
   # Start Docker (if not already running)
   if grep -q "microsoft" /proc/version > /dev/null 2>&1; then
       if service docker status 2>&1 | grep -q "is not running"; then
           wsl.exe --distribution "${WSL_DISTRO_NAME}" --user root \
               --exec /usr/sbin/service docker start > /dev/null 2>&1
       fi
   fi
   ```
5. Check that Docker daemon running
   ```shell
   ps aux | grep docker
   ```

6. Test docker after cloasing current and opening a new terminal
   ```shell
   docker run hello-world
   ```
