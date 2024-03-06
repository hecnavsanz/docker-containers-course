from modules.utils import load_dataframe, save_dataframe

# dataframe from local or shared file system
df_path = "../data/iris-test.csv"
# dataframe attributes
df_attrs = ['sepal-length', 'sepal-width', 'petal-length', 'petal-width', 'class']
# load dataframe
iris_flowers_df = load_dataframe(df_path, df_attrs)

# print summary statistics
iris_flowers_sum = iris_flowers_df.describe()
print('Summary Statistics')
print(iris_flowers_sum)

# save statistics dataframe
csv_path = "../results/csv/iris-test-stats-summary.csv"
csv_cols = ['sepal-length', 'sepal-width', 'petal-length', 'petal-width']
save_dataframe(iris_flowers_sum, csv_path, csv_cols)
