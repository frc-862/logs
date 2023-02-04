## BEHAVIOR OF LIMELIGHT IMAGE SNAPSHOTTING
# The limelight captures images and stores them up to the 100th image
# Upon the 100 image limit being exceeded, instead of saving the next image as 1.jpg
# it saves it as 101.jpg

# I have been lazy and not properly circumvented this issue, therefore
# if you are finding that you aren't getting any images increase the variable $num_of_imgs
# Or just find Robert at the comp if he's nearby

$link = "http://limelight.local:5801/snapshots/" 
$file_ext = ".jpg" # Only grabs jpg files
$file_time_stamp = Get-Date -Format "HHmm_MMddyyyy" # Hour minute month day year
$current_path = Get-Location # Gets current path that the script is ran from

# Makes new directory, assigns timestamp
New-item -Path $current_path -Name $file_time_stamp -ItemType "directory"

# Loops through images up to 1000.jpg
# ASSUMPTION: We won't exceed 1000.jpg, if we do then increase this number
$num_of_imgs = 1000

# The variable $i represents the jpg number to start at (i.e. 0.jpg in the case i = 0) 
for($i = 0; $i -le $num_of_imgs; $i += 1){
    try { Invoke-WebRequest $link$i$file_ext -outfile $FiletimeStamp/$i$file_ext }
    catch { "No such file (Wait for program to loop until exit)" }
    }