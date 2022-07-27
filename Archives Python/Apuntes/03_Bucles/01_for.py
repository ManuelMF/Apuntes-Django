# Sintaxis 
# for variable in elemento a recorrer

#for i in [1,2,3,4,5]:
#	print("Hola")

#for i in "juan@PildorasInformaticas.es":
#	print("Hola", end=" ") # defines como acabara al poner un Hola {quite en enter}

email = False
mi_email= input("Introduce tu email: \n")
validadorA=0
validadorP=0
fallo=False

for i in mi_email:
	if i == "@": 
		validadorA+=1 
	A = mi_email.find("@")
	F =len(mi_email)
	validadorP = mi_email.count(".",A,F)

	for j in mi_email[0:A]:
		if j==".":
			loc = mi_email.find(j)
			if mi_email[loc+1:loc+2] == ".": fallo = True
			
if validadorA==1 and validadorP==1 and fallo==False: email = True

print(email)