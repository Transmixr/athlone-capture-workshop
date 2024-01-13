# offline-rgbd

This directory will have the scripts for three similar capture scenarios:

- Capture RGB and D streams from 8 Kinect cameras connected to 8 NUC mini-pc's, storing the recordings locally on each NUC. After the session the files are transferred to a central machine.
- Capture RGB and D streams from 8 Realsense cameras, rest of the setup the same.
- Capture RGB only from 8 Kinect cameras, rest of the setup the same.

The last one (RGB only) is only going to be done with all cameras equally spaced and looking in (HSLU experiment from Simone Croci).

The first two are going to be done with various physical layouts for the cameras, including some rectangular layouts (where there is no single point in space that is seen by all cameras).

## Checklist

- Check that all NUCs are synced to the same NTP server with a decent NTP client (www.timesynctool.com has a good one I've used often)
- obviously ssh access needs to work
	- With a keypair would be best
- Don't forget: for Kinects it is best to start the master last, but for realsenses it is best to start the master first.
- After the session: ensure that all files have been copied, and are a decent size. 
	- Trying to play them back in `kinect_viewer` or `realsense_viewer` is probably a good idea.
	- Checking that the Aruco markers are visible is a good idea.
	- Maybe even checking that `cwipc_register` can find the aruco markers is a good idea.


## Scripts

- `cwipc-sxr-script.bat` was used for the CWIPC-SXR dataset captures.
- `ssh-disnuc101-script.sh` is a first step at doing that over ssh.
	- We have to think about how to control multiple machines (especially stop time). Maybe open 8 `Terminal` windows, and then type control-C when done?