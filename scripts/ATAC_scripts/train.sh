#!/bin/bash

BASE_DIR=/wynton/home/corces/allan/BPMVF/ATAC
DATA_DIR=$BASE_DIR/data
MODEL_DIR=$BASE_DIR/model

INPUT_DATA=$BASE_DIR/input_data.json
CV_SPLITS=$BASE_DIR/splits.json

PEAKS_DIR=$DATA_DIR/peaks
PEAKS_F=$PEAKS_DIR/Cluster24.idr.optimal.narrowPeak
INPUT_BW=$DATA_DIR/Cluster24.bpnet.unstranded.bw

REFERENCE_DIR=/wynton/home/corces/allan/BPMVF/reference
CHROM_SIZES=$REFERENCE_DIR/hg38.chrom.sizes
REFERENCE_GENOME=$REFERENCE_DIR/hg38.genome.fa

MODEL_NAME=bpnetv0.1
FILTERS=64
LEARNING_RATE=0.001
COUNTS_LOSS_WEIGHT=300.29 #300.28898500099734 for Cluster 24

mkdir -p $MODEL_DIR
train \
   --input-data $INPUT_DATA \
   --output-dir $MODEL_DIR \
   --splits $CV_SPLITS \
   --chrom-sizes $CHROM_SIZES \
   --reference-genome $REFERENCE_GENOME \
   --chroms $(paste -s -d ' ' $REFERENCE_DIR/chroms.txt) \
   --filters $FILTERS \
   --learning-rate $LEARNING_RATE \
   --counts-loss-weight $COUNTS_LOSS_WEIGHT \
   --model-arch-name BPNet1000d8 \
   --sequence-generator-name BPNet \
   --model-output-filename $MODEL_NAME \
   --threads 10 \
   --epochs 1 \
   --batch-size 64 \
   --input-seq-len 2114 \
   --output-len 1000 \
   --sampling-mode peaks \
