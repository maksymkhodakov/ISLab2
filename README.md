## Ходаков Максим ТТП-42
### Лабораторна робота №2 з дисципліни "Інтелектуальні системи"
#### Сайт для запуску: [onecompiler.com/prolog](https://onecompiler.com/prolog), але він може не підтримувати всі можливості, тому можна використовувати середовище [SWI-Prolog](https://www.swi-prolog.org/).

-----
##### Проконсультуватися команда:
```
?- consult('/Users/maksymkhodakov/Downloads/ISLab2/ISLab2/knowledge_base.pl').
```

-----
##### Структура онтології:
```
                                living_being
                                     |
                _____________________|__________________
               |                                        |
            plant                                   animal
         _____|______                           ________|_________
        |           |                         |        |        |
      tree        herb                       mammal   bird    reptile
       |            |                         |       |         |
    leaf, branch flower                    cat, dog   sparrow  lizard, snake
        |                                lion, tiger            crocodile
```

-----
##### Чи наслідує:
```
?- inherit(lion, animal).
?- inherit(dolphin, living_being).
```

-----
##### Чи є частиною:
```
?- part_of_chain(tail, body).
?- part_of_chain(claw, body).
?- part_of_chain(beak, animal).
```


-----
##### Перевірка заборони спадкування:
```
?- prohibit_inheritance(leg, animal).
?- prohibit_inheritance(teeth, animal).
```


-----
##### Мульти-спадкування:
```
?- multi_inherit(mermaid, [mythical_creature, human]).
?- multi_inherit(dragon, [mythical_creature, reptile]).
?- multi_inherit(basilisk, [mythical_creature, reptile]).
?- multi_inherit(centaur, [mythical_creature, horse, human]).
```

-----
##### Виведення всіх предків:
```
?- inherit(tiger, Ancestor).
?- inherit(dolphin, Ancestor).
?- inherit(whale, Ancestor).
```


-----
#### Перевірка причинно-наслідкового зв'язку:

##### Чи викликає lion страх у deer?
```
?- causes(lion, fear_in_deer).
```
##### Чи викликає fire руйнування через dragon?
```
?- causal_chain(fire, destruction).
```

##### Нескінченне виведення через циклічний зв'язок:
```
?- causal_chain(cycle, X).
```

-----
#### Перевірка зв'язку requires:
##### Чи потребує bird air?
```
?- requires(bird, air).
```
##### Чи потребує dragon sunlight через fire?
```
?- required_chain(dragon, sunlight).
```

#### Перевірка всіх наслідків від lion:
#### Виведення всіх ефектів, які викликає lion:
```
?- causal_chain(lion, Effect).
```

#### Перевірка всіх необхідних умов для fish:
```
?- required_chain(fish, Condition).
```

-----
#### Перевірка взаємодій:
##### Чи взаємодіють lion і tiger?
```
?- interaction(lion, tiger).
```

##### Транзитивна взаємодія між об'єктами:
```
?- interaction_chain(lion, basilisk).
```

-----
#### Перевірка залежностей:
##### Чи залежить dragon від fire?
```
?- dependent_on(dragon, fire).
```

##### Транзитивна залежність між об'єктами:
```
?- dependency_chain(dragon, sunlight).
```

----
### Поєднання всіх типів зв'язків:
#### Чи є частиною dragon (part_of) щось, що викликає (causes) страх у human?
```
?- part_of_chain(Part, dragon), causes(Part, fear_in_human).
```

----
### Виконання основних умов:

1. **Prolog**:  
   Використовується мова Prolog для визначення фактів, правил та запитів. Це основна мова для виконання завдання.  
   **Виконано:** ✔

2. **Набір фактів (не менше 25 початкових)**:  
   У базі знань більше 25 початкових фактів (33 факти `is_a` та 21 факт `part_of`).  
   **Виконано:** ✔

3. **Набір правил виведення**:  
   Є декілька правил:
   - `inherit/2` для спадкування.
   - `part_of_chain/2` для транзитивності частин.
   - `prohibit_inheritance/2` для заборони спадкування.
   - `multi_inherit/2` для мульти-спадкування.
   - `causal_chain/2` для транзитивності причинно-наслідкового зв'язку.
   - `required_chain/2` для транзитивності зв'язку вимог.
   - `interaction_chain/2` для транзитивності взаємодій.
   - `dependency_chain/2` для транзитивності залежностей.

   Всі ці правила дозволяють виводити нові факти на основі початкових.  
   **Виконано:** ✔

4. **Набір фактів утворює онтологію**:  
   Факти утворюють структуру, що визначає ієрархію об'єктів (`is_a`) і зв'язки частина-ціле (`part_of`).  
   **Виконано:** ✔

5. **Онтологія містить 2 типи зв'язків**:  
   Використовуються як `is_a` (родо-видові зв'язки), так і `part_of` (зв'язки частина-ціле).  
   **Виконано:** ✔

6. **Підграф з фактором галуження `is_a` ≥ 2 і висотою ≥ 3**:  
   Підграф з вузлом `animal`:
   - **Рівень 1:** `animal` (корінь).
   - **Рівень 2:** `mammal`, `bird`, `reptile`.
   - **Рівень 3:** Вузли від `mammal` (наприклад, `cat`, `dog`), від `bird` (наприклад, `sparrow`, `eagle`), від `reptile` (наприклад, `lizard`, `snake`).
   - **Фактор галуження** для `animal` = 3 (має 3 нащадки).
   - **Висота дерева** = 3.

   Вимоги щодо галуження та висоти дерева виконані.  
   **Виконано:** ✔

### Виконання додаткових умов:

1. **Мульти-спадкування:**  
   Реалізовано правило `multi_inherit/2`, яке перевіряє, чи об'єкт має два або три предки. Приклади з `mermaid` (`human`, `mythical_creature`) та `dragon` (`mythical_creature`, `reptile`).  
   **Виконано:** ✔

2. **Додаткові типи зв'язків:**  
   Додані два нові типи зв'язків:
   - `causes/2` для причинно-наслідкових зв'язків.
   - `requires/2` для функціональних зв'язків.
   - `interaction/2` та транзитивне правило `interaction_chain/2`.
   - `dependent_on/2` та транзитивне правило `dependency_chain/2`.

   Додані правила `causal_chain/2` та `required_chain/2`, які показують вплив нових типів зв'язків на виведення.  
   **Виконано:** ✔

3. **Заборона спадкування:**  
   Існує правило `prohibit_inheritance/2`, яке забороняє певні види спадкування (наприклад, `part_of` не може спадкуватися як `is_a`). Це реалізовано і працює для тестових запитів.  
   **Виконано:** ✔

4. **Потенційно нескінченне виведення нових тверджень:**  
   Використання рекурсивних правил (наприклад, для `part_of_chain/2` та `causal_chain/2`) може призвести до нескінченного виведення нових тверджень за певних умов. Наприклад, додавання факту `causes(fire, fire).` призведе до нескінченного виведення.  
   **Виконано:** ✔
