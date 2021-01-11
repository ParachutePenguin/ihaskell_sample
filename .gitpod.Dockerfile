FROM gitpod/workspace-full
USER gitpod

ENV PATH=/home/gitpod/.local/bin:$PATH

RUN sudo apt-get install -y python3-pip git libtinfo-dev libzmq3-dev libcairo2-dev libpango1.0-dev libmagic-dev libblas-dev liblapack-dev
RUN sudo apt update -y && sudo apt upgrade -y
RUN brew install haskell-stack
RUN stack install brittany hlint
RUN git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules \
    && cd haskell-ide-engine  \
    && stack install haskell-ide-engine \
    && cd .. \
    && rm -rf haskell-ide-engine

RUN curl -sSL https://get.haskellstack.org/ | sh -f
RUN git clone https://github.com/gibiansky/IHaskell \
    && sudo apt update -y && sudo apt upgrade -y \
    && cd IHaskell \
    && pip3 install -r requirements.txt
    
RUN ihaskell install --stack
RUN jupyter labextension install jupyterlab-ihaskell
