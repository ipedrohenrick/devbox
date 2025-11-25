FROM quay.io/toolbx/arch-toolbox:latest AS build

LABEL com.github.containers.toolbox="true" \
      name="devbox" \
      version="base-devel" \
      usage="This image is meant to be used with the toolbox command" \
      summary="Arch Linux based development environment image for creating toolbox containers" \
      maintaner="Pedro Henrick <pedrohenrickqa@gmail.com>"

COPY extra-packages /
RUN sed -i -e 's/#Color/Color/g' /etc/pacman.conf \
    && pacman-key --init && pacman-key --populate \
    && pacman -Syu --noconfirm \
    && xargs -a extra-packages pacman -Syu --needed --noconfirm \
    && rm extra-packages \
    && pacman -Scc --noconfirm


FROM build AS config

COPY skel /etc/skel
RUN sed -i -e "s/SHELL=.*bash/SHELL=\/bin\/zsh/g" /etc/default/useradd
