function [dictout]=delete_redundant_entries(dictin)

  dictin(find(dictin(:,5) == 0), : ) = [];
  
  dictout=dictin;