# buildx with 
# docker buildx build -t andrewufrank/xfce-pluseditors:deb10.1.x1.1.e1 --platform linux/arm/v7,linux/arm64,linux/amd64  --push .

# include a set of always used gui based tools

### questons: nemo or thunar?
# firefox or chrome?
# file-roller or archive??
 
# nemo extension sudo add-apt-repository ppa:gfunkmonk/nemo

# Options:
# Persistent home folder stored on host with   --home
# Shared host folder with                      --share DIR
# Hardware acceleration with option            --gpu
# Clipboard sharing with option                --clipboard
# ALSA sound support with option               --alsa
# Pulseaudio sound support with option         --pulseaudio
# Language setting with                        --lang [=$LANG]
# Printing over CUPS with                      --printer
# Webcam support with                          --webcam
#
# Look at x11docker --help for further options.

FROM andrewufrank/xfce-plusone:deb10.1.x1.1

RUN apt-get update &&  \ 
    env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
#        xorg 
        synaptic apt-xapian-index \
#        xrdp network-manager-gnome \
        gedit gedit-plugins     \
#        avahi-daemon avahi-utils avahi-discover avahi-ui-utils \
#        meld file-roller git-gui cups \
        firefox-esr  \
        thunderbird lightning \
        nemo nemo-fileroller \
        evince \
    && rm -rf /var/lib/apt/lists/*

CMD ["startxfce4"]
