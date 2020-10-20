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

