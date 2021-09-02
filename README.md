# El Asadito 

## Ejercicio integrador

**Necesitamos desarrollar una aplicación para una persona que quiere sacar ciertas conclusiones sobre los asados que organiza con sus amigos.  A los asados se los identifica mediante el motivo de la convocatoria y se indica el lugar donde se realizó.**

```prolog
asado(llegoLaVacuna, parque).
asado(finDeLaCuarentena, patio).
```

Se sabe qué alimentos se incluían en cada asado. 
```prolog
alimento(llegoLaVacuna, chori).
alimento(llegoLaVacuna, tiraDeAsado).
alimento(llegoLaVacuna, provoleta).
alimento(finDeLaCuarentena, vacio). 
alimento(finDeLaCuarentena, provoleta).
```

De las personas que asistieron a los asados se conocen acciones destacadas que haya realizado. 
```prolog

asistio(llegoLaVacuna, flor, asador). 
asistio(llegoLaVacuna, marina, hizoChistes(3)).
asistio(llegoLaVacuna, marina, toca(guitarra, bien)). 
asistio(llegoLaVacuna, pablo, toca(violin, mal)). 
asistio(llegoLaVacuna, pablo, contoAnecdotaDe([marina,pablo]).
asistio(finDeLaCuarentena, pablo, hizoChistes(1)). 
asistio(finDeLaCuarentena, marina, toca(guitarra, mal)). 
```
### Modelar la información
Hacer lo que sea necesario para incorporar los siguientes conocimientos: 
- Los alimentos que le gusta comer en un asado a las diferentes personas.
- Hay otro amigo, Carlos, del que se sabe:
  - Fue a los dos asados, en uno de ellos contó una anecdotas suya y de su pareja y no hizo chistes, en el otro hizo de asador. 
  - La pareja de Carlos no asistió a ningún asado. 
  - Le gusta la provoleta y todo lo que sea carne.

### Resultado del asado 
Definir los predicados:
- `asadoExitoso/1` que dice si todos los alimentos que se sirvieron en el asado les gustan a todos los asistentes. 
- `asadoAceptable/1` que dice si todas los asistentes encontraron en el asado al menos un alimento que les guste. 
- `asadoFracasado/2` que dice si hubo una persona que no encontró nada que le guste en el asado, y cuál es dicha persona. 

### Buena onda
Definir el predicado `buenaOnda/2`, que permite saber, para cada asado, qué amigos hicieron cosas divertidas, como por ejemplo haber contando 2 o más chistes, tocar bien algún instrumento o contar una anécdota donde la mayoria de los involucrados asistieron al asado.

### Ejemplos
Completar la base con más datos y mostrar ejemplos de consulta de cada predicado principal.

### Conceptos
Justificar la aplicación de los siguientes conceptos en la resolución:
- Inversibilidad (mostrar ejemplos y contraejemplos)
- Universo cerrado
