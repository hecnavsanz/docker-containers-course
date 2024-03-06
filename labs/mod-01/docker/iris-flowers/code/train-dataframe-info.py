import sys
from modules.utils import load_dataframe

# get the data directory
data_dir = str(sys.argv[1])

# dataframe from local or shared file system
df_path = data_dir + "/iris-train.csv"
# dataframe attributes
df_attrs = ['sepal-length', 'sepal-width', 'petal-length', 'petal-width', 'class']

# print number of instances (rows) and attributes
iris_flowers_ds = load_dataframe(df_path, df_attrs)
print(iris_flowers_ds.shape)
