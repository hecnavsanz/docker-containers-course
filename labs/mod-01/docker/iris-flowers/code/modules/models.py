from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import StratifiedKFold, cross_val_score
from sklearn.naive_bayes import GaussianNB
from sklearn.neighbors import KNeighborsClassifier
from sklearn.svm import SVC
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report, ConfusionMatrixDisplay
from numpy import random  # RandomState is deprecated


# logistic regression
def logistic_regression(slvr, mc):
    return LogisticRegression(solver=slvr, multi_class=mc)


# Linear Discriminant Analysis
def linear_discriminant_analysis(slvr):
    return LinearDiscriminantAnalysis(solver=slvr)


# K-Nearest Neighbors
def kneighbors_classifier():
    return KNeighborsClassifier()


# Classification and Regression Trees
def decisiontree_classifier():
    return DecisionTreeClassifier()


# Gaussian Naive Bayes
def gaussian_nb():
    return GaussianNB()


# Support Vector Machines
def svm(gm):
    return SVC(gamma=gm)


# train/test indices to split data in train/test sets
def train_test_split_datasets(n_splt, rnd_seed, shfl):
    rnd_state = random.RandomState(rnd_seed)
    return StratifiedKFold(n_splits=n_splt, random_state=rnd_state, shuffle=shfl)


# evaluates score by cross-validation
def cross_validation_eval_score(mdl, x_trn, y_trn, tts_ds, scr):
    return cross_val_score(mdl, x_trn, y_trn, cv=tts_ds, scoring=scr)


# evaluate predictions to get: accuracy, errors and class report
def evaluate_predictions(test_data, predicts):
    return (accuracy_score(test_data, predicts),
            confusion_matrix(test_data, predicts),
            classification_report(test_data, predicts))


# create evaluation errors display
def create_eval_errors_display(evalerrs, lbls):
    return ConfusionMatrixDisplay(confusion_matrix=evalerrs, display_labels=lbls)
