% Факти
is_a(lion, cat).
is_a(tiger, cat).
is_a(cat, mammal).
is_a(dog, mammal).
is_a(mammal, animal).
is_a(bird, animal).
is_a(sparrow, bird).
is_a(eagle, bird).
is_a(falcon, bird).
is_a(reptile, animal).
is_a(crocodile, reptile).
is_a(lizard, reptile).
is_a(snake, reptile).
is_a(horse, mammal).
is_a(deer, mammal).
is_a(whale, mammal).
is_a(dolphin, mammal).
is_a(shark, fish).
is_a(fish, animal).
is_a(cow, mammal).
is_a(buffalo, mammal).
is_a(plant, living_being).
is_a(animal, living_being).
is_a(tree, plant).
is_a(herb, plant).
is_a(human, mammal).
is_a(insect, animal).
is_a(butterfly, insect).
is_a(ant, insect).
is_a(frog, amphibian).
is_a(amphibian, animal).
is_a(mermaid, mythical_creature).
is_a(mermaid, human).
is_a(dragon, mythical_creature).
is_a(dragon, reptile).
is_a(basilisk, mythical_creature).
is_a(basilisk, reptile).

% Нові частини
part_of(head, body).
part_of(tail, body).
part_of(leg, body).
part_of(feather, bird).
part_of(fur, mammal).
part_of(skin, reptile).
part_of(leg, mammal).
part_of(leg, reptile).
part_of(teeth, head).
part_of(claw, leg).
part_of(beak, head).
part_of(horn, deer).
part_of(gill, fish).
part_of(fin, fish).
part_of(wing, bird).
part_of(leaf, tree).
part_of(branch, tree).
part_of(root, plant).
part_of(flower, plant).
part_of(wings, dragon).
part_of(tail, dragon).
part_of(venom, basilisk).

% Нові додаткові зв'язки
causes(lion, fear_in_deer).
causes(dragon, destruction).
causes(basilisk, paralysis).
causes(fire, destruction).
causes(cycle, cycle).  % рекурсивний зв'язок для нескінченного виведення
requires(bird, air).
requires(fish, water).
requires(plant, sunlight).
requires(dragon, fire).
requires(basilisk, darkness).
requires(frog, water).
interaction(lion, tiger).
interaction(dragon, basilisk).
dependent_on(dragon, fire).
dependent_on(plant, sunlight).
dependent_on(butterfly, flower).

% Правила для нових зв'язків
% Правило для транзитивності причинно-наслідкового зв'язку
causal_chain(X, Z) :- causes(X, Z).
causal_chain(X, Z) :- causes(X, Y), causal_chain(Y, Z).

% Правило для транзитивності зв'язку requires
required_chain(X, Z) :- requires(X, Z).
required_chain(X, Z) :- requires(X, Y), required_chain(Y, Z).

% Транзитивність для взаємодій (interaction)
interaction_chain(X, Z) :- interaction(X, Z).
interaction_chain(X, Z) :- interaction(X, Y), interaction_chain(Y, Z).

% Транзитивність для залежностей (dependent_on)
dependency_chain(X, Z) :- dependent_on(X, Z).
dependency_chain(X, Z) :- dependent_on(X, Y), dependency_chain(Y, Z).


% Правило спадкування is_a (якщо X is_a Y і Y is_a Z, то X is_a Z)
inherit(X, Z) :- is_a(X, Z).
inherit(X, Z) :- is_a(X, Y), inherit(Y, Z).

% Правило для транзитивності part_of (якщо X part_of Y і Y part_of Z, то X part_of Z)
part_of_chain(X, Z) :- part_of(X, Z).
part_of_chain(X, Z) :- part_of(X, Y), part_of_chain(Y, Z).

% Правило для частини-цілого з урахуванням is_a
part_of_chain(X, Z) :- is_a(X, Y), part_of(Y, Z).

% Заборона на використання зв'язків part_of по is_a
prohibit_inheritance(X, Z) :- part_of_chain(X, Y), is_a(Y, Z).

% Мульти-спадкування

% Мульти-спадкування для 2 предків
multi_inherit(X, [P1, P2]) :- is_a(X, P1), is_a(X, P2).

% Мульти-спадкування для 3 предків
multi_inherit(X, [P1, P2, P3]) :- is_a(X, P1), is_a(X, P2), is_a(X, P3).
