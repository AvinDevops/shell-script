DISK_USEAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=75

while IFS= read -r line
do
    USEAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    echo "$FOLDER useage is more than $DISK_THRESHOLD, current useage:$USEAGE"
done <<< $DISK_USEAGE