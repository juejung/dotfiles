ECHO Installing Anaconda package updates ...

REM Just run this from command line:
REM conda install pip ipython spyder numpy numba pandas blaze cython scipy sympy scikit-learn statsmodels xlsxwriter django matplotlib seaborn
REM conda update anaconda pip ipython spyder numpy numba pandas blaze cython scipy sympy scikit-learn statsmodels xlsxwriter django matplotlib seaborn

conda update conda
conda update anaconda
conda update pip
conda update ipython
conda update spyder

conda update numpy
conda update numba
conda update pandas
conda update blaze
conda update cython

conda update scipy
conda update sympy
conda update scikit-learn
conda update statsmodels
conda update xlsxwriter

conda update django

conda update matplotlib
conda update seaborn
conda update bokeh
conda install --channel https://conda.binstar.org/bokeh ggplot

conda update sphinx
conda install --channel https://conda.binstar.org/mpastell pweave
