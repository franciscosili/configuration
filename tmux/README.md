Here is all the configuration to get oh-my-tmux.


# Installation of tmux in lxplus
To configure tmux on lxplus it is necessary to install a new version of tmux, as the one by default there is 1.8.

The ideal scenario is to install the `bin` file in `~/.local/` and keep all the compiled library in `EOS`.

To procedure is as follows:
1. Install `libevent` library:
   1. Go to where you want to build the library. It's better to do it in `EOS`:
   2. Download it form git:
        ```
        git clone https://github.com/libevent/libevent.git
        cd libevent
        # generate configuration file
        source autogen.sh
        ```
   3. Now identify where you want to install the binary. I installed it in `afs` in my home folder: `/afs/cern.ch/user/f/fsili/.local` and the configure the library:
        ```
        ./configure --prefix=$HOME/.local --enable-shared
        ```
   4. Compile:
        ```
        make && make install
        ```
2. Install tmux:
   1. Go to where you want to build it in `EOS`:
   2. Download it form git:
        ```
        git clone https://github.com/tmux/tmux.git
        cd tmux
        # generate configuration file
        source autogen.sh
        ```
   3. Now identify where you want to install the binary. I installed it in `afs` in my home folder: `/afs/cern.ch/user/f/fsili/.local` and the configure the library:
        ```
        PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig ./configure --prefix=$HOME/.local
        make && make install
        ```
3. Add new libraries paths to your startup script. Add the following lines to your `.bashrc` or `.zshrc`
    ```
    export PATH=$HOME/.local/bin:$PATH
    export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH
    export MANPATH=$HOME/.local/share/man:$MANPATH
    ```


# Installation of oh-my-tmux
Link with all the documentation: https://github.com/gpakosz/.tmux

1. Clone the repository
    ```
    git clone https://github.com/gpakosz/.tmux.git ~/.config/oh-my-tmux
    ```
2. Next go to your home directory and link the configuration file for tmux with the one coming inside the repo
    ```
    ln -s -f .config/oh-my-tmux/.tmux.conf
    cp .config/oh-my-tmux/.tmux.conf.local .
    ```
    Only the `.tmux.conf.local` configuration file has to be modified. DO NOT MODIFY `.tmux.conf`

My configuration file for the local one is in this folder. Copy this one if you want to use this configuration