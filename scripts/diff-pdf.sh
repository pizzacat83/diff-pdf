#! /bin/sh -eu

tmpdir=$(mktemp -d)

mkdir -p $tmpdir/1/pages
mkdir -p $tmpdir/2/pages

pdftoppm -png -scale-to 512 $1 $tmpdir/1/pages/page
pdftoppm -png -scale-to 512 $2 $tmpdir/2/pages/page

convert -append $tmpdir/1/pages/* $tmpdir/1/concat.png
convert -append $tmpdir/2/pages/* $tmpdir/2/concat.png

magick compare $tmpdir/1/concat.png $tmpdir/2/concat.png $tmpdir/diff.png || true

cp $tmpdir/diff.png $3

rm -rf $tmpdir
