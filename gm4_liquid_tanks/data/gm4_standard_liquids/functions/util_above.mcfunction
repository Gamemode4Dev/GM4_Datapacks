#@s = tank with entity above it positioned ~ ~1 ~
#run from liquid_tanks:process via #gm4_liquid_tanks:util_above

tag @s add gm4_processing_tank

#cow
execute as @e[dx=0,type=cow,tag=!smithed.entity] run function gm4_standard_liquids:util/mobs/cow

#mooshroom
execute as @e[dx=0,type=mooshroom,tag=!smithed.entity] run function gm4_standard_liquids:util/mobs/mooshroom

#snow golem
execute as @e[dx=0,type=snow_golem,tag=!smithed.entity,predicate=gm4_standard_liquids:suspended_snow_golem] run function gm4_standard_liquids:util/mobs/snow_golem

#squids
execute as @e[dx=0,type=squid,tag=!smithed.entity] run function gm4_standard_liquids:util/mobs/squid
execute as @e[dx=0,type=glow_squid,tag=!smithed.entity] run function gm4_standard_liquids:util/mobs/glow_squid

#experience orb
execute positioned ~0.5 ~ ~0.5 if entity @e[distance=..0.5,type=experience_orb] if score @s[tag=gm4_lt_empty] gm4_lt_value matches 0 at @s run function gm4_standard_liquids:liquid_init/experience
execute positioned ~0.5 ~ ~0.5 if score @s[tag=gm4_lt_experience] gm4_lt_value matches ..1394 as @e[distance=..0.5,type=experience_orb] run function gm4_standard_liquids:util/experience_orb

#player depositing experience
execute if score $schedule_deposit_exp gm4_lt_util matches 2.. run schedule clear gm4_standard_liquids:util/scheduled_deposit_exp
execute positioned ~0.5 ~ ~0.5 if entity @a[distance=..0.5,gamemode=!spectator] run scoreboard players set $schedule_deposit_exp gm4_lt_util 1
execute positioned ~0.5 ~ ~0.5 if entity @a[distance=..0.5,gamemode=!spectator] run schedule function gm4_standard_liquids:util/scheduled_deposit_exp 1t

#dripstone cauldron
execute if entity @e[dx=0,type=area_effect_cloud,tag=gm4_ltu_dripstone_cauldron] run function gm4_standard_liquids:util/drain_cauldron

#cauldrons
execute if entity @s[tag=gm4_lt_water] run function gm4_standard_liquids:util/fill_cauldrons
execute if entity @s[tag=gm4_lt_lava] run function gm4_standard_liquids:util/fill_cauldrons
execute if entity @s[tag=gm4_lt_powder_snow] run function gm4_standard_liquids:util/fill_cauldrons

#honey cauldron
execute if entity @s[tag=gm4_lt_honey] run function gm4_standard_liquids:util/honey_casting/honey_tank

#furnace
execute if entity @s[tag=gm4_lt_lava] run function gm4_standard_liquids:util/furnace_fueling/lava_tank


tag @s remove gm4_processing_tank
