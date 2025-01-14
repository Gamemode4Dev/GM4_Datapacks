execute unless score augmented_armor gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Augmented Armor"}
execute unless score augmented_armor gm4_earliest_version < augmented_armor gm4_modules run scoreboard players operation augmented_armor gm4_earliest_version = augmented_armor gm4_modules
scoreboard players set augmented_armor gm4_modules 1

# reset all links
data modify storage gm4_augmented_armor:data active_links set value [{id:-1,name:{"translate":"item.gm4.augmented_armor.name.link","fallback":"Unlinked %s","with":[{"translate":"item.minecraft.iron_chestplate","italic":false}],"italic":false,"color":"light_purple"}}]

# scoreboards
scoreboard objectives add gm4_aa_data dummy
scoreboard objectives add gm4_aa_id dummy
scoreboard objectives add gm4_aa_in_pvp dummy
scoreboard objectives add gm4_aa_in_combat dummy
scoreboard objectives add gm4_aa_keep_tick dummy

scoreboard objectives add gm4_aa_stat.damage_taken minecraft.custom:minecraft.damage_taken
scoreboard objectives add gm4_aa_stat.kills minecraft.custom:minecraft.mob_kills
scoreboard objectives add gm4_aa_stat.kills_add minecraft.custom:minecraft.player_kills
scoreboard objectives add gm4_aa_stat.sprint_one_cm minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add gm4_aa_stat.swim_one_cm minecraft.custom:minecraft.swim_one_cm
scoreboard objectives add gm4_aa_stat.used_bow minecraft.used:minecraft.bow
scoreboard objectives add gm4_aa_stat.used_crossbow minecraft.used:minecraft.crossbow
scoreboard objectives add gm4_aa_stat.armor armor
scoreboard objectives add gm4_aa_stat.damage_dealt minecraft.custom:minecraft.damage_dealt
scoreboard objectives add gm4_aa_stat.damage_dealt_add minecraft.custom:minecraft.damage_absorbed
scoreboard objectives add gm4_aa_stat.damage_dealt_resisted minecraft.custom:minecraft.damage_dealt_resisted

scoreboard objectives add gm4_aa_augment.link.id dummy
scoreboard objectives add gm4_aa_augment.link.slot dummy
scoreboard objectives add gm4_aa_augment.link.max_health dummy

scoreboard objectives add gm4_aa_augment.equine.speed_level dummy
scoreboard objectives add gm4_aa_augment.psychic.id dummy
scoreboard objectives add gm4_aa_augment.psychic.degree dummy
scoreboard objectives add gm4_aa_augment.totemic.strength_effect dummy
scoreboard objectives add gm4_aa_augment.canine.timer dummy
scoreboard objectives add gm4_aa_augment.canine.slot dummy
scoreboard objectives add gm4_aa_augment.dashing.timer dummy
scoreboard objectives add gm4_aa_augment.dashing.timeout dummy
scoreboard objectives add gm4_aa_augment.dashing.pieces_equipped dummy
scoreboard objectives add gm4_aa_augment.rejuvenating.stored_health dummy
scoreboard objectives add gm4_aa_augment.sparking.static_stacks dummy
scoreboard objectives add gm4_aa_augment.sparking.timer dummy
scoreboard objectives add gm4_aa_augment.sparking.deg dummy
scoreboard objectives add gm4_aa_augment.sparking.striking_timer dummy
scoreboard objectives add gm4_aa_augment.berserkers.timer dummy

scoreboard objectives add gm4_aa_training_dummy.dps dummy
scoreboard objectives add gm4_aa_training_dummy.total_damage dummy
scoreboard objectives add gm4_aa_training_dummy.timer dummy

# constants
scoreboard players set #-1 gm4_aa_data -1
scoreboard players set #0 gm4_aa_data 0
scoreboard players set #1 gm4_aa_data 1
scoreboard players set #2 gm4_aa_data 2
scoreboard players set #3 gm4_aa_data 3
scoreboard players set #4 gm4_aa_data 4
scoreboard players set #5 gm4_aa_data 5
scoreboard players set #7 gm4_aa_data 7
scoreboard players set #8 gm4_aa_data 8
scoreboard players set #10 gm4_aa_data 10
scoreboard players set #11 gm4_aa_data 11
scoreboard players set #13 gm4_aa_data 13
scoreboard players set #14 gm4_aa_data 14
scoreboard players set #15 gm4_aa_data 15
scoreboard players set #16 gm4_aa_data 16
scoreboard players set #17 gm4_aa_data 17
scoreboard players set #20 gm4_aa_data 20
scoreboard players set #21 gm4_aa_data 21
scoreboard players set #25 gm4_aa_data 25
scoreboard players set #30 gm4_aa_data 30
scoreboard players set #35 gm4_aa_data 35
scoreboard players set #40 gm4_aa_data 40
scoreboard players set #50 gm4_aa_data 50
scoreboard players set #64 gm4_aa_data 64
scoreboard players set #75 gm4_aa_data 75
scoreboard players set #80 gm4_aa_data 80
scoreboard players set #90 gm4_aa_data 90
scoreboard players set #100 gm4_aa_data 100
scoreboard players set #125 gm4_aa_data 125
scoreboard players set #1000 gm4_aa_data 1000
scoreboard players set #1875 gm4_aa_data 1875
scoreboard players set #6000 gm4_aa_data 6000

# start clocks
schedule function gm4_augmented_armor:tick 1t
schedule function gm4_augmented_armor:slow_clock 1t
