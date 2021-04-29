
letters2numbers('hello');


function    num = letters2numbers( word )
    asc = double( upper(word) );    % http://www.asciitable.com/
    num = 26 + double('A') - asc;   % simple arithmetic
end