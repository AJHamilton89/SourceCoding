function [Pac,Pab,Pcf,Pce,Pdg,Pgi,Pgh,Pdb,Pbdzeros,Pbdones] = Calculatetransitions(codeword,Pac,Pab,Pcf,Pce,Pdg,Pgi,Pgh,Pdb,Pbdzeros,Pbdones)

for n=1:length(codeword)
    if  mod(n,2) == 1 % if N is odd
         if n==1 
             if codeword(1) == 1
                Pac=Pac+1;
                if codeword(n+1) == 1
                    Pcf=Pcf+1;

                else
                    Pce=Pce+1;

                end
                break
            elseif codeword(1) ==0
                Pab=Pab+1;
        end
        elseif codeword(n)==1
            Pdg=Pdg+1;
            if codeword(n+1)==1
                Pgi=Pgi+1;
                
            else
                Pgh=Pgh+1;
                
            end
            break
        else
            Pdb=Pdb+1;
        end
     
    else
        if codeword (n) ==1
            Pbdones=Pbdones+1;
        else
            Pbdzeros=Pbdzeros+1;
        end
    end
    
end
end

        
           