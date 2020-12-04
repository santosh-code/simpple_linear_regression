import pandas as pd 
import numpy as np
cc=pd.read_csv("C:/Users/USER/Desktop/cc.csv")
cc.columns="y","x"
import matplotlib.pylab as plt
####one variet analysis#####
plt.hist(cc.x)
plt.hist(cc.y)
plt.boxplot(cc.x)
plt.boxplot(cc.y)
cc.describe()
####bi variet analysis######
import scipy
from scipy import stats
stats.cor(cc.x,cc.y)

np.corrcoef(cc.x,cc.y)
plt.scatter(cc.x,cc.y)
import statsmodels.formula.api as smf
model=smf.ols("y~x",data=cc).fit()
model.summary()
pred=model.predict(pd.DataFrame(cc['x']))
pred
err=pred-cc.y
err_sq=err*err
err_mean=np.mean(err_sq)
err_sqrt=np.sqrt(err_mean)
err_sqrt
