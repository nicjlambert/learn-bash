# Description: Downloading data from IRENA API
# Author: @nicjlambert
# Date: 2021-09-01
# Version: 1.0
# Usage: ./curl.sh
# Notes:
# 1. The API is limited to 100,000 values per call

# ASSIGN THE CURRENT YEAR TO A VARIBALE CALLED Date 

YEAR=2022
CYCLE=2

for i in $(seq 20 50)
do
echo "Downloading file: "$i
curl --fail --location --request POST https://pxweb.irena.org:443/api/v1/en/IRENASTAT/Power%20Capacity%20and%20Generation/RECAP_"$YEAR"_cycle"$CYCLE".px \
--header "Content-Type: application/json" \
--data-raw '{
    "query": [
      {
        "code": "Year",
        "selection": {
          "filter": "item",
          "values": [
            "'$i'"
          ]
        }
      }
    ],
    "response": {
      "format": "csv"
    }
  }' >> exportfile_$i  || exit 1 
sleep 2
done