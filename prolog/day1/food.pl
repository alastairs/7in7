food_type(cheddar, cheese).
food_type(ritz, cracker).
food_type(spam, meat).
food_type(sausage, meat).
food_type(lemonade, fizzy_drink).
food_type(chocolate, dessert).

flavour(sweet, dessert).
flavour(savoury, meat).
flavour(savoury, cheese).
flavour(sweet, fizzy_drink).

food_flavour(X, Y) :- food_type(X, Z), flavour(Y, Z).
