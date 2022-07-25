FROM continuumio/miniconda3
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# copy local files to image
WORKDIR /app
COPY . /app

# make RUN commands use `bash --login`
SHELL ["/bin/bash", "--login", "-c"]

# create conda env and install dependencies
RUN conda env create -f pytorch_env.yml
# activate env when running container
RUN echo "conda activate pytorch_env" >> ~/.bashrc

# let RUN commands use the miniconda env
SHELL ["conda", "run", "-n", "pytorch_env", "/bin/bash", "-c"]

# add alias to bash profile for easy jupyter access
RUN echo 'alias expose_jpt="jupyter notebook --ip 0.0.0.0 --port 8888 --no-browser --allow-root"' >> ~/.bashrc

# make conda env available as kernel for jupyter
RUN python -m ipykernel install --user --name=pytorch_env