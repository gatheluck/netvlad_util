function matdatagenerator()
% MATDATAGENERATOR: generate mat data from database
%
% Authors: Yoshihiro Fukuhara
%
% Copyright (C) 2016-09 Yoshihiro Fukuhara (Yosssshi).
% All rights reserved.
%
% Note:
%  Output .mat file should be placed under 'paths.dsetSpecDir' in 'localPaths.m'.
%

% set output name
nameOutput = 'dataset-name.mat'; % edit here!

% set path
pathDb = '/path/2/database'; % edit here!
pathQ  = '/path/2/query';    % edit here!
pathOutput = '/path/2/Output'; % edit here!

if ~exist(pathDb); error('pathDb:%s does not exist', pathDb); end
if ~exist(pathQ);  error('pathQ:%s does not exist',  pathQ);  end
if ~exist(pathOutput);  error('pathQ:%s does not exist',  pathOutput);  end

% members of output structure
dbImageFns = {};
qImageFns  = {};
utmDb = [];
utmQ = [];
posDistThr = 25;  % edit here!
nonTrivPosDistSqThr = 100; % edit here!

% generate dbImageFns
arrayDb = dir(fullfile(pathDb, '*.png'));
dbImageFns = {arrayDb.name};

% generate qImageFns
arrayQ = dir(fullfile(pathQ, '*.png'));
qImageFns = {arrayQ.name};

% generate utmDb (This is not correct imprementation)
for i=1:numel(dbImageFns)
  utmDb(1,i) = 0.3829; % edit here!
  utmDb(2,i) = 3.9472; % edit here!
end

% generate utmQ (This is not correct imprementation)
for i=1:numel(qImageFns)
  utmQ(1,i) = 0.3815; % edit here!
  utmQ(2,i) = 3.9466; % edit here!
end

% output
dbStruct = [];
dbStruct.dbImageFns = dbImageFns;
dbStruct.qImageFns  = qImageFns;
dbStruct.utmDb = utmDb;
dbStruct.utmQ  = utmQ;
dbStruct.posDistThr = posDistThr;
dbStruct.nonTrivPosDistSqThr = nonTrivPosDistSqThr;

% check
fprintf('size(dbImageFns):%d\n', numel(dbImageFns));
fprintf('size(qImageFns):%d\n',  numel(qImageFns));
fprintf('size(utmDb):%d, %d\n',  size(utmDb,1), size(utmDb,2));
fprintf('size(utmQ):%d, %d\n',   size(utmQ, 1), size(utmQ, 2));
fprintf('posDistThr:%d\n',       posDistThr);
fprintf('nonTrivPosDistSqThr:%d\n',   nonTrivPosDistSqThr);

% Save
save(fullfile(pathOutput, nameOutput), 'dbStruct');
