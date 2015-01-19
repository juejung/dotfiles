import subprocess as sp
"""This does NOT work. It starts a Python instance and when that is running
conda cannot update itself"""
"""
Just run this from command line:
conda install pip ipython spyder numpy numba pandas blaze cython scipy sympy scikit-learn statsmodels xlsxwriter django matplotlib seaborn
conda update anaconda pip ipython spyder numpy numba pandas blaze cython scipy sympy scikit-learn statsmodels xlsxwriter django matplotlib seaborn
"""

sp.call("conda update anaconda", shell=True)
sp.call("conda update pip", shell=True)
sp.call("conda update ipython", shell=True)
sp.call("conda update spyder", shell=True)

sp.call("conda update numpy", shell=True)
sp.call("conda update numba", shell=True)
sp.call("conda update pandas", shell=True)
sp.call("conda update blaze", shell=True)
sp.call("conda update cython", shell=True)

sp.call("conda update scipy", shell=True)
sp.call("conda update sympy", shell=True)
sp.call("conda update scikit-learn", shell=True)
sp.call("conda update statsmodels", shell=True)
sp.call("conda update xlsxwriter", shell=True)

sp.call("conda update django", shell=True)

sp.call("conda update matplotlib", shell=True)
sp.call("conda update seaborn", shell=True)

