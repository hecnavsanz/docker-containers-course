import sys
from modules.utils import load_dataframe, load_model, save_pyplot, save_report
from modules.models import evaluate_predictions, create_eval_errors_display
from matplotlib import pyplot as plt

# get the data and results directories
data_dir = str(sys.argv[1])
results_dir = str(sys.argv[2])

# dataframe from local or shared file system
df_path = data_dir + "/iris-test.csv"
# dataframe attributes (5 columns)
df_attrs = ['sepal-length', 'sepal-width', 'petal-length', 'petal-width', 'class']
# load dataframe
iris_flowers_df = load_dataframe(df_path, df_attrs)

# get x and y train dataframe
x_test = iris_flowers_df.values[:, 0:4]  # first 4 columns in df_attrs
y_test = iris_flowers_df.values[:, 4]  # last column in df_attrs

# load the best ml model from file
fn_path = results_dir + "/models/iris.mlm"
model = load_model(fn_path)
# make predictions on test dataframe using test dataframe
predictions = model.predict(x_test)
# evaluate predictions
eval_accuracy, eval_errors, eval_class_report = evaluate_predictions(y_test, predictions)
print('Accuracy: %f' % eval_accuracy)
print('Error Matrix')
print(eval_errors)
print('Class Report')
print(eval_class_report)

# save evaluation confusion matrix
eval_errors_display = create_eval_errors_display(eval_errors, model.classes_)
eval_errors_display.plot()
fn_path = results_dir + "/images/iris-prediction-errors.png"
save_pyplot(plt, fn_path, fmt='png')
# save evaluation class report
rpt_path = results_dir + "/reports/iris-prediction-class-report.rpt"
save_report(eval_class_report, rpt_path)
