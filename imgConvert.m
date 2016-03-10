clear;

imDir = 'images/4D_image_stack/Processed';
inDir = 'images/4D_image_stack/ProcessedOut';

files = dir(imDir);
for fileNum = 1:numel(files)
    if (files(fileNum).isdir)
        continue
    end
    r = regexp(files(fileNum).name, '4D_img_stack_processed_c01_t0001_z[0-9]{4}', 'match');
    if (numel(r) <= 0) 
        continue
    end
    
    im = imread(strcat(imDir, '/', files(fileNum).name));
    path = strcat(inDir, '/', r{1}, '.png');
    imwrite(im, path);
    
end

clear r path inDir imDir im files fileNum;