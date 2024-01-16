## License: Apache 2.0. See LICENSE file in root directory.
## Copyright(c) 2015-2017 Intel Corporation. All Rights Reserved.

#####################################################
## librealsense tutorial #1 - Accessing depth data ##
#####################################################

# First import the library
import sys
import pyrealsense2 as rs

try:
    # Create a context object. This object owns the handles to all connected realsense devices
    pipeline = rs.pipeline()

    # Configure streams
    config = rs.config()
    config.enable_stream(rs.stream.depth, 1280, 720, rs.format.z16, 30)
    config.enable_stream(rs.stream.color, 1280, 720, rs.format.bgr8, 30)
    # xxxjack set important camera parameters
    config.enable_record_to_file(sys.argv[1])
    # Start streaming
    pipeline.start(config)

    print(f"Recording to {sys.argv[1]}")
    try:
        while True:
            pipeline.wait_for_frames()
    except KeyboardInterrupt:
        pass
    print(f"Recording stopped")
    pipeline.stop()

except Exception as e:
    print(e)
    pass