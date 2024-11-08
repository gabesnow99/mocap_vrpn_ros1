# # This is an auto generated Dockerfile for ros:ros-base
# # generated from docker_images/create_ros_image.Dockerfile.em
# FROM ros:noetic-ros-core-focal
# RUN apt-get install apt-transport-https

ARG ROS_DISTRO='noetic'
FROM osrf/ros:${ROS_DISTRO}-desktop-full

RUN apt update
RUN apt upgrade -y
RUN rosdep update

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    wget \
    git \
    bash-completion \
    build-essential \
    python3-rosdep \
    python3-rosinstall \
    python3-vcstools \
    ros-$ROS_DISTRO-catkin \
    python3-catkin-tools \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN /bin/bash -c "bash /ros_entrypoint.sh"
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash"

RUN rosdep update --rosdistro $ROS_DISTRO

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-ros-base \
    && rm -rf /var/lib/apt/lists/*

RUN /bin/bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash"
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> /root/.bashrc

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install netbase
RUN apt-get install ros-${ROS_DISTRO}-vrpn-client-ros -y

RUN echo "export ROS_MASTER_URI=http://localhost:11311" >> /root/.bashrc
RUN echo "export ROS_HOSTNAME=localhost" >> /root/.bashrc

WORKDIR /root
