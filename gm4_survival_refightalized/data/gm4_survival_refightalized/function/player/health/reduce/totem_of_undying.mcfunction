
# if player has resistance from module remove said resistance
execute store result score $resistance_level gm4_sr_data run data get storage gm4_survival_refightalized:temp active_effects[{id:"minecraft:resistance"}].amplifier
execute if score $resistance_level gm4_sr_data matches -1 run function gm4_survival_refightalized:player/health/damaged/resistance_remove

# damage player to trigger totem
damage @s 99999999999999 generic

# dev damage log
tellraw @s[tag=gm4_sr_dev] [{"text":"Triggered Totem","color":"gray"}]
