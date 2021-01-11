FROM gitpod/workspace-full
USER gitpod

ENV PATH=/home/gitpod/.local/bin:$PATH

RUN sudo apt-get install haskell-platform

RUN sudo apt-get install -y python3-pip git libtinfo-dev libzmq3-dev libcairo2-dev libpango1.0-dev libmagic-dev libblas-dev liblapack-dev

RUN sudo apt update -y && sudo apt upgrade -y

RUN sudo curl -sSL https://get.haskellstack.org/ | sh

RUN git clone https://github.com/gibiansky/IHaskell \
    && cd IHaskell \
    && stack install gtk2hs-buildtools \
    && stack setup \
    && stack install --fast \
    && stack exec ihaskell -- install --stack
