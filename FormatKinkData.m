% IDs = kinkData2(1,:);
% dataCells = kinkData2(2:end, :);
% data = cell2mat(dataCells);
% data = [kinkData data];
% data = data(:, [1 2 4:end]);
% IDs = [names IDs];
% IDs = IDs([1 2 4:end]);
% save("KinkData.mat", "IDs", "data", "kinks")
%load("KinkData.mat")
[~, nKink] = size(kinks);
[~, nPeep] = size(data);
[U, D, V] = svd(data);
if (U(1) < 0)
    U = -U;
    V = -V;
end

figure(1)
plot(U(:,1:2))
set(gca,'xtick',[1:nKink],'xticklabel', kinks, "fontsize", 20); xtickangle(-45)
yline(0)
title("First two PCA")

figure(2)
plot(V(:,1:2))
set(gca,'xtick',[1:nPeep],'xticklabel', IDs, "fontsize", 20); xtickangle(-45)
yline(0)