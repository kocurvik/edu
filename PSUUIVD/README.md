Linky:

[Colab notebook pre DeepDream](https://colab.research.google.com/github/kocurvik/edu/blob/master/PSUUIVD/colab_intro_deepdream.ipynb)

[Colab notebook pre Lokalizáciu](https://colab.research.google.com/drive/1MrVs9b8aQYODtOGkoaGNF9Nji3sbCNMQ)

[Repozitár ktorý sa pri tom používa](https://github.com/cvg/Hierarchical-Localization)

[Dáta pre lokalizáciu](https://liveuniba-my.sharepoint.com/:u:/g/personal/kocur15_uniba_sk/EVW4VwHy5ldBhSEtRw2Q0moBAi_Evee3LhDWc5ae81zRrQ?e=MJdH7o\&download=1)

```shell
wget -o fmfi.tar.gz https://liveuniba-my.sharepoint.com/:u:/g/personal/kocur15_uniba_sk/EVW4VwHy5ldBhSEtRw2Q0moBAi_Evee3LhDWc5ae81zRrQ?e=MJdH7o\&download=1
```

[Dáta pre detekciu](https://liveuniba-my.sharepoint.com/:u:/g/personal/kocur15_uniba_sk/EUb4y4ho8WxFmvTmU4E0SxYBwLyfpbRfM_U_R0ioNDoVsg?e=Z21TYA\&download=1)

[PCA](https://scikit-learn.org/stable/modules/generated/sklearn.decomposition.PCA.html)

# Úloha na SfM (english version)

In the second part of the lab we will use a code repository for SfM called [hloc - the hierarchical localization toolbox](https://github.com/cvg/Hierarchical-Localization). This repository contains code for SfM which uses a more sophisticated procedure than simple itertive SfM.

## Exercise

Your objective will be to use this repository to localize the image you have taken of the "Matematika" entrance to our faculty. You can use the official [demo colab notebook](https://colab.research.google.com/drive/1MrVs9b8aQYODtOGkoaGNF9Nji3sbCNMQ).

The data for reconstruction is available [here](https://liveuniba-my.sharepoint.com/:u:/g/personal/kocur15_uniba_sk/EVW4VwHy5ldBhSEtRw2Q0moBAi_Evee3LhDWc5ae81zRrQ?e=MJdH7o\&download=1). You can download it using wget.

After creating a sparse model use the repository code to obtain the location of your camera when you took a photo of the entrance.

## Workshop

In this exercise your task will be to construct a sparse model of an object using several images of it and then estimate its pose in some other images. You can download the data [here](https://liveuniba-my.sharepoint.com/:u:/g/personal/kocur15_uniba_sk/EUb4y4ho8WxFmvTmU4E0SxYBwLyfpbRfM_U_R0ioNDoVsg?e=Z21TYA\&download=1).

Note that I tested the procedure for this data using an older version of hloc. Since then, hloc has changed the default feature detector and matcher and you may not be able to detect the model. Therefore, to run on this data you should slightly modify the configuration. In the Setup cell block change these two lines:

```python
feature_conf = extract_features.confs['disk']
matcher_conf = match_features.confs['disk+lightglue']
```
and change them to:
```python
feature_conf = extract_features.confs['superpoint_aachen']
matcher_conf = match_features.confs['superglue']
```

In order to show that you found the object pose properly you should plot three lines which all originate in the cetenter of the sparse model and the directions are determined by PCA of the points in the sparse pointcloud. The expected output is shown in the image below:

![](https://raw.githubusercontent.com/kocurvik/edu/master/3DV/labs/resources/carbo_result.png)

As an alternative to PCA you can try to find the dominant plane of the object and plot its normal and any two perpendicular vectors in the plane.

### Hints:

We can obtain 3D points from the model in the following way from the model object that we obtained during the reconstruction:

```python
pts = np.array([p.xyz for p in model.points3D.values()])
```

From these points, we then calculate their average and three components using PCA. For PCA you can use [sklearn](https://scikit-learn.org/stable/modules/generated/sklearn.decomposition.PCA.html). Subsequently, we draw lines in the picture going from the center towards the three main components. You can draw either with matplolib, OpenCV, or any other way.


In order to draw 3D points in images, we will have to project them onto the image plane. We can do this because we can also get the internal parameters of the camera (camera object from the demo) and its position (pose).
```python
# you obtain the pose of the camera using a command like this:
ret, log = pose_from_cluster(localizer, query, camera, ref_ids, features, matches)
# then you can obtain the projection matrix:
P = camera.calibration_matrix() @ ret['cam_from_world'].matrix()
```
