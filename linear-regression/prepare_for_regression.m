function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  
  [m, n] = size(InitialMatrix);
  FeatureMatrix = zeros(m, n+1); % with an extra column for the label
  col=n; % the last column
	for i = 1:m
		for j = 1:n
			val = InitialMatrix{i, j};

			if strcmp(val, 'no')
				FeatureMatrix(i, j) = 0;
			elseif strcmp(val, 'yes')
				FeatureMatrix(i, j) = 1;
			elseif strcmp(val, 'semi-furnished')
				FeatureMatrix(i, j) = 1;
				FeatureMatrix(i, j+1) = 0;
				col=j; % the column with the label
			elseif strcmp(val, 'unfurnished')
				FeatureMatrix(i, j) = 0;
				FeatureMatrix(i, j+1) = 1;
				col=j;
			elseif strcmp(val, 'furnished')
				FeatureMatrix(i, j) = 0;
				FeatureMatrix(i, j+1) = 0;
				col=j;
			else
				if(j<col)
				  FeatureMatrix(i, j) = val; % before the column with the label
				else
				  FeatureMatrix(i, j+1) = val; % after the column with the label
				end
			end
		end
	end
end
