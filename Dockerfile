# Start from debian linux image (DockerHub)
FROM debian:stable

# Add custom label
LABEL maintainer "monica <monica.sg7@gmail.com>" \
      version "0.1" \
      description "this container creates a VennDiagram of 4 given lists of genes"

# Install R (after apt-get update)
RUN apt-get update && apt-get install -y r-base

# Install R package 'ggplot2' and 'VennDiagram
RUN R -e 'install.packages("ggplot2", repos = "http://cloud.r-project.org/")'
RUN R -e 'install.packages("VennDiagram", repos = "http://cloud.r-project.org/")'

# Make the folder '/scripts' in the container
RUN mkdir /scripts

# Copy 'scripts/script.R' to the folder '/scripts' in the container
ADD VennDiagram.4groups.R /scripts

#url to image in dockerhub: https://hub.docker.com/repository/docker/msguixe/image_venn
