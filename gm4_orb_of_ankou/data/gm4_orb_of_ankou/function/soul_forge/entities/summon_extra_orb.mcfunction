# @s = soul forge without fire with extra orb in storage
# run from soul_forge/destroy

# spawn silverfish
data modify storage gm4_orb_of_ankou:temp current_orb set from storage gm4_orb_of_ankou:temp equipment.head
execute positioned ~ ~0.2 ~ summon silverfish run function gm4_orb_of_ankou:soul_forge/entities/set_data/living_orb

# visuals
playsound minecraft:entity.silverfish.hurt hostile @a[distance=..12] ~ ~ ~ 0.7 1
