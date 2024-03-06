from modules.utils import load_dataframe, save_pyplot
from pandas.plotting import scatter_matrix
from matplotlib import pyplot as plt

# dataframe from local or shared file system
df_path = "../data/iris-test.csv"
# dataframe attributes
df_attrs = ['sepal-length', 'sepal-width', 'petal-length', 'petal-width', 'class']
# load dataframe
iris_flowers_df = load_dataframe(df_path, df_attrs)

# box and whisker plots
iris_flowers_df.plot(kind='box', subplots=True, layout=(2, 2), sharex=False, sharey=False)
fn_path = "../results/images/iris-test-box-whisker.png"
save_pyplot(plt, fn_path, fmt='png')

# histograms
iris_flowers_df.hist()
fn_path = "../results/images/iris-test-histograms.png"
save_pyplot(plt, fn_path, fmt='png')

# scatter plot matrix
scatter_matrix(iris_flowers_df)
fn_path = "../results/images/iris-test-scatter-matrix.png"
save_pyplot(plt, fn_path, fmt='png')
