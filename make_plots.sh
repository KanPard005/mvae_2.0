#!/bin/bash
#
dataset=cifar

python make_plots.py \
	--dataset=$dataset \
	--logdir=./log1

python make_plots.py \
	--dataset=$dataset \
	--logdir=./log
