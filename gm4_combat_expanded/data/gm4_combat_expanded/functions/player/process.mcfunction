# process player
# @s = online player
# at unspecified
# run from player/submain

# process player deaths
execute if score @s[scores={gm4_ce_deaths=1..}] gm4_ce_alivetime matches ..16 run function gm4_combat_expanded:player/process_death

# translate being hit to timer
# hurt2 also counts damage absorbed
scoreboard players operation @s gm4_ce_hurt2 += @s gm4_ce_hurt
scoreboard players set @s[scores={gm4_ce_hurt2=1..}] gm4_ce_t_hurt 5

# natural regen
execute unless score $natural_regen gm4_ce_data matches -1 store result score $natural_regen gm4_ce_data run gamerule naturalRegeneration
execute if score $natural_regen gm4_ce_data matches 0 unless score @s[scores={gm4_ce_hunger=18..}] gm4_ce_natural_regen_damage matches 1.. run function gm4_combat_expanded:player/regen/check

# check for archer armor
tag @s remove gm4_ce_wearing_archer
tag @s[predicate=gm4_combat_expanded:modified_armor/wearing_archer] add gm4_ce_wearing_archer

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

# reset mount tag from horse armor
execute on vehicle run tag @s remove gm4_ce_speed_given

# remove second wind tag if armor is taken off
tag @s[tag=gm4_ce_second_wind.active,predicate=!gm4_combat_expanded:modified_armor/wearing_second_wind] remove gm4_ce_second_wind.active

# check if player has no health left
execute store result score $player_health gm4_ce_data run attribute @s generic.max_health get
execute if score $player_health gm4_ce_data matches 0 run function gm4_combat_expanded:player/no_health_death

##TODO: remove this
# DEV: trigger for players with `gm4_ce_dev` tag
execute if entity @s[tag=gm4_ce_dev] at @s as @e[type=#gm4_combat_expanded:modify,limit=1,sort=nearest] run function gm4_combat_expanded:debug/dev 
