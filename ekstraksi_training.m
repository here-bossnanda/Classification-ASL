addpath(genpath('Train\'))
folder1=dir('Training\');
filem_train=[];
klas_train=[];
featall_left_train=[];

    
g=0;
for i=3:size(folder1,1)
    filename1=folder1(i).name;
    folder2=dir(['Training\',filename1]);
    for j=3:size(folder2,1)
        filename2=folder2(j).name;
        folder3=dir(['Training\',filename1,'\',filename2]);
        s=size(folder3,1);
        if s<8
            continue
        else
            for k=3: size(folder3,1)
                g=g+1;
                filename3=folder3(k).name;
                img=imread(['Training\',filename1,'\',filename2,'\',filename3]);
                name=['Training\',filename1,'\',filename2,'\',filename3];
                %grayscale
                imggray = rgb2gray(img);
                img1 =im2double(imggray);
                %HOG
                [feature_train,visualization] = extractHOGFeatures(img1,'CellSize',[16 16]);
                subplot(1,2,1);
                imshow(img1);
                subplot(1,2,2);
                plot(visualization);
                featall_left_train = [featall_left_train;{feature_train}];
                filem_train=[filem_train;{filename3}];
                klas_train=[klas_train;{i-2}]; 
            end
        end
		
		
    end
end


featall_hog = [filem_train,klas_train,featall_left_train];

save featall_hog featall_hog
