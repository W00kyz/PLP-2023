:- module(Agendar, [agendar/4, cancelarAgendamento/4]).
:- use_module('../../Models/Agendamento/Agendamento.pl').
:- use_module('../../Repository/agendamentosRepository.pl').

agendar(IDLocal, Data, Horario, Matricula) :-
    agendar_compromisso(IDLocal, Data, Horario, Matricula).

cancelarAgendamento(IDLocal, Data, Horario, Matricula) :-
    desalocar(IDLocal, Data, Horario, Matricula).