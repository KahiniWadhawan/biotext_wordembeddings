DATA_DIR=../data
BIN_DIR=../bin
SRC_DIR=../src

TEXT_DATA=$DATA_DIR/merge497k
VECTOR_DATA=$DATA_DIR/merge497k-vector-neg15-dim300-textwin11-subsample5-mincount10.bin

pushd ${SRC_DIR} && make; popd

echo -----------------------------------------------------------------------------------------------------
#echo -- Training vectors...
time $BIN_DIR/word2vec -train $TEXT_DATA -output $VECTOR_DATA -cbow 0 -size 300 -window 11 -negative 15 -hs 0 -sample 1e-5 -threads 24 -binary 1 -min-count 10
  
echo -----------------------------------------------------------------------------------------------------
echo -- distance...
$BIN_DIR/distance $DATA_DIR/$VECTOR_DATA
