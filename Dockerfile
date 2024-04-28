FROM pytorch/pytorch:1.9.1-cuda11.1-cudnn8-runtime

LABEL author="Vishal Bhashyaam"
LABEL description="Default container definition for class competition."

# Create app directory
WORKDIR /app

RUN pip install -U pytorch-lightning \
    graphviz==0.16 \
    "ipython>=7.20.0,<8" \
    notebook==6.4.6 \
    jupyter-client==7.1.2 \
    jupyter-contrib-nbextensions==0.5.1 \
    && jupyter contrib nbextension install --user \
    && pip install numpy==1.19.5 \
    scipy==1.7.3 \
    scikit-learn==0.24.2 \
    matplotlib==3.4.3 \
    pandas==1.3.4 \
    seaborn==0.11.2 \
    plotly==5.5.0 \
    tqdm==4.62.3

# copy executables to path
COPY . ./
RUN chmod u+x  scripts/* \
    && mv scripts/* /usr/local/bin/ \
    && rmdir scripts

# launch jupyter by default
CMD ["/bin/bash", "launch-notebook"]
