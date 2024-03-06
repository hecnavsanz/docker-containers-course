import sys
from modules.utils import load_dataframe, save_pyplot
from pandas.plotting import scatter_matrix
from matplotlib import pyplot as plt

# get the data and results directories
data_dir = str(sys.argv[1])
results_dir = str(sys.argv[2])

# dataframe from local or shared file system
df_path = data_dir + "/iris-train.csv"
# dataframe attributes
df_attrs = ['sepal-length', 'sepal-width', 'petal-length', 'petal-width', 'class']
# load dataframe
iris_flowers_df = load_dataframe(df_path, df_attrs)

# box and whisker plots
iris_flowers_df.plot(kind='box', subplots=True, layout=(2, 2), sharex=False, sharey=False)
fn_path = results_dir + "/images/iris-train-box-whisker.png"
save_pyplot(plt, fn_path, fmt='png')

# histograms
iris_flowers_df.hist()
fn_path = results_dir + "/images/iris-train-histograms.png"
save_pyplot(plt, fn_path, fmt='png')

# scatter plot matrix
scatter_matrix(iris_flowers_df)
fn_path = results_dir + "/images/iris-train-scatter-matrix.png"
save_pyplot(plt, fn_path, fmt='png')
