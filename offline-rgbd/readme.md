# offline-rgbd

This directory will have the scripts for three similar capture scenarios:

- Capture RGB and D streams from 8 Kinect cameras connected to 8 NUC mini-pc's, storing the recordings locally on each NUC. After the session the files are transferred to a central machine.
- Capture RGB and D streams from 8 Realsense cameras, rest of the setup the same.
- Capture RGB only from 8 Kinect cameras, rest of the setup the same.

The last one (RGB only) is only going to be done with all cameras equally spaced and looking in (HSLU experiment from Simone Croci).

The first two are going to be done with various physical layouts for the cameras, including some rectangular layouts (where there is no single point in space that is seen by all cameras).

Here is a possible arrangement of cameras: [jack-suggestion-camera-placement.pdf](./docs/jack-suggestion-camera-placement.pdf)

## Checklist - before workshop

- Ensure that the NUCs can handle the size/framerate we selected
- Ensure that the NUCs have enough free diskspace (at least for a single session).
- Add `C:\Program Files\Azure Kinect SDK v1.4.1\tools` to the `PATH` of the central machine (so it is easier to check the recordings)
- Fix `rs-python-recorder.py`.
- All NUCs must have recent Realsense and Kinect software.
- All NUCs must have a recent Python
- All NUCs must have `pyrealsense2` installed
- All NUCs must have this repo checked out (or have a copy of it).

## Checklist

- Check that all NUCs are synced to the same NTP server with a decent NTP client (www.timesynctool.com has a good one I've used often)
	- Ensure they're all on Irish time
- obviously ssh access needs to work
	- With a keypair would be best
- Check (Microsoft remote desktop) that all Kinect cameras are on manual whitebalance, manual exposure (the whitebalance setting is not part of `k4arecord` it uses uses as-is)
- Check that all Kinect cameras are on MJPEG. This setting seems to reset whenever a camera is reconnected or something?
- Don't forget: for Kinects it is best to start the master last, but for realsenses it is best to start the master first.
- After the session: ensure that all files have been copied, and are a decent size. 
	- Trying to play them back in `kinect_viewer` or `realsense_viewer` is probably a good idea.
	- Checking that the Aruco markers are visible is a good idea.
	- Maybe even checking that `cwipc_register` can find the aruco markers is a good idea.


## Scripts

- `cwipc-sxr-script.bat` was used for the CWIPC-SXR dataset captures.
	- Asked Nacho about the `sync_delay` stuff. Luckily he remembered: this is to forestall interference with the IR beacons. Details are at <https://learn.microsoft.com/en-us/azure/kinect-dk/multi-camera-sync> but the 160uS should work fine.
- `ssh-disnuc101-script.sh` is a first step at doing that over ssh.
	- We have to think about how to control multiple machines (especially stop time). Maybe open 8 `Terminal` windows, and then type control-C when done?
- `capture-ssh.sh` is a first stab at the capture script. To be run on a Mac.