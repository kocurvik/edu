load ex2data1.txt

rng(25)
p = randperm(100);
XY = ex2data1(p, :);

% we chose 60 for standard validation
% train = XY(1:60,:);
% val = XY(61:80,:);

% we choose both the val and train for crossvalidation
train = XY(1:80,:);
test = XY(81:100,:);

disp(sum(train(:,3)))
disp(sum(val(:,3)))
disp(sum(test(:,3)))

% best_acc = 0;
best_loss = 1000;
best_k = 0;

for k = [1,3,5,7,9]
    mdl = fitcknn(train(:,[1 2]), train(:,3), 'NumNeighbors', k);

%     Crossvalidation
    cvmdl = crossval(mdl);
    loss = kfoldLoss(cvmdl);
    
    if loss < best_loss
        best_loss = loss;
        best_k = k;
    end
    
    
%     Uncomment this for normal validation
%     y_val_pred = mdl.predict(val(:,[1 2]));    
%     accuracy = sum(y_val_pred == val(:,3))/20;
%     disp('For k:')
%     disp(k)
%     disp('Accuracy:')
%     disp(accuracy)   
%         
%     if accuracy > best_acc
%         best_k = k;
%         best_acc = accuracy;
%     end
end

mdl = fitcknn(XY(1:80,[1 2]), XY(1:80,3), 'NumNeighbors', k);
test_pred = mdl.predict(test(:,[1 2]));
test_acc = sum(test_pred == test(:,3))/20;
disp('test_acc')
disp(test_acc)



