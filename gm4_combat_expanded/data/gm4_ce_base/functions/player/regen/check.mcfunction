# check if player can get some healing
# @s = player to regenerate
# at unspecified
# run from clocks/player_process
# run from armor/modifier/type/sustain/extra_regen

function gm4_ce_base:player/calculate_hp
execute store success score $wearing_half gm4_ce_data if score @s[predicate=gm4_ce_base:modified_armor/half] gm4_ce_health.current >= @s gm4_ce_health.max_half
execute if score @s gm4_ce_health.current < @s gm4_ce_health.max unless score $wearing_half gm4_ce_data matches 1 run scoreboard players add @s gm4_ce_healstore 1
# if player is on fire add some delay before next healing tick, fire should remain somewhat dangerous but not a death sentence if players just escaped lava
scoreboard players set @s[scores={gm4_ce_healstore=1..},predicate=gm4_ce_base:technical/on_fire] gm4_ce_natural_regen_damage 4
