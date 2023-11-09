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
