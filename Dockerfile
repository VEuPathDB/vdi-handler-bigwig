FROM veupathdb/vdi-plugin-base:1.0.7

RUN apt-get update && apt-get install -y \
    python3-pip

RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir numpy && \
    pip3 install --no-cache-dir pyBigWig

COPY bin/ /opt/veupathdb/bin
#COPY testdata/ /opt/veupathdb/testdata

RUN export LIB_GIT_COMMIT_SHA=dca2f7a57e138b6ea710d8df0fbbef8f0f1710b6\
    && git clone https://github.com/VEuPathDB/lib-vdi-plugin-rnaseq.git \
    && cd lib-vdi-plugin-rnaseq \
    && git checkout $LIB_GIT_COMMIT_SHA \
    && mkdir -p /opt/veupathdb/lib/perl \
    && cp lib/perl/BigWigUtils.pm /opt/veupathdb/lib/perl \
    && cp bin/* /opt/veupathdb/bin

RUN chmod +x /opt/veupathdb/bin/*

