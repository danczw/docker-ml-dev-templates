FROM continuumio/miniconda3
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# copy local files to image
WORKDIR /app
COPY . /app

# Make RUN commands use `bash --login`
SHELL ["/bin/bash", "--login", "-c"]

# create conda env and install dependencies
RUN conda env create -f environment.yml
# activate env when running container
RUN echo "conda activate myenv" >> ~/.bashrc

# let RUN commands use the miniconda env
SHELL ["conda", "run", "-n", "myenv", "/bin/bash", "-c"]
