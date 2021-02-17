# SecurityCamera
Project developed for Academic Purposes during topic "Image Processing" in 2020

## About the Project
The project will use the mobile camera to record and check if it is something or someone in the place, for example, some person or an animal, increasing the security to that place.

## What was used to run the algorithm?
To work successfully, the algorithm was used one application, named IP Webcam, installed on the smartphone to use the mobile webcam. IP Webcam turns your phone into a network camera with multiple viewing options.
The code developed in MATLAB will get the IP Webcam and run the script, it will use the recorded frames by smartphone to process. The user needs to update the IP from Webcam in code if needed (file: ImageDetection.m, line 4), because when the application is turned off and on, the IP can change.
About code
The ImageDetection.m file will get the Camera URL from the smartphone and start recording, showing it in MATLAB. The ProcessImg.m file will ‘work’ with the images recorded and check if there is any significant difference. Both files need to stay in the same folder.
Files with code: ImageDetection.m (main) and ProcessImg.m

### Algorithm Steps:
1. Start
2. Save the first frame to be the reference
3. The next frames recorded will be checked with the reference if it is someone or something in front of the camera
4. Convert the next frames and reference to Black and White
5. Subtract Images
6. Find Location of Difference
7. Threshold Image and Fill in Regions
8. Overlay into Original Image
9. Only care about things large than the value
10. Determine if Change is Significant
11. After x time update reference

![img sample](https://github.com/DavidCRicardo/SecurityCamera/blob/main/sample.png)

### Observations:
The x time and value are variables defined by the user.
The problem with the daylight was fixed but needs to improve the Threshold to automatically (file: ProcessImg.m, line 20).
If the Change is Significant, it will show in Command Window “Reporting…” otherwise will appear “Nothing to Report…”. But when the reference is updated it will show “Updating Reference Image”.