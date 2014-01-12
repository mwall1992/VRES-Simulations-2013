files = dir('*.txt');
for i=1:length(files)
    eval(['load ' files(i).name ' -ascii']);
end