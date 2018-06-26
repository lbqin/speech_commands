#!/bin/bash


python train.py --data_url= --data_dir="/home/research/data/dataset/xunfei_dialect/wav" --wanted_words="changsha,hebei,kejia,minnan,nanchang,shanghai" --train_dir="inference/models"

python train.py --data_url= --data_dir="/home/research/data/dataset/speech_commands_v0.02"  --train_dir="/home/research/data/#speech_commands_train" --wanted_words="yes,no,up,down,left,right,on,off,stop,go,zero,one,two,three,four,five,six,seven,eight,\
nine,bed,bird,cat,dog,happy,house,marvin,sheila,tree,wow,backward,follow,forward,learn,visual"