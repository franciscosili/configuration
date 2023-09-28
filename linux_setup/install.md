# Guide to install Linux KDE

1. Download Linux and install on Pendrive
2. Packages:
    1. Third-party packages install
    2. Update system packages (may take a while).
    3. Install packages
        1. `sudo apt udpate` (Debian)
        2. `sudo apt install terminator
        3. Download and install Google Chrome from web
        4. Install [kinto.sh](https://github.com/rbreaves/kinto):
            1. `/bin/bash -c "$(wget -qO- https://raw.githubusercontent.com/rbreaves/kinto/HEAD/install/linux.sh || curl -fsSL https://raw.githubusercontent.com/rbreaves/kinto/HEAD/install/linux.sh)"`
            2. It will probably fail. Do the following:
                ```
                $ cd ~/Downloads/kinto-master/xkeysnail
                $ sudo pip3 install --upgrade --break-system-packages .
                $ cd ~/Downloads/kinto-master
                $ source install/linux.sh
                ```
3. Clone configuration package (the one you are reading):
     ```
     $ cd ~/.config
     $ git clone https://github.com/franciscosili/configuration.git
     ```
4. Setup zsh:
     1.  Install zsh:
         ```
         $ sudo apt update
         $ sudo apt install zsh -y
         ```
     2. Install oh-my-zsh
         ```
         $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
         ```
     3. Copy functions, aliases and the p10k theme to the home directory
         ```
         $ cd ~/.config/configuration/zsh
         $ cp .zsh_alias .zsh_functions ~/
         $ cp .p10k.zsh ~/
         ```
     4. Copy custom themes to the oh-my-zsh themes folder
         ```
         $ cp multiline.zsh-theme sili.zsh-theme ~/.oh-my-zsh/themes/
         ```
     5. Setup oh-my-zsh plugins
        ```
        $ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        $ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        $ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
        ```
     6. Copy the .zshrc file
     7. Probably will need to install fonts for the p10k theme. Follow [these instructions](https://github.com/romkatv/powerlevel10k#manual-font-installation). Then restart the terminal app and change the fonts accordingly.
5. Setup Terminator
    1. Copy the config file from this repo in the `terminator` directory and also the `plugins/` folder
        ```
        $ cd ~/.config/configuration/terminator
        $ mkdir -p ~/.config/terminator
        $ cp -r config plugins ~/.config/terminator
        ```
7. Reboot to apply all changes up to now
8. In case bluetooth stopped working after reboot, follow [this tutorial](https://ubuntuforums.org/showthread.php?t=2486644&s=4226c9ec1c0c742d4ada675123450077&p=14142022#post14142022)
9. Setup vim (__WIP__)
    ```
    $ sudo apt-get install neovim
    ```
    Now we want to setup colors and plugins
10. Install TexLive
    ```
    $ sudo apt-get install texlive-full -y
    ```
11. Install tmux: follow instructions in tmux directory.
    If `tmux` not installed:
    ```
    $ sudo apt-get install tmux
    ```
12. Install mamba and ROOT and python
    1. Download mamba from [here](https://github.com/conda-forge/miniforge#download)
    2. Execute the installer script and answer `yes` when asked if you want to initialize the base envorironment.
        ```
        $ bash Miniforge3-Linux-x86_64.sh
        ```
    3. Install `ROOT` and `Python`:
        ```
        $ mamba create --name pyroot root=6.28.4 python=3.11
        ```
13. Install VSCode
    - Ubuntu:
       1. Download the `.deb` file from the official [VSCode webpage](https://code.visualstudio.com/docs/setup/linux)
        ```
        $ sudo apt install ./<file>.deb
        ```
        In case you have the following error:
        ```
        permission error when installing ttf-mscorefonts-installer/Can't drop privileges as file couldn't be accessed by user '_apt'
        ```
        do
        ```
        $ sudo chown _apt /var/lib/update-notifier/package-data-downloads/partial/
        ```
        and try installing it again.
14. Install cernbox
    ```
    
    ```
