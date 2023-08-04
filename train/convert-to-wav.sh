#!/bin/bash

# Set the location of your soundfont file
sound_font="../TimGM6mb.sf2"

# Iterate over all directories in the current directory
for dir in */
do
  # Go inside each directory
  cd "$dir"

  # Iterate over all .mid files in the current directory
  for midi_file in *.mid
  do
    # Replace the file extension from .mid to .wav
    wav_file="${midi_file%.mid}.wav"

    # Use fluidsynth to convert the midi file to a wav file
    /mnt/host/c/tools/fluidsynth-2.3.2-win10-x64/bin/fluidsynth.exe -ni "$sound_font" "$midi_file" -F "$wav_file" -r 44100
  done

  # Go back to the parent directory
  cd ..
done

