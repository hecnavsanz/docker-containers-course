from modules.utils import load_dataframe

# dataframe from local or shared file system
df_path = "../data/iris-test.csv"
# dataframe attributes
df_attrs = ['sepal-length', 'sepal-width', 'petal-length', 'petal-width', 'class']

# print number of instances (rows) and attributes
iris_flowers_ds = load_dataframe(df_path, df_attrs)
print(iris_flowers_ds.shape)
