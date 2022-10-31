#!/bin/bash

default_source_code="source.cpp"
default_input_file="input.in"
default_output_file="output.out"

if [ -z ${1+x} ]; then
    echo "[WARNING] using default source code:" $default_source_code
    source_code=$default_source_code;
else 
    source_code=$1;
fi

if [ -z ${2+x} ]; then
    echo "[WARNING] using default input file:" $default_input_file
    input_file=$default_input_file;
else 
    input_file=$2;
fi

if [ -z ${3+x} ]; then
    echo "[WARNING] using default output file:" $default_output_file
    output_file=$default_output_file;
else 
    output_file=$3;
fi

echo "source code :" $source_code
echo "input file  :" $input_file
echo "output file :" $output_file

echo "=================================================="
g++ -o code.exe $source_code
./code.exe < $input_file > $output_file
