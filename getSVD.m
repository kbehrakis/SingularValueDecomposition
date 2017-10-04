% Computes SVD on an input matrix. Outputs:
%   - singular values
%   - second singular vector
%   - vowels, consonants, and neuters

% Adjacency Matrix
A = [1 0 0; 
     0 1 0;
     0 0 6];

% Extract the SVD components (i.e. U vectors, V transpose vector, signular values 
[U,S,W] = svd(A);

% Gets the singular values
singularVales = diag(S)

% Get the second U
