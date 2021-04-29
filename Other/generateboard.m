%function[] = board(size)
%end


%board = zeros(6,7);





board =[];
for c=1:7
    for r=1:6
        board(r,c)=0;
    end
end
disp("     1     2     3     4     5     6     7");
disp("     _____________________________________");

disp(board);


board(2,4) = 'C'

%the char function is a great way to get rid of letter code and actually
%print out the letters as designated


for i=1:4
choice(i)=input("enter column index from 1-7: ");  
board(6,choice(i))='U'
end

if(co

disp(board);

newboard = char(board);
disp(newboard);