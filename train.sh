#!/bin/bash
#mkdir ./data
if [ ! -d "./data/train" ]; then
    rm train_list_noVAD.txt
    find "/dataset" -name '*.pcm'  > train_list_noVAD.txt
    mkdir ./data
    mkdir ./data/train

    for line in `cat train_list_noVAD.txt`
    do
        echo $line
        out=`echo $line|awk '{split($0,a,"/");print a[3]}'`
        filename="${line##*/}"
        file_id="${filename%.*}"
        if [ ! -d "./data/train/${out}" ]; then
            mkdir ./data/train/${out}
        fi
        ./bin/pcm2wav $line 1 16 16000 ./data/train/${out}/${file_id}.wav
    done
fi
find "./data/train" -name '*.wav' > train_list_noVAD_wav.txt

python train.py --data_url= --data_dir="./data/train" --wanted_words="changsha,hebei,kejia,minnan,nanchang,shanghai,hefei,sichuan,shan3xi" --train_dir="./models"

#python train.py --data_url= --data_dir="/home/research/data/dataset/speech_commands_v0.02"  --train_dir="/home/research/data/#speech_commands_train" --wanted_words="yes,no,up,down,left,right,on,off,stop,go,zero,one,two,three,four,five,six,seven,eight,\
#nine,bed,bird,cat,dog,happy,house,marvin,sheila,tree,wow,backward,follow,forward,learn,visual"

python freeze.py --start_checkpoint="./models/conv.ckpt-18000" --output_file="./models/my_frozen_graph.pb" --wanted_words="changsha,hebei,kejia,minnan,nanchang,shanghai,hefei,sichuan,shan3xi"
