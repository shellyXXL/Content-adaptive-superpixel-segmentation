
%%% This code is the implementation of 
%%% Content-Adaptive Superpixel Segmentation. Xiao, Xiaolin and Zhou,
%%% Yicong and Gong, Yue-Jiao. TIP. 2018.


clear all;clc;close all;

dataset = 'input_image_set_3';   
suffix='jpg';
datatype= 'test3';
 %datatype= 'bsds500';
 
for x=1:5
  numSuperpixels=100*x;
  iids = imgList(datatype); 

    for i=1:length(iids)
       name=iids(i);
       name=num2str(name);
       img=imread([pwd,'\',dataset,'\',name,'.',suffix]);
       gaus=fspecial('gaussian',[3,3],0.5); % higher smooth, regular shapes, lower br and ue
       img=imfilter(img,gaus);

       compactness=20;
       [labels, numlabels] = casmex(img,numSuperpixels,compactness);
        dir=pwd;
        subfolder='\result_CAS\CAS_test3\';
        DisplaySuperpixel(dir,labels,img,name,numSuperpixels,subfolder);
    end

end