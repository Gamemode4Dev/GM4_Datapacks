# Set up balloon animal and trade for the balloon animal trader
# @s = animal, balloon animal to be attached to trader
# at @s
# run from function, wandering_trader/pick_two_animals

execute store result score $animal_id gm4_balloon_animals_data run loot spawn ~ ~-4096 ~ loot gm4_balloon_animals:technical/random/enumeration_value

for animal in ctx.meta['animals']:
    if animal['function'] != 'init_animal':
        execute if score $animal_id gm4_balloon_animals_data matches ctx.meta['enumeration'].index(animal['id']) run function f"gm4_balloon_animals:wandering_trader/trade/{animal['function']}"
        continue
        
    execute if score $animal_id gm4_balloon_animals_data matches ctx.meta['enumeration'].index(animal['id']) summon animal['id'] run function f"gm4_balloon_animals:wandering_trader/trade/{animal['function']}"
        
