FROM quay.io/toolbx/arch-toolbox:latest

LABEL com.github.containers.toolbox="true" \
      name="devbox" \
      version="base-devel" \
      usage="This image is meant to be used with the toolbox command" \
      summary="Arch Linux based development environment image for creating toolbox containers" \
      maintaner="pedrohenrickqa@gmail.com"

COPY extra-packages /
RUN xargs -a extra-packages pacman -Syu --needed --noconfirm \
    && rm extra-packages \
    && yes | pacman -Scc

COPY files config.sh /
RUN chmod +x config.sh \
    && config.sh \
    && rm -rf config.sh files
