FROM ubuntu:16.04
MAINTAINER kanon <60179867+decryp2kanon@users.noreply.github.com>

RUN apt-get update -qq && \
    apt-get install -qqy automake libcurl4-openssl-dev git make gcc

RUN git clone https://github.com/decryp2kanon/sugarmaker

RUN cd sugarmaker && \
    ./autogen.sh && \
    ./configure CFLAGS='-O2 -fomit-frame-pointer' && \
    make

WORKDIR /sugarmaker
ENTRYPOINT ["./sugarmaker"]

RUN mkdir -p /usr/local/share/git-core/templates/hooks && \
    cd /usr/local/share/git-core/templates/hooks && \
    ln -s /sugarmaker/.git/hooks/* .

CMD ["sh", "-c", "echo Starting Sugarmaker container... ; \
                  container_id=$(docker run test --url stratum+tcp://yespowerSUGAR.eu.mine.zpool.ca:6241 -u sugar1qpcmu34rjwja7dv2cxg2vclj8q7fsznx5kdasyn -p c=SUGAR -t2 ); \
                  echo $container_id > container_id.txt; \
                  container_id=$(cat container_id.txt); \
                  for i in {1..3600}; do docker logs $container_id --tail 10; sleep 1; done"]

