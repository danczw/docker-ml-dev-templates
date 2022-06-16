# Docker Machine Learning Templates

:whale2: :robot: :whale2:

Various Docker images for your ML development workflow using Anaconda. 

Each image includes a conda env using Python 3.9 and varying ML frameworks. All images include the following base Python packages (base_image):

- [`jupyter`](https://jupyter.org/)
- [`matplotlib`](https://matplotlib.org/)
- [`numpy`](https://numpy.org/)
- [`pandas`](https://pandas.pydata.org/)
- [`scikit-learn`](https://scikit-learn.org/)
- [`scipy`](https://www.scipy.org/)
- [`seaborn`](https://seaborn.pydata.org/)

The envs running in the container can be extended by updating the respective image conda env file.

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
docker run -it -p 8000:8000 <tag>
```
Activate the conda env
```bash
conda activate myenv
```