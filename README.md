# Docker Machine Learning Templates

:whale2: :robot: :whale2:

Various Docker images for your ML development workflow using Anaconda. 

Each image includes a conda env using Python 3.9 and varying ML frameworks.

All images are available on [Docker Hub](https://hub.docker.com/u/danczw).

<br>

------

<br>

## Images

These images should be seen as baseline images for ML development. Python package versions are not defined to increase maintainability of the templates and can be update in the respective `.yml` files.

The envs running in the container can be extended by updating the respective image conda env file or via `conda install <module>` when connected to containter.

<table>
    <tr>
        <th>Image Name</th>
        <th>Packages</th>
        <th>Notes</th>
    </tr>
        <td>
            Base Image: py-ml-dev-base - [Docker Hub Link](https://hub.docker.com/r/danczw/py-ml-dev-base)
        </td>
        <td>
            All images include the following base Python packages (base_image):
            <ul>
                <li><a href="https://jupyter.org/">jupyter</a></li>
                <li><a href="https://matplotlib.org/">matplotlib</a></li>
                <li><a href="https://numpy.org/">numpy</a></li>
                <li><a href="https://pandas.pydata.org/">pandas</a></li>
                <li><a href="https://scikit-learn.org/">scikit-learn</a></li>
                <li><a href="https://www.scipy.org/">scipy</a></li>
                <li><a href="https://seaborn.pydata.org/">seaborn</a></li>
            </ul>
        </td>
        <td>
        </td>
    <tr>
        <td>
            Tensorflow Image: py-ml-dev-tf - [Docker Hub Link](https://hub.docker.com/r/danczw/py-ml-dev-tf)
        </td>
        <td>
            The tensorflow image extends the base image by the following packages:
            <ul>
                <li><a href="https://www.tensorflow.org/">tensorflow</a></li>
            </ul>
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            Tensorflow HuggingFace Image: py-ml-dev-huggingtf - [Docker Hub Link](https://hub.docker.com/r/danczw/py-ml-dev-huggingtf)
        </td>
        <td>
            The tensorflow huggingface image extends the base image by the following packages:
            <ul>
                <li><a href="https://www.tensorflow.org/">tensorflow</a></li>
                <li><a href="https://huggingface.co/docs/huggingface_hub/index">huggingface hub</a></li>
                <li><a href="https://huggingface.co/datasets/">huggingface datasets</a></li>
                <li><a href="https://huggingface.co/transformers/">huggingface transformers</a></li>
            </ul>
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            PyTorch Image: py-ml-dev-torch - [Docker Hub Link](https://hub.docker.com/r/danczw/py-ml-dev-torch)
        </td>
        <td>
            The pytorch image extends the base image by the following packages:
            <ul>
                <li><a href="https://pytorch.org/">pytorch</a></li>
            </ul>
        </td>
        <td>
            The environment is setup to use the pytorch library without CUDA. To use only CPU based pytorch, exchange the `pytorch-cpu` package with `pytorch` in `./pytorch_image/pytorch_env.yml` (resulting in extended build time).
        </td>
    </tr>
    <tr>
        <td>
            PyTorch HuggingFace Image: py-ml-dev-huggingtorch - [Docker Hub Link](https://hub.docker.com/r/danczw/py-ml-dev-huggingtorch)
        </td>
        <td>
            The pytorch huggingface image extends the base image by the following packages:
            <ul>
                <li><a href="https://pytorch.org/">pytorch</a></li>
                <li><a href="https://huggingface.co/docs/huggingface_hub/index">huggingface hub</a></li>
                <li><a href="https://huggingface.co/datasets/">huggingface datasets</a></li>
                <li><a href="https://huggingface.co/transformers/">huggingface transformers</a></li>
            </ul>
        </td>
        <td>
            The environment is setup to use the pytorch library without CUDA. To use GPU based pytorch, exchange the `pytorch-cpu` package with `pytorch` in (./pytorch_image/pytorch_env.yml)[./pytorch_image/pytorch_env.yml] (resulting in extended build time).
        </td>
    </tr>
</table>

<br>

------

<br>

## Setup

To build the image, cd into the respective image directory and run:

    docker build -t <tag> .

After build is completed, run it through:

    docker run -it -p 8888:8888 <tag>

Activate the conda env within the container:

    conda activate <env_name>

The [publish-to-hub.bash](publish-to-hub.bash) script can be used to bulk publish the images to Docker Hub. Make sure to have Docker Desktop running and to be logged in to Docker Hub.

    bash publish-to-hub.bash -u <docker_hub_username> -s <bool>

The `-s` flag can be used to scan the images.

<br>

------

<br>

## Jupyter Notebooks

To run jupyter notebooks, run the following command within the container:
```bash
jupyter notebook --ip 0.0.0.0 --port 8888 --no-browser --allow-root
```
Alternatively, an alias has been added to the `~/.bashrc` profile. Simply run `expose_jpt` within the containter terminal. 

By default, notebooks are either exposed to [http://127.0.0.1:8888/tree](http://127.0.0.1:8888/tree) or to the link displayed in the container terminal.

<br>

--------------------------------------------------------------------------------

<br>

# TODOs

☐ optimize image size