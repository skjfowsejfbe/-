students = []
student1 = ['mark', 'man', 'otl']
students.append(student1)
student2 = ['misha', 'man', 'tr']
students.append(student2)
student3 = ['vera', 'woman', 'tr']
students.append(student3)
student4 = ['Masha', 'woman', 'hor']
students.append(student4)
for i in range(3):
 if students[i][1] == 'man' and (students[i][2] == 'otl' or students[i][2] == 'hor') :
  print(students[i][0])