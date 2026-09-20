
data modify storage gm4_timelines:temp filtered_days set value []
data modify storage gm4_timelines:temp filtered_days append from storage gm4_timelines:temp possible_days[{out_type:"clear"}]
data modify storage gm4_timelines:temp possible_days set from storage gm4_timelines:temp filtered_days
data remove storage gm4_timelines:temp filtered_days
