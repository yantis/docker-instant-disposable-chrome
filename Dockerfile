############################################################
# Dockerfile for Chrome over SSH with X-Forwarding.
#
# Based on Arch Linux
#
# FROM yantis/archlinux-tiny
# FROM yantis/archlinux-small
# FROM yantis/archlinux-small-ssh-hpn
# FROM yantis/ssh-hpn-x
# YOU ARE HERE
############################################################

FROM yantis/ssh-hpn-x
MAINTAINER Jonathan Yantis <yantis@yantis.net>

    # Update and force a refresh of all package lists even if they appear up to date.
RUN pacman -Syyu --noconfirm && \

    # Install Google Chrome
    pacman --noconfirm -S google-chrome libexif && \

    # Cleanup
    rm -r /usr/share/man/* && \
    rm -r /usr/share/doc/* && \
    bash -c "echo 'y' | pacman -Scc >/dev/null 2>&1" && \
    paccache -rk0 >/dev/null 2>&1 &&  \
    pacman-optimize && \
    rm -r /var/lib/pacman/sync/*

CMD ["/init"]
