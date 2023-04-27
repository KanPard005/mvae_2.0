#!/bin/bash

python -m mt.examples.eval --dataset="mnist" --model="h2,s2,e2" --chkpt="./chkpt/vae-mnist-e2,h2,s2-2023-03-26T04:19:51.519534/499.chkpt" --epoch=499 --batch_size=16
# python -m mt.examples.run --dataset="mnist" --model="h2,s2,e2" --fixed_curvature=False
