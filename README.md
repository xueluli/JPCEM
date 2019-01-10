# JPCEM
Collaborative Priors for Multi-view ATR
######### ATR database #########
_The Mid-Wave InfrarRed (MWIR) data base is the database collected by the US Army Night Vision and Electronic Sensors Directorate (NVESD) that is intended to support the ATR algorithm development community. The details about how the images are extracted, stored and labeled can be seen in the User Reference Guide.pdf from the original database. In the MWIR ATR database folder provided, only the processed data and the programs are available_

# Content of MWIR ATR database folder #

**ATR GUI revised:**
`ATR_GUI.fig`: GUI.
`ATR_GUI.m`: program of the GUI.

[Data##]
Include the images used in the GUI. 

**Multiview SRC:**
`ImExtr.m`: used to form the training data and the test data.
`MWIR_multiView.mat`: multi-view database including the training data, the training labels, the test data, and the test labels.
(the label rule: 504: the view 5 from the class 04)
`records.xlsx`: includes the parameters used for extracting the training data and the test data.
**Programs:**
[data]
`MWIR_multiView.mat`: same as above.
`cegr0####_#######`: image samples used for the program `Demo3_Sample_Test.m`
[SPAMS]
includes programs for the reweighted l_1 algorithm.
`AccDiffTrain.mat, AccDiffViews.mat, AccNormal.mat`: data calculated in advance used for `Demo1_Statistical_Results.m`.
[utils]
includes utility programs used for the main programs of the algorithm.
`label_to_range.m`: used for calculating the ranges of different labels.
`PickDfromY_train.m`: used for picking out samples used for forming the dictionary from the trainig data.
`FormDicfromYtrain.m`: used for forming the final dictionary according to the training size and the number of views. 
`Label_Pred.m`: used for predicting the label.
`calc_acc.m`: used for calculating the classification accuracy.

The rest files are divided into two categories:
1. Demonstration programs:
`Demo1_Statistical_Results.m`: used for demonstrating the statistical comparison results.
`Demo2_Accuracy_Computation.m`: used for demonstrating how to calculate the overall classification accuracy of the test data.
`Demo3_Sample_Test.m`: used for demonstrating how to predict the label a single test image (the utilized image samples are stored in [data]).
2. Main programs for the algorithms:
`JPCEM_wrapper.m, JPCEM_pred.m, JPCEM.m`: the main programs of our algorithm. where `JPCEM_wrapper.m` is the top program (relation: `JPCEM_wrapper.m`> `JPCEM_pred.m`> `JPCEM.m`).
`JPCEM_wrapper.m`: the output is the classification accuracy.
`JPCEM_pred.m`:  the output is the label of the test sample.
`JPCEM.m`: the output is the sparse coefficients of the test sample.

# The structure of the data base which can be used for the programs #
"MWIR_multiView.mat" is an example of the final version data which is ready for being directly utilized in the programs provided in the folder **Programs**. Its stucture is described as below:
[Training data]
% Y_train %: a 800*6350 matrix including vectors of size 800*1 formed by 127 images from each class (10 classes) each view (5 views).
% label_train %: a 1*6350 vector including the labels of the images used for forming % Y_train %.
[Test data]
% Y_test %: a 800*6350 matrix including vectors of size 800*1 formed by 127 images from each class (10 classes) each view (5 views).
% label_test %: a 1*6350 vector including the labels of the images used for forming % Y_test %.

Note:
1. There is no overlapping data between % Y_train % and % Y_test %.
2. The label of a image is defined as 'ABC', 'A' is the view number in [1 2 3 4 5], 'BC' is the class number in [01, 02, 03, ... , 10].
3. All the data bases should be converted into the same structure as described above in order to use the programs provided in the **Programs**.
4. "MWIR_multiView.mat" is located in "../MWIR ATR database/Multiview SRC" (where it is produced) and "../MWIR ATR database/Programs/data_1"
(where it can be better utilized by the provided programs).

# How to obtain your own training and test data #
In order to make the programs provided in this folder be better utilized for other data base, we describe the data extraction process of "MWIR_multiView.mat" here. The codes used for the extraction process can be modified to suit other data bases according to their locations and specific information. 

1. In each subfolder of "../MWIR ATR database/ATR database in BMP/cegr_crop", there are 4 files in dfferent formats. Their functions and the order to be used are as below:
(1) `readimage.m`: read all the original images in the corresponding subfolder of "../MWIR ATR database/ATR database in BMP/cegr", and save the images in the "I.mat" file.
(2) `imgecrop_save.m`: load `I.mat` file, crop the parts including the targets in each image according the position information and azimuth angle information provided in the file `cegr0####_####.txt`, resize the cropped the images into the same size and save them in the corresponding folder in "../MWIR ATR database/Multiview SRC".
Modification tips for other database:
a. Change the contents in the `.txt` file to reset the position and the azimuth angle information corresponding to each image.
b. change the values of "X_range" and "Y_range" to reset the cropping size of the image.
c. change the values of "X" and "Y" to reset the final size of the cropped images before they are saved. ("X" and "Y" are used to adjust the sizes of the cropped images to make sure all the cropped parts have the same size even if they are obtained at different distances)
2. In the subfolders of "../MWIR ATR database/Multiview SRC", there are cropped images of the same size stored in the different folders according to their class and view type. In "../MWIR ATR database/Multiview SRC", `ImExtr.m` is used for producing the final training and test data stored in "MWIR_multiView.mat".
Modification tips for other database:
a. change the value of "X" and "Y" to change the vector size of each image in the  `MWIR_multiView.mat`. The vector size is defined as X*Y (Default: 40*20=800).
b. the codes can be used to only produce the training data if no test data is needed (just delete the part of producing the test data). 


**Related publications:**

1. Xuelu Li and Vishal Monga, “ Collaborative Sparse Priors for Multi-view ATR,” SPIE Defence and Commercial Sensing, April 2018, accepted. 
2. Xuelu Li and Vishal Monga, “Collaborative Sparse Priors for Infrared Image Multi-View ATR,” IEEE International Geoscience and Remote Sensing Symposium, July 2018, submitted.
3. Xuelu Li and Vishal Monga, “Collaborative Sparse Priors for Infrared Image Multi-View ATR,” IEEE Transactions on Geoscience and Remote Sensing, in preparation.

**Author: [Xuelu Li](http://www.personal.psu.edu/xul76/)**





