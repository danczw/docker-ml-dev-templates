# Docker Machine Learning Templates

:whale2: :robot: :whale2:

Various Docker images for your ML development workflow using Anaconda. 

Each image includes a conda env using Python 3.9 and varying ML frameworks.

The envs running in the container can be extended by updating the respective image conda env file or via `conda install <module>` when connected to containter.

<br>

------

<br>

## Images

### base image

All images include the following base Python packages (base_image):

- [`jupyter`](https://jupyter.org/)
- [`matplotlib`](https://matplotlib.org/)
- [`numpy`](https://numpy.org/)
- [`pandas`](https://pandas.pydata.org/)
- [`scikit-learn`](https://scikit-learn.org/)
- [`scipy`](https://www.scipy.org/)
- [`seaborn`](https://seaborn.pydata.org/)

### tensorflow image

The tensorflow image extends the base image by the following packages:

- [`tensorflow`](https://www.tensorflow.org/)

<br>

------

<br>

## Setup

To build the image, cd into the respective image directory and run:
```bash
docker build -t <tag> .
```
After build is completed, run it through:
```bash
docker run -it -p 8888:8888 <tag>
```
Activate the conda env within the container:
```bash
conda activate <env_name>
```

<br>

------

<br>

## Jupyter Notebooks

To run jupyter notebooks, run following command within the container:
```bash	
jupyter notebook --ip 0.0.0.0 --port 8888 --no-browser --allow-root
```
Notebooks are either exposed to [http://127.0.0.1:8888/tree](http://127.0.0.1:8888/tree) or to the link displayed in the container terminal.