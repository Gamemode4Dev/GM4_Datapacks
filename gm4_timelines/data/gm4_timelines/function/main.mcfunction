schedule function gm4_timelines:main 1t

execute store result score $day.real gm4_timelines.data run time query day
execute store result score $daytime.real gm4_timelines.data run time query daytime

scoreboard players operation $day.current gm4_timelines.data = $day.real gm4_timelines.data
scoreboard players operation $day.current gm4_timelines.data *= #24000 gm4_timelines.data
scoreboard players operation $day.current gm4_timelines.data += $daytime.real gm4_timelines.data
scoreboard players operation $day.current gm4_timelines.data -= #day.offset gm4_timelines.data
scoreboard players operation $daytime.current gm4_timelines.data = $day.current gm4_timelines.data
scoreboard players operation $day.current gm4_timelines.data /= #day.duration gm4_timelines.data
scoreboard players operation $daytime.current gm4_timelines.data %= #day.duration gm4_timelines.data

execute unless score $day.active gm4_timelines.data = $day.current gm4_timelines.data run function gm4_timelines:pick_day/run
