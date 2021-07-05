#!/bin/bash

BASE_DIR=/wynton/home/corces/allan/BPMVF/ENCSR000EGM
DATA_DIR=$BASE_DIR/data
MODEL_DIR=$BASE_DIR/models
REFERENCE_DIR=/wynton/home/corces/allan/BPMVF/reference
CHROM_SIZES=$REFERENCE_DIR/hg38.chrom.sizes
REFERENCE_GENOME=$REFERENCE_DIR/hg38.genome.fa
CV_SPLITS=$BASE_DIR/splits.json
INPUT_DATA=$BASE_DIR/input_datav1.json
PREDICTIONS_DIR=$BASE_DIR/predictionsv1

predict \
    --model $(ls $MODEL_DIR/model_split000.h5) \
    --chrom-sizes $CHROM_SIZES \
    --chroms chr1 \
    --reference-genome $REFERENCE_GENOME \
    --exponentiate-counts \
    --output-dir $PREDICTIONS_DIR \
    --input-data $INPUT_DATA \
    --predict-peaks \
    --write-buffer-size 2000 \
    --batch-size 1 \
    --has-control \
    --stranded \
    --input-seq-len 2114 \
    --output-len 1000 \
    --output-window-size 1000