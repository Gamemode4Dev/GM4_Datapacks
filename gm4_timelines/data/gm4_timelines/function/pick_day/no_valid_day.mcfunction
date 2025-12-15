
data modify storage gm4_timelines:temp picked_day set from storage gm4_timelines:data day_registry[0]
tellraw @a [{text:"[GM4 Timelines] ",color:"#4AA0C7"},{text:"No valid day found, using day 0 as fallback",color:"red"}]
