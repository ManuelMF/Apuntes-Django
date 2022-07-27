#Ejercicio 3:
#• Crea un programa que evalúe si una dirección de correo electrónico es válida o no en 
#función de si tiene “@” o “.” Hay que tener en cuenta que la dirección se considera 
#correcta si solo tiene una “@” y si tiene uno o más “.”
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