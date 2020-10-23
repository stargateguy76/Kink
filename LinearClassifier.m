load("KinkData.mat")
[~, nPeep] = size(data);
ind = rand(nPeep, 1) > 0.5;
%ind = zeros(nPeep, 1);
%ind([7 24 30]) = 1;
ind = logical(ind);
nInd = sum(ind);
weights = ind/nInd + (ind-1)/(nPeep-nInd);
optimal = data * weights;
optimal = optimal / norm(optimal);
proj = optimal' * data;
sum(proj' .* weights)
range = 1:nPeep;

figure(11);
plot(range(ind), proj(ind), '.', 'markersize', 40)
hold on
plot(range(~ind), proj(~ind), '.', 'markersize', 40)
grid on
set(gca,'xtick',[1:nPeep],'xticklabel', IDs, "fontsize", 20); xtickangle(-45)
hold off

figure(12);
plot(optimal)
set(gca,'xtick',[1:nKink],'xticklabel', kinks, "fontsize", 20); xtickangle(-45)
grid on