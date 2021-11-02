function J = costFuncJ(X, y, theta)
    % X: is the "design matrix" containing our training examples
    % y: is the class labels
    % theta: is the searched parameters
    
    % get the #of training examples
    m = size(X,1);
    % get the prediction of hypothesis on all m examples
    predictions = X*theta;
    % get the squared errors
    sqrErrors = (predictions-y).^2;
    
    % get J
    J = 1/(2*m) * sum(sqrErrors);
end;
    
    