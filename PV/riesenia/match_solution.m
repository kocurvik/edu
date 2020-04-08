function match(I1, I2)
p1 = detectSURFFeatures(I1);
p2 = detectSURFFeatures(I2);

[f1, vp1] = extractFeatures(I1, p1);
[f2, vp2] = extractFeatures(I2, p2);

idxs = matchFeatures(f1,f2);
mp1 = vp1(idxs(:,1), :);
mp2 = vp2(idxs(:,2), :);

I3 = imfuse(I1,I2, 'montage');
col = size(I1, 2);

imshow(I3);
hold on

loc1 = mp1.Location;
loc2 = mp2.Location;

line([loc1(:, 1)'; loc2(:,1)' + col], [loc1(:, 2)'; loc2(:,2)'], 'Color', 'r');

[H, inliers] = ransacfithomography(loc2', loc1', 0.01);

line([loc1(inliers, 1)'; loc2(inliers,1)' + col], [loc1(inliers, 2)'; loc2(inliers,2)'], 'Color', 'g');

corners = [0, size(I2, 2), size(I2,2), 0;
           0, 0, size(I2,1), size(I2,1);
           1, 1, 1, 1];
 
ch = H * corners; 
cs = ch(1:2, :)./ch(3,:);

line([cs(1,:), cs(1,1)], [cs(2,:), cs(2,1)], 'Color', 'y', 'LineWidth', 4);



