%%%code to calcuate probabilties in accordance with page 59 of logbook

createcodes=1;
max=1000;

for k=1:1
    index=1;
   
    
    
    if createcodes==1
codewords = createExpGcodes(max,k);
end
for p1=0.025:0.05:1
  
%set how many symbols we need to go down (also includes the test length)


%set S parameter
s=zeta_p1_to_s(p1);

%set K parameter for codewords


Pac=0;
Pab=0;
Pcf=0;
Pce=0;
Pdg=0;
Pgi=0;
Pgh=0;
Pdb=0;
Pbdzeros=0;
Pbdones=0;

%set flag for creating codewords


createsymbols=1;

num_symbols=10000;
%set how far we want to go for conditional probabilities
g=20;


%% create RExp codewords


%% select codeword if required
%identify symbol of interest

if createsymbols==1
%generate symbols
symbols=generate_random_symbols(num_symbols,'distribution_zeta',s,max);
end

codewordout=[];

for num=1:length(symbols)
codeword=idcodeword(symbols(num),codewords);
reorderedcodeword=reordercodewordRExpG(codeword,k);
[Pac,Pab,Pcf,Pce,Pdg,Pgi,Pgh,Pdb,Pbdzeros,Pbdones]=Calculatetransitions(reorderedcodeword,Pac,Pab,Pcf,Pce,Pdg,Pgi,Pgh,Pdb,Pbdzeros,Pbdones);
codewordout = [codewordout,reorderedcodeword];
end


totaltransitions = sumthemall(Pac,Pab,Pcf,Pce,Pdg,Pgi,Pgh,Pdb,Pbdzeros,Pbdones);

averagecodewordlength=length(codewordout)/length(symbols);

for x=1:max
Px (x) = x.^-s/zeta(s);
end

information=measure_information_probdist(Px);

rate(index,k)=information/averagecodewordlength;
index=index+1;
end
end
averagetransitions = totaltransitions/averagecodewordlength;


PACreal=Pac/averagetransitions;
PABreal=Pab/averagetransitions;
% PCF=Pcf/ sumthemall(Pcf,Pce,Pdg,Pgi,Pgh,Pdb,Pbdzeros,Pbdones);
% PCE=Pce/sumthemall(Pcf,Pce,Pdg,Pgi,Pgh,Pdb,Pbdzeros,Pbdones);
% PDG=Pdg/sumthemall(Pdg,Pgi,Pgh,Pdb,Pbdzeros,Pbdones);
% PGI=Pgi/sumthemall(Pgi,Pgh);
% PGH=Pgh/sumthemall(Pgi,Pgh);
% PDB=Pdb/sumthemall(Pdg,Pgi,Pgh,Pdb,Pbdzeros,Pbdones);
% PBDzeros=Pbdzeros/sumthemall(Pdg,Pgi,Pgh,Pdb,Pbdzeros,Pbdones);
% PBDones=Pbdones/sumthemall(Pdg,Pgi,Pgh,Pdb,Pbdzeros,Pbdones);

PCFreal=Pcf/ sumthemall(Pcf,Pce);
PCEreal=Pce/sumthemall(Pcf,Pce);
PDGreal=Pdg/sumthemall(Pdg,Pdb);
PGIreal=Pgi/sumthemall(Pgi,Pgh);
PGHreal=Pgh/sumthemall(Pgi,Pgh);
PDBreal=Pdb/sumthemall(Pdg,Pdb);
PBDzerosreal=Pbdzeros/sumthemall(Pbdzeros,Pbdones);
PBDonesreal=Pbdones/sumthemall(Pbdzeros,Pbdones);
