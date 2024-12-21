
# check the bonus damage that is allowed to added in total (x100)
scoreboard players set @s gm4_aa_augment.hawkeye.max_damage 20
scoreboard players operation @s gm4_aa_augment.hawkeye.max_damage *= $hawkeye_level gm4_aa_data
# add original damage (x100) to get final max damage this arrow can do
scoreboard players operation $original_damage gm4_aa_data = $arrow_damage gm4_sr_data
scoreboard players operation $original_damage gm4_aa_data *= #100 gm4_aa_data
scoreboard players operation @s gm4_aa_augment.hawkeye.max_damage += $original_damage gm4_aa_data
# store on arrow for later
scoreboard players operation @s gm4_aa_augment.hawkeye.count = $hawkeye_count gm4_aa_data

# add tags and start a clock
tag @s add gm4_aa_hawkeye_arrow
tag @s add gm4_aa_hawkeye_arrow.process
execute unless score $keep_tick.hawkeye gm4_aa_keep_tick matches 1 run schedule function gm4_augmented_armor:clocks/temp/hawkeye 1t
