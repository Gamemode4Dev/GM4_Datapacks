# process player
# @s = online player
# at unspecified
# run from player/submain

# process player deaths
execute if score @s[scores={gm4_ce_deaths=1..}] gm4_ce_alivetime matches ..16 run function gm4_combat_expanded:player/process_death

# translate being hit / killing mobs to timers
# translate hurt2 score to count absorbed damage as well
scoreboard players operation @s gm4_ce_hurt += @s gm4_ce_hurt2
scoreboard players set @s[scores={gm4_ce_hurt=1..}] gm4_ce_t_hurt 5
scoreboard players set @s[scores={gm4_ce_kill=1..}] gm4_ce_t_kill 5

# natural regen
execute unless score $natural_regen gm4_ce_data matches -1 store result score $natural_regen gm4_ce_data run gamerule naturalRegeneration
execute if score $natural_regen gm4_ce_data matches 0 unless score @s[scores={gm4_ce_hunger=18..}] gm4_ce_natural_regen_damage matches 1.. run function gm4_combat_expanded:player/regen/check

# check for archer armor
tag @s remove gm4_ce_wearing_archer
tag @s[predicate=gm4_combat_expanded:modified_armor/archer/wearing] add gm4_ce_wearing_archer

# remove husk sprint score if player didn't sprint for too long
execute unless score @s gm4_ce_sprinting matches 1.. run scoreboard players add @s[scores={gm4_ce_t_sprinting=1..}] gm4_ce_sprinting_timeout 1
scoreboard players reset @s[scores={gm4_ce_sprinting_timeout=3..,gm4_ce_t_sprinting=1..}] gm4_ce_t_sprinting

# remove tags
tag @s remove gm4_ce_beacon_active
execute if entity @s[tag=gm4_ce_immune_active] run function gm4_combat_expanded:armor/modifier/type/immune/clear_immunities

# process armor
execute if predicate gm4_combat_expanded:modified_armor/wearing run function gm4_combat_expanded:armor/process

# shield players if they have stored shield
execute if score @s gm4_ce_absorp matches 1.. run function gm4_combat_expanded:player/shield/prep
# heal players if they have stored health
execute if score @s gm4_ce_healstore matches 1.. run function gm4_combat_expanded:player/heal/heal_calc

# process player sleeping
execute if score @s gm4_ce_sleep matches 1.. at @s run function gm4_combat_expanded:home/detect_sleep

##TODO: remove this
# DEV: trigger for players with `gm4_ce_dev` tag
execute if entity @s[tag=gm4_ce_dev] at @s as @e[type=#gm4_combat_expanded:modify,limit=1,sort=nearest] run function gm4_combat_expanded:debug/dev 
