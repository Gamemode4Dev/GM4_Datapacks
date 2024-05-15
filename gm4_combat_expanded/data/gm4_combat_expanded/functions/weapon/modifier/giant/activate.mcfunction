# deal AoE damage
# @s = player wielding the weapon
# at @s
# run from weapon/check_modifier

scoreboard players reset $giant_damage gm4_ce_data
execute if entity @s[advancements={gm4_combat_expanded:used_giant_weapon={10_heart=true}}] run scoreboard players set $giant_damage gm4_ce_data 10
execute unless score $giant_damage gm4_ce_data matches 1.. if entity @s[advancements={gm4_combat_expanded:used_giant_weapon={9_heart=true}}] run scoreboard players set $giant_damage gm4_ce_data 9
execute unless score $giant_damage gm4_ce_data matches 1.. if entity @s[advancements={gm4_combat_expanded:used_giant_weapon={8_heart=true}}] run scoreboard players set $giant_damage gm4_ce_data 8
execute unless score $giant_damage gm4_ce_data matches 1.. if entity @s[advancements={gm4_combat_expanded:used_giant_weapon={7_heart=true}}] run scoreboard players set $giant_damage gm4_ce_data 7
execute unless score $giant_damage gm4_ce_data matches 1.. if entity @s[advancements={gm4_combat_expanded:used_giant_weapon={6_heart=true}}] run scoreboard players set $giant_damage gm4_ce_data 6
execute unless score $giant_damage gm4_ce_data matches 1.. if entity @s[advancements={gm4_combat_expanded:used_giant_weapon={5_heart=true}}] run scoreboard players set $giant_damage gm4_ce_data 5
execute unless score $giant_damage gm4_ce_data matches 1.. if entity @s[advancements={gm4_combat_expanded:used_giant_weapon={4_heart=true}}] run scoreboard players set $giant_damage gm4_ce_data 4
execute unless score $giant_damage gm4_ce_data matches 1.. if entity @s[advancements={gm4_combat_expanded:used_giant_weapon={3_heart=true}}] run scoreboard players set $giant_damage gm4_ce_data 3
execute unless score $giant_damage gm4_ce_data matches 1.. if entity @s[advancements={gm4_combat_expanded:used_giant_weapon={2_heart=true}}] run scoreboard players set $giant_damage gm4_ce_data 2
execute unless score $giant_damage gm4_ce_data matches 1.. run scoreboard players set $giant_damage gm4_ce_data 1
advancement revoke @s only gm4_combat_expanded:used_giant_weapon

execute store result storage gm4_combat_expanded:temp giant_strike.range float 0.1 run attribute @s player.entity_interaction_range get 10
execute store result storage gm4_combat_expanded:temp giant_strike.damage int 2 run scoreboard players get $giant_damage gm4_ce_data

tag @s add gm4_ce_target
function gm4_combat_expanded:weapon/modifier/giant/eval_damage with storage gm4_combat_expanded:temp giant_strike
data remove storage gm4_combat_expanded:temp giant_strike
tag @s remove gm4_ce_target

particle minecraft:block{block_state:"minecraft:stone"} ~ ~ ~ 1 0.2 1 1 30
playsound minecraft:entity.zombie.attack_wooden_door player @a ~ ~ ~ 0.7 0.25
