function [iids] = imgList(type)

    if nargin<1, type='all'; end

    iids_test3 = load(fullfile(bsdsRoot,'iids_test3.txt'));


    switch type,
     case 'test3', iids = iids_test3;  
     otherwise, error(sprintf('type=%s is invalid',type));
    end

% return a row vector
iids = iids(:)';

