FROM continuumio/miniconda3:4.10.3-alpine

COPY environment.yml .
RUN conda env update -f environment.yml