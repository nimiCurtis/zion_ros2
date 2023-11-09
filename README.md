<div align="center">
<h1 align="center">zion_ros2</h1>

<h3>Zion wearable system - ROS2</h3>

<img src="https://img.shields.io/badge/License-Apache_2.0-blue.svg" alt="https://opensource.org/licenses/Apache-2.0" />
<img src="https://img.shields.io/github/last-commit/badges/shields/master" alt="git-last-commit" />

<!-- <img src="web/rob_tau_logo-small-e1633878088484 (1).png" width="50" /> -->

</div>

---

## Overview
This package lets you use the software packages of Zion wearable system which includes Nvidia Jetson Orin platform and Stereolabs ZED mini camera. It provides access to the following:

  - All of ZED camera features and data as it described in - [zed-ros2-wrapper](https://github.com/stereolabs/zed-ros2-wrapper/tree/master/images)
  - Single stair detection & modeling

This prototype system serves as a wearable sensor and processing unit designed for exoskeleton systems used in the rehabilitation of paraplegics. Until now, it has been equipped with a stereo camera that enables the acquisition of spatial information from the surroundings. This information is then used to interpret and discern the user's intentions, allowing the robot to respond and operate accordingly.

---

## Installation

### Prerequisites

- [Ubuntu 20.04 (Focal Fossa)](https://releases.ubuntu.com/focal/) / [JetPack](https://docs.nvidia.com/sdk-manager/install-with-sdkm-jetson/index.html)>=5.1
- [ZED SDK](https://www.stereolabs.com/developers/release/latest/) >= v4.0.6 
- [CUDA](https://developer.nvidia.com/cuda-downloads)
- [ROS2 Foxy](https://docs.ros.org/en/foxy/Installation/Linux-Install-Debians.html)
- [zed-ros2-wrapper (v4.0.6 release or newer)](https://github.com/stereolabs/zed-ros2-wrapper) 
- [TensorRT (optional)](https://docs.nvidia.com/deeplearning/tensorrt/install-guide/index.html)


### Build the package

To install the **zion_ros2**, open a bash terminal, clone the package from Github, and build it:

```bash
$ cd ~/ros2_ws/src/ 
$ git clone --recursive https://github.com/nimiCurtis/zion_ros2
$ cd ..
$ rosdep install --from-paths src --ignore-src -r -y
$ colcon build --symlink-install
$ source ~/.bashrc
```

**Note:** If `rosdep` is missing you can install it with:

  ```$ sudo apt-get install python-rosdep python-rosinstall-generator python-vcstool python-rosinstall build-essential```

#### Update the local repository

To update the repository to the latest release you must use the following command to retrieve the latest commits of `zion_ros2` and of all the submodules:

```bash
$ git checkout master # if you are not on the main branch  
$ git pull --recurse-submodules # update recursively all the submodules
```

### Python Dependencies

For python dependencies installation, open a terminal and use the ```install.sh``` file.

**For PC platform:**
```bash
$ ./install.sh 
```

**For Jetson Orin platform:**
```bash
$ ./install.sh jet
```


<!-- ## Known issues -->

---

## Get Started

To start the **zion_ros2** nodes, open a terminal and use the command `ros2 launch`:

#### ZED Mini Node:
```bash
$ ros2 launch zion_zed_ros2_interface zedm.launch.py
```

#### Single Stair Detection Node:
```bash
$ ros2 launch stair_detection_ros stair_detection.launch.py
```

For rviz visualization, use:
```bash
$ ros2 launch stair_detection_ros stair_detection_view.launch.py
```

For more information please enter the [stair_detection_ros](https://github.com/nimiCurtis/stair_detection_ros) package

#### Stair Modeling Node:
```bash
$ ros2 launch stair_modeling stair_modeling.launch.py
```

For rviz visualization, use:
```bash
$ ros2 launch stair_modeling stair_modeling_view.launch.py
```

For more information please enter the [stair_modeling](https://github.com/nimiCurtis/stair_modeling) package

---

### TODO: 
- [ ] Images of the system
- [ ] Images from rviz 
- [ ] readme for every package ? 