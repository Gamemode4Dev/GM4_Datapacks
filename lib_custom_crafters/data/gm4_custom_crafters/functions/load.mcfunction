scoreboard objectives add gm4_crafting dummy
scoreboard objectives add gm4_count dummy

schedule function gm4_custom_crafters:main 1t

# NOTE remove in 1.21 update
execute if entity @e[type=armor_stand,tag=gm4_custom_crafter_stand] run scoreboard players set custom_crafters gm4_earliest_version 300000
    # since libraries have no persistent data prior to 1.20, this is needed to differentiate a fresh install from an world that had seen an earlier CC version


