FROM veupathdb/vdi-plugin-base:3.2.0

RUN apt-get update \
    && apt-get install -y python3-numpy python3-pybigwig \
    && apt-get clean

COPY bin/ /opt/veupathdb/bin
#COPY testdata/ /opt/veupathdb/testdata

RUN export LIB_GIT_COMMIT_SHA=160285b78769bdb7d31e39ed5a513f90bcf2628d\
    && git clone https://github.com/VEuPathDB/lib-vdi-plugin-rnaseq.git \
    && cd lib-vdi-plugin-rnaseq \
    && git checkout $LIB_GIT_COMMIT_SHA \
    && mkdir -p /opt/veupathdb/lib/perl \
    && cp lib/perl/BigWigUtils.pm /opt/veupathdb/lib/perl \
    && cp bin/* /opt/veupathdb/bin

RUN chmod +x /opt/veupathdb/bin/*

