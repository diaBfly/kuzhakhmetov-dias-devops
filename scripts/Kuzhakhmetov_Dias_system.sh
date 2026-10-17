#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "=============================="
echo "Student Information"
echo "=============================="

echo "Name: Dias"
echo "Surname: Kuzhakhmetov"
echo "Group: IT2310"
echo "Student ID: 31935"

echo ""
echo "=============================="
echo "System Information"
echo "=============================="

echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -a)"

echo ""
echo "Disk Usage:"
df -h

echo ""
echo "Memory Usage:"
free -h

echo ""
if [ -f "$PROJECT_DIR/Kuzhakhmetov_Dias_info.txt" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi

