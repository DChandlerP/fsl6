FROM ubuntu:18.04

# Core system capabilities required.
# fslreorient2std needs bc
# /usr/local/fsl/bin/standard_space_roi needs dc
# flirt needs libopenblas-dev
RUN apt-get update && apt-get install -y \
    bc \
    dc \
    libopenblas-dev \
    npm \
    python \
    tar \
    unzip \
    wget \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Run FSL installer and remove unneeded directories
RUN wget -q http://fsl.fmrib.ox.ac.uk/fsldownloads/fslinstaller.py && chmod 775 fslinstaller.py
# The additional arguments allow for this to be non interactive.
RUN /fslinstaller.py -d /usr/local/fsl

#https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslEnvironmentVariables
#FSL needs these environment variables
ENV FSLDIR=/usr/local/fsl
ENV PATH=$FSLDIR/bin:$PATH
#CLI for the software doesn't work properly without this
RUN /bin/bash -c 'source /usr/local/fsl/etc/fslconf/fsl.sh'
ENV FSLMULTIFILEQUIT=TRUE
ENV FSLOUTPUTTYPE=NIFTI_GZ
RUN ln -s /usr/local/fsl/bin/eddy_openmp /usr/local/fsl/bin/eddy


