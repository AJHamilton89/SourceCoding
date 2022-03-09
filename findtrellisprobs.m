function [UECtransterminal,UECtranscarry,FLCtransleft,FLCtransright] = findtrellisprobs(mother,trellis,Px)


children=findchildren(mother,trellis);
UECtransterminal= sum(Px(mother))/(sum(Px(mother))+sum(Px(children)));
UECtranscarry=1-UECtransterminal;

firstchildren=findchild(mother,trellis);
left_children=findchildren(firstchildren(1),trellis);
right_children=findchildren(firstchildren(2),trellis);

FLCtransleft = sum(Px(left_children))/(sum(Px(left_children))+sum(Px(right_children)));
FLCtransright = 1-FLCtransleft;
end