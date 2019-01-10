function range = label_to_range(label)
%% ================== File info ==============================
% Description: Convert label to range, label = [1 1 1 2 2 2 2 3 3]
%                 then range = [0, 3, 7, 9]
%% ================== end File info ==========================
mid_c = num2str(label(end));
C = str2double(mid_c(1))*str2double(mid_c(2:3));
range = zeros(1,C+1);
t = 1;
for i = 1:length(label)-1
    if label(i+1)~=label(i)
        t = t+1;
        range(t) = i;
    end
    range(C+1) = length(label);
end

end