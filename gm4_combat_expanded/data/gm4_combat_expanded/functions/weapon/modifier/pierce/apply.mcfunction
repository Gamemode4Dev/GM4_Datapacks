# apply the piercing effect
# @s = entity that pierced is applied to
# at @s
# run from weapon/modifier/pierce/activate

scoreboard players set @s gm4_ce_pierce_timer 13

execute store result score $pierced_armor gm4_ce_data run attribute @s generic.armor modifier value get df679fe3-2d2a-429f-9dea-55a030b50964 -1
execute if score $pierced_armor gm4_ce_data matches 1.. run attribute @s generic.armor modifier remove df679fe3-2d2a-429f-9dea-55a030b50964
execute store result storage gm4_combat_expanded:temp pierce.pierced_armor int 1 run scoreboard players operation $pierced_armor gm4_ce_data += $level gm4_ce_data 
function gm4_combat_expanded:weapon/modifier/pierce/eval_pierced_armor with storage gm4_combat_expanded:temp pierce
data remove storage gm4_combat_expanded:temp pierce
