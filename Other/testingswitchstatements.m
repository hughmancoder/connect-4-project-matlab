result = 52;

switch(result)
   case 52
      disp('result is 52')
   case {52, 78}
      disp('result is 52 or 78')
end

x = [12 64 24];
plottype = 'pie3';

switch plottype
    case 'bar' 
        bar(x)
        title('Bar Graph')
    case {'pie','pie3'}
        pie(x) %pie(x) is 2d pie chart, pie3 is a 3d pie chart. 
        title('Pie Chart')
    otherwise
        warning('Unexpected plot type. No plot created.')
end