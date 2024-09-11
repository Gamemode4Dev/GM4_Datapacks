
scoreboard players set @s gm4_ce_pierce_timer 13

execute store result score $pierced_armor gm4_ce_data run attribute @s generic.armor modifier value get gm4_combat_expanded:pierced_armor -1
execute if score $pierced_armor gm4_ce_data matches 1.. run attribute @s generic.armor modifier remove gm4_combat_expanded:pierced_armor
execute store result storage gm4_combat_expanded:temp pierce.pierced_armor int 1 run scoreboard players add $pierced_armor gm4_ce_data 6
function gm4_combat_expanded:weapon/modifier/pierce/eval_pierced_armor with storage gm4_combat_expanded:temp pierce
data remove storage gm4_combat_expanded:temp pierce

# processing from pierce weapon

damage @s 14 magic at ~1.5 ~1 ~1.5

effect give @s[tag=!gm4_ce_immune_slowness] slowness 10 0
effect give @s darkness 10 0 true
effect give @s[tag=!gm4_ce_immune_fatigue] mining_fatigue 10 4 true
