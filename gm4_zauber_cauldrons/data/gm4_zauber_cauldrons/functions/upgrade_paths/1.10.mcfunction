# add pre-computed location and dimension data to existing Zauber Cauldrons, if there is a player in the same dimension as the cauldron (required for obtaining the dimension id)
execute as @e[type=marker,tag=gm4_zauber_cauldron,scores={gm4_entity_version=..1}] at @s if entity @p[x=0] run function gm4_zauber_cauldrons:cauldron/setup/initialize_marker
tag @a remove gm4_zc_luck
