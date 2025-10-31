scoreboard objectives add gm4_ml_data dummy
scoreboard objectives add gm4_ml_heat dummy

scoreboard objectives add gm4_ml_ore_al dummy
scoreboard objectives add gm4_ml_ore_ba dummy
scoreboard objectives add gm4_ml_ore_bi dummy
scoreboard objectives add gm4_ml_ore_th dummy

#arborenda
function gm4_arborenda_shamir:init_scoreboards
#declare gm4_arborenda_shamir:temp

#ender_bolt
scoreboard objectives add gm4_bolt_time dummy
scoreboard objectives add gm4_ender_bolt_own_id dummy
scoreboard objectives add gm4_ender_bolt_foreign_id dummy
execute unless score $enable_pvp gm4_ender_bolt_foreign_id matches 0..1 run scoreboard players set $enable_pvp gm4_ender_bolt_foreign_id 1 

#infinitas
scoreboard objectives add gm4_infinitas_empty_held dummy
scoreboard objectives add gm4_infinitas_lava_held dummy
scoreboard objectives add gm4_infinitas_powder_snow_held dummy
scoreboard objectives add gm4_infinitas_water_held dummy
scoreboard objectives add gm4_infinitas_leave minecraft.custom:leave_game
scoreboard objectives add gm4_infinitas_success_check dummy
scoreboard players add $lava_infinitas gm4_ml_data 0
scoreboard players add $powder_snow_infinitas gm4_ml_data 0

#musical
scoreboard objectives add gm4_note_collect totalKillCount
scoreboard objectives add gm4_note_time dummy

#sensus
scoreboard players set $current_sensus_layer gm4_ml_data 0

#vibro
scoreboard objectives add gm4_vibro_fall minecraft.custom:minecraft.fall_one_cm
scoreboard objectives add gm4_vibro_hurt minecraft.custom:minecraft.damage_taken
scoreboard objectives add gm4_vibro_absorb minecraft.custom:minecraft.damage_absorbed
scoreboard objectives add gm4_vibro_shock dummy
scoreboard objectives add gm4_vibro_sneak dummy
scoreboard players set #shock_multiplier gm4_vibro_shock 20
scoreboard players set #100 gm4_vibro_shock 100

execute unless score metallurgy gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Metallurgy"}
execute unless score metallurgy gm4_earliest_version < metallurgy gm4_modules run scoreboard players operation metallurgy gm4_earliest_version = metallurgy gm4_modules
scoreboard players set metallurgy gm4_modules 1

schedule function gm4_metallurgy:main 1t
schedule function gm4_metallurgy:tick 1t



#$moduleUpdateList
