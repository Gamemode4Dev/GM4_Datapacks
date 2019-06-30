#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ carved_pumpkin run function potion_infusers:effects/failed
execute if block ~ ~ ~ carved_pumpkin run function potion_infusers:effects/success
execute if block ~ ~ ~ carved_pumpkin[facing=north] run setblock ~ ~ ~ jack_o_lantern[facing=north]
execute if block ~ ~ ~ carved_pumpkin[facing=south] run setblock ~ ~ ~ jack_o_lantern[facing=south]
execute if block ~ ~ ~ carved_pumpkin[facing=east] run setblock ~ ~ ~ jack_o_lantern[facing=east]
execute if block ~ ~ ~ carved_pumpkin[facing=west] run setblock ~ ~ ~ jack_o_lantern[facing=west]
