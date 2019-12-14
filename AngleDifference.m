function angleDifference = AngleDifference(position, targetOne, targetTwo)


    [angleOne,~] = cart2pol(targetOne(1) - position(1), targetOne(2) - position(2));
    [angleTwo,~] = cart2pol(targetTwo(1) - position(1), targetTwo(2) - position(2));

    angleDifference = abs(angleOne - angleTwo);
    if (angleDifference > pi)
        angleDifference = 2*pi - angleDifference;
    end
    
end