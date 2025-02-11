
# convert each notebook into markdown -> latex
for i in ./Notebooks/**/**/*.ipynb; do 
    echo $i
    jupyter nbconvert --to markdown $i 
    pandoc --listings -f markdown -t latex "${i%.*}.md" -o "${i%.*}.tex"
done