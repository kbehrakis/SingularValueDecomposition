% Get the minimum distance between two points
function [refAlpha, newAlpha, newAlpha_2, finalAlpha, accuracy] = find_distance()
    [uOrig, vOrig, u, v] = plotLetters();
    labels=['A B C D E F G H I J K L M N O P Q R S T U V W X Y Z '];
    refAlpha = labels
    
    for i=1:length(uOrig),
       % Find the distance between reference and each "encrypted" point
       for j=1:length(v),
         allDistances(j) = distance_to(i,j);
         allDistances_2(j) = distance_to(j,i);
       end
       
       % Extract the minimum distance found and at what j value it occurs
       % From mathworks.com: [M,I] = min(___) finds the indices of the 
       % minimum values of A and returns them in output vector I, using 
       % any of the input arguments in the previous syntaxes. 
       [minDistance,jIndex] = min(allDistances);
       [minDistance_2,jIndex_2] = min(allDistances_2);
          
         % Compare the label of the reference text w/ label of "encrypted"
         % text
          disp('REFERENCE: ')
          uOrig(i)
          vOrig(i)
          labels(2*i-1:2*i)
          
          disp('NEW TEXT: ')
          u(jIndex)
          v(jIndex)
          labels(2*jIndex-1:2*jIndex)
          % constructs new alphabet
          newAlpha(2*i-1:2*i) = labels(2*jIndex-1:2*jIndex)
          newAlpha_2(2*i-1:2*i) = labels(2*jIndex_2-1:2*jIndex_2)
                 
    end
      
    % constructs final alphabet
    for w = 1:(length(refAlpha)/2)
        if newAlpha(2*w-1) == newAlpha_2(2*w-1)
            finalAlpha(2*w-1) = newAlpha(2*w-1);
        elseif minDistance < minDistance_2
            finalAlpha(2*w-1) = newAlpha(2*w-1);
        else
            finalAlpha(2*w-1) = newAlpha_2(2*w-1);
        end
    end
    
    accuracy(1) = check_accuracy(newAlpha, refAlpha);
    accuracy(2) = check_accuracy(newAlpha_2, refAlpha);
    accuracy(3) = check_accuracy(finalAlpha, refAlpha);
    
    % Compute the distance between points at each index
    function distance = distance_to(index_1, index_2)
      u_1 = uOrig(index_1);
      v_1 = vOrig(index_1);
      u_2 = u(index_2);
      v_2 = v(index_2);
      
      distance = sqrt((u_1 - u_2)^2 + (v_1 - v_2)^2);
    end

    % returns what percent of leters in the alphabet match
    function accuracy = check_accuracy(alpha_1, alpha_2)
        letters_correct = 0;
        for i = 1:(length(alpha_1)/2)
            if alpha_2(2*i-1) == alpha_1(2*i-1)
                letters_correct = letters_correct + 1;
            end    
        end
        accuracy = (letters_correct/26)*100
    end
end
