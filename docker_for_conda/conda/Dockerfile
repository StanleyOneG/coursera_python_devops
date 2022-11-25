FROM stanleyone1/ubuntu

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh -O ~/miniconda.sh &&  \
   /bin/bash ~/miniconda.sh -b -p /opt/conda && \
   rm ~/miniconda.sh && \
   ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
   echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
   echo "conda activate base" >> ~/.bashrc && \ 
   find /opt/conda/ -follow -type f -name '*.a' -delete && \
   find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
   /opt/conda/bin/conda clean -afy

# RUN opt/conda/bin/conda install -y \
#     plotly \
#     ipykernel \
#     pandas \
#     numpy \
#     nbformat \
#     requests \
#     bs4==4.10.0 \
#     lxml==4.6.4 \
#     html5lib==1.1

# RUN opt/conda/bin/pip install \
#     pycoingecko \
#     mplfinance \
#     randomuser

CMD [ "bin/bash" ]