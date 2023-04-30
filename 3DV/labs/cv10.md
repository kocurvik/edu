# 10th and 11th Lab - Fun with running someone else's code.

Quite often when working with SOTA vision systems you will not write all of the code yourself, but will use some existing code and icorporate it into your own codebase or a pipeline. For the rest of the labs you may choose among different 3D vision repositories and try to run them. You will get points based on the estimated difficulty of the install and running. I have tried some of these repos and have given estimated points in parentheses. However, I have not worked with some of them (with some only long ago) so my estimation may be wrong. Therefore, if you feel that the install and running deserves more points you can show me the work you have done to run the repo and I may give you more points.

You should generally perform just the inference, but if you run training on some dataset not provided in the repositor you can get even more points. If you have an idea for a more complex project using any of these repositories you can also get more points.

Here is the list of suggested repositories. You can suggest your own. We can discuss the points you may get. Other models are available at [Hugging Face](https://huggingface.co) or you can check out [PapersWithCode](https://paperswithcode.com) - more specifically [the 3D-related tasks](https://paperswithcode.com/task/3d)


### Monocular Depth Estimation
* [AdelaiDepth](https://github.com/aim-uofa/AdelaiDepth) is an open source toolbox for monocular depth prediction. Easy Colab notebook - try on custom images from similar domains (1 - 2 pts).
* [Monocular Depth Estimation Toolbox](https://github.com/zhyever/Monocular-Depth-Estimation-Toolbox/) a toolbox with multiple methods implemented. Semi-difficult install. Try inference on custom data (? pts).
* [Niantic's Monodepth 2](https://github.com/nianticlabs/monodepth2) requires install, good instructions. Try on your own image (1 - 3 pts).
* [Any other papers on paperswithcode.com for monocular depth estimation](https://paperswithcode.com/task/monocular-depth-estimation) - consult with me if you want to do this. You can select any dataset or custom data, but it is quite likely that the models will only work within the specified domain.


### 3D Pose Estimation - Hands, Humans etc.
* [MMPose](https://github.com/open-mmlab/mmpose) is a library for human pose estimation (multiple options - hands, bodies, faces etc.). Should be an easy install. Try something for 3D on your own data. (1 - 3 pts.)
* [MediaPipe](https://mediapipe.dev) is a similar library from Google. Should be an easy install. Try something from the 3D tasks on custom data. (1 - 3 pts.)


### 6 DoF object detecion
* [OnePose](https://github.com/zju3dv/OnePose) is a 6DoF pose estimation tool which does not need a CAD model. Difficult install (especially on Win) - try it on the provided demo data (3 - 5 pts).
* [OnePose++](https://github.com/zju3dv/OnePose_Plus_Plus) is an imprvovement over OnePose++. Able to better handle textureless objects. Takes longer to build a model. Difficult install (especially on Win) - try it on the provided demo data (3 - 5 pts).
* [Deep Object Pose Estimation - ROS Inference from Nvidia](https://github.com/NVlabs/Deep_Object_Pose) is a 6DoF object detector using synthetic training data. Requires multiple other packages to be installed. You can run it on the provided data or find the objects from the training set online (3 - 5 pts).
* [Any other papers on paperswithcode.com for 6 DoF pose estimation](https://paperswithcode.com/task/6d-pose-estimation) - consult with me if you want to do this. You can select any dataset, but it is quite likely that the models will only work within the specified domain (usually requiring CAD models).

### Relative and Absolute Pose Estimation (F, E, PnP, H etc.) + RANSAC variants
* [PoseLib](https://github.com/vlarsson/PoseLib) is a library for pose estimation - requires C++ compilation. May need modificatoin on windows (see [this issue](https://github.com/vlarsson/PoseLib/issues/49)). You will need to use some keypoint detection and matching on custom images (you can use the example from 6th lab). Afterwards you may calculate the Essential or Fundamental matrix (3 - 5 pts).
* [Graph-cut Ransac](https://github.com/danini/graph-cut-ransac) is a library for graph-cut ransac, which usually finds an all-inlier sample faster. Easy notebook try on you own images, (1 - 2 pts)
* [MAGSAC](https://github.com/danini/magsac) is a similar library, but implements MAGSAC. Easty notebook - try on your own images (1 - 2 pts).
* [Degensac](https://github.com/ducha-aiki/pydegensac) is a similar library, but implements Degensac with bells and whistles. Should be an easy notebook - try on your own images (1 - 2 pts).
* [Using Affine Correspondences](https://github.com/danini/affine-correspondences-for-camera-geometry) is a library for affine correspondences (AC). ACs also contain information about how the neighborhood of a point is transformed in the other view. Each AC provides 3 equations on elements F. This means that only 3 correspondences are need for F estimation and only 2 for E, which leads to faster inference. Easy notebook - try on you own images (1 - 2 pts).
* [Deep Fundamental Matrix Estimation](https://github.com/isl-org/DFE) is a deep learning approach to F estimations. Seems like a difficult install (? pts).
