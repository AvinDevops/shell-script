#!/bin/bash

echo "This is a test mail & Date $(date)" | mail -s "message" info@joindevops.com

# echo "body of the mail" | mail -s "subject" tomailaddress