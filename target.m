 % Classes from 1 to 24
 targets_train = 1:24;
 % 28 samples per class
 targets_train = repmat(targets_train, 49, 1);
 % Reshape to obtain a vector
 targets_train = reshape(targets_train, 1, numel(targets_train));
 
 targets_train = full(ind2vec(targets_train));
 
 save targets_train