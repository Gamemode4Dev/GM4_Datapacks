execute unless score blasting_maces gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Blasting Maces"}
execute unless score blasting_maces gm4_earliest_version < blasting_maces gm4_modules run scoreboard players operation blasting_maces gm4_earliest_version = blasting_maces gm4_modules
scoreboard players set blasting_maces gm4_modules 1

# init module scoreboards
scoreboard objectives add gm4_blast_data dummy
scoreboard objectives add gm4_blast_charging dummy
scoreboard objectives add gm4_blast_charge_ticks dummy
scoreboard objectives add gm4_blast_slot dummy

schedule function gm4_blasting_maces:tick 1t
schedule function gm4_blasting_maces:main 1t
