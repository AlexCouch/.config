total_space=$(df -h . | grep -v "Used" | awk ' {print $2}')
total_space_num=$(echo $total_space | cut -d"G" -f1)
avail_space=$(df -h . | grep -v "Used" | awk ' {print $4}')
avail_space_num=$(echo $avail_space | cut -d"G" -f1)
used_space=$(df -h . | grep -v "Used" | awk ' {print $3}')
used_space_num=$(echo $used_space | cut -d"G" -f1)
ratio=$(awk "BEGIN{print $used_space_num / $avail_space_num}")
level=$(awk "BEGIN{if($ratio > 0.5) print high; else if($ratio > 0.75) print critical;}")
if [ level = "critical" ]; then
	echo  %{F#f71616} %{F-} $used_space / $avail_space / $total_space
elif [ level = "high" ]; then
	echo %{F#f7d916} %{F-} $used_space / $avail_space / $total_space
else	
	echo %{F#2954ff} %{F-} $used_space / $avail_space / $total_space
fi
