FROM continuumio/miniconda3
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# copy local files to image
WORKDIR /app
COPY . /app

# make RUN commands use `bash --login`
SHELL ["/bin/bash", "--login", "-c"]

# create conda env and install dependencies
RUN conda env create -f base_env.yml
# activate env when running container
RUN echo "conda activate base_env" >> ~/.bashrc

# let RUN commands use the miniconda env
SHELL ["conda", "run", "-n", "base_env", "/bin/bash", "-c"]

# make conda env available as kernel for jupyter
RUN python -m ipykernel install --user --name=base_env