# Neural networks for computer vision

This repository contains the material for the course.

[Table with grades](https://docs.google.com/spreadsheets/d/1oGddioqF9-LL4pEr5f0VdXgg_hKkn2rmF_YBNlTihY4/edit?usp=sharing)

# Homework assignment 1 (20 points)

The aim of the first homework assignment is to practically test the elements of the CNNs we have just discussed. The assignment has multiple parts. The output of the asignemnt may be a multiple notebooks or python scripts which you used to run the experiments. You submission also has to contain a pdf file with the results including graphs or tables which support your conclusions.

The main task is to train a CNN on the Cifar-10 dataset. You will evaluate how the various modifications of the network work against a common baseline.

### Base model (1b)

The goal is to design a base model which is ideally as fast as possible and sould reach ~70 percent accuracy on the Cifar-10 dataset. You will then use this model as a baseline for further modifications. The base model will use the ReLU activation and the Adam optimizer. The model should contain a few convolutional and pooling layers at the beginning and some fully connected layers at the end.

In the following subtasks you need to change some aspec of the model and compare how they work using graphs which show how the validation accuracy and loss changes. You may also use a table of final results instead.

### Activations (3b)

Try to use different activation functions. Test three of the following sigmoid, tanh, ELU, LeakyReLU or PReLU. You may also test out LeakyReLU for using differnt values for the parameter alpha.

To use Leaky ReLU and PReLU you will need to check the [documentation](https://keras.io/layers/advanced-activations/)

### Optimization (6b)

Test out the training using the Adam, SGD or RMSProp optimzers. Test at least four different configurations (different optimizer, trainig step or some other hyperparameter). When evaluating the results it would be beneficial to use a graph.

Pick one of these configurations and additionally check 3 different minibatch sizes with it.

### Dropout and Augmentation (6b)

Test the dropout first just in the fully connected layer (p = 0.5) and then in the convolutional layers as well (p = 0.2). Test out one additional different placements or the probabilities of the DropOut layer.

Test the augmentation for 3 different settings for both cases.

Perform both of these on the original train/val split and special case where you only use 1000 training images. Please do note that if the trainig set is smaller so will be the number of steps per epoch so you need to adjust either the number of steps or the number of epochs accordingly.

### Deeper network (5b)

Design a deep network (at least 11 layers, but the network can be very thin). Test it out at first without BatchNorm, residual or dense connections or auxillary training layers. Test out at least two of these approaches so that you end up with at least 3 models.

Note: If you plan to use residual or dense connections you have to design the network in a way which allows their placement somewhere in the network.

### Best model (3b)

Produce a model which will reach the best result. These points are additional are not counted towards the assignment maximum of 20 points. Your results will be compared against the results of the rest of the calss. Send the model in the h5 format and include a script which runs the model on the test data and prints out the accuracy.

You can seek insipiration online, but do not use any pretrained networks. If you use something we have not covered so far in the labs please elaborate on how it works and why it should work. 

## Grading

This is assignment is rather straightforward and the goal is for you to gain experience. This assignment might be a bit more time consuming since running the training might take quite some time.

You can select multiple different parameters so feel free to also select some that are nonsensical since knowing what does not work is also quite important. However you may lose points if there are not meaningful parameters tested in any of the sections of the assignment. Ideally after the few initial tries you would try to find the best settings for the hyperparameters that work. The pdf accompanying this assignemnt should also include some commentary on your experiments. I will subtract some points if this commentary will make untrue or nonsensical statements.

## Submission

Submit the assignment in a zip file with notebooks/scripts, the pdf with results and optionally your model to kocurvik@gmail.com.

Make sure that the pdf if file is split into sections and ideally subsections as well. For each result please add some commentary.

Deadline is **6.11. 23:59**. If you submit late you might get some points subtracted.

## Homework assignment 2 (20b)

The goal of the second homework assignment is to train an object detector on a smaller dataset.

### Object detector

The first part of the assigment will be to find a deep learning based object detector, ideally as an open-source Github repository. There are many options, but to mention a few such YOLO, RetinaNet, CenterNet (there are two different ones), CornerNet etc. Most of them are also availbe in a keras implementation. You will have to get the object detector approved by me via e-mail/MS Teams/after labs. Preferably you would send me a link directly to a repository. I would prefere if not all of you used the same detector.

As with the last assignment you will again have to submit a pdf document. In the introduction you will briefly describe how the chosen object detector works. It is important to cover the base principle. Feel free to use images from the original articles or from anywhere else. From the text you write the answers to the following questions should be obvious:

1. What kind of structure is responsible for object localization.
2. How does this structure work w.r.t training (how is the loss computed)?
3. How does the object detector deal with multiple bounding boxes found for the same object.
4. Does this structure have a class imbalance problem? If it does how does the detector solve this problem?

### Dataset

You will train the models on the [Stanford Dogs dataset](http://vision.stanford.edu/aditya86/ImageNetDogs/main.html). This dataset is small enouch to make working with it easy. However this dataset has some drawbacks. Some classes have very few examples and the datset only contains one type of images (usually one dog in a natural background). The detector may therefore easily fail for some other type of images. This is however not a concern for us as the aim of this assignment is for you to learn the workflow of training an object detector.

#### train/test split

The datasat contains train/test split in `.mat` files. These can be opened in python with the `scipy` library and its method `scipy.io.loadmat`. We will use this split to evaluate the trained detector.

#### Bounding boxes

The dataset annotations contain bounding boxes. Probably the most important part of your assignment will be to parse these correctly and use them during training. It is up to you whether you convert the data once, or you supply your own generator. Describe your approach in the pdf.

### Training

You will train two models. One will detect bouding boxes for various classes (each breed will have its own class) and the other one will detect only one class (dog).

Most of the object detectors come with some default training hyperparameters and also some pre-trained models. Feel free to use these (the pre-trained models are especially useful to speed up your work). However I would be glad if you do not use models pretrained on ImageNet since the Stanford Dogs dataset is a subset of ImageNet. Create a train/val split and observe the training process. If the code allows for it it is always better to observe metrics such as mAP or AP50 (more on that later). It is also beneficial to use training step scheduling or image augmentation. However, if these are not implemented in the repository you do not need to use them. (Of course if you feel up to it you can implement these features yourself, however that might be too time consuming).

You will have to include the training process, data splits and other training parameters in the pdf.

### Evaluation

You will have to evaluate both models. We will use mostly the [IoU](https://en.wikipedia.org/wiki/Jaccard_index) and AP (average precision) metric. AP metric is calculated as the number of correctly detected objects / the number of ground truth objects averaged over all of the classes. There is of course some ambiguity as to what constitutes a correct detection. We will decide that via the IoU metric. For example the AP50 score means that we will consider a detection a true posivie (correct detection) if the IoU metric against the ground truth bounding box is greater than 0.5. When dealing with object detection another metric known as mAP (mean average precision is also commonly used). mAP is just an average of various APXX values so for example: mAP = (AP05 + AP10 + ... + AP90 + AP95) / 18

For the model with just one class the A in AP does not make sense (average over one class is just the precision for the given class). However we will use the AP designation to stay consistent. In the evaluation section you will create a graph showing AP for various IoU thresholds. You will also calculate the mAP metric as defined in the previous paragraph.

For the model which distinguishes between breeds you should calculate the AP25, AP50 and AP75. You will create a table (a structured txt file is sufficient) with the values of precision for IoU tresholds 0.25, 0.50, 0.75 for each class as well as the number of examples of that class in the training data. In the pdf you should only include the most interesting values (best and worst classes for all of the three metrics). You can comment these results and determine whether the number of training examples affected the results.

You can also include a different evaluation such as AP50 for various bounding box sizes, but this is not necessary. Comment the overall results. Did anything surprise you during this assignment? Did you learn anything intersting?

### Submission

Send the resulting pdf with the model description, data preparation, training and evaluation in an email. If the table for the multiclass (breeds) model is not in a pdf please send it in an easily readable form (such as .txt or .csv). If you cloned a repository please send a link to your fork on Github, or the code in a zip file.

The deadline for the selection of an object detector is the **1.12.2020** lab. You can send me the chosen detector via e-mail, MS Teams or discuss it after the lab.

The deadline for the whole assignment is **13.12.2020**. Since the trainig process might take too long I strongly advise you to start with this exercise at least a week before the deadline. You can train wherever you want, but I strongly encourage using the Google Cloud.

