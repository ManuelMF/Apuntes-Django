#para usar modulos hay que importarlos
import funciones_matematicas
#hay que poner el nombre del modulo
print(funciones_matematicas.sumar(7,6))
print(funciones_matematicas.restar(4,5))

#como dejar de poner el nombre del moduto
#asi introduciriamos una
from funciones_matematicas import sumar
print(sumar(3,14))

#asi introduciriamos todas
from funciones_matematicas import *
print(restar(3,14))
print(multiplicar(3,200))