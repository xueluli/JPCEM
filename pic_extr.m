clear all;
close all;

% addpath('./MWIR ATR database');
C = 10;
N = 5;
s = pwd;
% cd('..');
% cd('..');
s1 = s(1:end-16);
s2 = fullfile(s1,'ATR GUI revised');
list = dir(s2);
folder1 = fullfile(s1,'Multiview SRC');
listing = dir(folder1);
for i = 6:length(listing)
    folder2 = fullfile(folder1,listing(i).name);
    listing1 = dir(folder2);
    for j = 3:length(listing1)-1
        folder3 = fullfile(folder2,listing1(j).name);
        listing2 = dir(folder3);
%         Select_index = randperm(length(listing2)-3,N);
        b = round(length(listing2)/6);
        Select_index = [5 5+b 5+2*b 5+3*b 5+4*b];
        for k = 1:N
            filename = fullfile(folder3,listing2(Select_index(k)+2).name);
%             img = imread(filename);
%             figure,
%             imshow(img);
            folder4 = fullfile(s2,list(4+j-2).name);
            list1 = dir(folder4);
            folder5 = fullfile(folder4,list1(2+i-5).name);
            copyfile(filename,folder5);
            if j ~= 12
            filename1 = fullfile(s1,'ATR database in BMP/cegr',listing2(Select_index(k)+2).name(1:14),listing2(Select_index(k)+2).name);
            folder6 = fullfile(folder5,'OrgImg');
%             img1 = imread(filename1);
%             figure,
%             imshow(img1);
            copyfile(filename1,folder6);
            end
            if j == 12
            a = [listing2(Select_index(k)+2).name(1:14) listing2(Select_index(k)+2).name(16:end)];
            filename1 = fullfile(s1,'ATR database in BMP/cegr',listing2(Select_index(k)+2).name(1:14),a);
            folder6 = fullfile(folder5,'OrgImg');
%             img1 = imread(filename1);
%             figure,
%             imshow(img1);
            copyfile(filename1,folder6);
            end
        end
    end
end