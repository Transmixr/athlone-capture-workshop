set "output_folder=s1_professor_Emc2" 
SET /A fps = 30
SET /A duration_sec = 40
SET /A sync_delay = 160
SET /A sync_delay_inc = 160

mkdir %output_folder%

start "recording sub_1" cmd /k "C:\Program Files\Azure Kinect SDK v1.4.1\tools\k4arecorder" --device 1 --record-length %duration_sec% --color-mode 1536p --depth-mode NFOV_UNBINNED --rate %fps% --imu OFF --external-sync Subordinate --sync-delay %sync_delay% %output_folder%\output_sub_1.mkv 2^> %output_folder%\sub_1_error.txt

SET /A sync_delay = %sync_delay% + %sync_delay_inc%

start "recording sub_2" cmd /k "C:\Program Files\Azure Kinect SDK v1.4.1\tools\k4arecorder" --device 2 --record-length %duration_sec% --color-mode 1536p --depth-mode NFOV_UNBINNED --rate %fps% --imu OFF --external-sync Subordinate --sync-delay %sync_delay% %output_folder%\output_sub_2.mkv 2^> %output_folder%\sub_2_error.txt

SET /A sync_delay = %sync_delay% + %sync_delay_inc%

start "recording sub_3" cmd /k "C:\Program Files\Azure Kinect SDK v1.4.1\tools\k4arecorder" --device 3 --record-length %duration_sec% --color-mode 1536p --depth-mode NFOV_UNBINNED --rate %fps% --imu OFF --external-sync Subordinate --sync-delay %sync_delay% %output_folder%\output_sub_3.mkv 2^> %output_folder%\sub_3_error.txt

SET /A sync_delay = %sync_delay% + %sync_delay_inc%

start "recording sub_4" cmd /k "C:\Program Files\Azure Kinect SDK v1.4.1\tools\k4arecorder" --device 4 --record-length %duration_sec% --color-mode 1536p --depth-mode NFOV_UNBINNED --rate %fps% --imu OFF --external-sync Subordinate --sync-delay %sync_delay% %output_folder%\output_sub_4.mkv 2^> %output_folder%\sub_4_error.txt

SET /A sync_delay = %sync_delay% + %sync_delay_inc%

start "recording sub_5" cmd /k "C:\Program Files\Azure Kinect SDK v1.4.1\tools\k4arecorder" --device 5 --record-length %duration_sec% --color-mode 1536p --depth-mode NFOV_UNBINNED --rate %fps% --imu OFF --external-sync Subordinate --sync-delay %sync_delay% %output_folder%\output_sub_5.mkv 2^> %output_folder%\sub_5_error.txt

SET /A sync_delay = %sync_delay% + %sync_delay_inc%

start "recording sub_6" cmd /k "C:\Program Files\Azure Kinect SDK v1.4.1\tools\k4arecorder" --device 6 --record-length %duration_sec% --color-mode 1536p --depth-mode NFOV_UNBINNED --rate %fps% --imu OFF --external-sync Subordinate --sync-delay %sync_delay% %output_folder%\output_sub_6.mkv 2^> %output_folder%\sub_6_error.txt

start "recording master" cmd /k "C:\Program Files\Azure Kinect SDK v1.4.1\tools\k4arecorder" --device 0 --record-length %duration_sec% --color-mode 1536p --depth-mode NFOV_UNBINNED --rate %fps% --imu OFF --external-sync Master --sync-delay 0 %output_folder%\output_master.mkv 2^> %output_folder%\master_error.txt

pause
