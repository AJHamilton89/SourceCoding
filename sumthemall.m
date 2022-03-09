function S = sumthemall(varargin) 
S = cellfun(@(x) x(:), varargin, 'Uniform', 0); 
S = sum(vertcat(S{:})); 
end