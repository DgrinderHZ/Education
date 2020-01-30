# -*- coding: utf-8 -*-
"""
Created on Sat Dec  7 14:44:29 2019

@author: elitebook
"""

# 1)
import numpy as np
from sklearn.impute import SimpleImputer
from sklearn.metrics import mean_squared_error



# 2)
n_base = 100

data1 = np.random.randn(n_base, 2) + [5, 5]
data2 = np.random.randn(n_base, 2) + [3, 2]
data3 = np.random.randn(n_base, 2) + [1, 5]

data = np.concatenate((data1, data2, data3))

print("Data shape is: ", data.shape)

np.random.shuffle(data)

n_samples = data.shape[0]


# 3) 

# définition du taux de lignes à valeurs manquantes
missing_rate = 0.3
n_missing_samples = int(np.floor(n_samples * missing_rate))

# choix des lignes à valeurs manquantes
missing_samples = np.hstack((np.zeros(n_samples - n_missing_samples, dtype=np.bool), np.ones(n_missing_samples, dtype=np.bool)))
np.random.shuffle(missing_samples)

# obtenir la matrice avec données manquates: manque indiqué 
# par valeurs NaN dans la seconde colonne pour les lignes 
# True dans missing_samples

data_missing = data.copy()
data_missing[np.where(missing_samples), 1] = np.nan

# imputation par la moyenne

imp = SimpleImputer(missing_values=np.nan, strategy='mean')
data_imputed = imp.fit_transform(data_missing)
#print(data_imputed)
print("data_imputed shape is: ", data_imputed.shape)
# calculer l'erreur d'imputation
err = mean_squared_error(data[missing_samples, 1], data_imputed[missing_samples, 1])


# 4) Affichage des  valeurs calculéss
print("Mean: ")
print(data_imputed.mean(0))


# 5) 
# imputation par la median
imp1 = SimpleImputer(missing_values=np.nan, strategy='median')
data_imputed1 = imp1.fit_transform(data_missing)
#print(data_imputed)
print("data_imputed1 shape is: ", data_imputed1.shape)
# calculer l'erreur d'imputation
err1 = mean_squared_error(data[missing_samples, 1], data_imputed1[missing_samples, 1])
print("Median: ")
print(np.median(data_imputed, 0))

# 6) 
# imputation par la constant zero
imp2 = SimpleImputer(missing_values=np.nan, strategy='constant', fill_value=0)
data_imputed2 = imp2.fit_transform(data_missing)
#print(data_imputed)
print("data_imputed1 shape is: ", data_imputed2.shape)
# calculer l'erreur d'imputation
err2 = mean_squared_error(data[missing_samples, 1], data_imputed2[missing_samples, 1])
print("zero: ")
print(np.median(data_imputed, 0), err2)

# 7)
'''from sklearn.impute import KNNImputer
knnimp = KNNImputer(n_neighbors=2, weights="uniform")
knn_data_imputed = knnimp.fit_transform(data_missing)
err3 = mean_squared_error(data[missing_samples, 1], knn_data_imputed[missing_samples, 1])
print("knn: ")
print(np.median(knn_data_imputed, 0), err3)
'''