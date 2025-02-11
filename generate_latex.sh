
# convert each notebook into markdown -> latex
for i in ./Notebooks/**/**/*.ipynb; do 
    echo $i
    jupyter nbconvert --to markdown $i
    pandoc --listings -f markdown -t latex "${i%.*}.md" -o "${i%.*}.tex"
    sed -i -e 's/lstlisting/python/g' "${i%.*}.tex" #convert listing blocks to python
    sed -i -e 's/\\begin{figure}/\\begin{figure}\[h\]/g' "${i%.*}.tex" #convert listing blocks to python
    sed -i -e 's/\\includegraphics/\\includegraphics\[scale=0.75\]/g' "${i%.*}.tex" #convert listing blocks to python
    rm -f "${i%.*}.md" 
done