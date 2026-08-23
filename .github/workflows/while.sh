#!/usr/bin/env bash
#while [[ "hello"=="hello" ]]; do
#       echo "Hello world"
#done

# counter=0
# while (( counter < 10 )); do
#     (( counter = counter + 1 ))
#     if (( counter == 5 )); then
#         echo "Counter is 5, skipping."
#         continue
#     fi
#     if (( counter == 8 )); then
#         echo "Counter is 8, breaking the loop."
#         break
#     fi
#     echo "hello world: ${counter}"
# done

url='https://downloads.codingcoursestv.eu/055%20-%20bash/while/images/image-%%.jpg'
ifnotfound=0
counter=1
while true; do
    echo "Downloading: ${url/\%\%/$counter}"
    if curl -s --fail "${url/\%\%/$counter}" -o   image-${counter}.jpg; then
        echo "Downloaded image-${counter}.jpg"
        ifnotfound=0
    else
        (( ifnotfound = ifnotfound + 1 ))
        if (( ifnotfound >= 10 )); then
            echo "No more images to download. Exiting."
            break
        fi
    fi
(( counter = counter + 1 ))
done