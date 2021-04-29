
disp(letters2numbers('h'));
double(lower('A'))
num = char('a')
num=randi(26)+'a'
char(8)


choice=input("enter column index from 1-7: ");
string = str(choice)
disp(string)
letters = ['a' 'e' 'i' 'o' 'u' ];
for i=1:length(letters)
    if string == letters(i)
        disp("invalid");
        
    end
end


function[num] = letters2numbers( word )
    asc = double(upper(word));    % http://www.asciitable.com/
    num = 26 + double('A') - asc   % simple arithmetic
end


