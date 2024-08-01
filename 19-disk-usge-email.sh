DISK_USEAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=7

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

while IFS= read -r line
do
    USEAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    echo -e "$Y $FOLDER $N useage is more than $R $DISK_THRESHOLD $N, current useage:$G $USEAGE $N"
done <<< $DISK_USEAGE