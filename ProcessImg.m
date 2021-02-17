    function [highlighted_img] = ProcessImg(img1,img2)
    %% Read the image
    %img1 = imread(img1); %for test
    %img2 = imread(img2); $for test
    
    %% Convert to Black and White and Display
    img1BW = rgb2gray(img1);
    img2BW = rgb2gray(img2);

    %% Subtract Images
    imgDiff = abs(img2BW - img1BW);
    %imgDiff = xor(img2BW , img1BW);
   
    %% Find Location of Difference
    maxDiff = max(max(imgDiff));
    [iRow, iCol] = find(imgDiff == maxDiff);
    [m,n] = size(imgDiff);
    
    %% Threshold Image
    imgThreshold = imgDiff;% > 5; %default = 8  when converting to a binary image if intense value greater than 8 // user decides how much want
    %See Threshold!! Convert to a binary image
    
    %% Fill in regions
    imgFilled = bwareaopen(imgThreshold, 15); 
    %bwareaopen(BW,P) removes all connected components (objects) that have fewer than P pixels from the binary image BW, producing another binary image, BW2. This operation is known as an area opening.

    %% Overlay into Original Image
    imgBoth = imoverlay(img2, imgFilled, [1 0 0]);
    highlighted_img = imgBoth;
    %imoverlay(___,color) lets you specify the color that imoverlay uses to fill the image. color is a valid MATLAB® color specification.

    %% Only care about things large than 80 (by default)
    imageStats = regionprops(imgFilled, 'MajorAxisLength');
    imgLengths = [imageStats.MajorAxisLength];
    idx = imgLengths > 80; %%80 by default // user decides how much want
    imageStatsFinal = imageStats(idx);
    %disp(imageStatsFinal)
    %disp(X) displays the value of variable X without printing the variable name

    %% Determine if Change is Significant
    if isempty(imageStatsFinal)
        msg = 'Nothing to Report...';
        disp('Nothing to Report...')
    else
        msg = 'Reporting...';
        disp('Reporting...')
    end