# @s = wandering trader and no trader llamas, tag=gm4_balloon_animal_trader,tag=gm4_balloon_animal_trader_new
# at @s
# run from wandering_trader/pick_two_animals

execute store result score $animal_id gm4_balloon_animals_data run loot spawn ~ ~-4096 ~ loot gm4_balloon_animals:technical/random/enumeration_value

for animal in ctx.meta['animals']:
    if animal['function'] not in ['init_animal', 'init_wolf','init_farm']:
        execute if score $animal_id gm4_balloon_animals_data matches ctx.meta['enumeration'].index(animal['id']) summon minecraft:trader_llama run function f"gm4_balloon_animals:wandering_trader/trade/{animal['function']}"
        continue
        
    execute if score $animal_id gm4_balloon_animals_data matches ctx.meta['enumeration'].index(animal['id']) summon animal['id'] run function f"gm4_balloon_animals:wandering_trader/trade/{animal['function']}"
        
