# finalizes the storage used by the guidebook to display the table of contents
# @s = none
# run from gm4_guidebook:analyze_storage/interpret/schedule

# set toc pages (for up to 15 pages)
data modify storage gm4_guidebook:front_matter pages set value ['[{"nbt":"table_of_contents[0][]","storage":"gm4_guidebook:front_matter","interpret":true,"separator":""}]']
execute if score $toc_pages gm4_guide matches 2.. run data modify storage gm4_guidebook:front_matter pages append value '[{"nbt":"table_of_contents[1][]","storage":"gm4_guidebook:front_matter","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 3.. run data modify storage gm4_guidebook:front_matter pages append value '[{"nbt":"table_of_contents[2][]","storage":"gm4_guidebook:front_matter","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 4.. run data modify storage gm4_guidebook:front_matter pages append value '[{"nbt":"table_of_contents[3][]","storage":"gm4_guidebook:front_matter","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 5.. run data modify storage gm4_guidebook:front_matter pages append value '[{"nbt":"table_of_contents[4][]","storage":"gm4_guidebook:front_matter","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 6.. run data modify storage gm4_guidebook:front_matter pages append value '[{"nbt":"table_of_contents[5][]","storage":"gm4_guidebook:front_matter","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 7.. run data modify storage gm4_guidebook:front_matter pages append value '[{"nbt":"table_of_contents[6][]","storage":"gm4_guidebook:front_matter","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 8.. run data modify storage gm4_guidebook:front_matter pages append value '[{"nbt":"table_of_contents[7][]","storage":"gm4_guidebook:front_matter","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 9.. run data modify storage gm4_guidebook:front_matter pages append value '[{"nbt":"table_of_contents[8][]","storage":"gm4_guidebook:front_matter","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 10.. run data modify storage gm4_guidebook:front_matter pages append value '[{"nbt":"table_of_contents[9][]","storage":"gm4_guidebook:front_matter","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 11.. run data modify storage gm4_guidebook:front_matter pages append value '[{"nbt":"table_of_contents[10][]","storage":"gm4_guidebook:front_matter","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 12.. run data modify storage gm4_guidebook:front_matter pages append value '[{"nbt":"table_of_contents[11][]","storage":"gm4_guidebook:front_matter","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 13.. run data modify storage gm4_guidebook:front_matter pages append value '[{"nbt":"table_of_contents[12][]","storage":"gm4_guidebook:front_matter","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 14.. run data modify storage gm4_guidebook:front_matter pages append value '[{"nbt":"table_of_contents[13][]","storage":"gm4_guidebook:front_matter","interpret":true,"separator":""}]'
execute if score $toc_pages gm4_guide matches 15.. run data modify storage gm4_guidebook:front_matter pages append value '[{"nbt":"table_of_contents[14][]","storage":"gm4_guidebook:front_matter","interpret":true,"separator":""}]'

# clean up
data remove storage gm4_guidebook:temp_toc modules
