chel(mark,otl).
chel(misha,troy).
chel(vera,hor).
chel(masha,otl).
student(mark,man).
student( misha,man).
student(vera,woman).
student(masha,woman).
molodec(X,Y):-student(X,Y),chel(X,otl).
molodec(X,Y):-student(X,Y),chel(X,hor).