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
6. Reboot to apply all changes up to now
7. In case bluetooth stopped working after reboot, follow [this tutorial](https://ubuntuforums.org/showthread.php?t=2486644&s=4226c9ec1c0c742d4ada675123450077&p=14142022#post14142022)
8. Setup vim (__WIP__)
    ```
    $ sudo apt-get install neovim
    ```
    Now we want to setup colors and plugins
9. Install TexLive
    ```
    $ sudo apt-get install texlive-full -y
    ```
10. Install tmux: follow instructions in tmux directory.
    If `tmux` not installed:
    ```
    $ sudo apt-get install tmux
    ```
11. Install mamba and ROOT and python
    1. Download mamba from [here](https://github.com/conda-forge/miniforge#download)
    2. Execute the installer script and answer `yes` when asked if you want to initialize the base envorironment.
        ```
        $ bash Miniforge3-Linux-x86_64.sh
        ```
    3. Install `ROOT` and `Python`:
        ```
        $ mamba create --name pyroot root=6.28.4 python=3.11
        ```
12. Install VSCode
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
13. Install cernbox
    ```
    
    ```



# Linux appearance to macOS
Will be following [this tutorial](https://www.youtube.com/watch?v=jWDgdC28tYo&t=927s&ab_channel=LinuxScoop)

- Update
    ```
    sudo apt udpate
    sudo apt install curl rsync
    ```
- Enable flatpak
- Install flatseal
    ```
    flatpak install flathub com.github.tchx84.Flatseal
    ```
- Setup KDE: shortcuts, Desktops
    - Import shortcuts scheme from linx_keyboard directory
- Download files from [this page](https://www.pling.com/p/2062884/)
- Download MacSonoma KDE theme from `GlobalThemes` in Appearance
    - Alternative:
        ```
        $ cd Downloads
        $ git clone https://github.com/vinceliuice/MacSonoma-kde.git
        $ cd MacSonoma-kde
        $ ./install.sh --round
        ```
- Download WhiteSur Dar from the ApplicationStyle GTK themes
    - Alternative:
        ```
        cd Downloads
        git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
        cd WhiteSur-gtk-theme
        $ ./install.sh
        ```
- Install Lightly
    ```
    sudo apt install cmake build-essential libkf5config-dev libkdecorations2-dev libqt5x11extras5-dev qtdeclarative5-dev extra-cmake-modules libkf5guiaddons-dev libkf5configwidgets-dev libkf5windowsystem-dev libkf5coreaddons-dev libkf5iconthemes-dev gettext qt3d5-dev
    cd Downloads
    git clone --single-branch --depth=1 https://github.com/Luwx/Lightly.git
    cd Lightly && mkdir build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF ..
    make
    sudo make install
    ```
- Install Kvantum
    ```
    sudo add-apt-repository ppa:papirus/papirus
    sudo apt-get update
    sudo apt install qt5-style-kvantum qt5-style-kvantum-themes
    ```

- Install Icons
    ```
    cd Downloads
    git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git

    ```

- Install Cursors
    ```
    cd Downloads
    git clone https://github.com/vinceliuice/WhiteSur-cursors.git

    ```

- Install Latte Dock
    ```
    sudo apt install latte-dock
    ```
    1. Run Latte Dock and position it, edit it accordingly.
    2. Move the bottom panel to the top

- Modify the top panel
    1. Delete it
    2. Create New Panel, Empty
    3. Right click on it -> add new widgets -> Get new widgets
    4. Install the following widgets:
        - kpple
        - Better inline clock
        - Control Centre
        - Window title applet
    5. Add widgets:
        - kpple
        - better inline clock
        - control centre
        - window title applet
        - global menu
        - system tray

- Install themes, fonts, cursors, icons:
    - GlobalTheme: MacSonoma-Dark
    - Application Style: Lightly
    - Plasma Style: MacSonoma-Dark
    - Colors: MacSonoma-Dark
    - window dectorations: MacSonoma-Dark
    - Modify titlebar buttons order
    - fonts:
        - Adjust all fonts: SF Pro Display 8pt
        - Fixed Width: FiraCode Nerd Font Mono 8pt
    - Icons: WhiteSur-Dark
    - cursors: WhiteSur cursors
    - Splash screen: MacSonoma-Dark
    - __IMPORTANT__: LOGOUT AND LOGIN AGAIN

    - Workspace behaviour -> Screen Locking -> Select desired wallpaper
    - Startup and Shutdown -> Login Screen -> MacSonoma-Dark
    - Application Style -> configure GNOME/GTK application -> Select WhiteSur-Dark-Solid


- Install other apps:
    - Spotify
    - Mattermost
    - Skype
    - Whatsapp
    - __INSTALL THEM FROM THE DISCOVER APP__