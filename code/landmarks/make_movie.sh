#!/bin/bash
#
# This file is part of jetflows.
#
# Copyright (C) 2014, Henry O. Jacobs (hoj201@gmail.com), Stefan Sommer (sommer@di.ku.dk)
# https://github.com/nefan/jetflows.git
#
# jetflows is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# jetflows is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with jetflows.  If not, see <http://www.gnu.org/licenses/>.
#

echo "If you go to NYU film school you get to make cool movies like this."
#python run_mpp.py
python generate_images.py
hoj_OS="darwin12"
imperial_OS="linux-gnu"
if [ "$hoj_OS" = "$OSTYPE" ]; then
    ffmpeg -y -i ./movie_frames/frame_%d.png -pix_fmt yuv420p particle_motion.mp4
    open particle_motion.mp4
elif [ "$imperial_OS" = "$OSTYPE" ] && [ "stefan" != "$USER" ]; then
    ffmpeg -y -i ./movie_frames/frame_%d.png -pix_fmt yuv420p particle_motion.mp4
    vlc particle_motion.mp4
else
    avconv -y -i ./movie_frames/frame_%d.png -pix_fmt yuv420p particle_motion.mp4
    see particle_motion.mp4
fi


