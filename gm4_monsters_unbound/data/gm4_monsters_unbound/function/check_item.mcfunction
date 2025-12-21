# check items on ground for Survival Refightalized items
# @s = item
# at unspecified
# run from tick

# tag item as checked and try to process
tag @s add gm4_mu_item_checked
scoreboard players set $item_processed gm4_mu_data 0

# check for spores
execute if items entity @s contents *[custom_data~{gm4_mu_spore:{}}] run function gm4_monsters_unbound:mob/process/spore/initialise

# check for elite death markers
execute if items entity @s contents *[custom_data~{gm4_mu_elite_on_death:{}}] at @s run function gm4_monsters_unbound:mob/process/elite/on_death/run
