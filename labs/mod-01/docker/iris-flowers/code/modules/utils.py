from pandas import read_csv, DataFrame
import pickle  # pickle is not secure
# import csv
# from io import StringIO
# from numpy import random
# from sklearn.model_selection import train_test_split


# load dataframe in memory
def load_dataframe(df_path, df_attrs):
    return read_csv(filepath_or_buffer=df_path, names=df_attrs)


# save dataframe to csv
def save_dataframe(df, csv_path, csv_cols):
    df.to_csv(path_or_buf=csv_path, columns=csv_cols)


# save output to csv
def save_report(output, rpt_path):
    with open(rpt_path, 'w') as file:
        file.write(output)
        file.close()


# save visualization to image file
def save_pyplot(plt, fn_path, fmt='png'):
    plt.savefig(fname=fn_path, format=fmt)


# save model to file
def save_model(model, fn_path):
    pickle.dump(model, open(fn_path, 'wb'))


# load model from file
def load_model(fn_path):
    return pickle.load(open(fn_path, 'rb'))


# split-out train dataframe
#   sample to create train and test dataframes:
#     x_train, x_test, y_train, y_test = split_train_test_dataframes(sample_df, cols_to_x, cols_to_y, random_seed)
# def split_train_test_dataframes(df, x_num, y_num, rnd_seed):
#     df_array = df.values
#     x = df_array[:, 0:x_num]
#     rnd_state = random.RandomState(rnd_seed)
#     y = df_array[:, y_num]
#     return train_test_split(x, y, test_size=0.20, random_state=rnd_state)


# populate dataframe
def dataframe_results(models, means, stds):
    return DataFrame({'Model': models, 'Mean': means, 'StdDev': stds})
