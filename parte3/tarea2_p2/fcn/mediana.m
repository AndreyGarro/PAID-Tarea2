
function B = mediana(A)
  
 A2=zeros(size(A)+2);
 B=zeros(size(A));
 
 for x=1:size(A,1)
   for y=1:size(A,2)
     A2(x+1,y+1, 1)=A(x,y, 1);
     A2(x+1,y+1, 2)=A(x,y, 2);
     A2(x+1,y+1, 3)=A(x,y, 3);
   end
 end

 
 for i= 1:size(A2,1)-2
   for j=1:size(A2,2)-2
     array=zeros(9,1);
     array2=zeros(9,1);
     array3=zeros(9,1);
     cont=1;
     for x=1:3
       for y=1:3
       array1(cont)=A2(i+x-1,j+y-1, 1);
       array2(cont)=A2(i+x-1,j+y-1, 2);
       array3(cont)=A2(i+x-1,j+y-1, 3);
       cont+=1;
      endfor
     endfor
   array1=sort(array1);
   array2=sort(array2);
   array3=sort(array3);
   B(i,j, 1)=array1(5);
   B(i,j, 2)=array2(5);
   B(i,j, 3)=array3(5);
   endfor
 endfor
B=uint8(B);
  
endfunction