# mocap_vrpn_ros1

I, Gabelonius Maximus, having sworn in my wrath that the annoyance of this task shall never be repeated by a student of the MAGICC Lab, do leave this ROSrelic to you.

This repo a shortcut to use the Optitrack Motion capture system in the BYU MAGICC Lab when a robot requires use of ROS. The preference is that you use ROS2. An equivalent ROS2 repository can be found at: TODO: FILL THIS IN.

Clone or copy the Dockerfile and compose.yaml. Just make sure they are in the same directory.
```
docker compose up -d
docker compose exec vrpn_service bash
```
Then run ```roslaunch vrpn_client_ros sample.launch server:=192.168.1.3```. You will likely a second window to access the published data. Check that the data vehicle positions are being published correctly by running ```rostopic list```. You should see something like: /vrpn_client_node/ROBOT_NAME/pose.

Troubleshooting:
- Ensure you are connected to the MAGICC wifi.
- Ensure the MoCap system is on.
- Ensure Motive is open on the adjacent computer.
- Verify that the IP address on the adjacent computer matches the server in the command.

For those who wish to use without Docker:
- Be sure to apt install ros-{distro}-vrpn-client-ros.
- Run the same command as above.
