# version 1.4-1
# docker-version 0.11.1
FROM        l3iggs/archlinux:latest
MAINTAINER  Seo Myunggyun "tki@tkism.org"

# We use a bootstrap script to avoid having temporary cache files and build
# dependencies being committed and included into the docker image.
ADD         bootstrap.sh /tmp/
RUN         chmod +x /tmp/bootstrap.sh && /tmp/bootstrap.sh

RUN         useradd znc
ADD         start-znc /usr/local/bin/

EXPOSE      16667
ENTRYPOINT  ["/usr/local/bin/start-znc"]
CMD         [""]
