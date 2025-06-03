# preventing death with death_protection item
# @s = player to damage
# at unspecified
# run from player/health/reduce/death

# if player has resistance from module remove said resistance
execute store result score $resistance_level gm4_sr_data run data get storage gm4_survival_refightalized:temp active_effects[{id:"minecraft:resistance"}].amplifier
execute if score $resistance_level gm4_sr_data matches -1 run function gm4_survival_refightalized:player/resistance/remove

# damage player to trigger death_protection item
damage @s 99999999999999 generic

# dev damage log
tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":"Triggered death_protection item","color":"gray"}]
