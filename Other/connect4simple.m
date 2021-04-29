%function[] = board(size)
%end


board = zeros(6,7)
disp("     1     2     3     4     5     6     7");
disp("     _____________________________________");
disp(board);

%the char function is a great way to get rid of letter code and actually
%print out the letters as designated


for i=1:42 %this is because there are 6*7=42 possible entries, so we put the code in a big while loop to run thorough the code for each entry.
    
    %get the computers choice
    
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
        
        
        if board(6,choice(i))==0;
            board(6,choice(i))=2;
            disp(board);
            break
        end
        
        %row-1 gets the row above, essentially, if the row below is full
        %and the row above is empty, the number can be filled in the row
        %above.
        if board(row,choice(i))==2 && board(row-1,choice(i))==0 || board(row,choice(i))==1 && board(row-1,choice(i))==0
            board(row-1,choice(i))=2;
            disp(board);
            break
        end
        
    end
    
    %now we move onto the computer choice, which is made after the users
    %choice
    compchoice(i)=randi(7);
    
    for row=[6:-1:2]
        if board(6,compchoice(i))==0;
            board(6,compchoice(i))=1;
            disp(board);
            break
        end
        
        %row-1 gets the row above, essentially, if the row below is full
        %and the row above is empty, the number can be filled in the row
        %above.
        
        if board(row,compchoice(i))==2 && board(row-1,compchoice(i))==0 || board(row,compchoice(i))==1 && board(row-1,compchoice(i))==0
            
            board(row-1,compchoice(i))=1;
            disp(board);
            break
        end
    end
    %%checks for users wins%%
    %vertically
  
    for col=7:-1:1 %this is because the board cannot exceed 6
        for row=6:-1:4 %we go to 4 as index cannot be less than 1 for row-3.
            if board(row,col) == 1 && board(row-1,col)== 1 && board(row-2,col)== 1 && board(row-3,col)== 1
                
                disp("computer wins");
                flag=1; %this is a way to break out of nested loops
                %win=1;
                break
            elseif board(row,col) == 2 && board(row-1,col)== 2 && board(row-2,col)== 2 && board(row-3,col)== 2
                disp("you win");
                flag=1;
                break
            end
        end
    end
    

  
    %horizontally
 
        for col=7:-1:4 %this is because the board cannot exceed 6
            for row=6:-1:1 %we go to 4 as index cannot be less than 1 for row-3.
                if board(row,col) == 1 && board(row,col-1)== 1 && board(row,col-2)== 1 && board(row,col-3)== 1

                    disp("computer wins");
                    flag=1; %this is a way to break out of nested loops
                    %win=1;
                    break
                elseif board(row,col) == 2 && board(row,col-1)== 2 && board(row,col-2)== 2 && board(row,col-3)== 2
                    disp("you win");
                    flag=1;
                    break
                end
            end
        end

    %diagonally /

    for row=6:-1:4 
            for col=1:1:4 
                if board(row,col) == 1 && board(row-1,col+1)== 1 && board(row-2,col+2)== 1 && board(row-3,col+3)== 1

                    disp("computer wins /");
                    flag=1; %this is a way to break out of nested loops
                    %win=1;
                    break
                elseif board(row,col) == 2 && board(row-1,col+1)== 2 && board(row-2,col+2)== 2 && board(row-3,col+3)== 2
                    disp("you win /");
                    flag=1;
                    break
                end
            end
    end

    %diagonally \
    for col=1:1:4 %this is because the board cannot exceed 6
        for row=1:1:3 %we go to 4 as index cannot be less than 1 for row-3.
            if board(row,col) == 1 && board(row+1,col+1)== 1 && board(row+2,col+2)== 1 && board(row+3,col+3)== 1
                
                disp("computer wins \");
                flag=1; %this is a way to break out of nested loops
                %win=1;
                break
            elseif board(row,col) == 2 && board(row+1,col+1)== 2 && board(row+2,col+2)== 2 && board(row+3,col+3)== 2
                disp("you win \");
                flag=1;
                break
            end
        end
    end
    
end


%note 2 is the user and 1 is the computer.

disp(board);



