
scoreboard objectives modify gm4_timelines_panel displayname "GM4 Timeline Panel"

scoreboard players set $day_name gm4_timelines_panel 999999
scoreboard players set $moon_phase gm4_timelines_panel 999998
scoreboard players operation $daytime gm4_timelines_panel = $daytime gm4_timelines_data
scoreboard players set $day_id gm4_timelines_panel -1

scoreboard players display name $day_name gm4_timelines_panel {text:"Active Day",color:"gray"}
scoreboard players display name $moon_phase gm4_timelines_panel {text:"Moonphase",color:"gray"}
scoreboard players display name $daytime gm4_timelines_panel {text:"Daytime",color:"gray"}
scoreboard players display name $day_id gm4_timelines_panel {text:"Day #ID",color:"gray"}

scoreboard players display numberformat $day_name gm4_timelines_panel fixed {nbt:"active_day.id",storage:"gm4_timelines:data",interpret:true}
execute unless score $moon_phase gm4_timelines_data matches 1.. run scoreboard players display numberformat $moon_phase gm4_timelines_panel fixed "Full Moon"
execute if score $moon_phase gm4_timelines_data matches 1 run scoreboard players display numberformat $moon_phase gm4_timelines_panel fixed "Waning Gibbous"
execute if score $moon_phase gm4_timelines_data matches 2 run scoreboard players display numberformat $moon_phase gm4_timelines_panel fixed "Third Quarter"
execute if score $moon_phase gm4_timelines_data matches 3 run scoreboard players display numberformat $moon_phase gm4_timelines_panel fixed "Waning Crescent"
execute if score $moon_phase gm4_timelines_data matches 4 run scoreboard players display numberformat $moon_phase gm4_timelines_panel fixed "New Moon"
execute if score $moon_phase gm4_timelines_data matches 5 run scoreboard players display numberformat $moon_phase gm4_timelines_panel fixed "Waxing Crescent"
execute if score $moon_phase gm4_timelines_data matches 6 run scoreboard players display numberformat $moon_phase gm4_timelines_panel fixed "First Quarter"
execute if score $moon_phase gm4_timelines_data matches 7 run scoreboard players display numberformat $moon_phase gm4_timelines_panel fixed "Waxing Gibbous"
scoreboard players display numberformat $day_id gm4_timelines_panel fixed {score:{name:"$current_day",objective:"gm4_timelines_data"},color:"red"}
