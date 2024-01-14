# selects flowers to be poisounous (=1) or lucky (=0)
# none
# at world spawn
# Run from init if $required_flowers gm4_zc_flowers has no score

# initialize randomizer
random reset gm4_zauber_cauldrons:flowers/poisonous_flowers 0 true true

# assign poisonous/lucky score
for flower_data in ctx.meta['flower_types']:
    execute store result score f"${flower_data['flower']}" gm4_zc_flowers run random value 0..1 gm4_zauber_cauldrons:flowers/poisonous_flowers

# store amount of non poisonous flowers as 12-<sum of flower scores>
scoreboard players set $required_flowers gm4_zc_flowers 12
for flower_data in ctx.meta['flower_types']:
    scoreboard players operation $required_flowers gm4_zc_flowers -= f"${flower_data['flower']}" gm4_zc_flowers
