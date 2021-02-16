load feattes_hog

f = feattes_hog;
feature_tes = [];  

for i=1:size(f,1)
    data_hog_test = f{i,3};
    clas_hog_test = f{i,2};
    zx = ones(size(data_hog_test,1),1);
    datai_hog_test = [data_hog_test zx*clas_hog_test];
    feature_tes = [feature_tes;datai_hog_test];
    
end

kategori_tes =feature_tes(:,577);
data_hog_testing = feature_tes(:,1:576)';

save data_hog_testing data_hog_testing
save kategori_tes kategori_tes
save feature_tes feature_tes