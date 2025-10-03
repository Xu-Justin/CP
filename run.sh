#!/bin/bash

default_source_code="source.cpp"
default_input_file="input.in"
default_output_file="output.out"

# Parse args
print_to_stdout=false
while [[ "$1" =~ ^- ]]; do
    case $1 in
        -p|--print)
            print_to_stdout=true
            shift
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Source code
if [ -z ${1+x} ]; then
    echo "ℹ️ Using default source code:" $default_source_code
    source_code=$default_source_code
else 
    source_code=$1
fi

# Input file
if [ -z ${2+x} ]; then
    echo "ℹ️ Using default input file:" $default_input_file
    input_file=$default_input_file
else 
    input_file=$2
fi

# Output file
if [ -z ${3+x} ]; then
    echo "ℹ️ Using default output file:" $default_output_file
    output_file=$default_output_file
else 
    output_file=$3
fi

echo "source code :" $source_code
echo "input file  :" $input_file
if [ "$print_to_stdout" = true ]; then
    echo "output file : stdout"
else
    echo "output file :" $output_file
fi

echo "=================================================="
g++ -o code.exe $source_code
if [ "$print_to_stdout" = true ]; then
    ./code.exe < "$input_file"
else
    ./code.exe < "$input_file" > "$output_file"
fi
