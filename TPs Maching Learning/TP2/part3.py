# -*- coding: utf-8 -*-
"""
Created on Sun Dec  8 13:30:43 2019

@author: elitebook
"""

import numpy as np
import 
#partie 3

#A/
   #1/
X1=np.array([[1,-1,2],
          [2,0,0],
          [0,1,-1]])
   #2/ 
print(X1)
mm=X1.mean()

ec=X1.var()

   #3  
normed_matrix =scale(X1)
print(normed_matrix)


   # 4/ 
MN=x_normed.mean()
VN=x_normed.var()

# B/ 

   #1/
X2=np.array([[1,-1,2],
          [2,0,0],
          [0,1,-1]])
    #2/ 
print(X2)
MX2=X2.mean()
    #3/
min_max_scaler = preprocessing.MinMaxScaler()
X2_minmax = min_max_scaler.fit_transform(X2)
print(X2_minmax)

#C/
    #1/
iris2=load_iris()
    #2/
a = 0
b= 1
forma = plt.FuncFormatter(lambda i, *args: iris2.target_names[int(i)])
plt.scatter(iris2.data[:, a], iris2.data[:, b], c=iris2.target)
plt.colorbar(ticks=[0, 1, 2], format=forma)
plt.xlabel(iris2.feature_names[a])
plt.ylabel(iris2.feature_names[b])