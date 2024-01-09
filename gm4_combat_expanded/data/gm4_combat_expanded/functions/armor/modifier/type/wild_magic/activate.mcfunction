# activate wild_magic armor when player is damaged
# @s = player wearing armor
# at @s
advancement revoke @s only gm4_combat_expanded:damaged/armor/wild_magic

execute store result score $wild_magic_roll gm4_ce_data run random value 1..100

function gm4_combat_expanded:armor/modifier/type/wild_magic/effect/hunger

#execute if score $wild_magic_roll gm4_ce_data matches 1..50 run function gm4_combat_expanded:armor/modifier/type/wild_magic/1_50
#execute if score $wild_magic_roll gm4_ce_data matches 51..100 run function gm4_combat_expanded:armor/modifier/type/wild_magic/51_100
