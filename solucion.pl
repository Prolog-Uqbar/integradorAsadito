asado(llegoLaVacuna, parque).
asado(finDeLaCuarentena, patio).

alimento(llegoLaVacuna, chori).
alimento(llegoLaVacuna, tiraDeAsado).
alimento(llegoLaVacuna, provoleta).
alimento(finDeLaCuarentena, vacio). 
alimento(finDeLaCuarentena, provoleta).

asistio(llegoLaVacuna, flor, asador). 
asistio(llegoLaVacuna, marina, hizoChistes(3)).
asistio(llegoLaVacuna, marina, toca(guitarra, bien)). 
asistio(llegoLaVacuna, pablo, toca(violin, mal)). 
asistio(llegoLaVacuna, pablo, contoAnecdotaDe([marina,pablo])).
asistio(finDeLaCuarentena, pablo, hizoChistes(1)). 
asistio(finDeLaCuarentena, marina, toca(guitarra, mal)).

%---------------------------------------------------------------------------------------------------
%% PUNTO 1

leGusta(flor,chori).
leGusta(flor,tiraDeAsado).
leGusta(marina,provoleta).
leGusta(marina,vacio).
leGusta(pablo,provoleta).
leGusta(pablo,vacio).
leGusta(tobias,bondiola).
leGusta(juan,chori).

asistio(llegoLaVacuna, carlos, contoAnecdotaDe([carlos,parejaDeCarlos])).
asistio(finDeLaCuarentena, carlos, asador).

esCarne(tiraDeAsado). 
esCarne(vacio).       
esCarne(bondiola).

leGusta(carlos,provoleta).
leGusta(carlos,Alimento) :-
    esCarne(Alimento).

%---------------------------------------------------------------------------------------------------
%% PUNTO 2

asadoExitoso(Asado) :-
    asado(Asado,_),
    forall((asistio(Asado,Persona,_),alimento(Asado,Alimento)),leGusta(Persona,Alimento)).

asadoAceptable(Asado) :-
    asado(Asado,_),
    forall(asistio(Asado,Persona,_),hayAlgoQueLeGusta(Persona,Asado)).

hayAlgoQueLeGusta(Persona,Asado):-
    alimento(Asado,Alimento),
    leGusta(Persona,Alimento).

asadoFracasado(Asado,Persona) :-
    asistio(Asado,Persona,_),
    not(hayAlgoQueLeGusta(Persona,Asado)).

%---------------------------------------------------------------------------------------------------
%% PUNTO 3

buenaOnda(Asado,Persona) :-
    asistio(Asado,Persona,Accion),
    accionDivertida(Asado,Accion).

accionDivertida(_,hizoChistes(Cantidad)) :-
    Cantidad >= 2.

accionDivertida(_,toca(_,bien)).

accionDivertida(Asado,contoAnecdotaDe(Involucrados)) :-
    length(Involucrados,CantidadInvolucrados),
    involucradosPresentes(Asado,Involucrados,CantidadInvolucradosPresentes),
    CantidadInvolucradosPresentes > CantInvolucradosAnecdota / 2.

involucradosPresentes(Asado,Involucrados,Cantidad) :-
    findall(Persona,(member(Persona,Involucrados), asistio(Persona,Asado,_)), Personas),
    length(Personas,Cantidad).