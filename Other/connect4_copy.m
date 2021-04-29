





playgame(); %this calls the function play game which is stored below



function[] = decoration()
%this function simply gives the user a selection of all the indexes of the
%board.
disp("     1     2     3     4     5     6     7");
disp("     _____________________________________");

end




function[] = endgame()
clc;
fprintf("thanks for playing");
exit 
%this command really does exit the program and close it. Be warned user! :)
end

function[] = playgame()
board = zeros(6,7); %this creats and empty 6 by 7 board. 
 decoration();
 disp(board)
 userscore = 0;
 computerscore = 0;
flag = 0; %assigns an intial value to a variable called flag, this will be later used to break out of nested loops.
for i=1:42 %this is because there are 6*7=42 possible entries, so we put the code in a big while loop to run thorough the code for each entry.
    
   
    
    %gets the users choice
    choice(i)=input("enter column index from 1-7: ");
    
    %row goes to 2 maximum as row-1 offsets it to index 1.
    for row=[6:-1:2]
        
        %this test for invalid entries.
        if choice(i)~=[1:7]
            fprintf("not a valid input, please a valid index \n")
            
            break
        end
        
        %tests if the row is full
        if board(1,choice(i))==1 || board(1,choice(i))==2
            fprintf("this column is full, please try an empty column");
            %choice(i)=input("enter column index from 1-7: ");
            break
        end
        
        
        if board(6,choice(i))==0
            board(6,choice(i))=2;
            decoration();
            disp(board);
            break
        end
        
        %row-1 gets the row above, essentially, if the row below is full
        %and the row above is empty, the number can be filled in the row
        %above.
        if board(row,choice(i))==2 && board(row-1,choice(i))==0 || board(row,choice(i))==1 && board(row-1,choice(i))==0
            board(row-1,choice(i))=2;
            decoration();
            disp(board);
            break
        end
        
    end
    
    %now we move onto the computer choice, which is made after the users
    %choice
    %gets the computers choice (A random column from 1 to 7);
    compchoice(i)=randi(7);
    
    for row=[6:-1:2]
        if board(6,compchoice(i))==0;
            board(6,compchoice(i))=1;
            decoration();
            disp(board);
            break
        end
        
        %row-1 gets the row above, essentially, if the row below is full
        %and the row above is empty, the number can be filled in the row
        %above.
        
        if board(row,compchoice(i))==2 && board(row-1,compchoice(i))==0 || board(row,compchoice(i))==1 && board(row-1,compchoice(i))==0
            
            board(row-1,compchoice(i))=1;
            decoration();
            disp(board);
            break
        end
    end
    %%checks for users wins%%
    %vertically
    
    for col=7:-1:1 %this is because the board cannot exceed 6
        for row=6:-1:4 %we go to 4 as index cannot be less than 1 for row-3.
            if board(row,col) == 1 && board(row-1,col)== 1 && board(row-2,col)== 1 && board(row-3,col)== 1
                
                disp(" ======== computer wins ======== ");
                computerscore = computerscore +1;
                fprintf("userscore:  %d",userscore);
                fprintf("\n");
                fprintf("computerscore:  %d",computerscore);
                flag=1; %this is a way to break out of nested loops
                %win=1;
                break
            elseif board(row,col) == 2 && board(row-1,col)== 2 && board(row-2,col)== 2 && board(row-3,col)== 2
                disp(" ======== you win ======== ");
                userscore = userscore+1;
                
                fprintf("userscore: %d",userscore);
                fprintf("\n");
                fprintf("computerscore: %d",computerscore);
                flag=1;
                break
            end
        end
    end
    
    
    
    %horizontally
    
    for col=7:-1:4 %this is because the board cannot exceed 6
        for row=6:-1:1 %we go to 4 as index cannot be less than 1 for row-3.
            if board(row,col) == 1 && board(row,col-1)== 1 && board(row,col-2)== 1 && board(row,col-3)== 1
                
                disp(" ======== computer wins ======== ");
                flag=1; %this is a way to break out of nested loops
                %win=1;
                break
            elseif board(row,col) == 2 && board(row,col-1)== 2 && board(row,col-2)== 2 && board(row,col-3)== 2
                disp(" ======== you win ======== ");
                flag=1;
                break
            end
        end
    end
    
    %diagonally /
    
    for row=6:-1:4
        for col=1:1:4
            if board(row,col) == 1 && board(row-1,col+1)== 1 && board(row-2,col+2)== 1 && board(row-3,col+3)== 1
                
                disp(" ======== computer wins ========  /");
                flag=1; %this is a way to break out of nested loops
                %win=1;
                break
            elseif board(row,col) == 2 && board(row-1,col+1)== 2 && board(row-2,col+2)== 2 && board(row-3,col+3)== 2
                disp(" ======== you win ========  /");
                flag=1;
                break
            end
        end
    end
    
    %diagonally \
    for col=1:1:4 %this is because the board cannot exceed 6
        for row=1:1:3 %we go to 4 as index cannot be less than 1 for row-3.
            if board(row,col) == 1 && board(row+1,col+1)== 1 && board(row+2,col+2)== 1 && board(row+3,col+3)== 1
                
                disp(" ======== computer wins  ======== \");
                flag=1; %this is a way to break out of nested loops
                %win=1;
                break
            elseif board(row,col) == 2 && board(row+1,col+1)== 2 && board(row+2,col+2)== 2 && board(row+3,col+3)== 2
                disp(" ======== you win ======== \");
                flag=1;
                break
            end
        end
    end
    
    
    if flag==1
        again = input("would you like to play again yes/no: ","s")
        switch again
            case 'yes'
                disp("Let's play again!");
                playgame();
                
            otherwise
                
                endgame();
                %error arises when again = 'no'
        end
    end
    
end
end





