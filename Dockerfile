FROM ubuntu:18.04
MAINTAINER ian.ad@gmx.us

RUN apt-get update && \
    apt-get install -y wget git make g++ qt5-qmake qt5-default && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/r03ert0/meshgeometry && \
    git clone -b devel https://github.com/cnr-isti-vclab/vcglib

RUN cd vcglib/apps/tridecimator && \
    qmake tridecimator.pro && \
    make

#RUN ["git", "clone", "https://github.com/r03ert0/meshgeometry"]
#RUN ["git", "clone", "-b", "devel", "https://github.com/cnr-isti-vclab/vcglib"]
#RUN ["qmake", "tridecimator.pro"]
#RUN ["make"]
#RUN ["cd", ".."]
# RUN ["wget", "ftp://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/6.0.0/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz"]
