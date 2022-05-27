scoreboard objectives add gm4_count dummy
scoreboard objectives add gm4_ar_time dummy
scoreboard players set #max_play_time gm4_ar_time 45

execute unless score allay_revitalizing gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Allay Revitalizing"}
scoreboard players set allay_revitalizing gm4_modules 1

schedule function gm4_allay_revitalizing:tick 1t

#$moduleUpdateList
