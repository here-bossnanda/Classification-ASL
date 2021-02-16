addpath(genpath('DataRan\'))
folder1=dir('DataRandom\');
filem_test=[];
klas_test=[];
featall_left_test=[];

g=0;
for i=3:size(folder1,1)
    filename1=folder1(i).name;
    folder2=dir(['DataRandom\',filename1]);
    for j=3:size(folder2,1)
        filename2=folder2(j).name;
        folder3=dir(['DataRandom\',filename1,'\',filename2]);
        s=size(folder3,1);
        if s<2
            continue
        else
            for k=3: size(folder3,1)
                g=g+1;
                filename3=folder3(k).name;
                img=imread(['DataRandom\',filename1,'\',filename2,'\',filename3]);
                name=['DataRandom\',filename1,'\',filename2,'\',filename3];
                %grayscale
                imggray = rgb2gray(img);
                img1 =im2double(imggray);
                
                %HOG
                [feature_testing,visualization] = extractHOGFeatures(img1,'CellSize',[16 16]);
                subplot(1,2,1);
                imshow(img1);
                subplot(1,2,2);
                plot(visualization);
                
                featall_left_test=[featall_left_test;{feature_testing}];
                filem_test=[filem_test;{filename3}];
                klas_test=[klas_test;{i-2}]; 
            end
        end
    end
end

feattes_hog = [filem_test,klas_test,featall_left_test];
save feattes_hog feattes_hog
