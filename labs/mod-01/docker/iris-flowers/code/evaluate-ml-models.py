import sys
from modules.models import (logistic_regression, linear_discriminant_analysis, kneighbors_classifier,
                            decisiontree_classifier, gaussian_nb, svm, train_test_split_datasets,
                            cross_validation_eval_score)
from modules.utils import (load_dataframe, dataframe_results, save_dataframe, save_pyplot,
                           save_model)
from matplotlib import pyplot as plt

# get the data and results directories
data_dir = str(sys.argv[1])
results_dir = str(sys.argv[2])

# dataframe from local or shared file system
df_path = data_dir + "/iris-train.csv"
# dataframe attributes (5 columns)
df_attrs = ['sepal-length', 'sepal-width', 'petal-length', 'petal-width', 'class']
# load dataframe
iris_flowers_df = load_dataframe(df_path, df_attrs)

# spot check algorithms
models = [('LR', logistic_regression(slvr='liblinear', mc='ovr')),
          ('LR', linear_discriminant_analysis(slvr='svd')),
          ('KNN', kneighbors_classifier()),
          ('CART', decisiontree_classifier()),
          ('NB', gaussian_nb()),
          ('SVM', svm(gm='auto'))]

# get x and y train dataframe
x_train = iris_flowers_df.values[:, 0:4]  # first 4 columns in df_attrs
y_train = iris_flowers_df.values[:, 4]  # last column in df_attrs

# evaluate each model in turn with train data
mean_results = []
std_results = []
model_names = []
model_eval_results = []
print('Model Evaluation Results')
for name, model in models:
    dsts = train_test_split_datasets(10, 1, True)
    cv_results = cross_validation_eval_score(model, x_train, y_train, tts_ds=dsts, scr='accuracy')
    model_eval_results.append(cv_results)
    model_names.append(name)
    mean_results.append(cv_results.mean())
    std_results.append(cv_results.std())
    print('%s: %f (%f)' % (name, cv_results.mean(), cv_results.std()))

# save model evaluation results to csv file
csv_path = results_dir + "/csv/iris-models-evaluation.csv"
csv_cols = ['Model', 'Mean', 'StdDev']
df_results = dataframe_results(model_names, mean_results, std_results)
save_dataframe(df_results, csv_path, csv_cols)

# save model evaluation results to image file
plt.boxplot(model_eval_results, labels=model_names)
plt.title('Algorithm Comparison')
fn_path = results_dir + "/images/iris-model-eval-results.png"
save_pyplot(plt, fn_path, fmt='png')

# save the best ml model with train data to file
best_model_name = df_results.max()['Model']
fn_path = results_dir + "/models/iris.mlm"
for name, model in models:
    if name == best_model_name:
        model.fit(x_train, y_train)
        save_model(model, fn_path)
print('Best Model: %s' % best_model_name)
