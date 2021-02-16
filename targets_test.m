 % Classes from 1 to 24
 target_test = 24:24;
 % 28 samples per class
 target_test = repmat(target_test, 2, 1);
 % Reshape to obtain a vector
 target_test = reshape(target_test, 1, numel(target_test));
 
  target_test = full(ind2vec(target_test));
 
 save targets_test