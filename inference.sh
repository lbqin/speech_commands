#!/bin/bash

mkdir result
#rm -rf ./data

if [ ! -d "./data/valid" ]; then
#    rm dev_list_noVAD.txt
    find "/test" -name '*.pcm'  > dev_list_noVAD.txt
#    mkdir ./data
    mkdir ./data/valid

    for line in `cat dev_list_noVAD.txt`
    do
        echo $line
        out=`echo $line|awk '{split($0,a,"/");print a[3]}'`
        filename="${line##*/}"
        file_id="${filename%.*}"
        if [ ! -d "./data/valid/${out}" ]; then
            mkdir ./data/valid/${out}
        fi
        ./bin/pcm2wav $line 1 16 16000 ./data/valid/${out}/${file_id}.wav
    done
fi
find "./data/valid" -name '*.wav' > dev_list_noVAD_wav.txt
python inference.py --graph="./models/my_frozen_graph.pb" --labels="./models/conv_labels.txt" --input_list_file="dev_list_noVAD_wav.txt"

