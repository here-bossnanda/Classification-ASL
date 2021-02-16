load featall_hog

f = featall_hog;
feat_hog_train = [];
A = [];
 
for i=1:size(f,1)
    data_hog_train = f{i,3};
    clas_hog_train = f{i,2};
    zx = ones(size(data_hog_train,1),1);
    datai_hog_train = [data_hog_train zx*clas_hog_train];
    feat_hog_train = [feat_hog_train;datai_hog_train];
end

kategori_train =feat_hog_train(:,577);
data_hog_train = feat_hog_train(:,1:576)';

save data_hog_train data_hog_train
save feat_hog_train feat_hog_train
save kategori_train kategori_train