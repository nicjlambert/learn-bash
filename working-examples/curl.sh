for i in $(seq 1 50)
do
echo "Downloading file: "$i
curl --fail --location --request POST "https://pxweb.irena.org:443/api/v1/en/IRENASTAT/Power%20Capacity%20and%20Generation/RECAP_2022_cycle2.px" \
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