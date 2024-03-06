import sys
from modules.utils import load_dataframe, save_dataframe

# get the data and results directories
data_dir = str(sys.argv[1])
results_dir = str(sys.argv[2])

# dataframe from local or shared file system
df_path = data_dir + "/iris-train.csv"
# dataframe attributes
df_attrs = ['sepal-length', 'sepal-width', 'petal-length', 'petal-width', 'class']
# load dataframe
iris_flowers_df = load_dataframe(df_path, df_attrs)

# print summary statistics
iris_flowers_sum = iris_flowers_df.describe()
print('Summary Statistics')
print(iris_flowers_sum)

# save statistics dataframe
csv_path = results_dir + "/csv/iris-train-stats-summary.csv"
csv_cols = ['sepal-length', 'sepal-width', 'petal-length', 'petal-width']
save_dataframe(iris_flowers_sum, csv_path, csv_cols)
