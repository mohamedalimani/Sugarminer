FROM            ubuntu:16.04
MAINTAINER      kanon <60179867+decryp2kanon@users.noreply.github.com>

RUN             apt-get update -qq && \
                apt-get install -qqy automake libcurl4-openssl-dev git make gcc

RUN             git clone https://github.com/decryp2kanon/sugarmaker

RUN             cd sugarmaker && \
                ./autogen.sh && \
                ./configure CFLAGS='-O2 -fomit-frame-pointer' && \
                make

WORKDIR         /sugarmaker
ENTRYPOINT      ["./sugarmaker"]
