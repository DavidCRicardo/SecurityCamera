%% Image Processing Project - Security Camera
%% David Ricardo a68882

%% Access the mobile webcam
clear; clc;

CamUrl = 'http://10.20.82.18:8080/shot.jpg'; %update address ip if needed 

frames = 24*3; %how many frames until update reference
while(1) 
    frame  = imread(CamUrl); %reads the image from the file specified by CamURL
    fh = image(frame);       %displays the data in array C as an image
    reference_img = frame;
    set(fh,'CData',reference_img);title('Reference Image'); %will open a window with what is recording
    drawnow;
    
     for i = 1:frames
        %Adquire Image from webcam
        frame  = imread(CamUrl);
        fh = image(frame); 
      
        %Call the function to check
        ObjectDetected = ProcessImg(frame, reference_img);
        
        %Update the imshow to the new image
        set(fh,'CData',ObjectDetected);title('Recording...');
        drawnow;
     end
   disp('Updating Reference Image');
end
%Shutdown webcam by deleting handle
%Pause the script and Quit Debugging to Stop Running