#!/bin/bash

log_file="server.log"
report_file="error_report.txt"

#check lof file is exists
if [ ! -f "$log_file" ]; then
    echo "Error: log file not found!!"
    exit 1
fi

echo "analyzing $log_file..."

#count total error
error_count=$(grep -c "ERROR" "$log_file")

echo "total error is: $error_count"

#decision create
if [ $error_count -gt 0 ]; then
    echo "detected!! generating reports....!!!"
    echo "--error report: $(date) --" > "$report_file"
    
#ERROR lines and append to report
    grep "ERROR" "$log_file" >> "$report_file"
    echo "report saved to: $report_file"
    cat "$report_file"
else
    echo "no errors found in the log."
fi 
