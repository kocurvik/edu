## Homework 1

The first homework will consist of practical testing of the things we just mentioned. It is divided into several parts. The output of the task can be either multiple notebooks or python scripts that you used to run the experiments. The output should also contain a pdf file with results and graphs that will demonstrate your claims.

The core of the homework will be training the network on the Cifar-10 dataset. You will always then compare how different modifications of the network work against others or against some baseline. The task will consist of several parts.

*Note:* You can also solve the task in Keras or another framework, but you must first agree with me.

### Basic model (1pt)

The goal is to ideally design the fastest possible model that will reach approx. 70 percent accuracy on Cifar-10 dataset. This model will serve as a baseline for further modifications. Use the Adam optimizer and ReLU activations within the model. The beginning of the model should consist of a few convolutional and pooling layers. There should be a fully connected part at the end.

In the remaining tasks, it is always necessary to change some part of the model and compare them with each other using graphs that show the development of validation accuracy and error. Instead of graphs, it is possible to use a table, but it makes sense to list only the values at the end of training.

### Activations (3pt)

Try swapping the activation functions. Test three of the following activation functions sigmoid, tanh, ELU, LeakyReLU and PReLU. You can also test LeakyReLU for different values of the alpha parameter (e.g. 0.3, 0.1, 0.03).

### Optimization (4pt)

Test training with Adam, SGD or RMSProp optimizers. Run at least 4 different configurations (different steps, different alpha, beta, etc). For this task, it is advisable to use the graphs in the pdf.

Choose one method and additionally test three other minibatch sizes for it.

### Dropout and Augmentation (4pt)

Test the dropout so that it is first only in the fully connected layer (p = 0.5) and then also after the convolutional layers (p = 0.2). And one more option. Remember to use Dropout2d instead of Dropout1d when using in convolution layers.

Test augmentation for 3 different settings. You can be creative, but it should at least make sense. Documentation can be found [here](https://pytorch.org/vision/stable/transforms.html). Be careful to do it right.

Test both things for two cases in one you use a regular split on train/val and in the other you leave only the first 1000 examples in the training set. Be aware that the number of training steps is smaller for the second case, so use proportionately more epochs.

### Deep web (3pt)

Design a deep (narrow is enough, but have at least 11 layers) network. Test it first without BatchNorm, residual or dense links, or additional training layers. Finally, test at least two of these approaches so that you have at least 3 different models (ie, different placements of these elements).

Note: If you want to test residual or dense connections, design the network in such a way that there is a place to put them.

### Best model (3pt)

Create a model that achieves the best result you can. These points are extra and do not count towards the total number of points. The models submitted by others will be taken into account. Submit the model as a .pth torch state dict along with one script that loads the model and calculates the accuracy on the Cifar-10 test set. Describe your procedure for creating the model. You can get inspiration from the internet, but don't download or use pre-trained models. If you are inspired by something too much, then at least describe why that particular model should work well (please don't write here that it is because some blog says so).

## Points

The task is relatively straightforward, as its goal is rather to gain experience. However it can take quite a lot of time to train the models. You can usually choose several parameters for tasks. Therefore, it does not matter if some of them are meaningless, such as a very big learning step, as knowing what doesn't work is also important. However, I will deduct points if there are almost no settings in a section that make sense/good results. It would be ideal if you tried, for example after the first three settings, to find the "best" setting. Also if you claim some nonsense in the pdf you could get some points deducted.

## Submission

Submit the task in a zip with notebooks/scripts, a pdf with the results and your model to the e-mail address `kocurvik@gmail.com' Divide the pdf into sections like here and ideally also into sub-sections where it makes sense. Always write a comment on the results about how they turned out.

The deadline is **27.11.2023 15:00**. I will deduct points for late submissions.


## Homework no. 1 (15b) - Alternative

As an alternative to the first homework, one of the notebooks from the exercises can be rewritten into another framework. Target frameworks can be, for example, JAX, or something else. If you are interested in this form of the first home homework please discuss this option with me.

## Homework no. 2 (15b) - Object Detector
The goal of the second homework will be to train an object detector on a smaller dataset.

### Object detector
The first part of the task will be to find some object dector based on deep learning ideally from Github like e.g. YOLO, RetinaNet, CenterNet (there are two different ones), CornerNet, FCOS, ATSS, etc. Most of them also exist in a version for keras. You will send the choice of detector to me for approval by mail/MS Teams/in person after the exercise. Ideally, send a direct link to the repository. However, if you find that it somehow doesn't work, you can change the detector later. I would also like it if you all didn't have the same detector.

As with the previous assignment, you will be submitting a pdf file this time as well. In its introduction, briefly describe how the selected object detector works. It is important to describe the basic principle. Feel free to use images from the publication for the given detector, or from there on the Internet. This text should contain answers to the questions:

* What structure makes it possible to determine the position of objects?
* How does this structure work in the context of training (how is loss calculated)?
* How does the selected detector solve the assignment of multiple bounding boxes to the same object?
* Does this structure have a class imbalance problem (there are few objects and a lot of background) and if so, how is it approached?

### Dataset
You will train on the [Stanford Dogs](http://vision.stanford.edu/aditya86/ImageNetDogs/main.html) dataset. This dataset is small enough to be easy to work with, but it has real shortcomings, which are few examples for some classes and the fact that the dataset only contains a certain type of images (mostly one dog in a natural background). The detector can therefore fail with other types of data. But that won't bother us, since the goal of this task is to learn the workflow of training object detectors.

### train/test split
You can also download the train/test split for the dataset. It is in .mat files. You can open them in Python, e.g. using the scipy library and the scipy.io.loadmat method. We will use this split to evaluate accuracy on the dataset.

### Bounding boxes
Bounding boxes are also available in the dataset annotation. Probably the most important thing will be to correctly parse this data and get it into the training process. It is up to you whether you, for example, you convert these annotations into another form with a script, or you write your own generator. Comment this procedure in pdf.

### An alternative to the dataset

If it is convenient for you to train the object detector on another dataset as part of another project or final thesis, you can consult with me about this task and do it all on the dataset of your choice. But I have to approve it first.

### Training

You will train one model that will detect bounding boxes for different classes (each breed is a different class). Most object detectors have pre-set approximate parameters for training and also provide pre-trained models. Feel free to use these, for example, if the backbone was pre-trained on Imagenet, it will probably converge quite quickly, since there are a lot of images of dogs in it. Create a validation set and watch the model learn. If the code allows it, it is better to monitor measures such as mAP or AP50 (more on them below). It is also nice to use gradual reduction of the training step or image augmentation. Do not implement these things if they are not in the downloaded implementation, but of course you can if you want to. Also add the plots of the training process, the method of dividing the dataset, and the selected parameters to the pdf.

### Evaluation

It will be necessary to create an evaluation for the trained model. We will mainly use the [IoU metric](https://en.wikipedia.org/wiki/Jaccard_index) and AP measures, i.e. average precision, i.e. the number of objects we correctly detected / the number of objects in the test set averaged for all classes. There is of course the question of what proper detection means and that is what you determine with the IoU metric. For example, the AP50 score means precision if we take as a true positive (correctly detected) a bounding box that has an IoU > 0.5 compared to the ground truth. The measure mAP (mean average precision) is also often used, which is the average for several AP values, i.e. e.g. mAP = (AP05 + AP10 + ... + AP90 + AP95) / 18.

*Note:* Average precision is often calculated for some recall value. However, this is not the case in our definition. We will only be interested in the threshold for the IoU metric. This is also known as MS COCO mAP. You can read more about the differences in AP calculations [e.g. here.](https://jonathan-hui.medium.com/map-mean-average-precision-for-object-detection-45c121a31173). It is of course possible that you will use a repository where another type of calculation for mAP (eg VOC) will already be implemented. In that case, you must describe in the report exactly how this calculation took place.


### Submission
Email a pdf file with a description of the model, data preparation, training and evaluation. If you cloned a foreign repo, it is ideal to add a link to your fork in the pdf. If not, add the relevant code to the zip.

### Grading
The grading will not directly take into account what results your model achieved, but rather the training process. However, if, for example, you will not have sufficient time to train the model fully, it is sufficient if you train a model that at least works a little after a few epochs and also make then perform evaluation on this unfinished model. You will also get some of the points for describing how the object detector itself works. Therefore, it is worthwhile to choose one and describe it if, for example, fewer points are enough for you.

The deadline for the entire assignment is **19.12. 23:59**. Since training can take a relatively long time, I recommend starting earlier than a week before turning the homework in. You can train wherever you want, but I recommend trying Google Cloud.
