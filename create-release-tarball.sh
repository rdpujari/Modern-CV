#!/bin/sh
# script to create a tarball for the files that should be in the CTAN upload

# fetch version via git
VERSION=$(git describe --tags --dirty)
TARBALL=moderncv-$VERSION.tar

# remove existing tarballs
rm -f $TARBALL $TARBALL.gz

# create tar with all files in git repo excluding helper files
git archive \
  --prefix=moderncv/ \
  --output=$TARBALL \
  --exclude=.github \
  --exclude=.gitignore \
  --exclude=create-release-tarball.sh \
  HEAD

# compress
gzip $TARBALL
