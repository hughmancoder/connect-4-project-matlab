%Hugh Signoriello 2021. Matlab and C. 
%This is the main file
playgame(); %this calls the function play game which is stored below



function[] = decoration()
%this function simply gives the user a selection of all the indexes of the
%board. I chose to put this in a function to avoid code repetition. 
disp("     1     2     3     4     5     6     7");
disp("     _____________________________________");
%this is just decoration above the board to let the user know what column
%index is which on the board. 
end

function[] = endgame()
%if the user finishes the game, this functoin is called 
clc;
fprintf("thanks for playing");
fprintf("\n");
%exit is commented out as the command exit was somewhat obtrusive and
escape = input("would you like to exit program yes/no: ","s" )

%asks user if they want to exit program
if escape == 'yes'
%exit

else
    disp("the game will resume");
    playgame() 
end

%this command really does exit the program and close it. Be warned user! :)
end

function[] = playgame() %stores the main code in a function called playgame
board = zeros(6,7); %this creats and empty 6 by 7 board.

flag = 0; %assigns an intial value to a variable called flag, this will be later used to break out of nested loops.
initalcompchoice=randi(7); %the computer starts first, this selects a random column.
board(6,initalcompchoice)=1; %get a random column betwee 1 and 7 for the computers firt move
decoration(); %displays the decoration above the board
disp(board) %displays the board under the decoration

for i=1:42 %this is because there are 6*7=42 possible entries, so we put the code in a big while loop to run thorough the code for each entry.
   
    %=========gets the users choice=========
    choice(i)=input("enter column index from 1-7: ");
    fprintf("\n");
    
    %row goes to 2 maximum as row-1 offsets it to index 1.
    for row=[6:-1:2]
        
        %this test for invalid entries.
        if choice(i)~=[1:7]
            fprintf("not a valid input, please a valid index, try again \n")
            break
        end
        
        
        %tests if the row is full
        if board(1,choice(i))==1 || board(1,choice(i))==2
            fprintf("this column is full, please try an empty column");
            %choice(i)=input("enter column index from 1-7: ");
            break
        end
        
        %if the bottom row is empty, then the bottom row will be filled
        %with a 2.
        if board(6,choice(i))==0
            board(6,choice(i))=2;
            decoration();
            disp(board);
            break %breaks out of the for loop on line 50 so that the code does not repeat itself over and over. 
        end
        
        %row-1 gets the row above, essentially, if the row below is full
        %and the row above is empty, the number can be filled in the row
        %above.
        if board(row,choice(i))==2 && board(row-1,choice(i))==0 || board(row,choice(i))==1 && board(row-1,choice(i))==0
            board(row-1,choice(i))=2;
            decoration();
            disp(board);
            break %breaks out of for loop once 2 has been placed in the correct row and column. 
       
        end
        
    end
    
    %now we move onto the computer choice, which is made after the users
    %choice
    
    %(A random column from 1 to 7);
    %=========computers choice=========
    
    for col=[7:-1:1]
        for row=[6:-1:1]
            
            for row=[1:6] %index stacking for numbers upwards
            %=========verticle stack detection=========
            %we add indexes to go from top to bottom of the matrix board.
            %This assures that the upper values get detected
            if board(row,col)==0 && board(row+1,col)==2 && board(row+2,col)==2 && board(row+3,col)==2  %this checks vertically to see if the user has 2 connected upwards, so that the computer can stop user from winning
                board(row,col)=1; %row-2 gets the row above, and places a 1. This is the computers strategy to stop the user from stacking 1s consistently upwards. 
                
                decoration();
                disp(board);
                break
            end
            break
            end
            
            %we start from the bottom to the top this time to make sure the
            %bottom rows get detected
            for row=[6:-1:4] %index needs to be set to lower limit 3 as row-2 can take a minimum value of 1. 
            %=========verticle stack detection=========
            if board(row,col)==2 && board(row-1,col)==2 && board(row-2,col)==2 && board(row-3,col)==0  %this checks vertically to see if the user has 2 connected upwards, so that the computer can stop user from winning
                board(row-3,col)=1; %row-2 gets the row above, and places a 1. This is the computers strategy to stop the user from stacking 1s consistently upwards. 
                
                decoration();
                disp(board);
                break
            end
            break%breaks loop if number is printed
            end
            
            %=========horizontal stack detection, row 1=========
            for col=[7:-1:3]
                %3 in a row detection for first row (which takes index 6)
                if board(6,col) == 2 && board(6,col-1)== 2 && board(6,col-2)== 0
                    board(6,col-2)=1; %if user has 2 in a row, computer stops this from happening but on the left hand side.
                    decoration();
                    disp(board);
                    break
                end
                break
            end
            
                
             for col=[1:5]
              if board(6,col)==2 && board(6,col+1)== 2 && board(6,col+2)== 0
                    board(6,col+2)=1; %if user has 3 in a row, computer stops this from happening, but on the right hand side.
                    decoration();
                    disp(board);
                    break
               end
               break %breaks for loop
             end
            %=========horizontal stack detection row > 1 =========
           for col=[7:-1:3]
                %3 in a row detection 
                if board(row,col) == 2 && board(row,col-1)== 2 && board(row,col-2)== 0 && board(row+1,col-2) ~= 0
                    board(row,col-2)=1; %if user has 2 in a row, computer stops this from happening but on the left hand side.
                    decoration();
                    disp(board);
                    break
                end
                break
            end
            
                
             for col=[1:5]
              if board(row,col)==2  && board(row,col+1)== 2 && board(row,col+2)== 0  && board(row+1,col+2)~=0
                    board(row,col+2)=1; %if user has 3 in a row, computer stops this from happening, but on the right hand side.
                    decoration();
                    disp(board);
                    break
               end
               break %breaks nested for loop
             end
             break %breaks larger for loop
             
             %========computer strategy=========
             %test for spaces to connect e.g. 00x0 = 0010 
              for col=[1:4]
              if board(row,col)==1  && board(row,col+1)== 2 &&  board(row,col+2)== 0 && board(row,col+3)== 2  && board(row+1,col+2)~=0
                    board(row,col+2)=1; %if user has 3 in a row, computer stops this from happening, but on the right hand side.
                    decoration();
                    disp(board);
                    break
               end
               break %breaks nested for loop
             end
             break %breaks larger for loop
            
            
             %test for spaces to connect e.g. 0x00 = 0100 
              for col=[1:4]
              if board(row,col)==1  && board(row,col+1)== 0 &&  board(row,col+2)== 2 && board(row,col+3)== 2  && board(row+1,col+1)~=0
                    board(row,col+1)=1; %if user has 3 in a row, computer stops this from happening, but on the right hand side.
                    decoration();
                    disp(board);
                    break
               end
               break %breaks nested for loop
             end
             break %breaks larger for loop
            
        end
       
    end
   
   %if none of the above conditions are passed, then a random index is
   %generated
    compchoice(i)=randi(7); %gets random column from 1 to 7. 
    
    for row=[6:-1:2]
        %checks if the bottom row is empty.
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
    
    
    %=========checks for users wins=========%%
    %vertically
    
    for col=7:-1:1 %this is because the board cannot exceed 6
        for row=6:-1:4 %we go to 4 as index cannot be less than 1 for row-3.
            if board(row,col) == 1 && board(row-1,col)== 1 && board(row-2,col)== 1 && board(row-3,col)== 1
                
                disp(" ======== computer wins ======== ");
                
                flag=1; %this is a way to break out of nested loops
                %win=1;
                break
            elseif board(row,col) == 2 && board(row-1,col)== 2 && board(row-2,col)== 2 && board(row-3,col)== 2
                disp(" ======== you win ======== ");
               
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
        fprintf("\n");
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
%note 2 is the user and 1 is the computer.
