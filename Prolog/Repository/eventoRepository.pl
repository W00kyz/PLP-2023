:- module(eventoRepository, [saveEvento/1, deleteById/1, getById/2, getAllEvento/1, getByIdAgendamento/2]).
:- use_module("../Data/data.pl").
:- use_module("../Utils/conversors.pl").
:- use_module("../Utils/parsers.pl").

% Fato dinâmico para gerar o id dos agentes
:- dynamic id/1.

% Gera um novo ID incremental
novo_id(ID) :-
    retract(id(IDAnterior)),
    ID is IDAnterior + 1,
    assert(id(ID)).

% Obtém o último ID usado
ultimo_id(ID) :-
    retract(id(ID)),
    assert(id(ID)).

path('eventos.csv').

saveEvento(Evento) :- 
    path(Path),
    ultimo_id(ID),
    writeln('flag0'),
    novo_id(NovoID),
    writeln('flag1'),
    insertAtFirst(NovoID, Evento, List),
    writeln(List),
    parseList(List, Row),
    writeln(Row),
    saveRow(Path, Row),
    writeln('fim').

getByIdAgendamento(IdAgendamento, Evento) :- path(Path), getByIdAgendamentoRow(Path, IdAgendamento, Row), parseTable(Row, Evento).

deleteById(Id) :- path(Path), deleteRow(Path, Id).

getById(Id, Evento) :- path(Path), getByIdRow(Path, Id, Row), parseRow(Row, Evento).

getAllEvento(Eventos) :- path(Path), getAllRows(Path, Rows), parseTable(Rows, Eventos).

updateEvento(Id, Evento) :- path(Path), listToRow(Evento, Row), updateRow(Path, Id, Row).