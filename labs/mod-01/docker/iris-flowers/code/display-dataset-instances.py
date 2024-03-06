import sys
from modules.utils import load_dataframe

# get the number of instances (rows) to display
num = int(sys.argv[1])

# dataframe from remote
ds_url = "https://raw.githubusercontent.com/jbrownlee/Datasets/master/iris.csv"
# dataframe attributes
df_attrs = ['sepal-length', 'sepal-width', 'petal-length', 'petal-width', 'class']

# display <N> instances (rows) with the attributes
iris_flowers_ds = load_dataframe(ds_url, df_attrs)
print(iris_flowers_ds.head(num))
